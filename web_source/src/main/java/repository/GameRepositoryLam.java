package repository;

import model.GameDTO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

public class GameRepositoryLam extends GameRepository {
    private final String GET_GAME_FOR_CART = "call get_game_for_cart(?)";

    public GameDTO getGameForCart(int gameId) {
        Connection connection = BaseGameRepository.getConnection();
        try (CallableStatement callableStatement = connection.prepareCall(GET_GAME_FOR_CART)) {
            callableStatement.setInt(1, gameId);
            ResultSet resultSet = callableStatement.executeQuery();
            resultSet.next();
            String title = resultSet.getString("game_title");
            double price = resultSet.getDouble("price");
            String gameCoverURl = resultSet.getString("url");
            return new GameDTO(title, price, gameCoverURl, gameId);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
