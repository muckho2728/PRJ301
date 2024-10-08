/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models_DAO;

/**
 *
 * @author Admin
 */
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import models_DTO.CartItem;

public class CartDAO {

    public void addToCart(HttpSession session, String productID, int quantity) {
        // Retrieve existing cart items from session
        Map<String, CartItem> cartItems = (Map<String, CartItem>) session.getAttribute("cart");
        if (cartItems == null) {
            cartItems = new HashMap<>();
        }

        // Check if product already exists in cart
        CartItem existingItem = cartItems.get(productID);
        if (existingItem != null) {
            existingItem.setQuantity(existingItem.getQuantity() + quantity);
        } else {
            // Create a new CartItem and add it to the cart
            cartItems.put(productID, new CartItem(productID, quantity, quantity)); // Replace with logic to get product price
        }

        // Update the cart in the session
        session.setAttribute("cart", cartItems);
    }

    public List<CartItem> getCartItems(HttpSession session) {
        // Retrieve existing cart items from session
        Map<String, CartItem> cartItems = (Map<String, CartItem>) session.getAttribute("cart");
        if (cartItems == null) {
            return new ArrayList<>(); // Return empty list if no cart items exist
        }

        // Convert the Map to a List for easier processing in JSP
        return new ArrayList<>(cartItems.values());
    }

    public void updateCart(HttpSession session, String productID, int quantity) {
        // Retrieve existing cart items from session
        Map<String, CartItem> cartItems = (Map<String, CartItem>) session.getAttribute("cart");
        if (cartItems == null) {
            return; // No cart to update
        }

        // Check if product exists in cart
        CartItem item = cartItems.get(productID);
        if (item == null) {
            return; // Product not found in cart
        }

        // Update the quantity
        item.setQuantity(quantity);

        // Remove item if quantity is 0
        if (quantity == 0) {
            cartItems.remove(productID);
        }

        // Update the cart in the session
        session.setAttribute("cart", cartItems);
    }

    public void removeFromCart(HttpSession session, String productID) {
        // Retrieve existing cart items from session
        Map<String, CartItem> cartItems = (Map<String, CartItem>) session.getAttribute("cart");
        if (cartItems == null) {
            return; // No cart to update
        }

        // Remove the item from the cart
        cartItems.remove(productID);

        // Update the cart in the session
        session.setAttribute("cart", cartItems);
    }
}