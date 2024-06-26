<?php
// session to manage user sessions throughout the app
session_start();
//db connection
$mysqli = new mysqli('localhost', 'root', '', 'bookingcalendar');

if ($mysqli->connect_error) {
    die("Connection failed: " . $mysqli->connect_error);
}

// includes and calls a function from an external script (student_sessionValidator.php) to validate the user's session 
require_once 'student_sessionValidator.php';
validateSession($mysqli);

// Fetch the date range from db
$query = "SELECT start_date, end_date FROM defense_schedule ORDER BY id DESC LIMIT 1";
$result = $mysqli->query($query);

if ($result && $result->num_rows > 0) {
    $row = $result->fetch_assoc();
    $start_date = new DateTime($row['start_date']);
    $end_date = new DateTime($row['end_date']);
} else {
    // handle case where no dates are set
    echo "No defense schedule dates are set.";
    exit;
}

// convert the start and end dates to month and year for the calendar
$month = $start_date->format('m');
$year = $start_date->format('Y');

// if(isset($_GET['booking']) && $_GET['booking'] == 'success') {
//     echo "<div class='alert alert-success'>Oral defense time successfully booked!</div>";
// }

// to fetch availability data for the given professors and month/year
function getAvailabilityData($mysqli, $first_reader, $second_reader, $month, $year) {
    $availabilityData = [
        'professors' => []
    ];

    // fetch availability for first reader
    $stmt = $mysqli->prepare("SELECT date, timeslot FROM professors WHERE name=? AND MONTH(date)=? AND YEAR(date)=?");
    $stmt->bind_param("sii", $first_reader, $month, $year);
    if ($stmt->execute()) {
        $result = $stmt->get_result();
        while ($row = $result->fetch_assoc()) {
            $availabilityData['professors'][$first_reader][$row['date']][] = $row['timeslot'];
        }
    }
    $stmt->close();

    // fetch availability for second reader

    $stmt = $mysqli->prepare("SELECT date, timeslot FROM professors WHERE name=? AND MONTH(date)=? AND YEAR(date)=?");
    $stmt->bind_param("sii", $second_reader, $month, $year);
    if ($stmt->execute()) {
        $result = $stmt->get_result();
        while ($row = $result->fetch_assoc()) {
            $availabilityData['professors'][$second_reader][$row['date']][] = $row['timeslot'];
        }
    }
    $stmt->close();

    // // fetch availability for room
    // $stmt = $mysqli->prepare("SELECT date, timeslot FROM rooms WHERE name=? AND MONTH(date)=? AND YEAR(date)=?");
    // $stmt->bind_param("sii", $room, $month, $year);
    // if ($stmt->execute()) {
    //     $result = $stmt->get_result();
    //     while ($row = $result->fetch_assoc()) {
    //         $availabilityData['rooms'][$row['date']][] = $row['timeslot'];
    //     }
    // }
    // $stmt->close();

    // echo "<pre>Availability Data: ";
    // print_r($availabilityData);
    // echo "</pre>";

    return $availabilityData;
}

// to find overlapping slots between two selected professors' availabilities
function findOverlappingSlots($availabilityData, $first_reader, $second_reader) {
    $overlappingSlots = [];

    // Only compare availability between first and second readers
    if (isset($availabilityData['professors'][$first_reader]) && isset($availabilityData['professors'][$second_reader])) {
        foreach ($availabilityData['professors'][$first_reader] as $date => $firstReaderSlots) {
            if (isset($availabilityData['professors'][$second_reader][$date])) {
                $secondReaderSlots = $availabilityData['professors'][$second_reader][$date];
                $overlap = array_intersect($firstReaderSlots, $secondReaderSlots);
                if (!empty($overlap)) {
                    $overlappingSlots[$date] = $overlap;
                }
            }
        }
    }

    // echo "<pre>Overlapping Slots: ";
    // print_r($overlappingSlots);
    // echo "</pre>";

    return $overlappingSlots;
}

$first_reader = isset($_GET['first_reader']) ? $_GET['first_reader'] : '';
$second_reader = isset($_GET['second_reader']) ? $_GET['second_reader'] : '';
$room = isset($_GET['room']) ? $_GET['room'] : '';


// function checkSlots($mysqli, $date, $first_reader, $second_reader) {
//     // fetch all slots where either professor is booked
//     $professorBookedQuery = "SELECT timeslot FROM bookings WHERE date=? AND (reader_one IN (?, ?) OR reader_two IN (?, ?))";
//     $stmt = $mysqli->prepare($professorBookedQuery);
//     $stmt->bind_param('sssss', $date, $first_reader, $second_reader, $first_reader, $second_reader);
//     $stmt->execute();
//     $result = $stmt->get_result();
    
//     $bookedSlots = [];
//     while ($row = $result->fetch_assoc()) {
//         $bookedSlots[] = $row['timeslot'];
//     }
//     $stmt->close();

