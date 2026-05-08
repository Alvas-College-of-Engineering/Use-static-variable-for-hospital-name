<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="model.Patient" %>
<!DOCTYPE html>
<html>
<head>
    <title>Hospital Management System</title>
    <style>
        * { margin:0; padding:0; box-sizing:border-box; }
        body { font-family: Arial, sans-serif; background: #eaf4fb; text-align: center; }
        h1   { background: #1a5276; color: white; padding: 25px; font-size: 24px; }
        .hospital-badge {
            background: #d6eaf8; color: #1a5276; display: inline-block;
            padding: 10px 25px; border-radius: 20px; margin: 20px auto;
            font-size: 16px; font-weight: bold; border: 2px solid #2980b9;
        }
        .menu  { display: inline-block; margin-top: 15px; }
        .btn   {
            display: block; width: 320px; padding: 16px; margin: 12px auto;
            color: white; text-decoration: none; border-radius: 6px;
            font-size: 16px; font-weight: bold;
        }
        .btn1  { background: #1e8449; } .btn1:hover { background: #196f3d; }
        .btn2  { background: #2980b9; } .btn2:hover { background: #1a5276; }
        .btn3  { background: #8e44ad; } .btn3:hover { background: #6c3483; }
    </style>
</head>
<body>
    <h1>🏥 Hospital Management System</h1>
    <div class="hospital-badge">
        🏨 Current Hospital: <%= Patient.getHospitalName() %>
    </div>
    <div class="menu">
        <a class="btn btn1" href="addPatient.jsp">➕ Add Patient</a>
        <a class="btn btn2" href="HospitalServlet?action=view">📋 View All Patients</a>
        <a class="btn btn3" href="setHospital.jsp">🏨 Set Hospital Name</a>
    </div>
</body>
</html>