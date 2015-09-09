<html>
<header>
  <title>Testing POST</title>
</header>
<body>
   <form method="post" 
        action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
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
<?php 

  require_once 'webAPI.php';

  // LogInServer();

  registerStaff();

?>

</body>
</html>