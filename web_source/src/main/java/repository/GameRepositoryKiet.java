package repository;

import model.GameDTO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class GameRepositoryKiet extends GameRepository {
    private static final String SELECT = "call getAll()";

    @Override
    public List<GameDTO> getAll() {
        List<GameDTO> list = new ArrayList<>();
        Connection connection = BaseGameRepository.getConnection();
        CallableStatement callableStatement = null;
        try {
            callableStatement = connection.prepareCall(SELECT);
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                String name = resultSet.getString("game_title");
                double price = resultSet.getDouble("price");
                String urlVideo = resultSet.getString("video");
                String url = resultSet.getString("img");
                String percentDiscount = resultSet.getString("percent_discount");
                String rating = resultSet.getString("rating_type_name");
                list.add(new GameDTO(name, price, url, urlVideo, percentDiscount, rating));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            try {
                if (callableStatement != null) {
                    callableStatement.close();
                }
                connection.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

        }
        return list;
    }
}
