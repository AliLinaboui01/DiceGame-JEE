package ali.com.dicegame.models;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class GameState {
    private User user;

    private boolean gameOver = false;

    private List<Message> messages = new ArrayList<Message>();
    private HashMap<Integer,Integer> myMap = new HashMap<Integer,Integer>();

    public HashMap<Integer, Integer> getMyMap() {
        return myMap;
    }

    public void setMyMap(HashMap<Integer, Integer> myMap) {
        this.myMap = myMap;
    }

    public void reinit() {
        gameOver = false;
        messages = new ArrayList<Message>();
        myMap=new HashMap<Integer,Integer>();
        user.setScore(0);
    }

    public String toString() {
        return "GameState [Score=" + user.getScore() + ", messages="
                + messages;
    }

    public void addMessage(Message ms) {
        messages.add(ms);
    }

    public GameState(User user) {
        this.user = user;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public boolean isGameOver() {
        return gameOver;
    }

    public void setGameOver(boolean gameOver) {
        this.gameOver = gameOver;
    }

    public List<Message> getMessages() {
        return messages;
    }

    public void setMessages(List<Message> messages) {
        this.messages = messages;
    }
    public int sizeMessages(){
        return messages.size();
    }
}
