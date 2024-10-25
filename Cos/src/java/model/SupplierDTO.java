/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author ADMIN
 */
public class SupplierDTO {
    private String supplierID;
    private String supplierName;
    private String contactName;
    private String phoneNumber;
    private String email;
    private String address;

    public SupplierDTO() {
    }

    public SupplierDTO(String supplierID, String supplierName, String contactName, String phoneNumber, String email, String address) {
        this.supplierID = supplierID;
        this.supplierName = supplierName;
        this.contactName = contactName;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.address = address;
    }
    
    

    // Getters and Setters
    public String getSupplierID() {
        return supplierID;
    }

    public void setSupplierID(String supplierID) {
        this.supplierID = supplierID;
    }

    public String getSupplierName() {
        return supplierName;
    }

    public void setSupplierName(String supplierName) {
        this.supplierName = supplierName;
    }

    public String getContactName() {
        return contactName;
    }

    public void setContactName(String contactName) {
        this.contactName = contactName;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}

