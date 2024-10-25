/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.SupplierDAO;
import model.SupplierDTO;

/**
 *
 * @author ADMIN
 */
public class SupplierController extends HttpServlet {

    private final SupplierDAO supplierDAO = new SupplierDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "getAllSupplier":
                getAllSuppliers(request, response);
                break;
            case "getSupplierById":
                getSupplierById(request, response);
                break;
            case "delete":
                deleteSupplier(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        switch (action) {
            case "create":
                createSupplier(request, response);
                break;
            case "edit":
                editSupplier(request, response);
                break;
        }
    }

    private void getAllSuppliers(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            request.setAttribute("supplierList", supplierDAO.findAll());
            request.getRequestDispatcher("/supplierList.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error fetching suppliers.");
        }
    }

    private void getSupplierById(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String supplierID = request.getParameter("supplierID");
        try {
            SupplierDTO supplier = supplierDAO.findById(supplierID);
            if (supplier != null) {
                request.setAttribute("supplier", supplier);
                request.getRequestDispatcher("updateSupplier.jsp").forward(request, response);
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Supplier not found.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error fetching supplier.");
        }
    }

    private void createSupplier(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve form data
        String supplierID = request.getParameter("supplierID");
        String supplierName = request.getParameter("supplierName");
        String contactName = request.getParameter("contactName"); // Updated for clarity
        String phoneNumber = request.getParameter("phoneNumber");
        String email = request.getParameter("email");
        String address = request.getParameter("address");

        // Create a new SupplierDTO object with all necessary information
        SupplierDTO newSupplier = new SupplierDTO(supplierID, supplierName, contactName, phoneNumber, email, address);

        // Create a SupplierDAO object and insert the new supplier into the database
        boolean isCreated = supplierDAO.create(newSupplier);

        // Check if the supplier was created successfully
        if (isCreated) {
            response.sendRedirect("MainController?controller=SupplierController&action=getAllSupplier"); // Redirect to the supplier list page
        } else {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error creating supplier.");
        }
    }

    private void editSupplier(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve form data
        String supplierID = request.getParameter("supplierID");
        String supplierName = request.getParameter("supplierName");
        String contactName = request.getParameter("contactName"); // Updated for clarity
        String phoneNumber = request.getParameter("phoneNumber");
        String email = request.getParameter("email");
        String address = request.getParameter("address");

        // Create a SupplierDTO object with the updated data
        SupplierDTO updatedSupplier = new SupplierDTO(supplierID, supplierName, contactName, phoneNumber, email, address);

        // Update the supplier in the database
        boolean isUpdated = supplierDAO.update(updatedSupplier);

        // Check if the supplier was updated successfully
        if (isUpdated) {
            response.sendRedirect("MainController?controller=SupplierController&action=getAllSupplier"); // Redirect to the supplier list page
        } else {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error updating supplier.");
        }
    }

    private void deleteSupplier(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String supplierID = request.getParameter("supplierID");
            supplierDAO.delete(supplierID);
            response.sendRedirect("SupplierController?action=getAllSupplier");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error deleting supplier.");
        }
    }
}
