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
import java.io.IOException;

@WebServlet(name = "GameServlet", value = "/game-servlet")
public class GameServlet extends HttpServlet {
    private final IGameService iGameService = new GameService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "search":
                break;
            default:
                resp.sendRedirect("/home/home.jsp");
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
                Game game = new Game();
                RequestDispatcher requestDispatcher = req.getRequestDispatcher("home/home.jsp");
                break;
        }
    }
}
