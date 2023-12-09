package controller;

import model.GameDTO;
import model.UserAccount;
import model.UserDto;
import service.GameService;
import service.GameServiceLam;
import service.IGameService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

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
                req.getRequestDispatcher("/home/home.jsp").forward(req, resp);
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
            case "user":
                handleDecentralization(resp, session);
                break;
            case "check_if_game_in_cart":
                checkIfGameInCart(req, resp);
                break;
            case "show_cart":
                showCart(req, resp);
                break;
            default:
                showList(req, resp);
        }
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
                resp.sendRedirect("register/register.jsp");
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
        List<GameDTO> list = gameService.getAll();
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
            case "search":
                String txtSearch = req.getParameter("txtSearch");
                String indexString = req.getParameter("index");
                int index = Integer.parseInt(indexString);
                RequestDispatcher requestDispatcher = req.getRequestDispatcher("search/search.jsp");
                int count = gameService.count(txtSearch);
                int pageSize = 3;
                int endPage = 0;
                endPage = count / pageSize;
                if (count % endPage != 0) {
                    endPage++;
                }
                List<GameDTO> listSearch = gameService.search(txtSearch, index, pageSize);
                List<GameDTO> games = gameService.search("s", 1, 3);
                for (GameDTO a : games) {
                    System.out.println(a);
                }
                req.setAttribute("endPage", endPage);
                req.setAttribute("list", listSearch);
                requestDispatcher.forward(req, resp);
                break;
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
            req.setAttribute("message", "Logged in successfully");
            httpSession.setAttribute("userDto", userDto);
            resp.sendRedirect("/game-servlet");
        }
    }

    private void signUp(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        UserAccount account = new UserAccount(email, password);
        boolean isSuccess = gameService.createAccount(account);
        if (isSuccess) {
            UserDto userDto = this.gameService.getUserInfo(account);
            gameService.createUser(email);
            HttpSession httpSession = req.getSession();
            httpSession.setAttribute("userDto", userDto);
            req.getRequestDispatcher("home/home.jsp").forward(req, resp);
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