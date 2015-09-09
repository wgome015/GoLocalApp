<html>
<header>
  <title>Go Local App</title>
</header>
<body>

  <?php
  //define variables used in the form
  $username;
  $password;
  $confirmPass;
  $email;
  $confirmEmail;
  $fname;
  $middleI;
  $lname;
  $gender;
  $usernameError = "";
  $passwordError = "";
  $emailError = "";
  $passwordMatchError = "";
  $emailMatchError = "";

  $db = mysqli_connect("localhost", "root", "root", "golocalapp");
  if( !$db )
    echo "Unable to connect to MySQL.".PHP_EOL;

  if( $_SERVER["REQUEST_METHOD"] == "POST" )
  {
    if( empty($_POST["username"]) )
      $usernameError = "Username is required";
    else
    {
      $username = test_input($_POST["username"]);
    }

    if( empty($_POST["password"]) || empty($_POST["confirmPass"]) )
      $passwordError = "Passowrd is required";
    else
    {
      if( $_POST["password"] != $_POST["confirmPass"] )
        $passwordMatchError = "The passwords don't match<br>";
      else
      {
        // $passwordHashed = password_hash($_POST['password'], PASSWORD_BCRYPT);
        // $query = "";
        // $result = mysqli_query($db, $query);
        // $row = mysqli_fetch_array( $result, MYSQLI_ASSOC );

        // if( password_verify( $password, $row["password"]) )
        // {
        //   echo "SUCCESS";
        // }
        // else
        // {
        //   echo "WONG PASSWORD";
        // }
      }
    }

    if( empty($_POST["email"]) || empty($_POST["confirmEmail"]) )
      $emailError = "Email is required";
    else
    {
      if( $_POST["email"] != $_POST["confirmEmail"] )
        $emailMatchError = "Emails do not match<br>";
      else
      {
        $passwordHashed = password_hash($_POST['password'], PASSWORD_BCRYPT);
        $email = $_POST["email"];
        $query = "INSERT INTO registeredstaff (peopleID, username, password, email)
                  VALUES ( '0', '$username', '$passwordHashed', '$email' )";
        $result = mysqli_query($db, $query);

        $to = $email;
        $subject = "GoLocalApp email verification";
        $message = "Thanks for signing up!";
        $from = "noreply@golocalpromos.com";
        mail( $to, $subject, $message );

      }
    }

  }

  function test_input($data)
  {
    $data = trim($data);
    $data = stripcslashes($data);
    $data = htmlspecialchars($data);
    return $data;
  }
  
  ?>

  <!-- Create the form -->
  <form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
  	Username: <input type="text" name="username" value="<?php echo $username; ?>">
      <span class="error">*<?php echo $usernameError; ?></span><br><br>
    <span class="error"><?php echo $passwordMatchError; ?></span>
  	Password: <input type="password" name="password">
      <span class="error">*<?php echo $passwordError; ?></span><br><br>
  	Confirm Password: <input type="password" name="confirmPass">
      <span class="error">*<?php echo $passwordError; ?></span><br><br>
    <span class="error"><?php echo $emailMatchError; ?></span>
  	Email: <input type="email" name="email"><br><br>
  	Confirm Email: <input type="email" name="confirmEmail"><br><br>
  	Name: <input type="text" name="fname"><br><br>
  	Middle Initial: <input type="text" name="middleI"><br><br>
  	Last Name: <input type"text" name="lname"><br><br>
  	Gender: <input type="radio" name="gender" value="female">Female
  			<input type="radio" name="gender" value="male">Male
  	<br><br><input type="submit" value="Submit">
  </form>
  	
</body>
</html>