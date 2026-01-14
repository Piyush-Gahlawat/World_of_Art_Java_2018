/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package tools;

/**
 *
 * @author Shiryu
 */
import tools.IdGenerator;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
/**
 *
 * @author mkl
 */
@MultipartConfig(fileSizeThreshold=1024*1024*2,
maxFileSize=1024*1024*10, 
maxRequestSize=1024*1024*50)
 
@WebServlet(name = "upload", urlPatterns = {"/upload"})
public class UploadServlet extends HttpServlet {
private String getFileName(final Part part) {
    final String partHeader = part.getHeader("content-disposition");
    
    for (String content : 
part.getHeader("content-disposition").split(";")) {
        if (content.trim().startsWith("filename")) {
            return content.substring(
                    content.indexOf('=') + 1).trim().replace("\"", "");
        }
    }
    return null;
}

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
                     {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
                HttpSession session=request.getSession();
                        String id=String.valueOf(session.getAttribute("artist"));
            String arid=String.valueOf(session.getAttribute("up_req"));
            int a_id=Integer.parseInt(id);
            int art_id=Integer.parseInt(arid);
            String arttype=request.getParameter("arttype");
            String pric=request.getParameter("price");
            int price=Integer.parseInt(pric);
            String description=request.getParameter("description");
            Calendar calendar=Calendar.getInstance();
            java.sql.Date up_date=new java.sql.Date(calendar.getTime().getTime());
            String sold_f="0";
            
            Part filePart = request.getPart("picture");
          String path=getdata.photopath()+"\\"+a_id;
          String dpath=getdata.datapath()+"/"+a_id;
          String format="no";
          String fn=filePart.getName();
          int ind=fn.lastIndexOf(".");
          if(ind>0){
              format=fn.substring(ind+1);
              format=format.toLowerCase();
          }
          File file=new File(path);
          file.mkdir();
          String fileName = IdGenerator.unique()+"."+format;
            OutputStream ou = null;
            InputStream filecontent = null;
            PrintWriter writer = response.getWriter();
            try {
        ou = new FileOutputStream(new File(path + File.separator+fileName));
        filecontent = filePart.getInputStream();
        int read = 0;
        final byte[] bytes = new byte[1024];
        while ((read = filecontent.read(bytes)) != -1) {
            ou.write(bytes, 0, read);
        }
        String photo=path+"\\"+fileName;
        String pic=dpath+"/"+fileName;
       
        Class.forName("com.mysql.jdbc.Driver");
        try(Connection con = DriverManager.getConnection(getdata.url(),getdata.user(),getdata.password())){
              String query="insert into dummyartdb values(?,?,?,?,?,?,?,?)";
              try(PreparedStatement ps = con.prepareStatement(query)){
                  ps.setInt(1,art_id);
                  ps.setInt(2,price);
                  ps.setString(3,arttype);
                  ps.setInt(4,a_id);
                  ps.setString(5,description);
                  ps.setDate(6,up_date);
                  ps.setString(7,sold_f);
                  ps.setString(8,pic);
                  int i=ps.executeUpdate();
                  if(i>0){
                       out.println("Successful upload");
                  session.setAttribute("up_req",null);
                  out.println("<html><body><script>function redirect(link){window.location=link;}</script><input type=\"button\" class=\"navbutton\" value=\"Upload Art\" onclick=\"redirect('"+request.getContextPath()+"/upload_art.jsp');\"></body></html>");
                  }
                  else
                  {
                        out.println("Unsuccessful upload");
                    session.setAttribute("up_Req",null);
                  out.println("<html><body><script>function redirect(link){window.location=link;}</script<input type=\"button\" class=\"navbutton\" value=\"Upload Art\" onclick=\"redirect('"+request.getContextPath()+"/upload_art.jsp');\"></body></html>"); 
                  }

             ps.close();
             }catch(SQLException e){
                out.print(e);
             }
        con.close();
        }catch( SQLException ex){
            out.print(ex);
}
     out.println("<html><body><script>alert('Sucessfully Saved! Check the database and the path!');</script></body></html>");
}           catch (ClassNotFoundException ex) {
                Logger.getLogger(UploadServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        } catch (IOException | ServletException ex) {
        Logger.getLogger(UploadServlet.class.getName()).log(Level.SEVERE, null, ex);
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
        processRequest(request, response);
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
