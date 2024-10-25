package controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cart;
import model.CartItems;
import model.OrderDAO;
import model.OrderDTO;
import model.OrderDetailDAO;
import model.OrderDetailDTO;

/**
 * Handles order creation when a user checks out from the cart.
 */
public class OrderController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");

        if (cart == null || cart.getItems().isEmpty()) {
            // If the cart is empty, redirect the user to the cart page with an error message.
            request.setAttribute("error", "Your cart is empty!");
            request.getRequestDispatcher("cart.jsp").forward(request, response);
            return;
        }

        // Proceed with creating the order and order details
        try {
            OrderDAO orderDAO = new OrderDAO();
            OrderDetailDAO orderDetailDAO = new OrderDetailDAO();
            // Create a new OrderDTO
            OrderDTO newOrder = new OrderDTO();
            String randomString = UUID.randomUUID().toString();
            newOrder.setOrderID(randomString);
            
            newOrder.setOrderDate(java.sql.Date.valueOf(LocalDate.now()));
            newOrder.setUserID((String) session.getAttribute("userId")); // Assuming a logged-in user ID exists in the session
            newOrder.setTotalAmount(cart.getTotalMoney());

            // Create the order in the database
            boolean orderCreated = orderDAO.create(newOrder);

            if (orderCreated) {
                // Get the newly created order ID
                String orderId = newOrder.getOrderID();

                // Loop through the cart items and create order details
                for (CartItems item : cart.getItems()) {
                    OrderDetailDTO orderDetail = new OrderDetailDTO();
                    orderDetail.setOrderID(orderId);
                    orderDetail.setProductID(item.getProduct().getProductID());
                    orderDetail.setQuantity(item.getQuantity());
                    orderDetail.setPrice(item.getProduct().getPrice());

                    // Insert the order details into the database
                    orderDetailDAO.create(orderDetail);
                }

                // Clear the cart after checkout
                cart.clearCart();
                session.setAttribute("cart", cart);

                // Redirect to a success page
                response.sendRedirect("checkoutSuccess.jsp");

            } else {
                request.setAttribute("error", "There was an error processing your order.");
                request.getRequestDispatcher("cart.jsp").forward(request, response);
                
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "An error occurred during checkout.");
            request.getRequestDispatcher("cart.jsp").forward(request, response);
           
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    public String getServletInfo() {
        return "OrderController handles checkout and order creation.";
    }
}
