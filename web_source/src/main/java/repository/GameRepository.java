package repository;

import model.UserDto;
import model.GameDTO;
import model.UserAccount;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class GameRepository implements IGameRepository {
    private static final String SEARCH = "with x as (select row_number() over (order by game_id desc) as r,game.game_title,game.price,image.url \n" +
            "from game \n" +
            "join image on game.game_id = image.game_game_id\n" +
            "where game_title like ? )\n" +
            "select * from x where r between ?*3-2 and ?*3;";
    private static final String CATELOGY = "with y as (select row_number() over (order by g.game_id ) as r,g.game_title,g.price,img.url as img,t.tag_name\n" +
            "from game g\n" +
            "join image img on img.game_game_id = g.game_id\n" +
            "join game_tag gt on gt.game_id = g.game_id\n" +
            "join tag t on t.tag_id = gt.tag_id\n" +
            "where t.tag_name = ?) \n" +
            "select * from y where r between ?*3-2 and ?*3;";
    private static final String COUNTCATELOGY = "select count(*)\n" +
            "from game g\n" +
            "join image img on img.game_game_id = g.game_id\n" +
            "join game_tag gt on gt.game_id = g.game_id\n" +
            "join tag t on t.tag_id = gt.tag_id\n" +
            "where t.tag_name = ?;";
    private static final String COUNT = "select count(*) from game where game_title like ?;";
    private static final String ADD_TO_CART = "insert into game_in_cart(user_id, game_id) values (?,?) on duplicate key update is_deleted=0";
    private static final String GET_CART = "call get_user_cart(?)";
    private static final String SELECT = "call getAll()";
    private static final String SIGN_UP = "insert into user_account(email, password, role_role_id) values(?,?,?);";
    private final String GET_USER_INFO = " select ua.email, r.role_id, r.role_name, u.user_name, u.birthday, u.user_id from user_account ua " +
            "   left join user u on ua.email = u.email " +
            "        left join role r on r.role_id = ua.role_role_id " +
            "         where ua.email = ? and ua.password = ?; ";

    private static final String INSERT_USER = " insert into `user` set email = ?; ";
    private static final String REMOVE_CART_ITEM = "call remove_cart_item(?,?);";

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
        }finally {
            try {
                connection.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return 0;
    }

    @Override
    public int countCatelogy(String txtSearch) {
        Connection connection = BaseGameRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(COUNTCATELOGY);
            preparedStatement.setString(1, txtSearch );
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                return resultSet.getInt(1);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally {
            try {
                connection.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return 0;
    }

    @Override
    public List<GameDTO> searchCatelogy (String txtSearch, int index) {
        Connection connection = BaseGameRepository.getConnection();
        List<GameDTO> list;
        if (txtSearch.equals("Hack")){
            txtSearch = "Hack & Slash";
        }else if (txtSearch.equals("Arcade")){
            txtSearch = "Arcade & Rhythm";
        }
        try {
            list = new ArrayList<>();
            PreparedStatement preparedStatement = connection.prepareStatement(CATELOGY);
            preparedStatement.setString(1, txtSearch);
            preparedStatement.setInt(2, index);
            preparedStatement.setInt(3, index);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String name = resultSet.getString("game_title");
                double price = resultSet.getDouble("price");
                String url = resultSet.getString("img");
                String tagGame = resultSet.getString("tag_name");
                list.add(new GameDTO(name, price, url,tagGame));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
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
    public boolean createAccount(UserAccount userAccount) {
        boolean isSuccess = false;
        Connection connection = BaseGameRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SIGN_UP);
            preparedStatement.setString(1, userAccount.getEmail());
            preparedStatement.setString(2, userAccount.getPassword());
            preparedStatement.setInt(3, 2);
            isSuccess = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }

        return isSuccess;
    }

    public void addToCart(int userId, int gameId) {
        try (Connection connection = BaseGameRepository.getConnection()) {
            PreparedStatement preparedStatement = connection.prepareStatement(ADD_TO_CART);
            preparedStatement.setInt(1, userId);
            preparedStatement.setInt(2, gameId);
            preparedStatement.executeUpdate();
        } catch (SQLIntegrityConstraintViolationException ignored) {
            System.out.println("Game already in cart!");
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
                userDto.setUserId(resultSet.getInt("user_id"));
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
                int gameId = resultSet.getInt("game_id");
                gamesInCart.add(new GameDTO(title, price, gameCoverURl, gameId));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return gamesInCart;
    }

    @Override
    public void removeCartItem(int userId, int gameId) {
        try (Connection connection = BaseGameRepository.getConnection()) {
            CallableStatement callableStatement = connection.prepareCall(REMOVE_CART_ITEM);
            callableStatement.setInt(1, userId);
            callableStatement.setInt(2, gameId);
            callableStatement.executeQuery();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public boolean createUser(String email) {
        boolean isSuccess = false;
        Connection connection = BaseGameRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USER);
            preparedStatement.setString(1, email);
            isSuccess = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return isSuccess;
    }

    @Override
    public GameDTO getGameForCart(int gameId) {
        return null;
    }

    @Override
    public boolean findDuplicate(String email) {
        return false;
    }
}
