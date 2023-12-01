<?php

session_start();

include("includes/db.php");
include("includes/header.php");

?>


<body onload="window.print();">
	<div id="page" class="page">

		<!--*******************
        Preloader start
    ********************-->
		<!-- <div id="preloader">
		<div class="sk-three-bounce">
			<div class="sk-child sk-bounce1"></div>
			<div class="sk-child sk-bounce2"></div>
			<div class="sk-child sk-bounce3"></div>
		</div>
	</div> -->
		<!--*******************
        Preloader end
    ********************-->


		<!--**********************************
        Main wrapper start
    ***********************************-->
		<div id="main-wrapper">

			<!--**********************************
            Nav header start
        ***********************************-->
			<?php

			// include("includes/navhead.php");

			?>
			<!--**********************************
            Nav header end
        ***********************************-->

			<!--**********************************
            Chat box start
        ***********************************-->

			<!--**********************************
            Chat box End
        ***********************************-->




			<!--**********************************
            Header start
        ***********************************-->
			<?php

			// include("includes/main.php");

			?>
			<!--**********************************
            Header end ti-comment-alt
        ***********************************-->

			<!--**********************************
            Sidebar start
        ***********************************-->
			<?php

			// include("includes/sidebar.php");

			?>
			<!--**********************************
            Sidebar end
        ***********************************-->

			<!--**********************************
            Content body start
        ***********************************-->
			<!-- <div class="content-body"> -->
			<div class="container-fluid">
				<!-- <div class="page-titles">
					<h4>Invoice</h4>
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="javascript:void(0)">Layout</a></li>
						<li class="breadcrumb-item active"><a href="javascript:void(0)">Blank</a></li>
					</ol>
				</div> -->
				<div class="row">
					<div class="col-lg-12">

						<div class="card">
							<div class="card-header">
								<strong>AQC</strong>
								<strong>DATE: 29/11/2022</strong>
								<span class="float-right">
									<strong>Status: Warning</strong>
								</span>
								<img class="logo-abbr" src="./images/A_logo.png" alt="">
							</div>

							<div class="card-body">
								<div class="row">
									<div class="col-xl-3 col-sm-6 mb-4">
										<h6>From:</h6>
										<div> <strong>Aurora Quarantine Camp</strong> </div>
										<div>273 An D. Vương</div>
										<div>Phường 3, Quận 5, TP.HCM</div>
										<div>Email: aurora@mail.com</div>
										<div>Phone: +48 444 666 3333</div>
									</div>
									<div class="col-xl-3 col-sm-6 mb-4">
										<h6>To:</h6>
										<div> <strong>Luc Le</strong> </div>
										<div>8 Duong Quang Dong</div>
										<div>Phuong 5, Quan 8, TP.HCM</div>
										<div>Email: thomas@mail.com</div>
										<div>Phone: +78 123 456 7891</div>
									</div>
									<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 mb-4 d-flex justify-content-lg-end justify-content-md-center justify-content-xs-start">
										<div class="row align-items-center">
											<div class="col-sm-9">
												<div class="brand-logo mb-3">
													<img class="logo-abbr" src="./images/lucle.jpg" alt="">
													<!-- <img class="logo-compact" src="./images/lucle.jpg" alt=""> -->
												</div>
												<span>Case ID: ABCD123<strong class="d-block">Age: 40</strong>
													<strong>Gender: Male</strong></span><br>
												<!-- <small class="text-muted">Current exchange rate 1BTC = $6590 USD</small> -->
											</div>
											<!-- <div class="col-sm-3 mt-3"> <img src="images/A_logo.png" class="img-fluid width110"> </div> -->
										</div>
									</div>
								</div>
								<br><br><br><br>
								<div class="table-responsive">
									<table class="table table-striped table-responsive-md">
										<h4 class="card-title">Patient Details</h4>
										<thead>
											<tr>
												<th>ID</th>
												<th>Name</th>
												<th>Gender</th>
												<th>Doctor Assigned</th>
												<th>Contact</th>
												<th>Comorbidities</th>
												<th>Symptoms</th>
												<th>Date Check In</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>#P-00017</td>
												<td>Luc Le</td>
												<td>Male</td>
												<td>Dr. Sammy</td>
												<td><a href="javascript:void(0);"><strong>+78 123 456 7891</strong></a></td>
												<td><a href="javascript:void(0);"><strong>Older age, Heart disease</strong></a></td>
												<td>Headache</td>
												<td>21/07/2022</td>
											</tr>
										</tbody>
									</table>
								</div>

								<br><br><br><br>
								<div class="table-responsive">
									<table class="table table-striped table-responsive-md">
										<h4 class="card-title">Testing Results</h4>
										<thead>
											<tr>
												<th>Test ID</th>
												<th>Patient ID</th>
												<th>People ID</th>
												<th>Test Date</th>
												<th>Status</th>
												<th>PCR Test</th>
												<th>Quick Test</th>
												<th>SP02</th>
												<th>Respiratory rate</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>#B-00002</td>
												<td>#P-00017</td>
												<td>#PC-00012</td>
												<td>26/02/2020, 02:45 AM</td>
												<td><span class="badge light badge-danger">Positive</span></td>
												<td><span class="text-dark">Yes</span></td>
												<td><span class="text-dark">Yes</span></td>
												<td><span class="text-dark">15%</span></td>
												<td><span class="text-dark">75 bpm</span></td>
											</tr>
											<tr>
												<td>#B-00001</td>
												<td>#P-00017</td>
												<td>#PC-00022</td>
												<td>226/02/2020, 12:42 AM</td>
												<td><span class="badge light badge-success">Negative</span></td>
												<td><span class="text-dark">Yes</span></td>
												<td><span class="text-dark">No</span></td>
												<td><span class="text-dark">55%</span></td>
												<td><span class="text-dark">105 bpm</span></td>
											</tr>
										</tbody>
									</table>
								</div>

								<br><br><br><br>
								<div class="table-responsive">
									<table class="table table-striped table-responsive-md">
										<h4 class="card-title">Treatment</h4>
										<thead>
											<tr>
												<th>Doctor ID</th>
												<th>Patient ID</th>
												<th>Result</th>
												<th>Date Start</th>
												<th>Date End</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td><span class="text-nowrap">#B-00001</span></td>
												<td><span class="text-nowrap">#P-00017</span></td>
												<td><span class="badge light badge-success">Recovered</span></td>
												<td>26/06/2023</td>
												<td>06/06/2024</td>
											</tr>
											<tr>
												<td><span class="text-nowrap">#B-00002</span></td>
												<td><span class="text-nowrap">#P-00017</span></td>
												<td><span class="badge light badge-warning">In Treatment</span></td>
												<td>07/06/2020</td>
												<td>28/02/2024</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--**********************************
            Content body end
        ***********************************-->


		<!--**********************************
            Footer start
        ***********************************-->
		<!--**********************************
            Footer end
        ***********************************-->

		<!--**********************************
           Support ticket button start
        ***********************************-->

		<!--**********************************
           Support ticket button end
        ***********************************-->


	</div>
	<!--**********************************
        Main wrapper end
    ***********************************-->

	<!--**********************************
        Scripts
    ***********************************-->
	<!-- Required vendors -->
	<script src="./vendor/global/global.min.js"></script>
	<script src="./vendor/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
	<script src="./js/custom.min.js"></script>
	<script src="./js/deznav-init.js"></script>


	<script src="./vendor/highlightjs/highlight.pack.min.js"></script>
	<!-- Circle progress -->



</body>

</html>