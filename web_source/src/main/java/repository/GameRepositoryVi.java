package repository;

import javax.servlet.RequestDispatcher;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class GameRepositoryVi extends GameRepository {
    private static final String CHECK_DUPLICATE = "select count(*) from user_account where email = ?;";

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

}
