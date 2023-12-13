package controller;

import model.GameDTO;
import model.GameTag;
import model.UserAccount;
import model.UserDto;
import service.GameService;
import service.GameServiceLam;
import service.IGameService;
import utils.RegistrationValidator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "GameServlet", value = "/game-servlet")
public class GameServlet extends HttpServlet {
    private final IGameService gameService = new GameService();
    private final IGameService gameServiceLam = new GameServiceLam();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "logout":
                if (session.getAttribute("userDto") != null) {
                    session.invalidate();
                }
                resp.sendRedirect("/game-servlet");
                break;
            case "add_to_cart":
                addToCart(req, resp);
                break;
            case "register":
                register(req, resp);
                break;
            case "login":
                logIn(req, resp);
                break;
            case "game":
                break;
            case "user":
                handleDecentralization(resp, session);
                showListGame(req, resp);
                break;
            case "check_if_game_in_cart":
                checkIfGameInCart(req, resp);
                break;
            case "show_cart":
                showCart(req, resp);
                break;
            case "searchCatelogy":
                searchCatelogy(req, resp);
                break;
            case "detail":
                detailGame(req, resp);
                break;
            case "search":
                search(req,resp);
                break;
            default:
                showList(req, resp);
        }
    }
    private void searchCatelogy(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("search/search.jsp");
        String txtCatelogy = req.getParameter("catelogy");
        String indexString = req.getParameter("index");
        int index = Integer.parseInt(indexString);
        int count = gameService.countCatelogy(txtCatelogy);
        int pageSize = 3;
        int endPage = (count / pageSize);
        List<GameDTO> list = gameService.searchCatelogy(txtCatelogy, index);
        if (count % pageSize != 0) {
            endPage++;
        }
        req.setAttribute("check",true);
        req.setAttribute("listCatelogy", list);
        req.setAttribute("endPage", endPage);
        req.setAttribute("text", txtCatelogy);
        req.setAttribute("countCatelogy", count);
        req.setAttribute("index",index);
        requestDispatcher.forward(req, resp);
    }

    private void detailGame(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher requestDispatcher1 = req.getRequestDispatcher("detail_game/detail_game.jsp");
        String title = req.getParameter("title");
        GameDTO gameDTO = gameService.detailGame(title);
        req.setAttribute("listDetail",gameDTO);
        requestDispatcher1.forward(req, resp);
    }

    private void showListGame(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("game_manager/game_manager.jsp");
        List<GameDTO> list = gameService.getAll();
        req.setAttribute("list", list);
        requestDispatcher.forward(req, resp);
    }

    private void showCart(HttpServletRequest req, HttpServletResponse resp) {
        UserDto user = (UserDto) req.getSession().getAttribute("userDto");
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/cart/cart.jsp");
        if (user == null) {
            try {
                requestDispatcher.forward(req, resp);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
            return;
        }
        getUserCart(req, resp);
    }

    private static void handleDecentralization(HttpServletResponse resp, HttpSession session) throws IOException {
        if (session.getAttribute("userDto") != null) {
            UserDto userDto = (UserDto) session.getAttribute("userDto");
            if (userDto.getRoleId() == 1) {
                resp.sendRedirect("game_manager/game_manager.jsp");
            } else {
                resp.sendRedirect("home/home.jsp");
            }
        }
    }

    private void checkIfGameInCart(HttpServletRequest req, HttpServletResponse resp) {
        HttpSession session = req.getSession();
        UserDto user = (UserDto) session.getAttribute("userDto");
        int gameId = Integer.parseInt(req.getParameter("game_id"));
        if (user == null) {
            req.setAttribute("isInGuessCart", false);
            List<GameDTO> guessCart = (List<GameDTO>) session.getAttribute("guess_cart");
            if (guessCart != null) {
                for (GameDTO e : guessCart) {
                    if (e.getGameId() == gameId) {
                        req.setAttribute("isInGuessCart", true);
                        break;
                    }
                }
            }
        } else {
            req.setAttribute("isInUserCart", false);
            List<GameDTO> userCart = gameService.getCartGames(user.getUserId());
            if (userCart != null) {
                for (GameDTO e : userCart) {
                    if (e.getGameId() == gameId) {
                        req.setAttribute("isInUserCart", true);
                        break;
                    }
                }
            }
        }

        String pathToReturn = req.getParameter("path_to_return");
        try {
            req.getRequestDispatcher(pathToReturn).forward(req, resp);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void logIn(HttpServletRequest req, HttpServletResponse resp) {
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("login/login.jsp");
        try {
            requestDispatcher.forward(req, resp);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void register(HttpServletRequest req, HttpServletResponse resp) {
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("register/register.jsp");
        try {
            requestDispatcher.forward(req, resp);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }

    private void showList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("home/home.jsp");
        String message = req.getParameter("message");
        if (message != null) {
            req.setAttribute("message", message);
        }
        List<GameDTO> list = gameService.getAll();
        Map<Integer,ArrayList<GameDTO>> tagGame = new  HashMap<>();
        for (GameDTO gameDTO : list){
            int idGame = gameDTO.getGameId();
            List<GameDTO> list1 = gameService.tagGame(idGame);
            tagGame.put(idGame, (ArrayList<GameDTO>) list1);
        }
        req.setAttribute("tagGame",tagGame);
        req.setAttribute("list", list);
        requestDispatcher.forward(req, resp);
    }

    private void addToCart(HttpServletRequest req, HttpServletResponse resp) {
        UserDto user = (UserDto) req.getSession().getAttribute("userDto");
        if (user == null) {
            addToGuessCart(req, resp);
            return;
        }
        int userId = user.getUserId();
        int gameId = Integer.parseInt(req.getParameter("game_id"));
        gameService.addToCart(userId, gameId);
        getUserCart(req, resp);
    }

    private void addToGuessCart(HttpServletRequest req, HttpServletResponse resp) {
        HttpSession session = req.getSession();
        int gameId = Integer.parseInt(req.getParameter("game_id"));
        List<GameDTO> guessCart;
        if (session.getAttribute("guess_cart") != null) {
            guessCart = (List<GameDTO>) session.getAttribute("guess_cart");
        } else {
            guessCart = new ArrayList<>();
        }
        guessCart.add(gameServiceLam.getGameForCart(gameId));
        session.setAttribute("guess_cart", guessCart);
        try {
            req.getRequestDispatcher("/cart/cart.jsp").forward(req, resp);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void getUserCart(HttpServletRequest req, HttpServletResponse resp) {
        UserDto user = (UserDto) req.getSession().getAttribute("userDto");
        List<GameDTO> cartList = gameService.getCartGames(user.getUserId());
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/cart/cart.jsp");
        req.setAttribute("cart_list", cartList);
        try {
            requestDispatcher.forward(req, resp);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "sign_in":
                signIn(req, resp);
                break;
            case "sign_up":
                signUp(req, resp);
                break;
            case "remove_cart_item":
                removeCartItem(req, resp);
                break;
        }
    }

    private void search(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String txtSearch = req.getParameter("txtSearch");
        String indexString = req.getParameter("index");
        int index = Integer.parseInt(indexString);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("search/search.jsp");
        int count = gameService.count(txtSearch);
        int pageSize = 3;
        int endPage = (count / pageSize);
        List<GameDTO> listSearch = gameService.search(txtSearch, index);
        try {
            if (count % pageSize != 0) {
                endPage++;
            } else {
                endPage = 0;
                throw new ArithmeticException();
            }
        } catch (ArithmeticException e) {
            e.printStackTrace();
            req.setAttribute("Error", "Nothing games !!!!");
        }
        req.setAttribute("checkS",true);
        req.setAttribute("list", listSearch);
        req.setAttribute("endPage", endPage);
        req.setAttribute("save", txtSearch);
        req.setAttribute("count", count);
        req.setAttribute("index",index);
        requestDispatcher.forward(req, resp);
    }

    private void signIn(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        UserAccount userAccount = new UserAccount(email, password);
        UserDto userDto = this.gameService.getUserInfo(userAccount);
        if (userDto == null) {
            req.setAttribute("message", "account or password is incorrect");
            req.setAttribute("userAccount", userAccount);
            req.getRequestDispatcher("login/login.jsp").forward(req, resp);
        } else {
            HttpSession httpSession = req.getSession();
            httpSession.setAttribute("userDto", userDto);
            resp.sendRedirect("/game-servlet");
        }
    }

    private void signUp(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        if (!RegistrationValidator.isValidEmail(email)) {
            req.setAttribute("message", "Invalid email format.Ex: abc@gmail.com");
            req.setAttribute("userAccount", new UserAccount(email, password));
            req.getRequestDispatcher("register/register.jsp").forward(req, resp);
            return;
        }
        if (!RegistrationValidator.isValidPassword(password)) {
            req.setAttribute("message", " Password is minimum eight characters, at least one letter and one number");
            req.setAttribute("userAccount", new UserAccount(email, password));
            req.getRequestDispatcher("register/register.jsp").forward(req, resp);
            return;
        }
        UserAccount account = new UserAccount(email, password);
        boolean check = gameService.findDuplicate(email);
        if (check) {
            req.setAttribute("message", "Email is exists! Please enter another email");
            req.getRequestDispatcher("register/register.jsp").forward(req, resp);
        } else {
            boolean isSuccess = gameService.createAccount(account);
            if (isSuccess) {
                UserDto userDto = this.gameService.getUserInfo(account);
                gameService.createUser(email);
                HttpSession httpSession = req.getSession();
                httpSession.setAttribute("userDto", userDto);
                req.setAttribute("Sucssesful",true);
                List<GameDTO> list = gameService.getAll();
                req.setAttribute("newList", list);
                req.getRequestDispatcher("home/home.jsp").forward(req, resp);
            }
        }
    }

    private void removeCartItem(HttpServletRequest req, HttpServletResponse resp) {
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/cart/cart.jsp");
        int gameId = Integer.parseInt(req.getParameter("game_id"));
        UserDto user = (UserDto) req.getSession().getAttribute("userDto");
        if (user == null) {
            HttpSession session = req.getSession();
            List<GameDTO> guessCart = (List<GameDTO>) session.getAttribute("guess_cart");
            for (GameDTO e : guessCart) {
                if (e.getGameId() == gameId) {
                    guessCart.remove(e);
                    break;
                }
            }
            session.setAttribute("guess_cart", guessCart);
            try {
                requestDispatcher.forward(req, resp);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
            return;
        }
        gameService.removeCartItem(user.getUserId(), gameId);
        getUserCart(req, resp);
    }
}