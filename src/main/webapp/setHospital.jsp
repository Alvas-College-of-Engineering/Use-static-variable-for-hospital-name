<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="model.Patient" %>
<!DOCTYPE html>
<html>
<head>
    <title>Set Hospital Name</title>
    <style>
        body  { font-family: Arial; background: #eaf4fb; }
        h2    { background: #1a5276; color: white; padding: 18px; }
        .box  { width: 430px; margin: 40px auto; background: white;
                padding: 30px; border-radius: 8px;
                box-shadow: 0 2px 8px rgba(0,0,0,0.1); }
        .note { background: #fef9e7; border: 1px solid #f39c12;
                padding: 10px; border-radius: 4px; margin-bottom: 15px;
                font-size: 13px; color: #7d6608; }
        label { font-weight: bold; font-size: 14px; }
        input { width: 100%; padding: 10px; margin: 8px 0 16px;
                border: 1px solid #ccc; border-radius: 4px;
                font-size: 14px; box-sizing: border-box; }
        .btn  { width: 100%; padding: 12px; background: #8e44ad;
                color: white; border: none; border-radius: 4px;
                font-size: 15px; cursor: pointer; font-weight: bold; }
        .btn:hover { background: #6c3483; }
        .back { display: block; margin-top: 15px;
                text-align: center; color: #2980b9; text-decoration: none; }
        .msg  { padding: 12px; border-radius: 4px;
                margin-bottom: 15px; font-weight: bold; }
        .success { background: #d4edda; color: #155724; }
        .error   { background: #f8d7da; color: #721c24; }
    </style>
</head>
<body>
    <h2>🏨 Set Hospital Name</h2>
    <div class="box">

        <div class="note">
            ⚠️ This updates the <b>static variable</b> — hospital name will
            change for <b>ALL patients</b> immediately!
        </div>

        <% String msg = (String) request.getAttribute("message");
           if (msg != null) { %>
            <div class="msg <%= msg.startsWith("SUCCESS") ? "success" : "error" %>">
                <%= msg %>
            </div>
        <% } %>

        <label>Current Hospital Name:</label>
        <input type="text" value="<%= Patient.getHospitalName() %>" disabled
               style="background:#f0f0f0;"/>

        <form action="HospitalServlet" method="post">
            <input type="hidden" name="action" value="setHospital"/>
            <label>New Hospital Name:</label>
            <input type="text" name="hospitalName"
                   placeholder="Enter new hospital name" required/>
            <button class="btn" type="submit">🏨 Update Hospital Name</button>
        </form>
        <a class="back" href="index.jsp">← Back to Menu</a>
    </div>
</body>
</html>