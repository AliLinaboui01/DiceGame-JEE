package ali.com.dicegame.helpers;

public class GameException extends Exception{
    public GameException() {
    }

    public GameException(String message, Throwable cause) {
        super(message, cause);
    }

    public GameException(String message) {
        super(message);
    }

    public GameException(Throwable cause) {
        super(cause);
    }
}
