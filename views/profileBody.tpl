		<?php
			require_once(INCLUDES.'db_connect.tpl');
			$db_connect = new DatabaseConnection();

			$target = $_SESSION["login_prof_id"];
			$query = "SELECT * FROM users WHERE profile_id = '$target'";
			$result = $db_connect->read_query($query);
			if ($result)
				$tuple = mysqli_fetch_assoc($result);
			else
				echo "You broke it!";
		?>
		<img src="images/cover-001.jpg" class="wid-100 mrg-0 pad-0" alt="Cover Image">
		<div class="container bodytext mrg-btm-30 pad-15">
			<div class="row">
				<div class="col-12 col-lg-4" align="center">
					<img class="img-fluid avatar m" src='images/dps/
					<?php
						if ($tuple["avatar"] != "")
							echo $tuple["avatar"];
						elseif ($tuple["gender"] == "female" && $tuple["avatar"] == "")
							echo "default-avatar-f.png";
						else
							echo "default-avatar-m.png";
					?>
					'>
				</div>
				<div class="col-12 offset-lg-2 col-lg-6 bg-white about-me">
					<hr>
					<div class="cinzel text-center">About Me</div>
					<hr>
					<div class="row">
						<div class="col-1">
							<i class='fas fa-user'></i>
							<br>
							<i class='fas fa-at'></i>
							<br>
							<i class='fas fa-phone-volume'></i>
							<br>
							<i class='fas fa-map-marker-alt'></i>
							<br>
							<i class='fas fa-info'></i>
						</div>
						<div class="col">
							<?php
								echo $tuple["user"]."<br>".
								$tuple["email"]." | ".$tuple["profile_id"]."<br>".
								$tuple["phone"]."<br>".
								$tuple["address"]."<br>".
								nl2br($tuple["user_desc"]);
							?>
						</div>
					</div>
					<!-- Button trigger modal -->
					<button type="button" class="btn btn-primary no-border fnt-12 mrg-tb-10" data-toggle="modal" data-target="#updateModal">
						Update Profile
					</button>

					<!-- Modal -->
					<div class="modal fade bodytext" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="updateModalTitle" aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="updateModalTitle">Profile Update</h5>
									<button type="button" class="close" data-dismiss="modal" aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
							        <form class="pad-25" method="post" action="update_profile.php" enctype="multipart/form-data">
										<div class="custom-file fnt-16">
											<input type="file" class="custom-file-input" id="dp" name="dp">
											<label class="custom-file-label" for="dp">Upload new dp</label>
										</div>
										<textarea class="form-control pad-10 wid-100 mrg-tb-5" name="desc" rows="3" placeholder="Write about yourself..."></textarea>
										<input type="text" class="form-control mrg-tb-5" name="address" placeholder="Your address">
										<input type="tel" class="form-control mrg-tb-5" name="tel" maxlength="10" placeholder="Your phone number">
										<input type="text" class="form-control mrg-tb-5" name="userid" placeholder="User ID">
										<fieldset class="form-group fnt-16">
											<legend class="col-form-label">Gender:</legend>
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="genderRadios" id="genderRadio1" value="male">
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
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary no-border" data-dismiss="modal">Close</button>
									<button type="submit" class="btn btn-primary no-border">Save changes</button>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>