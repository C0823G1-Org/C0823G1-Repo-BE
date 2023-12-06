package repository;

import model.Game;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class GameRepository implements IGameRepository {
    private static final String SEARCH = "with x as (select row_number() over (order by id desc) as r,*\n" +
                                         "from game\n" +
                                         "where game_title like '%o%')\n" +
                                         "select * from x where r between 1 and 3;";
    private static final String COUNT = "select count(*) from game where game_title like ?;";
    private static final String ADD_TO_CART = "insert into game_in_cart values (?,?)";
    private static final String GET_CART = "select game_id from game_in_cart where user_id = ?";

    @Override
    public int count(String txtSearch) {
        Connection connection = BaseGameRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(COUNT);
            preparedStatement.setString(1, "%" + txtSearch + "%");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                return resultSet.getInt(1);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return 0;
    }

    @Override
    public void addToCart(int userId, int gameId) {
        try (Connection connection = BaseGameRepository.getConnection()) {
            PreparedStatement preparedStatement = connection.prepareStatement(ADD_TO_CART);
            preparedStatement.setString(1, userId);
            preparedStatement.setString(2, gameId);
            preparedStatement.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Game> getCartGames(int userId) {
        try (Connection connection = BaseGameRepository.getConnection()) {
            PreparedStatement preparedStatement = connection.prepareStatement(GET_CART);
            preparedStatement.setString(1, userId);

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}