/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models_DTO;

/**
 *
 * @author Admin
 */

public class CartItem {
//            <th>Product ID</th>
//            <th>Name</th>
//            <th>Quantity</th>
//            <th>Price</th>
//            <th>Total</th>
//            <th>Actions</th>
    private String productID;
    private String productName;
    private int quantity;
    private double price; // Assuming you have a price attribute for products
    private String total;

    
    public CartItem() {
    }

    public CartItem(String productID, int quantity, double price) {
        this.productID = productID;
        this.quantity = quantity;
        this.price = price;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getTotal() {
        return total;
    }

    public void setTotal(String totalAmount) {
        this.total = totalAmount;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getTotalPrice() {
        return quantity * price;
    }
}
