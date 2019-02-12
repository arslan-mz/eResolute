		<?php
			require_once(INCLUDES.'db_connect.tpl');
			$db_connect = new DatabaseConnection();

			$id = $arg['id'];
			$query = "SELECT id, user, avatar, user_desc FROM users WHERE profile_id = '$id'";
			$result = $db_connect->read_query($query);
			if ($result) {
				$tuple = mysqli_fetch_assoc($result);
				$id = $tuple['id'];
				$name = $tuple['user'];
			?>
				<div class="container bodytext bg-white mrg-btm-30 pad-15 text-justify">
					<div class='row pad-10'>
						<div class='col-lg-4 pad-20 text-center'>
							<img class="img-fluid avatar-type-2" src='images/dps/
							<?php
								if ($tuple["avatar"] != "")
									echo $tuple["avatar"];
								else
									echo "default-avatar-m.png";
							?>
							'>
						</div>
						<div class='col-lg-8 pad-20 text-justify' style='margin: auto;'>
							<h4>
								<?php
									echo $name;
								?>
							</h4>
							<p class='mrg-t-10'>
								<?php
									echo nl2br($tuple["user_desc"]);
								?>
							</p>
						</div>
					</div>
			<?php
				$query = "SELECT * FROM user_posts WHERE user_id = '$id' && passed = '1' ORDER BY created DESC";
				$result = $db_connect->read_query($query);
				if ($result && mysqli_num_rows($result) > 0) {
					while($tuple = mysqli_fetch_assoc($result)) {
						echo "
							<small>
								<b>".date('M j Y g:i A', strtotime($tuple["created"]))."
								</b>
							</small>
							<p class='bodytext fnt-16 pad-rl-10 pad-t-10'>
								<b>".$tuple["post_cat"]."</b><br>".
								nl2br($tuple["post_body"])."
							</p>
							<div class='row'>";
							if($tuple["img"] != ""){
								echo "
								<div class='col-lg-4 text-center pad-10'>
									<img class='img-fluid mx-ht-240 mr-auto' src='posts/".$tuple["img"]."'>
								</div>
								"; 
							}
							if($tuple["vid"] != ""){
								echo "
								<div class='col-lg-4 text-center pad-10'>
									
									<video class='video-element mx-wid-100' height='240' controls controlsList='nodownload'>
										<source src='posts/".$tuple["vid"]."' type='video/mp4'>
										No browser support for this element.
									</video>
									
								</div>
								"; 
							}
							if($tuple["file"] != ""){
								echo "
								<div class='col-lg-4 text-center pad-10'>
									<a class='mr-auto' href='posts/".$tuple["file"]."'>".$tuple["file"]."</a>
								</div>
								"; 
							}
							echo "
							</div>
							<hr>";
						}
					}
					else
						echo "<p class='pad-20 mr-btm-20 fnt-16 bodytext'><b>".$name." hasn't posted yet!</b></p>";
						$db_connect->close();
			}
			else
				require_once(PAGE.'error.tpl');
		?>
		</div>