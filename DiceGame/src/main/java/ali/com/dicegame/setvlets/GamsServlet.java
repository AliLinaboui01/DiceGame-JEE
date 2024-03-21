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
import java.util.Map;
import java.util.Random;

@WebServlet("/play")
public class GamsServlet extends HttpServlet {

    protected void play(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        GameState gameState = (GameState) session.getAttribute("gameState");
        GameContextManagement gameContext = GameContextManagement.getInstance(getServletContext());
        // check if the game is finish
        if (user.isEndGame()) {
            //is game over
            if (!gameState.isGameOver()) {
                // set the best score by comparing between last score and the last best score
                if (user.getScore() > user.getBestScore()) {
                    user.setBestScore(user.getScore());
                    gameContext.updateScore(user);
                }
                gameState.setGameOver(true);
            }
            getServletContext().getRequestDispatcher("/WEB-INF/view/back/home.jsp").forward(request,response);
            // end
            return;
        } else {
            Random random = new Random();
            // generate the random value of the dice
            int result =1+ random.nextInt(6);
            int diceNumber;
            try {
                // get the number of the dice
                diceNumber = Integer.parseInt(request.getParameter("diceNumber"));
            } catch (NumberFormatException e) {
                // case of invalid number
                gameState.addMessage(new Message("Invalid dice number", Message.ERROR));
                getServletContext().getRequestDispatcher("/WEB-INF/view/back/home.jsp").forward(request,response);
                return;
            }
            // here I want  to check if the number of dice is 1 , 2 or 3
            if (diceNumber >= 1 && diceNumber <= 3) {
                // if the session is not null, so I can check the condition of repetition of dice number
                if (session.getAttribute("old_dice") != null) {
                    HashMap<Integer, Integer> sessionMap = (HashMap<Integer, Integer>) session.getAttribute("old_dice");
                        // check the condition of repetition of dice number
                    if (sessionMap.containsKey(diceNumber)){
                        user.setScore(-1);
                        gameState.getUser().setScore(-1);
                        gameContext.updateScore(user);
                        gameState.setGameOver(true);
                        gameState.addMessage(new Message("Game Over because you already play with this number ", Message.ERROR));
                        user.setEndGame(true);
                        getServletContext().getRequestDispatcher("/WEB-INF/view/back/home.jsp").forward(request,response);
                        return;
                    }

                        //if the key is 1 and value is 6 , so end game and return a -1 score
                        else if ( sessionMap.containsKey(1) ) {
                        if( sessionMap.get(1)==6){
                            user.setScore(0);
                            gameState.getUser().setScore(0);
                            gameContext.updateScore(user);
                            gameState.setGameOver(true);
                            gameState.addMessage(new Message("End game the value of dice number 1 is 6 so the condition never verified", Message.ERROR));
                            user.setEndGame(true);
                            getServletContext().getRequestDispatcher("/WEB-INF/view/back/home.jsp").forward(request,response);
                            return;
                        }
                    }

                    // I want to check if the user is roll 3 dices so ia can check the condition of one < two && one < three
                    if (sessionMap.size() == 2) {
                        sessionMap.put(diceNumber, result);
                        gameState.addMessage(new Message(String.valueOf(result),Message.INFO));
                        gameState.addMessage(new Message("Game Over", Message.INFO));
                        user.setEndGame(true);
                        int one = sessionMap.get(1);
                        int two = sessionMap.get(2);
                        int three = sessionMap.get(3);
                        if (one < two && two < three) {
                            int score = one + two + three;
                            user.setScore(score);
                            gameState.getUser().setScore(score);
                            gameContext.updateScore(user);
                            getServletContext().getRequestDispatcher("/WEB-INF/view/back/home.jsp").forward(request,response);
                        }
                        // one < two && one < three is not verified
                        else {

                            gameState.addMessage(new Message("one < two && two < three is not verified score(0)", Message.INFO));
                            user.setScore(-1);
                            gameState.getUser().setScore(-1);
                            gameContext.updateScore(user);
                            getServletContext().getRequestDispatcher("/WEB-INF/view/back/home.jsp").forward(request,response);
                            return;
                        }
                    } else {
                        gameState.addMessage(new Message(String.valueOf(result),Message.INFO));
                        sessionMap.put(diceNumber, result);
                        session.setAttribute("old_dice", sessionMap);
                        getServletContext().getRequestDispatcher("/WEB-INF/view/back/home.jsp").forward(request,response);
                    }
                } else {
                    // the session is vide so the first lance can be 6 with key 1 , I can check this  here
                    if (diceNumber == 1 && result == 6){
                        gameState.addMessage(new Message(String.valueOf(result),Message.INFO));
                        gameState.setGameOver(true);
                        user.setScore(0);
                        gameState.getUser().setScore(0);
                        gameContext.updateScore(user);
                        gameState.addMessage(new Message("End game the value of dice number 1 is 6 so the condition never verified", Message.ERROR));
                        user.setEndGame(true);
                        getServletContext().getRequestDispatcher("/WEB-INF/view/back/home.jsp").forward(request,response);
                        return;
                    }else{
                        HashMap<Integer, Integer> myMap = new HashMap<>();
                        myMap.put(diceNumber, result);
                        gameState.addMessage(new Message(String.valueOf(result),Message.INFO));
                        session.setAttribute("old_dice", myMap);
                        getServletContext().getRequestDispatcher("/WEB-INF/view/back/home.jsp").forward(request,response);
                    }
                }
            } else {
                // if the input is not 1 2 or 3
                gameState.addMessage(new Message("Dice number should be between 1 and 3", Message.WARN));
                getServletContext().getRequestDispatcher("/WEB-INF/view/back/home.jsp").forward(request,response);
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        play(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        play(req, resp);
    }
}
