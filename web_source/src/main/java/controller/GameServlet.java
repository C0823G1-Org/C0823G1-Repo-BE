package controller;

import model.UserDto;
import model.GameDTO;
import model.UserAccount;
import service.GameService;
import service.IGameService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.Objects;

@WebServlet(name = "GameServlet", value = "/game-servlet")
public class GameServlet extends HttpServlet {
    private final IGameService gameService = new GameService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "logout":
                if (session.getAttribute("userDto") != null ) {
                    session.invalidate();
                }
                req.getRequestDispatcher("/home/home.jsp").forward(req,resp);
                break;
            case "add_to_cart":
                addToCart(req, resp);
                break;
            default:
                req.getRequestDispatcher("/home/home.jsp").forward(req,resp);
        }
    }

    private void addToCart(HttpServletRequest req, HttpServletResponse resp) {
        HttpSession session = req.getSession();
        int userId = Integer.parseInt(req.getParameter("user_id"));
        int gameId = Integer.parseInt(req.getParameter("game_id"));
        gameService.addToCart(userId, gameId);
        updateCart(req, resp);
    }

    private void updateCart(HttpServletRequest req, HttpServletResponse resp) {
        int userId = Integer.parseInt(req.getParameter("user_id"));
        List<GameDTO> cartList = gameService.getCartGames(userId);

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
                removeCartItem(req,resp);
                break;
        }
    }

    private void signIn(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        UserAccount userAccount = new UserAccount(email, password);
        UserDto userDto = this.gameService.getUserInfo(userAccount);
        if(Objects.isNull(userDto)) {
            req.setAttribute("message", "account or password is incorrect");
            req.setAttribute("userAccount", userAccount);
            req.getRequestDispatcher("login/login.jsp").forward(req,resp);
        } else {
            HttpSession httpSession = req.getSession();
            httpSession.setAttribute("userDto", userDto);
            req.getRequestDispatcher("home/home.jsp").forward(req,resp);
        }
    }

    private void signUp(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        UserAccount account = new UserAccount(email, password);
        gameService.createAccount(account);
        req.setAttribute("account", account);
        req.getRequestDispatcher("home/home.jsp").forward(req,resp);}
        
    private void removeCartItem(HttpServletRequest req, HttpServletResponse resp) {
        int userId= Integer.parseInt(req.getParameter("user_id"));
        int gameId= Integer.parseInt(req.getParameter("game_id"));
        gameService.removeCartItem(userId,gameId);
        System.out.println("Ayo this worked!");
        updateCart(req,resp);
    }
}
