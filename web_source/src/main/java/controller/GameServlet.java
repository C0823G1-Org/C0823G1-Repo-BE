package controller;

import model.Game;
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

@WebServlet(name = "GameServlet", value = "/game-servlet")
public class GameServlet extends HttpServlet {
    private final IGameService gameService = new GameService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "search":
                break;
            case "add_to_cart":
                addToCart(req,resp);
                break;
            default:
                resp.sendRedirect("/home/home.jsp");
        }
    }

    private void addToCart(HttpServletRequest req, HttpServletResponse resp) {
        HttpSession session = req.getSession();
        int userId= (int) session.getAttribute("user_id");
        int gameId= Integer.parseInt(req.getParameter("game_id"));
        gameService.addToCart(userId,gameId);
        List<Game> cartList = gameService.getCartGames(userId);
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
                Game game = new Game();
                RequestDispatcher requestDispatcher = req.getRequestDispatcher("home/home.jsp");
                break;
        }
    }
}
