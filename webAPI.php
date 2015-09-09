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
        echo "<p>connected successfully</p>";//testing
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
            echo $usernameError;//testing
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

              echo "<p>username is '".$username."'</p>";

              //making sure this is a unique registration
              $query = "SELECT * from registeredstaff";
              $result = mysqli_query($db, $query);
              

              printf("Select returned %d rows.\n", mysqli_num_rows($result));
              printf("%s\n", mysqli_info($db));

              $row = mysqli_fetch_array( $result, MYSQLI_ASSOC );
              echo "<p>about to print the row</p>";
              print_r($row);

              /* free result set */
              // $result->close();

              //attempting to register
          }
            
        }        
      }//eo-connection to DB

      //sending reply back


}//eom


?>