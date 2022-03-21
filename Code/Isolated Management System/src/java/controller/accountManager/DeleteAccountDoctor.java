/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.accountManager;

import dao.AccountDAO;
import dao.DoctorDAO;
import dao.NurseDAO;
import entity.Account;
import entity.Doctor;
import entity.Nurse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class DeleteAccountDoctor extends HttpServlet {

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
            out.println("<title>Servlet DeleteAccountDoctor</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DeleteAccountDoctor at " + request.getContextPath() + "</h1>");
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
        String id = request.getParameter("id");
        AccountDAO accountDAO = new AccountDAO();
        DoctorDAO doctorDAO = new DoctorDAO();
        int id1 = Integer.parseInt(id);
        Doctor doctor = doctorDAO.get(id1);
        Account account = accountDAO.get(doctor.getIdAccount());
        doctorDAO.delete(doctor);
        accountDAO.delete(account);
         int pageIndex = 1;
        final int PAGE_SIZE = 2;
        int type = 0;
        String raw_page = request.getParameter("pageIndex");
        if (raw_page != null) {
            pageIndex = Integer.parseInt(raw_page);
        }
        List<Doctor> list = doctorDAO.getAllDoctor(pageIndex, PAGE_SIZE);
        int totalPage = doctorDAO.countPage(PAGE_SIZE);

         request.setAttribute("totalPage", totalPage);
         request.setAttribute("pageIndex", pageIndex);
        
         request.setAttribute("list", list);
         RequestDispatcher view = request.getRequestDispatcher("../Accounts/list-doctor.jsp");
         view.forward(request, response);
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
        processRequest(request, response);
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

}