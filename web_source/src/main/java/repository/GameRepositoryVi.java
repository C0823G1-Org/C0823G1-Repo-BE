package repository;

import model.UserDto;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class GameRepositoryVi extends GameRepository {
    private static final String CHECK_DUPLICATE = "select count(*) from user_account where email = ?;";
    private static final String SHOW_ALL_USERS = "call create_user_account();";
    private static final String FIND_USER_ID = "select * from user where user.user_id=?; ";
    private static final String REMOVE_USER = "update `user` set user.is_deleted = 1 where user.user_id=?;";
    private static final String UPDATE_USER = "update `user` set user_name = ?,birthday = ? where user_id = ?;";

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
        CallableStatement callableStatement = null;
        try {
            callableStatement = connection.prepareCall(SHOW_ALL_USERS);
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("user_id");
                String name = resultSet.getString("user_name");
                String birthday = resultSet.getString("birthday");
                String email = resultSet.getString("email");
                userDtos.add(new UserDto(id, name, birthday, email));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            try {
                callableStatement.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return userDtos;
    }

    public UserDto findUserId(int userId) {
        UserDto userDto = null;
        Connection connection = BaseGameRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_USER_ID);
            preparedStatement.setInt(1, userId);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String name = resultSet.getString("user_name");
                String birthday = resultSet.getString("birthday");
                String email = resultSet.getString("email");
                userDto = new UserDto(userId, name, birthday, email);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return userDto;
    }

    public boolean removeUser(int userId) {
        boolean rowRemove = false;
        Connection connection = BaseGameRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(REMOVE_USER);
            preparedStatement.setInt(1, userId);
            rowRemove = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return rowRemove;
    }

    public boolean editUser(UserDto user) {
        boolean rowEdit = false;
        Connection connection = BaseGameRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_USER);
            preparedStatement.setString(1, user.getUsername());
            preparedStatement.setString(2, user.getBirthday());
            preparedStatement.setInt(3, user.getUserId());
            rowEdit = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return rowEdit;
    }
}
