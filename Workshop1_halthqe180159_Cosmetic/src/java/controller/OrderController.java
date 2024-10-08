/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;
import models_DAO.CartDAO;
import models_DAO.OrderDAO;
import models_DTO.CartItem;

@WebServlet("/OrderController")
public class OrderController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        OrderDAO orderDAO = new OrderDAO();
        CartDAO cartDAO = new CartDAO();

        try {
            if ("Checkout".equals(action)) {
                List<CartItem> cartItems = cartDAO.getCartItems(session);
                request.setAttribute("cartItems", cartItems);
                request.getRequestDispatcher("checkout.jsp").forward(request, response);

            } else if ("PlaceOrder".equals(action)) {
                String orderID = (String) session.getAttribute("userID");
                double totalAmount = (double) request.getAttribute("totalAmount");
                orderDAO.createOrderDetail(orderID, orderID, 0, totalAmount);
                session.removeAttribute("cartItems");  // Clear the cart after placing order
                response.sendRedirect("orderConfirmation.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("ERROR", "Order processing failed. Please try again.");
            request.getRequestDispatcher("checkout.jsp").forward(request, response);
        }
    }
}