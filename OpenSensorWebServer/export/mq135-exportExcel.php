<?php  
session_start();
if(!isset($_SESSION['login'])){
  header("location: ../login.php");
}
else{
  include('../connection.php');
   $output = '';  
   if(isset($_POST["export_excel"]))  
   {  
        $sql = "SELECT * FROM sensorvalue WHERE SENSORMODEL = 'MQ135' ORDER BY TIME DESC";  
        $result = mysqli_query($conn, $sql);  
        if(mysqli_num_rows($result) > 0)  
        {  
             $output .= '  
                  <table class="table" bordered="1">  
                       <tr>  
                            <th>Model</th>  
                            <th>Gas</th>  
                            <th>Time</th>  
                            <th>Value</th>  
                            <th>Unit</th>  
                       </tr>  
             ';  
             while($row = mysqli_fetch_array($result))  
             {  

                $date=date_create($row['TIME']);
                $date = date_format($date,"d-m-Y H:i:s");

                $output .= '  
                     <tr>  
                          <td>'.$row["SENSORMODEL"].'</td>  
                          <td>'.$row["GAS"].'</td>  
                          <td>'.$date.'</td>  
                          <td>'.$row["VALUE"].'</td>  
                          <td>'.$row["UNIT"].'</td>  
                     </tr>  
                ';  
             }  
             $output .= '</table>';  
             header("Content-Type: application/xls");   
             header("Content-Disposition: attachment; filename=download.xls");  
             echo $output;  
        }  
   }  
 }
 ?>