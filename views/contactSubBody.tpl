		<div class="container bodytext bg-white mrg-btm-30 pad-15">
			<div class="title-be">
				<h5>Contact Form Submissions</h5>
				<hr align="left">
			</div>
			<div class="table-responsive">
				<table class="table table-bordered table-striped table-hover">
					<thead class="thead-dark">
						<tr>
							<th scope="col">#</th>
							<th scope="col">Name</th>
							<th scope="col">Email</th>
							<th scope="col">Message</th>
							<th scope="col">Date</th>
						</tr>
					</thead>
					<tbody>
						<?php
							require_once(INCLUDES.'db_connect.tpl');
							$db_connect = new DatabaseConnection();

							$query = "SELECT * FROM contact_submissions ORDER BY created DESC";

							$result = $db_connect->read_query($query);
							if ($result) {
								$count = 1;
								while($tuple = mysqli_fetch_assoc($result)) {
								echo "
						<tr>
							<td>".$count."</td>
							<td>".$tuple['name']."</td>
							<td>".$tuple['email']."</td>
							<td>".$tuple['message']."</td>
							<td>".$tuple['created']."</td>
						</tr>";
							$count++;
							}
						}
						else
							echo "No submissions yet!";
							$db_connect->close();
						?>
					</tbody>
				</table>
			</div>
		</div>