package model;

public class Patient {

    // ✅ Static variable — shared by ALL patients (common hospital name)
    private static String hospitalName = "General Hospital";

    // Instance variables — unique to each patient
    private int    patientId;
    private String patientName;
    private int    age;
    private String disease;

    // Constructor
    public Patient(int patientId, String patientName, int age, String disease) {
        this.patientId   = patientId;
        this.patientName = patientName;
        this.age         = age;
        this.disease     = disease;
    }

    // Static getter and setter — for hospitalName
    public static String getHospitalName()            { return hospitalName; }
    public static void   setHospitalName(String name) { hospitalName = name; }

    // Instance getters
    public int    getPatientId()   { return patientId; }
    public String getPatientName() { return patientName; }
    public int    getAge()         { return age; }
    public String getDisease()     { return disease; }

    @Override
    public String toString() {
        return "Patient [ID=" + patientId + ", Name=" + patientName +
               ", Age=" + age + ", Disease=" + disease +
               ", Hospital=" + hospitalName + "]";
    }
}