/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.ProductDAO;
import model.ProductDTO;

/**
 *
 * @author ADMIN
 */
public class ProductController extends HttpServlet {

    private final ProductDAO productDAO = new ProductDAO();

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
            out.println("<title>Servlet ProductController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProductController at " + request.getContextPath() + "</h1>");
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
        switch (action) {
            case "getAllProduct":
                getAllProduct(request, response);
                break;
            case "getProductById":
                getProductById(request, response);
                break;
            case "delete":
                deleteProduct(request, response);
                break;
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

        switch (action) {
            case "create":
                createProduct(request, response);
                break;
            case "edit":
                editProduct(request, response);
                break;

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

    private void getAllProduct(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            request.setAttribute("productList", productDAO.findAll());
            request.getRequestDispatcher("/productList.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error fetching products.");
        }
    }
    
    protected void getProductById(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    try {
        // Get the productID from the request
        String productID = request.getParameter("id");
        
        // Fetch the product by ID using the ProductDAO
        ProductDTO product = productDAO.findById(productID);
        
        // Check if the product exists
        if (product != null) {
            // Set the product as a request attribute to be accessed in the JSP
            request.setAttribute("product", product);
            
            // Forward the request to the product detail or edit page (e.g., productDetail.jsp)
            request.getRequestDispatcher("/updateProduct.jsp").forward(request, response);
        } else {
            // If no product is found, redirect to the product list with an error message
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Product not found.");
        }
    } catch (Exception e) {
        e.printStackTrace();
        response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error retrieving product.");
    }
}

    /**
     * Create a new product based on the form data.
     */
    protected void createProduct(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve form data
        String productID = request.getParameter("productID");
        String productName = request.getParameter("productName");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String category = request.getParameter("category");
        String supplierID = request.getParameter("supplierID");

        // Create a ProductDTO object
        ProductDTO newProduct = new ProductDTO(productID, productName, description, price, quantity, category, supplierID);

        // Create a ProductDAO object
        ProductDAO productDAO = new ProductDAO();

        // Insert new product into the database
        boolean isCreated = productDAO.create(newProduct);

        // Check the result and redirect or send response accordingly
        if (isCreated) {
            response.sendRedirect("MainController?controller=ProductController&action=getAllProduct");  // Redirect to the product list page after successful creation
        } else {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error creating the product.");
        }
    }

    /**
     * Update an existing product based on the form data.
     */
    protected void editProduct(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve form data
        String productID = request.getParameter("productID");
        String productName = request.getParameter("productName");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String category = request.getParameter("category");
        String supplierID = request.getParameter("supplierID");

        // Create a ProductDTO object with the updated data
        ProductDTO updatedProduct = new ProductDTO(productID, productName, description, price, quantity, category, supplierID);

        // Create a ProductDAO object
        ProductDAO productDAO = new ProductDAO();

        // Update the product in the database
        boolean isUpdated = productDAO.update(updatedProduct);

        // Check the result and redirect or send response accordingly
        if (isUpdated) {
            response.sendRedirect("MainController?controller=ProductController&action=getAllProduct");  // Redirect to the product list page after successful update
        } else {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error updating the product.");
        }
    }

    /**
     * Delete a product based on the product ID.
     */
    private void deleteProduct(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String productId = request.getParameter("id");
            productDAO.delete(productId);

            response.sendRedirect("MainController?controller=ProductController&action=getAllProduct");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error deleting product.");
        }
    }
}
