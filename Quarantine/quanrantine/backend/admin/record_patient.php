<?php
session_start();
include('assets/inc/config.php');
include('assets/inc/checklogin.php');
check_login();
$aid = $_SESSION['ad_id'];
?>

<!DOCTYPE html>
<html lang="en">

<?php include('assets/inc/head.php'); ?>

<body>

    <!-- Begin page -->
    <div id="wrapper">

        <!-- Topbar Start -->
        <?php include("assets/inc/nav.php"); ?>
        <!-- end Topbar -->

        <!-- ========== Left Sidebar Start ========== -->
        <?php include("assets/inc/sidebar.php"); ?>
        <!-- Left Sidebar End -->

        <!-- ============================================================== -->
        <!-- Start Page Content here -->
        <!-- ============================================================== -->

        <!--Get Details Of A Single User And Display Them Here-->
        <?php
        $Patient_ID = $_GET['Patient_ID'];

        $ret = "SELECT p.*, t.Test_ID, t.PCR_Result, t.Test_Type,t.Quick_Test_Result,t.Quick_Test_Ct_Value,t.SPO2, t.Test_Date, t.Cycle_Threshold, c.comorbidity_type, s.Symtomp_Type, qcs.Name
               FROM patient p 
               JOIN test t ON p.Patient_ID = t.Patient_ID
               JOIN nurse n ON p.Nurse_ID = n.Nurse_ID
               JOIN quarantine_camp_staff qcs ON n.Quarantine_camp_Staff_ID = qcs.Quarantine_camp_Staff_ID
               LEFT JOIN (SELECT Patient_ID, GROUP_CONCAT(comorbidity_type) AS comorbidity_type
                          FROM comorbidity GROUP BY Patient_ID) c ON p.Patient_ID = c.Patient_ID 
               LEFT JOIN (SELECT Patient_ID, GROUP_CONCAT(Symtomp_Type) AS Symtomp_Type 
                          FROM symtomp GROUP BY Patient_ID) s ON p.Patient_ID = s.Patient_ID 
               WHERE p.Patient_ID =?";

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
                    <div class="container-fluid ">

                        <!-- start page title -->
                        <div class="row mx-auto text-center">
                            <div class="col-12">
                                <div class="page-title-box">
                                    <div class="page-title-right">

                                    </div>
                                    <h4 class="page-title">Patient records: <?php echo $row->Full_Name; ?></h4>
                                </div>
                            </div>
                        </div>
                        <!-- end page title -->

                        <div class="row mx-auto text-center">
                            <div class="">
                                <div class="card-box text-center">
                                    <img src="assets/images/users/patient.png" class="rounded-circle avatar-lg img-thumbnail" alt="profile-image">


                                    <div class="text-left mt-6">

                                        <p class="text-muted mb-2 font-13"><strong>Full Name: </strong> <span class="ml-2"><?php echo $row->Full_Name; ?> </span></p>
                                        <p class="text-muted mb-2 font-13"><strong>Phone: </strong><span class="ml-2"><?php echo $row->Phone; ?></span></p>
                                        <p class="text-muted mb-2 font-13"><strong>Address: </strong> <span class="ml-2"><?php echo $row->Address; ?></span></p>
                                        <p class="text-muted mb-2 font-13"><strong>Test id: </strong> <span class="ml-2"><?php echo $row->Test_ID; ?></span></p>
                                        <p class="text-muted mb-2 font-13"><strong>Test result: </strong> <span class="ml-2"><?php echo $row->Test_Result; ?></span></p>
                                        <p class="text-muted mb-2 font-13"><strong>Test Type: </strong> <span class="ml-2"><?php echo $row->Test_Type; ?></span></p>
                                        <p class="text-muted mb-2 font-13"><strong>Test Date: </strong> <span class="ml-2"><?php echo $row->Test_Date; ?></span></p>
                                        <p class="text-muted mb-2 font-13"><strong>Cycle Threshold: </strong> <span class="ml-2"><?php echo $row->Cycle_Threshold; ?></span></p>
                                        <!-- Câu lệnh điều kiện kiểm tra comorbidity -->
                                        <?php if ($row->comorbidity_type) : ?>
                                            <p class="text-muted mb-2 font-13"><strong>Comorbidity Type: </strong> <span class="ml-2"><?php echo $row->comorbidity_type; ?></span></p>
                                        <?php else : ?>
                                            <p class="text-muted mb-2 font-13"><strong>Comorbidity Type: </strong> <span class="ml-2">N/A</span></p>
                                        <?php endif; ?>
                                        <p class="text-muted mb-2 font-13"><strong>Symtomp Type: </strong> <span class="ml-2"><?php echo $row->Symtomp_Type; ?></span></p>
                                        <p class="text-muted mb-2 font-13"><strong>Nurse:</strong> <span class="ml-2"><?php echo $row->Name; ?></span></p>
                                        <p class="text-muted mb-2 font-13"><strong>Room:</strong> <span class="ml-2"><?php echo $row->Room_ID; ?></span></p>
                                    </div>

                                </div> <!-- end card-box -->

                            </div> <!-- end col-->

                        <?php } ?>


                        </div> <!-- container -->

                    </div> <!-- content -->

                    <!-- Footer Start -->
                    <?php include('assets/inc/footer.php'); ?>
                    <!-- end Footer -->

                </div>
            </div>
            <div class="rightbar-overlay"></div>

            <!-- Vendor js -->
            <script src="assets/js/vendor.min.js"></script>

            <!-- App js -->
            <script src="assets/js/app.min.js"></script>

</body>


</html>