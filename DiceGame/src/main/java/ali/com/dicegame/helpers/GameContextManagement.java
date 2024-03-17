package ali.com.dicegame.helpers;

import ali.com.dicegame.models.User;
import jakarta.servlet.ServletContext;

import java.util.List;

public class GameContextManagement {
    private ServletContext context;

    private static GameContextManagement instance;

    private GameContextManagement(ServletContext context) {
        this.context = context;
    }

    synchronized public static final GameContextManagement getInstance(ServletContext context) {
        if (instance == null) {
            instance = new GameContextManagement(context);
        }
        return instance;
    }
    public List<User> getAllUsers() {
        return (List<User>) context.getAttribute("users");

    }

    public void updateScore(User user) {
        List<User> users = getAllUsers();
        for (User it : users) {
            if (it.getEmail().equals(user.getEmail())) {
                it.setBestScore(user.getBestScore());
                break;
            }
        }

    }

    public void insertUser(User user) {
        List<User> userList = (List<User>) context.getAttribute("users");
        userList.add(user);
    }

    public User getUserByLogin(String login) {
        List<User> users = getAllUsers();
        for (User it : users) {
            System.out.println(it);
            if (it.getEmail().equals(login)) {
                return it;
            }
        }

        return null;
    }
}
