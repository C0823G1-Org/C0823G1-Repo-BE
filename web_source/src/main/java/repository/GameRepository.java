package repository;

import model.UserDto;
import model.GameDTO;
import model.UserAccount;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class GameRepository implements IGameRepository {
    private static final String SEARCH = "with x as (select row_number() over (order by game_id desc) as r,game.game_title,game.price,image.url \n" +
            "from game \n" +
            "join image on game.game_id = image.game_game_id\n" +
            "where game_title like ? )\n" +
            "select * from x where r between ?*3-2 and ?*3;";
    private static final String COUNT = "select count(*) from game where game_title like ?;";
    private static final String SIGN_UP = "insert into user_account(email, password, role_role_id) values(?,?,?);";
    private final String GET_USER_INFO = " select ua.email, r.role_id, r.role_name, u.user_name, u.birthday from user_account ua " +
            "   left join user u on ua.email = u.email " +
            "        left join role r on r.role_id = ua.role_role_id " +
            "         where ua.email = ? and ua.password = ?; ";

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
                list.add(new GameDTO(name,price,url));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    @Override
    public void createAccount(UserAccount userAccount) {
        Connection connection = BaseGameRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SIGN_UP);
            preparedStatement.setString(1, userAccount.getEmail());
            preparedStatement.setString(2, userAccount.getPassword());
            preparedStatement.setInt(3,2);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    @Override
    public UserDto getUserInfo(UserAccount userAccount) {
        UserDto userDto = null;
        Connection connection = BaseGameRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(GET_USER_INFO);
            preparedStatement.setString(1, userAccount.getEmail());
            preparedStatement.setString(2, userAccount.getPassword());
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                userDto = new UserDto();
                userDto.setEmail(resultSet.getString("email"));
                userDto.setRoleName(resultSet.getString("role_name"));
                userDto.setRoleId(resultSet.getInt("role_id"));
                userDto.setBirthday(resultSet.getString("birthday"));
                userDto.setUsername(resultSet.getString("user_Name"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return userDto;
    }
}
