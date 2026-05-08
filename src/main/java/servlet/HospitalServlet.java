package servlet;

import model.Patient;
import javax.servlet.*;
import javax.servlet.http.*;
//import javax.servlet.annotation.WebServlet;
import java.io.IOException;

//@WebServlet("/HospitalServlet")
public class HospitalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action  = request.getParameter("action");
        String message = "";

        // ── SET HOSPITAL NAME (updates static variable for ALL patients) ──
        if (action.equals("setHospital")) {
            String name = request.getParameter("hospitalName").trim();
            if (name.isEmpty()) {
                message = "ERROR: Hospital name cannot be empty!";
            } else {
                Patient.setHospitalName(name); // ✅ sets static variable
                message = "SUCCESS: Hospital name set to '" + name + "' for all patients!";
            }
            request.setAttribute("message", message);
            request.getRequestDispatcher("setHospital.jsp").forward(request, response);
        }

        // ── ADD PATIENT ───────────────────────────────────────────────────
        else if (action.equals("addPatient")) {
            int    patientId   = Integer.parseInt(request.getParameter("patientId"));
            String patientName = request.getParameter("patientName").trim();
            int    age         = Integer.parseInt(request.getParameter("age"));
            String disease     = request.getParameter("disease").trim();

            if (Storage.patientExists(patientId)) {
                message = "ERROR: Patient ID " + patientId + " already exists!";
            } else {
                Storage.getPatients().add(new Patient(patientId, patientName, age, disease));
                message = "SUCCESS: Patient '" + patientName + "' added to " +
                          Patient.getHospitalName() + "!";
            }
            request.setAttribute("message", message);
            request.getRequestDispatcher("addPatient.jsp").forward(request, response);
        }

        // ── DISCHARGE (REMOVE) PATIENT ────────────────────────────────────
        else if (action.equals("discharge")) {
            int patientId = Integer.parseInt(request.getParameter("patientId"));
            Patient p = Storage.findPatient(patientId);
            if (p == null) {
                message = "ERROR: Patient ID " + patientId + " not found!";
            } else {
                Storage.removePatient(patientId);
                message = "SUCCESS: Patient '" + p.getPatientName() + "' discharged!";
            }
            request.setAttribute("message", message);
            request.setAttribute("patients", Storage.getPatients());
            request.setAttribute("hospitalName", Patient.getHospitalName());
            request.getRequestDispatcher("viewPatients.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("view".equals(action)) {
            request.setAttribute("patients", Storage.getPatients());
            request.setAttribute("hospitalName", Patient.getHospitalName());
            request.getRequestDispatcher("viewPatients.jsp").forward(request, response);
        } else {
            response.sendRedirect("index.jsp");
        }
    }
}