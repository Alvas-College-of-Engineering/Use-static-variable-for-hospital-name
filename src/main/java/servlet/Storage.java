package servlet;

import model.Patient;
import java.util.ArrayList;
import java.util.List;

public class Storage {

    private static List<Patient> patients = new ArrayList<>();

    public static List<Patient> getPatients()      { return patients; }

    public static Patient findPatient(int id) {
        for (Patient p : patients) {
            if (p.getPatientId() == id) return p;
        }
        return null;
    }

    public static boolean patientExists(int id)    { return findPatient(id) != null; }

    public static boolean removePatient(int id) {
        return patients.removeIf(p -> p.getPatientId() == id);
    }
}