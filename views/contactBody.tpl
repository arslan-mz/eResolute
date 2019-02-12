		<div class="container bodytext bg-white mrg-btm-30 pad-15">
			<div class="title-be text-center">
				<h2>Contact Us</h2>
				<hr>
			</div>
			<br>
			<p class="heading" align="center">Have any queries? Feel free to contact us.</p><br>
			<form class="pad-25" method="post" action="contact.php">
				<div class="form-group row">

					<div class="col-lg-1"></div>

					<label class="col-form-label col-sm-12 col-lg">Name *</label>
					<div class="col-sm-12 col-lg-3">
						<input type="text" name="name" class="form-control" required>
					</div>

					<br><br><br>

					<label class="col-form-label col-sm-12 offset-lg-1 col-lg">Email-id *</label>
					<div class="col-sm-12 col-lg-3">
						<input type="email" name="email" class="form-control" required>
					</div>

					<div class="col-lg-1"></div>
					
					<br>
					
					<label class="col-form-label offset-lg-1 col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 mrg-t-10">Message *</label>
					<div class="col offset-lg-1">
						<textarea class="form-control" name="message" rows="5" required></textarea>
					</div>
					
					<div class="col-lg-1"></div>

				</div>
				
				<div class="form-group row">
					<div class="col offset-lg-1">
						<button type="submit" class="btn btn-primary bg-black no-border">Submit</button>
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
