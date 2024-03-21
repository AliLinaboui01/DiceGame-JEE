package ali.com.dicegame.setvlets;

import ali.com.dicegame.helpers.GameContextManagement;
import ali.com.dicegame.models.GameState;
import ali.com.dicegame.models.Message;
import ali.com.dicegame.models.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        GameState gameState = (GameState) session.getAttribute("gameState");
        if (gameState != null ) {
            gameState.restart();
            System.out.println("restart here ");
        }
        session.setAttribute("old_dice", null);
        getServletContext().getRequestDispatcher("/WEB-INF/view/back/home.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // On récupére les données envoyées dans le formulaire
        String login = request.getParameter("login");
        String password = request.getParameter("password");

        // On instancie la liste que nous utiliserons pour stocker les messages
        // à passer à la vue
        List<Message> messages = new ArrayList<Message>();

        GameContextManagement gameContext = GameContextManagement.getInstance(getServletContext());

        // On recherche l'utilisateur par login
        User user = gameContext.getUserByLogin(login.trim());
        // Si un utilisateur existe
        if (user != null) {

            // On vérifie que les mots de passe sont identiques
            if (user.getPassword() != null && user.getPassword().equals(password)) {
                // On stocke l'objet stockant l'état de jeu dans la session
                GameState gameSate = new GameState(user);
                request.getSession().setAttribute("gameState", gameSate);
                // On stocke l'utilisateur authentifié dans la session
                request.getSession().setAttribute("user", user);
                // On envoie une vue qu'est la page home comme résultat
                getServletContext().getRequestDispatcher("/WEB-INF/view/back/home.jsp").forward(request, response);
            } else {

                // On ajoute un message
                messages.add(new Message(" mot de passe incorrect", Message.WARN));

                // Mettre la la liste des messages dans les attributs de la requête
                request.setAttribute("messages", messages);

                // on affiche le formulaire d'authentification avec des
                // messages d'erreur
                getServletContext().getRequestDispatcher("/WEB-INF/view/pages/login.jsp").forward(request, response);

            }

        } else {
            messages.add(new Message("Login incorrect", Message.WARN));
            request.setAttribute("messages", messages);
            getServletContext().getRequestDispatcher("/WEB-INF/view/pages/login.jsp").forward(request, response);
        }
    }
}