//     // assuming getAvailabilityData() fetches all available slots for both professors
//     $availabilityData = getAvailabilityData($mysqli, $first_reader, $second_reader, date('m', strtotime($date)), date('Y', strtotime($date)));
//     $overlappingSlots = findOverlappingSlots($availabilityData, $first_reader, $second_reader);

//     // Calculate available slots by removing booked slots from overlapping slots
//     if (isset($overlappingSlots[$date])) {
//         $availableSlots = array_diff($overlappingSlots[$date], $bookedSlots);
//         return count($availableSlots);
//     }

//     return 0; // return 0 if no overlapping slots or all slots are booked
// }

// to calculate available slots excluding times where professors or rooms are already booked
function getAvailableSlotsCount($mysqli, $date, $first_reader, $second_reader) {
    // This fetches intersected availability and calculates the count of available slots
    $intersectedAvailabilityQuery = "SELECT r.name, r.timeslot FROM rooms r
                                     JOIN professors p1 ON r.date = p1.date AND r.timeslot = p1.timeslot AND p1.name = ?
                                     JOIN professors p2 ON r.date = p2.date AND r.timeslot = p2.timeslot AND p2.name = ?
                                     WHERE r.date = ?";
    $stmt = $mysqli->prepare($intersectedAvailabilityQuery);
    $stmt->bind_param('sss', $first_reader, $second_reader, $date);
    $stmt->execute();
    $result = $stmt->get_result();

    $roomsAvailability = [];
    while ($row = $result->fetch_assoc()) {
        $roomsAvailability[$row['name']][] = $row['timeslot'];
    }
    $stmt->close();

    // fetch bookings for the selected date to identify booked slots
    $bookingsQuery = "SELECT room, timeslot FROM bookings WHERE date = ?";
    $stmt = $mysqli->prepare($bookingsQuery);
    $stmt->bind_param('s', $date);
    $stmt->execute();
    $bookingsResult = $stmt->get_result();

    $bookedSlots = [];
    while ($row = $bookingsResult->fetch_assoc()) {
        $bookedSlots[$row['room']][] = $row['timeslot'];
    }
    $stmt->close();

    // fetch all bookings for the selected date to identify slots where selected professors are unavailable
    $professorBookingsQuery = "SELECT timeslot FROM bookings WHERE date = ? AND (reader_one IN (?, ?) OR reader_two IN (?, ?))";
    $stmt = $mysqli->prepare($professorBookingsQuery);
    $stmt->bind_param('sssss', $date, $first_reader, $second_reader, $first_reader, $second_reader);
    $stmt->execute();
    $professorBookingsResult = $stmt->get_result();

    $professorUnavailableSlots = [];
    while ($row = $professorBookingsResult->fetch_assoc()) {
        $professorUnavailableSlots[] = $row['timeslot'];
    }
    $stmt->close();

    // calculate available slots excluding slots where selected professors are unavailable
    $totalAvailableSlots = 0;
    foreach ($roomsAvailability as $roomName => $timeslots) {
        foreach ($timeslots as $timeslot) {
            if ((!isset($bookedSlots[$roomName]) || !in_array($timeslot, $bookedSlots[$roomName])) && !in_array($timeslot, $professorUnavailableSlots)) {
                $totalAvailableSlots++;
            }
        }
    }

    return $totalAvailableSlots;
}

