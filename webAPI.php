<?php 


function LogInServer() {
  echo "testing";

}

function registerStaff()
{
      /* error types:
        0 user successfully saved
        -1 un-able to connect to the database
        -2 missing required input fields 
        -3 user with that email or phone number already exist
      */
      $errorOccurred = false;
      $passwordError = ""; 
      $usernameError = "";

      //connect to database
      $db = mysqli_connect("localhost", "root", "fall2015", "golocalapp");

      if( !$db )//un-able to connect to the database
      {
        echo "Unable to connect to MySQL.".PHP_EOL;
        $errorOccurred = true;
      } 
      else //connection to the database establish
      {
        //processing POST request's
        if( $_SERVER["REQUEST_METHOD"] == "POST" )
        {
          // if( empty($_POST["password"]) || empty($_POST["confirmPass"]) )
          // {
          //   $passwordError = "Password is required";
          // }


          //validated required fields
          if( empty($_POST["username"]))
          {
            $usernameError = "username is required";
            $errorOccurred = true;
          }
          else 
          {
            $username = $_POST["username"];
          }

          // interact with database since all required fields were filled
          if(!$errorOccurred) 
          {
              //preventing sql injections
              $username = trim($username);
              $username = stripcslashes($username);
              $username = htmlspecialchars($username);

              //making sure this is a unique registration
              $query = "SELECT username from registeredstaff";
              $result = mysqli_query($db, $query);
              echo $result;

              /* free result set */
              $result->close();

              //attempting to register
          }
            
        }        
      }//eo-connection to DB

      //sending reply back


}//eom


?>