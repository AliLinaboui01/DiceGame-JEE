package ali.com.dicegame.setvlets;

import ali.com.dicegame.models.GameState;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.HashMap;

@WebServlet(urlPatterns = "/restart")
public class RestartGame extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        GameState gameState = (GameState) session.getAttribute("gameState");
        if (gameState != null ) {
            gameState.restart();
            System.out.println("restart here ");
        }
        session.setAttribute("old_dice", null);
        getServletContext().getRequestDispatcher("/WEB-INF/view/back/home.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }
}
