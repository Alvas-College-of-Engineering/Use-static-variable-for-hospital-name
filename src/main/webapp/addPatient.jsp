<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="model.Patient" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Patient</title>
    <style>
        body  { font-family: Arial; background: #eaf4fb; }
        h2    { background: #1a5276; color: white; padding: 18px; }
        .box  { width: 430px; margin: 40px auto; background: white;
                padding: 30px; border-radius: 8px;
                box-shadow: 0 2px 8px rgba(0,0,0,0.1); }
        .hospital-tag { background: #1a5276; color: white; padding: 6px 14px;
                        border-radius: 12px; font-size: 13px; margin-bottom: 15px;
                        display: inline-block; }
        label { font-weight: bold; font-size: 14px; color: #333; }
        input, select {
            width: 100%; padding: 10px; margin: 6px 0 14px;
            border: 1px solid #ccc; border-radius: 4px;
            font-size: 14px; box-sizing: border-box;
        }
        .btn  { width: 100%; padding: 12px; background: #1e8449;
                color: white; border: none; border-radius: 4px;
                font-size: 15px; cursor: pointer; font-weight: bold; }
        .btn:hover { background: #196f3d; }
        .back { display: block; margin-top: 15px;
                text-align: center; color: #2980b9; text-decoration: none; }
        .msg  { padding: 12px; border-radius: 4px;
                margin-bottom: 15px; font-weight: bold; }
        .success { background: #d4edda; color: #155724; }
        .error   { background: #f8d7da; color: #721c24; }
    </style>
</head>
<body>
    <h2>➕ Add Patient</h2>
    <div class="box">
        <div class="hospital-tag">
            🏥 Hospital: <%= Patient.getHospitalName() %>
        </div>

        <% String msg = (String) request.getAttribute("message");
           if (msg != null) { %>
            <div class="msg <%= msg.startsWith("SUCCESS") ? "success" : "error" %>">
                <%= msg %>
            </div>
        <% } %>

        <form action="HospitalServlet" method="post">
            <input type="hidden" name="action" value="addPatient"/>

            <label>Patient ID:</label>
            <input type="number" name="patientId"
                   placeholder="Enter Patient ID" required/>

            <label>Patient Name:</label>
            <input type="text" name="patientName"
                   placeholder="Enter Patient Name" required/>

            <label>Age:</label>
            <input type="number" name="age"
                   placeholder="Enter Age" min="1" max="120" required/>

            <label>Disease:</label>
            <select name="disease">
                <option>Fever</option>
                <option>Diabetes</option>
                <option>Blood Pressure</option>
                <option>Heart Disease</option>
                <option>Fracture</option>
                <option>Cancer</option>
                <option>Other</option>
            </select>

            <button class="btn" type="submit">➕ Add Patient</button>
        </form>
        <a class="back" href="index.jsp">← Back to Menu</a>
    </div>
</body>
</html>