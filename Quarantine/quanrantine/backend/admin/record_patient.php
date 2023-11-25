<?php
  session_start();
  include('assets/inc/config.php');
  include('assets/inc/checklogin.php');
  check_login();
  $aid=$_SESSION['ad_id'];
?>

<!DOCTYPE html>
    <html lang="en">

    <?php include('assets/inc/head.php');?>

    <body>

        <!-- Begin page -->
        <div id="wrapper">

            <!-- Topbar Start -->
             <?php include("assets/inc/nav.php");?>
            <!-- end Topbar -->

            <!-- ========== Left Sidebar Start ========== -->
                <?php include("assets/inc/sidebar.php");?>
            <!-- Left Sidebar End -->

            <!-- ============================================================== -->
            <!-- Start Page Content here -->
            <!-- ============================================================== -->

            <!--Get Details Of A Single User And Display Them Here-->
            <?php
               $Patient_ID = $_GET['Patient_ID'];

               $ret = "SELECT patient.*, test.Test_ID, test.Test_Result, test.Test_Type, test.Test_Date, test.Cycle_Threshold
                       FROM patient
                       JOIN test ON patient.Patient_ID = test.Patient_ID
                       WHERE patient.Patient_ID = ?";
               
               $stmt = $mysqli->prepare($ret);
               $stmt->bind_param('i', $Patient_ID);
               $stmt->execute();
               $res = $stmt->get_result();
               
               while ($row = $res->fetch_object()) {
                   $mysqlDateTime = $row->pat_date_joined;
                   // Các trường dữ liệu khác từ bảng patient và test có thể được truy cập tương tự
                   // Ví dụ: $test_id = $row->Test_ID;
            ?>
            <div class="content-page">
                <div class="content">

                    <!-- Start Content-->
                    <div class="container-fluid">

                        <!-- start page title -->
                        <div class="row">
                            <div class="col-12">
                                <div class="page-title-box">
                                    <div class="page-title-right">
                                      
                                    </div>
                                    <h4 class="page-title">Hồ sơ bệnh nhân :<?php echo $row->Full_Name;?></h4>
                                </div>
                            </div>
                        </div>
                        <!-- end page title -->

                        <div class="row">
                            <div class="">
                                <div class="card-box text-center">
                                    <img src="assets/images/users/patient.png" class="rounded-circle avatar-lg img-thumbnail"
                                        alt="profile-image">

                                    
                                    <div class="text-left mt-3">
                                        
                                        <p class="text-muted mb-2 font-13"><strong>Full Name :</strong> <span class="ml-2"><?php echo $row->Full_Name;?> </span></p>
                                        <p class="text-muted mb-2 font-13"><strong>Phone :</strong><span class="ml-2"><?php echo $row->Phone;?></span></p>
                                        <p class="text-muted mb-2 font-13"><strong>Address :</strong> <span class="ml-2"><?php echo $row->Address;?></span></p>
                                        <p class="text-muted mb-2 font-13"><strong>Test id :</strong> <span class="ml-2"><?php echo $row->Test_ID;?></span></p>
                                        <p class="text-muted mb-2 font-13"><strong>Test result :</strong> <span class="ml-2"><?php echo $row->Test_Result;?></span></p>
                                        <p class="text-muted mb-2 font-13"><strong>Test Type :</strong> <span class="ml-2"><?php echo $row->Test_Type;?></span></p>
                                        <p class="text-muted mb-2 font-13"><strong>Test Date :</strong> <span class="ml-2"><?php echo $row->Test_Date;?></span></p>
                                        <p class="text-muted mb-2 font-13"><strong>Cycle Threshold :</strong> <span class="ml-2"><?php echo $row->Cycle_Threshold;?></span></p>
                                        <p class="text-muted mb-2 font-13"><strong>Comorbidity_Type:</strong> <span class="ml-2"><?php echo $row->Comorbidity_Type;?></span></p>
                                        <p class="text-muted mb-2 font-13"><strong>Symtomp_Type :</strong> <span class="ml-2"><?php echo $row->ymtomp_Type;?></span></p>
                                       



                                    </div>

                                </div> <!-- end card-box -->

                            </div> <!-- end col-->
                            
                            <?php }?>
                            

                    </div> <!-- container -->

                </div> <!-- content -->

                <!-- Footer Start -->
                <?php include('assets/inc/footer.php');?>
                <!-- end Footer -->

            </div>
            

            <!-- ============================================================== -->
            <!-- End Page content -->
            <!-- ============================================================== -->


        </div>
        <!-- END wrapper -->
                                                   
        <!-- Right bar overlay-->
        <div class="rightbar-overlay"></div>

        <!-- Vendor js -->
        <script src="assets/js/vendor.min.js"></script>

        <!-- App js -->
        <script src="assets/js/app.min.js"></script>

    </body>


</html>