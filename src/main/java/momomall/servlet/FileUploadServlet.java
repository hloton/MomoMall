package momomall.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import momomall.DAO.UserDAO;
import momomall.bean.User;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

@WebServlet("/FileUploadServlet")
@MultipartConfig
public class FileUploadServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        System.out.println("11");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("userinfo");
        Part filePart = request.getPart("file");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        String uploadPath = getServletContext().getRealPath("/") + "img/user/" + user.getUid();
        File directory = new File(uploadPath);
        // 检查目录是否存在
        if (!directory.exists()) {
            // 目录不存在，创建它
            boolean wasSuccessful = directory.mkdirs();
            if (wasSuccessful) {
                // 目录已成功创建
                System.out.println("Directory created successfully.");
            } else {
                // 目录创建失败
                System.out.println("Failed to create directory.");
                // 在这里可以抛出一个异常或处理错误
            }
        } else {
            // 目录已存在
            System.out.println("Directory already exists.");
        }
//        System.out.println(uploadPath);
        filePart.write(uploadPath + "/" + fileName);

        UserDAO userDAO = new UserDAO();
        String avatarPath = "img/user/"+ user.getUid() + "/" + fileName; // 相对路径
        if (userDAO.updateAvatar(user.getUid(), avatarPath)) {
            user.setAvatar(avatarPath); // 更新session中的用户信息
        }

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write("{\"redirectUrl\":\"pic.jsp\"}");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        System.out.println("1233");
    }
}

