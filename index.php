<?php
	include('includes/config.php');
	$reqErr = $loginErr = "";
	if($_SERVER['REQUEST_METHOD'] == "POST") {
		if(!empty($_POST['txtUsername']) && !empty($_POST['txtPassword']) && isset($_POST['login_type'])){
			session_start();
			$username = $_POST['txtUsername'];
			$password = $_POST['txtPassword'];
			$_SESSION['sessLogin_type'] = $_POST['login_type'];
			if($_SESSION['sessLogin_type'] == "retailer") {
				//if selected type is retailer than check for valid retailer.
				$query_selectRetailer = "SELECT retailer_id,username,password FROM retailer WHERE username=?";
				if($result = mysqli_prepare($con,$query_selectRetailer)){
					mysqli_stmt_bind_param($result,"s",$param_username);
					$param_username=$username;
					if(mysqli_stmt_execute($result)){
						mysqli_stmt_store_result($result);
						if(mysqli_stmt_num_rows($result)==1){
							mysqli_stmt_bind_result($result,$id,$username,$hash_password);
							if(mysqli_stmt_fetch($result)){
								if(password_verify($password,$hash_password)){
									
									$_SESSION['retailer_id'] =  $id;
									$_SESSION['sessUsername'] = $_POST['txtUsername'];
									$_SESSION['retailer_login'] = true;
									header('Location:retailer/index.php');
									
								}
								else{
									$loginErr="* password is incorrect";
								}
							}
						}
						else{
							$loginErr="*username is incorrect";
						}
					}
				}
			}
			else if($_SESSION['sessLogin_type'] == "manufacturer") {
				//if selected type is manufacturer than check for valid manufacturer.
				$query_selectManufacturer = "SELECT man_id,username,password FROM manufacturer WHERE username=?";
				if($result = mysqli_prepare($con,$query_selectManufacturer)){
					mysqli_stmt_bind_param($result,"s",$param_username);
					$param_username=$username;
					if(mysqli_stmt_execute($result)){
						mysqli_stmt_store_result($result);
						if(mysqli_stmt_num_rows($result)==1){
							mysqli_stmt_bind_result($result,$id,$username,$hash_password);
							if(mysqli_stmt_fetch($result)){
								if(password_verify($password,$hash_password)){
									
									$_SESSION['manufacturer_id'] =  $id;
									$_SESSION['sessUsername'] = $_POST['txtUsername'];
									$_SESSION['manufacturer_login'] = true;
									header('Location:manufacturer/index.php');
									
								}
								else{
									$loginErr="* password is incorrect";
								}
							}
						}
						else{
							$loginErr="*username is incorrect";
						}
					}
				}

			}
			else if($_SESSION['sessLogin_type'] == "admin") {
				$query_selectAdmin = "SELECT username,password FROM admin WHERE username=?";
				if($result = mysqli_prepare($con,$query_selectAdmin)){
					mysqli_stmt_bind_param($result,"s",$param_username);
					$param_username=$username;
					if(mysqli_stmt_execute($result)){
						mysqli_stmt_store_result($result);
						if(mysqli_stmt_num_rows($result) == 1){
							mysqli_stmt_bind_result($result,$username,$hash_password);
							if(mysqli_stmt_fetch($result)){
								if(password_verify($password,$hash_password)){
									$_SESSION['admin_login'] = true;
									$_SESSION['sessUsername'] = $_POST['txtUsername'];
									header('Location:admin/index.php');
								}
								else{$loginErr="*password is incorrect";}
							}
						}
						else{$loginErr="*username is incorrect";}
					}
				}
				}
			}
		else {
			$reqErr = "* All fields are required.";
		}
	}
?>
<!DOCTYPE html>
<html>
<head>
	<title> Login </title>
	<link rel="stylesheet" href="includes/main.css" >
</head>
<body class="login-box">
	
	<form action="" method="POST" class="login-form">
	<h1>Sign in</h1>
	<ul class="form-list">
	<li>
		<div class="label-block"> <label for="login:username">Username</label> </div>
		<div class="input-box"> <input type="text" id="login:username" name="txtUsername" placeholder="Username" /> </div>
	</li>
	<li>
		<div class="label-block"> <label for="login:password">Password</label> </div>
		<div class="input-box"> <input type="password" id="login:password" name="txtPassword" placeholder="Password" /> </div>
	</li>
	<li>
		<div class="label-block"> <label  for="login:type">sign in type</label> </div>
		<div class="input-box">
		<select name="login_type" id="login:type">
		<option id="sign_in_type" value="" disabled selected> user type </option>
		<option value="retailer">Retailer</option>
		<option value="manufacturer">Manufacturer</option>
		<option value="admin">Admin</option>
		</select>
		</div>
	</li>
	<li>
		<input type="submit" value="Sign in" align="center" class="submit_button_login" /> <p style="color:red;" class="error_message"> <?php echo $loginErr; echo $reqErr; ?> </p>
	</li>
	</ul>
	</form>
	<style>
		input:-webkit-autofill,
input:-webkit-autofill:hover, 
input:-webkit-autofill:focus, 
input:-webkit-autofill:active  {
  transition: background-color 5000s;
  -webkit-text-fill-color: #fff !important;
}
	</style>
</body>
</html>