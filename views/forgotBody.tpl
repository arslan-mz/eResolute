		<div class="container bodytext bg-white mrg-btm-30 pad-15">
			<div class="title-be text-center">
				<h2>Password Reset</h2>
				<hr>
			</div>
			<p class="heading mrg-t-20 text-center">Forgot your password?</p>
			<img class="img-fluid mrg-auto mx-ht-240" src="images/forgot.png">
			<p class="cinzel mrg-t-20 fnt-16 text-center">No worries! You can reset it too!</p>
			<form class="mrg-tb-20 pad-25" method="post" action="genPwdRstTkn.php">
				<div class="row">
					<div class="form-group col-12 offset-lg-3 col-lg-6">
						<label for="InputEmail">Email address *</label>
						<input type="email" class="form-control" id="InputEmail" name="email" aria-describedby="emailHelp" required>
						<small>Please enter the email associated with your KalaManthan account. We'll mail you a password reset link.</small>
					</div>

					<div class="w-100"></div>

					<div class="form-group col text-center">
						<button type="submit" class="btn btn-primary bg-black no-border">Send password reset link</button>
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