// this function is to build and return the html for the calendar based on availability and bookings (rendering personalized scheduling calendar)
function build_calendar($start_date, $end_date, $first_reader, $second_reader, $room) {
    $mysqli = new mysqli('localhost', 'root', '', 'bookingcalendar');
    $daysOfWeek = array('Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday');
    
    $startDateTime = new DateTime($start_date);
    $endDateTime = new DateTime($end_date);

    $month = $startDateTime->format('m');
    $year = $startDateTime->format('Y');

    $firstDayOfMonth = mktime(0,0,0,$month,1,$year);
    $numberDays = date('t',$firstDayOfMonth);

    $dateComponents = getdate($firstDayOfMonth);
    $monthName = $dateComponents['month'];
    $dayOfWeek = $dateComponents['wday'];
    
    $calendar = "<table class='table table-bordered'>";
    $calendar .= "<div class='month-year'><strong>Date: $monthName $year</strong></div>";
    $calendar .= "<tr>";
    
    foreach($daysOfWeek as $day) {
        $calendar .= "<th class='header'>$day</th>";
    } 

    $calendar .= "</tr><tr>";
    
    if ($dayOfWeek > 0) { 
        for($k = 0; $k < $dayOfWeek; $k++){
            $calendar .= "<td class='empty'></td>"; 
        }
    }
    
    $currentDay = 1;
    // processing availability data
    $availabilityData = getAvailabilityData($mysqli, $first_reader, $second_reader, $month, $year);
    $overlappingSlots = findOverlappingSlots($availabilityData, $first_reader, $second_reader);

    while ($currentDay <= $numberDays) {
        $currentDayRel = str_pad($currentDay, 2, "0", STR_PAD_LEFT);
        $date = "$year-$month-$currentDayRel";

        if (new DateTime($date) < $startDateTime || new DateTime($date) > $endDateTime) {
            if ($dayOfWeek == 7) {
                $dayOfWeek = 0;
                $calendar .= "</tr><tr>";
            }
            $calendar .= "<td class='empty'></td>";
            $currentDay++;
            $dayOfWeek++;
            continue;
        }
        
        $dayname = strtolower(date('l', strtotime($date)));
        $eventNum = 0;
        $today = $date == date('Y-m-d') ? "today" : "";
        
        if($date < date('Y-m-d')){
            $calendar .= "<td><h4>$currentDay</h4> <button class='btn btn-danger btn-xs'>N/A</button>";
        }
        elseif($dayOfWeek == 0 || $dayOfWeek == 6) {
            $calendar .= "<td class='blocked'><h4>$currentDay</h4> <button class='btn btn-danger btn-xs'>Weekend</button>";
        }
        else {
            if (isset($overlappingSlots[$date]) && count($overlappingSlots[$date]) > 0) {
                $availableSlotsCount = getAvailableSlotsCount($mysqli, $date, $first_reader, $second_reader);


                $thesis = isset($_GET['thesis']) ? $_GET['thesis'] : '';
                $name = isset($_GET['name']) ? $_GET['name'] : '';
                $email = isset($_GET['email']) ? $_GET['email'] : '';

                // logic to mark available and unavailable days
                if ($availableSlotsCount > 0) {
                    $calendar .= "<td class='$today'><h4>$currentDay</h4> 
                                    <a href='book.php?date=".$date."&first_reader=".$first_reader."&second_reader=".$second_reader."&thesis=".$thesis."&name=".$name."&email=".$email."' class='btn btn-success btn-xs'>
                                        Book
                                    </a>
                                  <small><i>$availableSlotsCount slots left</i></small></td>";
                } else {
                    $calendar .= "<td class='$today'><h4>$currentDay</h4> <button class='btn btn-danger btn-xs'>Unavailable</button></td>";
                }
            } else {
                $calendar .= "<td class='$today'><h4>$currentDay</h4> <button class='btn btn-danger btn-xs'>Unavailable</button>";
            }
        }
        
        $calendar .= "</td>";
        
        $currentDay++;
        $dayOfWeek++;

        if ($dayOfWeek == 7) {
            $dayOfWeek = 0;
            $calendar .= "</tr><tr>";
        }
    }

    while ($dayOfWeek > 0 && $dayOfWeek < 7) {
        $calendar .= "<td class='empty'></td>";
        $dayOfWeek++;
    }
    
    $calendar .= "</tr></table>";
    return $calendar;
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <title>Oral Defense Calendar</title>
    <style>
        body {
            font-family: 'Inter', sans-serif;
            background-color: #f4f4f4;
            color: #333;
        }
        .calendar-container {
            position: relative;
            margin-top: 20px;
            background-color: #f8f9fa;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.05);
            width: 100%; 
            max-width: auto; 
            margin-left: auto;
            margin-right: auto;
        }
        .calendar-heading {
            text-align: center;
            margin: 20px;
        }
        .calendar-heading h1 {
            font-size: 24px;
            color: #333;
            margin: 0;
        }
        .month-year {
            font-size: 15px;
            color: #666;
            text-align: right;
            margin: 10px;
        }
        .instruction-box {
            border: 1px solid #f39c12;
            padding: 15px;
            margin-top: 20px;
            margin-bottom: 20px;
            border-radius: 5px;
            background-color: #fff5f5;
        }
        table {
            width: 100%;
            table-layout: fixed;
        }
        th, td {
            text-align: center;
            padding: 10px;
            border: 1px solid #ddd;
        }
        th {
            background-color: #bababa;
        }
        .today {
            background-color: #ffffe0;
        }
        .blocked, .not-available {
            background-color: #bababa;
        }
        .available-slot {
            background-color: #dff0d8;
        }
        .btn-book {
            margin-top: 5px;
            font-size: 12px;
            padding: 5px 10px;
        }
        .slots-left {
            font-size: 12px;
            color: #666;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="calendar-container">
        <a href="student_index.php" class="btn btn-primary">Go Back</a>
            <div class="instruction-box">
            Please review the calendar to select a date for your oral defense. 
            </div>
            <div class="row">
                <div class="col-md-12">
                    <?php
                    // calling build_calendar function and it rendering the personalized calendar
                        echo build_calendar($start_date->format('Y-m-d'), $end_date->format('Y-m-d'), $first_reader, $second_reader, $room);
                    ?>
                </div>
            </div>
        </div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</body>
</html>
