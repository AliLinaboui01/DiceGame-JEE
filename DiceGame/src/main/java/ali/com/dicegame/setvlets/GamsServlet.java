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
import java.util.HashMap;
import java.util.Random;


@WebServlet("/play")

public class GamsServlet extends HttpServlet {
    protected void play(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // On récupére la session de l'utilisateur en cours
        HttpSession session = request.getSession();

        // On récupére de la session, les informations du joueur en cours
        User user = (User) session.getAttribute("user");

        // Pour gérer les données de l'application dans le ServletContext
        GameContextManagement gameContext = GameContextManagement.getInstance(getServletContext());

        // Cette objet est déjà inséré dans la session au moment de login
        GameState gameSate = (GameState) session.getAttribute("gameState");


        if (user.isEndGame()){
            if (!gameSate.isGameOver()) {
                // On ajoute un message d'information
                gameSate.addMessage(new Message("Game Over", Message.INFO));

                // On vérifie s'il faut mettre à jour le meilleur score pour ce joueur
                if (user.getScore() > user.getBestScore()) {

                    // Si oui alors mise à jour des données dans la session
                    user.setBestScore(user.getScore());

                    // Mise à jour des données dans le contexte de l'application
                    gameContext.updateScore(user);
                }
                // On indique que le jeu est terminé
                gameSate.setGameOver(true);


            }
            // On redirige vers la vue par une redirection au niveau du serveur
            getServletContext().getRequestDispatcher("/WEB-INF/view/back/home.jsp").forward(request, response);
        }else {
            HashMap<Integer,Integer> diceNumberScore = (HashMap<Integer, Integer>)  request.getAttribute("diceNumberScore");
          int diceNumber = Integer.parseInt(request.getParameter("diceNumber"));
         if(diceNumber < 4 && diceNumber > 0) {

             Random random = new Random();
             int randScore = random.nextInt(7);

             int key = diceNumber;
             int value = randScore;

             if(!diceNumberScore.containsKey(key)) {
                 if(key == 1 && value==6) {

                     System.out.println("game over and score = -1");
                 }else{
                     diceNumberScore.put(key,value);



                 }

             }


         }
        }


    }


    public boolean stillInGame(HttpServletRequest request) {
        HttpSession session = request.getSession();

        return true;
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        play(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        play(req,resp);

    }
}
