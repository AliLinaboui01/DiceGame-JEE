package ali.com.dicegame.models;

public class User {
    private String name;
    private String email;
    private String password;
    private double score;
    private double bestScore;
    private boolean endGame = false;
    private int numberOfPlaying;

    public int getNumberOfPlaying() {
        return numberOfPlaying;
    }

    public void setNumberOfPlaying(int numberOfPlaying) {
        this.numberOfPlaying = numberOfPlaying;
    }
    public void incrementNumberOfPlaying(){
        numberOfPlaying++;
    }
    public User() {
    }

    public User(String name, String email, String password, double score, double bestScore) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.score = score;
        this.bestScore = bestScore;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public double getScore() {
        return score;
    }

    public void setScore(double score) {
        this.score = score;
    }

    public double getBestScore() {
        return bestScore;
    }

    public void setBestScore(double bestScore) {
        this.bestScore = bestScore;
    }

    public boolean isEndGame() {
        return endGame;
    }

    public void setEndGame(boolean endGame) {
        this.endGame = endGame;
    }


}
