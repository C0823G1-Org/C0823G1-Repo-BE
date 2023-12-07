package repository;

import model.GameDTO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class GameRepository implements IGameRepository {
    private static final String SEARCH = "with x as (select row_number() over (order by game_id desc) as r,game.game_title,game.price,image.url \n" +
                                         "from game \n" +
                                         "join image on game.game_id = image.game_game_id\n" +
                                         "where game_title like ? )\n" +
                                         "select * from x where r between ?*3-2 and ?*3;";
    private static final String COUNT = "select count(*) from game where game_title like ?;";
    private static final String ADD_TO_CART = "insert into game_in_cart(user_id, game_id) values (?,?)";
    private static final String GET_CART = "call get_user_cart(?);";

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
    public List<GameDTO> search(String txtSearch, int index, int size) {
        Connection connection = BaseGameRepository.getConnection();
        List<GameDTO> list;
        try {
            list = new ArrayList<>();
            PreparedStatement preparedStatement = connection.prepareStatement(SEARCH);
            preparedStatement.setString(1, "%" + txtSearch + "%");
            preparedStatement.setInt(2, index);
            preparedStatement.setInt(3, index);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String name = resultSet.getString("game_title");
                double price = resultSet.getDouble("price");
                String url = resultSet.getString("url");
                list.add(new GameDTO(name, price, url));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    @Override
    public void addToCart(int userId, int gameId) {
        try (Connection connection = BaseGameRepository.getConnection()) {
            PreparedStatement preparedStatement = connection.prepareStatement(ADD_TO_CART);
            preparedStatement.setInt(1, userId);
            preparedStatement.setInt(2, gameId);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<GameDTO> getCartGames(int userId) {
        List<GameDTO> gamesInCart = new ArrayList<>();
        try (Connection connection = BaseGameRepository.getConnection()) {
            CallableStatement callableStatement = connection.prepareCall(GET_CART);
            callableStatement.setInt(1, userId);
            ResultSet resultSet = callableStatement.executeQuery();

            while (resultSet.next()) {
                String title = resultSet.getString("game_title");
                double price = resultSet.getDouble("price");
                String gameCoverURl = resultSet.getString("url");
                gamesInCart.add(new GameDTO(title,price,gameCoverURl));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return gamesInCart;
    }
}
