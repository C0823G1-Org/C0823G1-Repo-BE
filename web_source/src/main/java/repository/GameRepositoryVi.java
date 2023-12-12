package repository;

import model.UserDto;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class GameRepositoryVi extends GameRepository {
    private static final String CHECK_DUPLICATE = "select count(*) from user_account where email = ?;";
    private static final String SHOW_ALL_USERS = "call create_user_account();";

    public boolean findDuplicate(String email) {
        boolean isSuccess = false;
        Connection connection = BaseGameRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(CHECK_DUPLICATE);
            preparedStatement.setString(1, email);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int count = resultSet.getInt(1);
                isSuccess = count > 0;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return isSuccess;
    }

    public List<UserDto> showAllUsers() {
        List<UserDto> userDtos = new ArrayList<>();
        Connection connection = BaseGameRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SHOW_ALL_USERS);
            ResultSet resultSet = preparedStatement.getResultSet();
            preparedStatement.executeQuery();
            while (resultSet.next()) {
                String name = resultSet.getString("name");
                String birthday = resultSet.getString("birthday");
                String email = resultSet.getString("email");
                userDtos.add(new UserDto(name, birthday, email));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return userDtos;
    }

}
