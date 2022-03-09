/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.room;

import dao.RoomDAO;
import dao.AreaDAO;
import entity.Nurse;
import entity.Room;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import utils.Notification;

/**
 *
 * @author Admin
 */
public class AddRoom extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        HttpSession ss = request.getSession();
        Nurse nurse = (Nurse) ss.getAttribute("nurse");
        String roomName = request.getParameter("roomName");
        String bedNumber = request.getParameter("bedNumber");
        String note = request.getParameter("note");
        
        if (roomName == null || bedNumber == null) {
            Notification noti = new Notification("Warning", "Hãy điền đủ tất cả thông tin.", "warning");
            request.setAttribute("notify", noti);
            RequestDispatcher add = request.getRequestDispatcher("add.jsp");
            add.forward(request, response);
        }
        if (note.length() == 0) {
            note = "no notes";
        }
        RoomDAO dao = new RoomDAO();
        AreaDAO daoArea = new AreaDAO();
        Room room = new Room();
        room.setRoomName(roomName);
        room.setNote(note);
        room.setBedNumber(Integer.parseInt(bedNumber));
        room.setArea(daoArea.get(nurse.getId_area()));
        dao.create(room);

        Notification noti = new Notification("Success", "Thêm phòng cách ly thành công.", "success");
        request.setAttribute("notify", noti);
        RequestDispatcher add = request.getRequestDispatcher("list");
        add.forward(request, response);
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
