		<div class="container bodytext bg-white mrg-btm-30 pad-15">
			<div class="title-be text-center">
				<h2>Register</h2>
				<hr>
			</div>
			
			<form class="mrg-tb-20 pad-25" method="post" onsubmit="return validate()" action="signup.php">
				<div class="row">
					<div class="form-group col-lg-6">
						<label for="InputName">Name *</label>
						<input type="text" class="form-control" id="InputName" name="name" aria-describedby="nameHelp" placeholder="Enter name" required>
					</div>

					<div class="form-group col-lg-6">
						<label for="InputEmail">Email address *</label>
						<input type="email" class="form-control" id="InputEmail" name="email" aria-describedby="emailHelp" placeholder="Enter email" required>
						<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
					</div>

					<div class="w-100"></div>

					<fieldset class="form-group col-lg-6">

						<div>
							Gender *
						</div>

						<div class="form-check form-check-inline mrg-t-15">
							<input class="form-check-input" type="radio" name="genderRadios" id="genderRadio1" value="male" checked>
							<label class="form-check-label" for="genderRadio1">Male</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="genderRadios" id="genderRadio2" value="female">
							<label class="form-check-label" for="genderRadio2">Female</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="genderRadios" id="genderRadio3" value="other">
							<label class="form-check-label" for="genderRadio3">Other</label>
						</div>

					</fieldset>

					<div class="form-group col-lg-6">
						<label for="dob">DOB *</label>
						<input type="date" class="form-control" name="dob" id="dob" required>
					</div>
				</div>

				<div class="row">
<!--
					<div class="form-group col-lg-6">
						<label for="InputPhone">Phone *</label>
						<input type="tel" class="form-control" id="InputPhone" name="tel" aria-describedby="phoneHelp" placeholder="Enter phone number" required>
					</div>
-->
					<div class="form-group col-lg-6">
						<label for="Password1">Password *</label>
						<input type="password" class="form-control" id="Password1" name="password1" placeholder="Password" required="">
					</div>

					<div class="form-group col-lg-6">
						<label for="Password2">Confirm Password *</label>
						<input type="password" class="form-control" id="Password2" name="password2" placeholder="Re-enter Password" required>
					</div>
				</div>
<!--
				<div class="form-group">
					<label for="InputAddress">Address</label>
					<input type="text" class="form-control" id="InputAddress" name="address" aria-describedby="addressHelp" placeholder="Enter address" required>
				</div>
-->
				<div class="form-group form-check">
					<input type="checkbox" class="form-check-input" id="tncCheck" required>
					<label class="form-check-label" for="tncCheck">I agree to e-Resolute Terms and Conditions</label>
				</div>
				<button type="submit" class="btn btn-primary bg-black no-border">Sign up</button>
			</form>
			
			<div class="offset-lg-3 col-lg-6">
				<?php
					if(isset($_SESSION['alert-msg']) && isset($_SESSION['alert-type'])) {
				?>
						<p class="alert alert-<?php echo $_SESSION['alert-type']; ?> alert-dismissible fade show">
							<a class="close" data-dismiss="alert" aria-label="close">&times;</a>
							<?php echo $_SESSION['alert-msg'];
							if(isset($_SESSION['alert-msg-2'])) { ?>
							<br>
							<small><?php echo $_SESSION["alert-msg-2"]; ?></small>
						</p>
				<?php
							unset($_SESSION['alert-msg-2']);
						}
						unset($_SESSION['alert-msg']);
						unset($_SESSION['alert-type']);
					}
				?>
			</div>
		</div>