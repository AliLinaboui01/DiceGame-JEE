package ali.com.dicegame.setvlets;

import ali.com.dicegame.helpers.GameContextManagement;
import ali.com.dicegame.models.Message;
import ali.com.dicegame.models.User;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String createUserFormPage = "/WEB-INF/view/pages/register.jsp";
        ServletContext context = getServletContext();
        context.getRequestDispatcher(createUserFormPage).forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String errorPage = "/WEB-INF/view/pages/error.jsp";
        String loginPage = "/WEB-INF/view/pages/login.jsp";

        ServletContext context = getServletContext();
        String f_name =request.getParameter("name");
        String email =request.getParameter("email");
        String password =request.getParameter("password");
        User user = new User(f_name,email,password,0,0);
        GameContextManagement gameContextManagement = GameContextManagement.getInstance(context);
        List<Message> messages = new ArrayList<Message>();
        if (gameContextManagement.getUserByLogin(email) != null) {
            messages.add(new Message("Login already exist", Message.WARN));
            request.setAttribute("messages", messages);

            context.getRequestDispatcher(errorPage).forward(request, response);
            return;

        }
        gameContextManagement.insertUser(user);
        messages.add(new Message("user added with success", Message.INFO));
        request.setAttribute("messages", messages);
        context.getRequestDispatcher(loginPage).forward(request, response);
    }
}
