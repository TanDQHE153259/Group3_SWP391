/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.PostCRUD;

import dao.PostDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Post;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "EditPostControler", urlPatterns = {"/edit-post"})
public class EditPostControler extends HttpServlet {

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
            out.println("<title>Servlet EditPostControler</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditPostControler at " + request.getContextPath() + "</h1>");
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
//        processRequest(request, response);
        int postId = Integer.parseInt(request.getParameter("postId"));
        Post post = new PostDAO().getPostById(postId);
        
        request.setAttribute("post", post);

        request.getRequestDispatcher("EditPost.jsp").forward(request, response);
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
//        processRequest(request, response);
        int postId = Integer.parseInt(request.getParameter("postId"));
        String title = request.getParameter("title");
        boolean status = Boolean.parseBoolean(request.getParameter("status"));
        String thumbnail = request.getParameter("image");
        String briefInfor = request.getParameter("briefInfor");
        String content = request.getParameter("description");
        
        new PostDAO().updatePost(postId, title, status, thumbnail, briefInfor, content);
        Post post = new PostDAO().getPostById(postId);
        
        request.setAttribute("post", post);

        request.getRequestDispatcher("EditPost.jsp").forward(request, response);
        
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
