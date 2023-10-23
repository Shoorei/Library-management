<?php
include('head.php');
session_start();
if(!isset($_SESSION['se_admin'])){
    include './includes/functions.php';
    $pageName='Login';
    $messages = "";
    if(isset($_POST['Login'])){
        $mobile = $_POST['mobile'];
        $pass = $_POST['pass'];
        $password = md5($pass);
        $employee_info=check_admin_info_by_mobile($mobile);
        if($employee_info){
            if($employee_info['a_status']==0){
                $messages = "Hãy Xác Minh Tài Khoản Của Bạn";
            }else{
                if(cms_emp_login($mobile,$password)){
                    $emp_info = cms_emp_login($mobile,$password);
                    $_SESSION['se_admin'] = $emp_info;
                    header("Location: cpanel.php");
                }else{
                    $messages = "Mật Khẩu Không Đúng";
                }
            }
        }else{
            $messages = "Số điện thoại không đúng";
        }
    }

    ?>

    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <title><?php echo $pageName.'-'.$webSiteName; ?></title>
        <link rel="shortcut icon" href="favicon.ico">
        <link href="css/bootstrap.min.css" type="text/css" rel="stylesheet"  />
        <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet"  />


        <style type="text/css">

            body{
                background-image: url("images/lib1.jpg");
                background-repeat: no-repeat;
                background-size: cover;
                background-position: center;
            }

            .login{
                padding-left: 80px;
                color: white;
            }

            .color{
                color: white;
            }

            .loginForm{
                border: 3px solid #f1f1f1;
                border-radius:5px;
                padding: 50px;
                padding-left: 90px;
                max-width: 500px;
                margin: 0 auto;
                background-color: lightblue;
            }

            .header{
                text-align: center;
                background-color: #007fff;
                color: white;
                padding: 5px;
            }
            .container{
                
            }
        </style>
    </head>
    <body>
    <div style='padding-top: 70px; padding-left:500px; color: white;'> <div id='message'><h2><?= $messages; ?></h2></div> </div>
        <div class="container">
            <div class="loginForm">
                <div class="header">
                    <h4><b>Library Management System</b></h4>
                </div><br>

                <p class="login"><strong>Please login!</strong></p>
                <h1></h1>
                <form action="" method="post">
                    <label class="color" for="Mobile">Mobile No:</label>
                    <input type="text" name="mobile" required/> <br />

                    <label class="color" for="Password">Password:</label>
                    <input type="password" name="pass" required />
                    <p class="color">Please enter login information</p><br>

                    <div class="text-center">
                        <input type="submit" name="Login" class="btn btn-default" value="Login">
                        <input type="reset"  class="btn btn-default" value="Reset">
                    </div>
                    <br>
                    <a class="forget" href="">Forgot your password?</a>

                </form>
                <hr/>
            </div>
        </div>

    <?php include 'includes/blinker.php'; ?>

    </body>
    </html>
    <?php
}else{
    echo "<meta http-equiv='refresh' content='.5;url=cpanel.php'>";
}
?>
