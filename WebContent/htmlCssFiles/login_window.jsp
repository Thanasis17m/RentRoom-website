<div id="login_window" class="login_modal">
		
		<div class="login_modal_content animate">
			<form action="login" method="post">
				<div class="login_div">

					<!--The X button that closes the modal-->
					<span onclick="document.getElementById('login_window').style.display='none'" class="close_icon" title="Close">&times;</span>

					<label class="login_label"><b>Username</b></label>
				    <input class="input_login" type="text" name="username"/>

				    <label class="login_label"><b>Password</b></label>
				    <input class="input_login" type="password" name="password"/>

				    <input id="input_remember" type="checkbox" checked="checked"/>
				    <label for="input_remember">Remember me</label>
				    <span class="forgot_psw_msg"><a class="forgot_psw_link" href="#">Forgot password?</a></span>
				    <button class="login_button" type="submit">Login</button>
				</div>
			</form>
			<hr style="margin-bottom: 0px;padding-bottom: 0px;"/>
			<div class="login_div" style="background-color:#f1f1f1;overflow:hidden;">
				<div class="signup_msg">
					Don't have an account?
				</div>
				<form action="signup.jsp">
					<input id="signup_footer_button" type="submit" value="Sign Up"/>
				</form>
		    </div>
		</div>
	</div>
