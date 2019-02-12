<?php
	require_once(INCLUDES.'db_connect.tpl');
	$db_connect = new DatabaseConnection();
?>
		<div class="container bodytext bg-white mrg-btm-30 pad-15">

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
			
			<div class="title-be">
				<h5>User Registrations</h5>
				<hr align="left">
			</div>
			<div class="table-responsive">
				<table class="table table-bordered table-striped table-hover">
					<thead class="thead-dark">
						<tr>
							<th scope="col">#</th>
							<th scope="col">Name</th>
							<th scope="col">Email</th>
							<th scope="col">Gender</th>
							<th scope="col">Phone</th>
							<th scope="col">Address</th>
							<th scope="col">Avatar</th>
							<th scope="col">Date</th>
							<th scope="col" colspan="3">Action</th>
						</tr>
					</thead>
					<tbody>
						<?php
							$query = "SELECT * FROM users WHERE verified = '0'";
							$result = $db_connect->read_query($query);
							if ($result) {
								$count = 1;
								while($tuple = mysqli_fetch_assoc($result)) {
								echo "
						<tr>
							<td>".$count."</td>
							<td>".$tuple['user']."</td>
							<td>".$tuple['email']."</td>
							<td>".$tuple['gender']."</td>
							<td>".$tuple['phone']."</td>
							<td>".$tuple['address']."</td>
							<td>".$tuple['avatar']."</td>
							<td>".date('M j Y g:i A', strtotime($tuple["created"]))."</td>
							<form method='post' action='decision'>
								<input type='hidden' name='user_id' value='".$tuple['id']."'>
								<input type='hidden' name='decision' value='approve'>
								<td><button type='submit' class='btn btn-success btn-cus'>Approve</button></td>
							</form>
							<form method='post' action='decision'>
								<input type='hidden' name='user_id' value='".$tuple['id']."'>
								<input type='hidden' name='decision' value='delete'>
								<td><button type='submit' class='btn btn-danger btn-cus'>Delete</button></td>
							</form>
							<td><button class='btn btn-warning btn-cus' data-toggle='modal' data-target='#updateModal".$tuple['id']."'>Edit</button></td>

							<!-- Modal -->
							<div class='modal fade bodytext' id='updateModal".$tuple['id']."' tabindex='-1' role='dialog' aria-labelledby='updateModalTitle' aria-hidden='true'>
								<div class='modal-dialog modal-dialog-centered' role='document'>
									<div class='modal-content'>
										<div class='modal-header'>
											<h5 class='modal-title' id='updateModalTitle'>Edit User Information</h5>
											<button type='button' class='close' data-dismiss='modal' aria-label='Close'>
												<span aria-hidden='true'>&times;</span>
											</button>
										</div>
										<div class='modal-body'>
									        <form class='pad-25' method='post' action='update_profile.php' enctype='multipart/form-data'>
									        	<input type='hidden' name='user_id' value='".$tuple['id']."'>
												<div class='custom-file fnt-16'>
													<input type='file' class='custom-file-input' id='dp' name='dp'>
													<label class='custom-file-label' for='dp'>Avatar</label>
												</div>
												<textarea class='form-control pad-10 wid-100 mrg-tb-5' name='desc' rows='3' placeholder='Users bio'></textarea>
												<input type='text' class='form-control mrg-tb-5' name='address' placeholder='Address'>
												<input type='tel' class='form-control mrg-tb-5' name='tel' maxlength='10' placeholder='Phone number'>
												<input type='text' class='form-control mrg-tb-5' name='userid' placeholder='User ID'>
												<fieldset class='form-group fnt-16'>
													<legend class='col-form-label'>Gender:</legend>
													<div class='form-check form-check-inline'>
														<input class='form-check-input' type='radio' name='genderRadios' id='genderRadio1' value='male'>
														<label class='form-check-label' for='genderRadio1'>Male</label>
													</div>
													<div class='form-check form-check-inline'>
														<input class='form-check-input' type='radio' name='genderRadios' id='genderRadio2' value='female'>
														<label class='form-check-label' for='genderRadio2'>Female</label>
													</div>
													<div class='form-check form-check-inline'>
														<input class='form-check-input' type='radio' name='genderRadios' id='genderRadio3' value='other'>
														<label class='form-check-label' for='genderRadio3'>Other</label>
													</div>
												</fieldset>
										</div>
										<div class='modal-footer'>
											<button type='button' class='btn btn-secondary no-border' data-dismiss='modal'>Close</button>
											<button type='submit' class='btn btn-primary no-border'>Save changes</button>
											</form>
										</div>
									</div>
								</div>
						</tr>";
							$count++;
							}
						}
						else
							echo "No pending registrations!";
							$db_connect->close();
						?>
					</tbody>
				</table>
			</div>
		</div>