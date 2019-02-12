		<div class="container bodytext bg-white mrg-btm-30 pad-15">
			<p class="heading mrg-t-20 text-center">Forgot your password?</p>
			<p class="cinzel clr-green fnt-16 text-center">No worries! You can reset it too!</p>
			<form class="mrg-tb-20 pad-25" method="post" action="resetPwd.php">
				<div class="row">
					<div class="form-group col-12 offset-lg-3 col-lg-6">
						<label for="InputPassword1">Password *</label>
						<input type="password" class="form-control" id="InputPassword1" name="password1" placeholder="New Password" required>
					</div>

					<div class="form-group col-12 offset-lg-3 col-lg-6">
						<label for="InputPassword2">Confirm Password *</label>
						<input type="password" class="form-control" id="InputPassword2" name="password2" placeholder="Repeat Password" required>
					</div>

					<div class="w-100"></div>

					<div class="form-group col offset-lg-3">
						<button type="submit" class="btn btn-primary bg-black no-border">Change password</button>
					</div>

					<div class="w-100"></div>

					<div class="offset-lg-3 col-lg-6">
						<?php
							if(isset($_SESSION['alert-msg']) && isset($_SESSION['alert-type'])) {
						?>
								<p class="alert alert-<?php echo $_SESSION['alert-type']; ?> alert-dismissible fade show">
									<a class="close" data-dismiss="alert" aria-label="close">&times;</a>
									<?php echo $_SESSION['alert-msg']; ?>
								</p>
						<?php
								unset($_SESSION['alert-msg']);
								unset($_SESSION['alert-type']);
							}
						?>
					</div>
				</div>
			</form>
		</div>