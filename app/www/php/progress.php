<?php
$q = $_REQUEST["q"];
$prgData = fopen("progressData.txt", "r+");
$percentage = fgets($prgData); 


//just copy the value of the progress
if($q == 0){
    echo '<font size ="+1"> Progress:'.$percentage.'%'.'</font>';
}
//increase the value of the progress
else{
    
    if($percentage < 100){    
    $percentage++;
    }
    
    file_put_contents('progressData.txt', '');
    fwrite($prgData, $percentage);
    
    echo '<font size ="+1"> Progress:'.$percentage.'%'.'</font>';
    
}

?>