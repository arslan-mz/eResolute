		<div class="container bodytext bg-white mrg-btm-30 pad-15">
			<div class="title-be text-center">
				<h2>Login</h2>
				<hr>
			</div>
			<p class="heading mrg-t-20 text-center"></p>
			<p class="cinzel clr-green fnt-16 text-center">Log in and view your information.</p>
			<form class="pad-25" method="post" action="login.php">
				<div class="row mrg-t-30">
					<div class="form-group col-12 offset-lg-3 col-lg-6">
						<label for="InputEmail">Email address *</label>
						<input type="email" class="form-control" id="InputEmail" name="email" aria-describedby="emailHelp" placeholder="Enter email" required>
					</div>

					<div class="w-100"></div>

					<div class="form-group col-12 offset-lg-3 col-lg-6">
						<label for="InputPassword">Password *</label>
						<input type="password" class="form-control" id="InputPassword" name="password" placeholder="Password" required>
						<small><a href="forgot">Forgot password?</a></small>
					</div>

					<div class="w-100"></div>

					<div class="form-group form-check col offset-lg-3 col-lg" hidden>
						<input type="checkbox" class="form-check-input" id="tncCheck">
						<label class="form-check-label" for="tncCheck">Remember me</label>
					</div>

					<div class="w-100"></div>

					<div class="form-group col offset-lg-3 col-lg">
						<button type="submit" class="btn btn-primary bg-black no-border">Login</button>
					</div>		
				</div>
			</form>
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