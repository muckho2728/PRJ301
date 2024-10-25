/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cart;
import model.CartItems;
import model.ProductDAO;
import model.ProductDTO;

/**
 *
 * @author ADMIN
 */
public class CartController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CartController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CartController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            viewCart(request, response);
        } else {
            switch (action) {
                case "add":
                    addCart(request, response);
                    break;
                case "view":
                    viewCart(request, response);
                    break;
                case "update":
                    updateCartItem(request, response);
                    break;
                case "remove":
                    removeCartItem(request, response);
                    break;
                case "clear":
                    clearCart(request, response);
                    break;
                default:
                    viewCart(request, response);
            }
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            viewCart(request, response);
        } else {
            switch (action) {
                case "add":
                    addCart(request, response);
                    break;
                case "view":
                    viewCart(request, response);
                    break;
                case "update":
                    updateCartItem(request, response);
                    break;
                case "remove":
                    removeCartItem(request, response);
                    break;
                case "clear":
                    clearCart(request, response);
                    break;
                default:
                    viewCart(request, response);
            }
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void addCart(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart(new ArrayList<>(), 0);
        }

        try {
            String productId = request.getParameter("id");
            int quantity = Integer.parseInt(request.getParameter("quantity"));

            ProductDAO dao = new ProductDAO();
            ProductDTO product = dao.findById(productId);

            if (product != null) {
                CartItems item = new CartItems(product, quantity);
                cart.addItem(item);
                session.setAttribute("cart", cart);
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }

        response.sendRedirect("MainController?controller=ProductController&action=getAllProduct");
    }

    // View Cart
    private void viewCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        HttpSession session = request.getSession();
//        Cart cart = (Cart) session.getAttribute("cart");
//
//        if (cart == null) {
//            cart = new Cart(new ArrayList<>(), 0);
//            session.setAttribute("cart", cart);
//        }
//
//        request.setAttribute("cart", cart);
        request.getRequestDispatcher("cart.jsp").forward(request, response);
    }

    // Update cart item quantity
    private void updateCartItem(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");

        if (cart != null) {
            String productId = request.getParameter("id");
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            cart.changeQuantity(productId, quantity);
        }

        response.sendRedirect("CartController?action=view");
    }

    // Remove item from cart
    private void removeCartItem(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");

        if (cart != null) {
            String productId = request.getParameter("id");
            cart.removeItems(productId);
        }

        response.sendRedirect("CartController?action=view");
    }

    // Clear entire cart
    private void clearCart(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");

        if (cart != null) {
            cart.clearCart();
        }

        response.sendRedirect("CartController?action=view");
    }
}
