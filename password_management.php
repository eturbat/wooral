<?php

//db connection
$mysqli = new mysqli('localhost', 'root', '', 'bookingcalendar');

if ($mysqli->connect_error) {
    die("Connection failed: " . $mysqli->connect_error);
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $panel = $_POST['panel'];
    $password = $_POST['password'];

    // Check if the password for this panel already exists
    $checkQuery = "SELECT * FROM panel_passwords WHERE panel = ?";
    $stmt = $mysqli->prepare($checkQuery);
    $stmt->bind_param("s", $panel);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        // Update the existing password
        $updateQuery = "UPDATE panel_passwords SET password = ? WHERE panel = ?";
    } else {
        // Insert a new password
        $updateQuery = "INSERT INTO panel_passwords (password, panel) VALUES (?, ?)";
    }

    $stmt = $mysqli->prepare($updateQuery);
    $stmt->bind_param("ss", $password, $panel);
    $stmt->execute();
    // admin updated action alert
    echo "<div class='alert alert-success'>Password for $panel panel updated successfully.</div>";
}

// Fetch current passwords
$fetchPasswordsQuery = "SELECT panel, password FROM panel_passwords";
$fetchStmt = $mysqli->prepare($fetchPasswordsQuery);
$fetchStmt->execute();
$fetchResult = $fetchStmt->get_result();
$currentPasswords = [];
while ($row = $fetchResult->fetch_assoc()) {
    $currentPasswords[$row['panel']] = $row['password'];
}
?>

<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Inter', sans-serif;
            background-color: #f4f4f4;
            color: #333;
        }
        .password-management-container {
            margin-top: 20px;
            background-color: #f8f9fa;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.05);
            width: 60%;
            margin-left: auto;
            margin-right: auto;
        }
        .form-header {
            text-align: center;
            margin-bottom: 20px;
            font-size: 1.5em;
            color: #333;
        }
        .field-icon {
            float: right;
            left: -10px;
            margin-left: -25px;
            margin-top: -25px;
            position: relative;
            z-index: 2;
        }
        .btn {
            display: block;
            width: 100%;
            margin: 10px auto;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
        }
        .panel-form {
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px; 
            margin: 0 10px;
        }
        .row.centered-forms {
            justify-content: center;
            display: flex;
            flex-wrap: wrap;
        }
    </style>
    <title>Password Management</title>
</head>
<body>
    <div class="container">
        <div class="password-management-container">
            <div class="form-header">Password Management</div>
            <div class="row centered-forms">
                <?php foreach (['student', 'professor'] as $panel): ?>
                <div class="col-md-6">
                    <form action="" method="post" class="panel-form">
                        <input type="hidden" name="panel" value="<?= $panel ?>">
                        <div class="form-group">
                            <label><?= ucfirst($panel) ?> Panel Password</label>
                            <input id="password-<?= $panel ?>" type="password" name="password" value="<?= htmlspecialchars($currentPasswords[$panel] ?? '') ?>" class="form-control" required>
                            <span toggle="#password-<?= $panel ?>" class="fa fa-fw fa-eye field-icon toggle-password"></span>
                        </div>
                        <button type="submit" class="btn btn-primary">Update</button>
                    </form>
                </div>
                <?php endforeach; ?>
            </div>
        </div>
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
    // pass hide and show toggle function
    $(document).ready(function() {
        // click event listener on all elements with class 'toggle-password'
        $(".toggle-password").click(function() {
            // toggle the classes 'fa-eye' and 'fa-eye-slash' for the clicked element
            $(this).toggleClass("fa-eye fa-eye-slash");
            var input = $($(this).attr("toggle"));
            // Check the current type of the input field (password or text)
            if (input.attr("type") === "password") {
                // if it's a password field, change its type to text to show the password
                input.attr("type", "text");
            } else {
                // if it's a text field, change its type back to password to hide the password
                input.attr("type", "password");
            }
        });
    });
    </script>
</body>
</html>
