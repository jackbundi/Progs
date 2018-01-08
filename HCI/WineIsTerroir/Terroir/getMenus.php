<?php
    $conn = mysqli_connect("localhost","root","127.0.0.1","wine_is_terroir") or die(mysqli_connect_error() . " Connection Error Encountered");

    $menu = $_POST['pmenu'];
    $menu = json_decode($menu);
    
    $sql = "SELECT * FROM `menus` WHERE `menuType` = '$menu'";
    $result = mysqli_query($conn, $sql);
    while($row = mysqli_fetch_array($result)){
        ?>
    <ul>
        <li>
            <a>
                <img src="<?php echo $row['foodOneImage']; ?>">                        
                <!--<h2>Title #1</h2>
                        <p>Text Content #1</p> -->
                    </a>
        </li>
        <li>
            <a>
                <h2>
                    <?php echo $row['foodOneName']; ?>
                </h2>
                <p>
                    <?php echo $row['foodOneText']; ?>
                </p>
            </a>
        </li>
        <li>
            <a>
                <img src="<?php echo $row['foodTwoImage']; ?>">                        
                    <!--<h2>Title #3</h2>
                        <p>Text Content #3</p>-->
                    </a>
        </li>
        <li>
            <a>
                <h2>
                    <?php echo $row['foodTwoName']; ?>
                </h2>
                <p>
                    <?php echo $row['foodTwoText']; ?>
                </p>
            </a>
        </li>
        <li>
            <a>
                    <img src="<?php echo $row['foodThreeImage']; ?>">                        
                    <!--<h2>Title #5</h2>
                        <p>Text Content #5</p>-->
                    </a>
        </li>
        <li>
            <a>
                <h2>
                    <?php echo $row['foodThreeName']; ?>
                </h2>
                <p>
                    <?php echo $row['foodThreeText']; ?>
                </p>
            </a>
        </li>
        <li>
            <a>
                    <img src="<?php echo $row['foodFourImage']; ?>">                        
                    <!--<h2>Title #7</h2>
                        <p>Text Content #7</p>-->
                    </a>
        </li>
        <li>
            <a>
                <h2>
                    <?php echo $row['foodFourName']; ?>
                </h2>
                <p>
                    <?php echo $row['foodFourText']; ?>
                </p>
            </a>
        </li>

    </ul>
    <a href="order.php">
        <span style="color:darkred"><p class="animated infinite bounce">Click here to view the full menu and place an order!</p></span>
    </a>
    <?php
    }
?>
