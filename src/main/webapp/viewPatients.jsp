<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*, model.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Patients</title>
    <style>
        body  { font-family: Arial; background: #eaf4fb; }
        h2    { background: #1a5276; color: white; padding: 18px; }
        .container { width: 780px; margin: 30px auto; }
        .hospital-header {
            background: #1a5276; color: white; padding: 12px 20px;
            border-radius: 6px; margin-bottom: 15px; font-size: 17px;
            font-weight: bold;
        }
        .count { background: #2980b9; color: white; padding: 8px 16px;
                 border-radius: 4px; display: inline-block;
                 margin-bottom: 12px; font-weight: bold; }
        table { width: 100%; border-collapse: collapse; background: white;
                border-radius: 8px; overflow: hidden;
                box-shadow: 0 2px 8px rgba(0,0,0,0.1); }
        th    { background: #1a5276; color: white; padding: 12px; text-align: left; }
        td    { padding: 11px; border-bottom: 1px solid #eee; }
        tr:hover td { background: #d6eaf8; }
        .empty { text-align: center; color: #999; font-style: italic; padding: 25px; }
        .back { display: block; margin: 20px auto;
                text-align: center; color: #2980b9; text-decoration: none; }
        .discharge-btn {
            padding: 5px 12px; background: #e74c3c; color: white;
            border: none; border-radius: 4px; cursor: pointer; font-size: 13px;
        }
        .discharge-btn:hover { background: #c0392b; }
        .msg  { padding: 12px; border-radius: 4px; margin-bottom: 15px; font-weight: bold; }
        .success { background: #d4edda; color: #155724; }
        .error   { background: #f8d7da; color: #721c24; }
    </style>
</head>
<body>
    <h2>📋 All Patients</h2>
    <div class="container">

        <% String msg = (String) request.getAttribute("message");
           if (msg != null) { %>
            <div class="msg <%= msg.startsWith("SUCCESS") ? "success" : "error" %>">
                <%= msg %>
            </div>
        <% } %>

        <div class="hospital-header">
            🏥 Hospital: <%= Patient.getHospitalName() %>
        </div>

        <%
        	@SuppressWarnings("unchecked")
            List<Patient> patients = (List<Patient>) request.getAttribute("patients");
            if (patients == null || patients.isEmpty()) {
        %>
            <p class="empty" style="background:white; padding:30px;
               border-radius:8px; box-shadow:0 2px 8px rgba(0,0,0,0.1);">
                No patients admitted yet.
            </p>
        <%
            } else {
        %>
            <div class="count">Total Patients: <%= patients.size() %></div>
            <table>
                <tr>
                    <th>Patient ID</th>
                    <th>Patient Name</th>
                    <th>Age</th>
                    <th>Disease</th>
                    <th>Hospital</th>
                    <th>Action</th>
                </tr>
                <% for (Patient p : patients) { %>
                <tr>
                    <td><%= p.getPatientId() %></td>
                    <td><%= p.getPatientName() %></td>
                    <td><%= p.getAge() %></td>
                    <td><%= p.getDisease() %></td>
                    <td><%= Patient.getHospitalName() %></td>
                    <td>
                        <form action="HospitalServlet" method="post" style="margin:0;">
                            <input type="hidden" name="action" value="discharge"/>
                            <input type="hidden" name="patientId" value="<%= p.getPatientId() %>"/>
                            <button class="discharge-btn" type="submit">🗑️ Discharge</button>
                        </form>
                    </td>
                </tr>
                <% } %>
            </table>
        <% } %>
        <a class="back" href="index.jsp">← Back to Menu</a>
    </div>
</body>
</html>