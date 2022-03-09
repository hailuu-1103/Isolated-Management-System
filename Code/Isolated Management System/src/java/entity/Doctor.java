/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author Admin
 */
public class Doctor {

    private int doctorId;
    private String doctorName;
    private int phone;
    private String fullName;
    private int accountId;
    private String address;

    public Doctor() {
    }

    public Doctor(int doctorId, String doctorName, int phone, String fullName, int accountId, String address) {
        this.doctorId = doctorId;
        this.doctorName = doctorName;
        this.phone = phone;
        this.fullName = fullName;
        this.accountId = accountId;
        this.address = address;
    }

    public int getDoctorId() {
        return doctorId;
    }

    public void setDoctorId(int doctorId) {
        this.doctorId = doctorId;
    }

    public String getDoctorName() {
        return doctorName;
    }

    public void setDoctorName(String doctorName) {
        this.doctorName = doctorName;
    }

    public int getPhone() {
        return phone;
    }

    public void setPhone(int phone) {
        this.phone = phone;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Override
    public String toString() {
        return "Doctor{" + "doctorId=" + doctorId + ", doctorName=" + doctorName + ", phone=" + phone + ", fullName=" + fullName + ", accountId=" + accountId + ", address=" + address + '}';
    }

}
