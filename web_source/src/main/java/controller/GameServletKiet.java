package controller;

import model.GameAddDTO;
import repository.IGameRepositoryKiet;
import service.GameService;
import service.GameServiceKiet;
import service.IGameService;
import service.IGameServiceKiet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "GameManager", value = "/game-manager")
public class GameServletKiet extends HttpServlet {
    private final IGameServiceKiet gameServiceKiet = new GameServiceKiet();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add_game":
                showNewForm(req, resp);
                break;
        }
    }

    private void showNewForm(HttpServletRequest req, HttpServletResponse resp) {
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("game_manager/add.jsp");
        try {
            requestDispatcher.forward(req, resp);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add_game":
                addGame(req, resp);
                break;
        }
    }

    private void addGame(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));
        String title = req.getParameter("title");
        double price = Double.parseDouble(req.getParameter("price"));
        String description = req.getParameter("description");
        int ageRequirement = Integer.parseInt(req.getParameter("ageRequirement"));
        int developerId = Integer.parseInt(req.getParameter("developerId"));
        String releaseDate = req.getParameter("releaseDate");
        int dlcId = Integer.parseInt(req.getParameter("dlcId"));
        int reviewRatingId = Integer.parseInt(req.getParameter("reviewRatingId"));
        String miniumSystemRequirement = req.getParameter("miniumSystemRequirement");
        String recommendSystemRequirement = req.getParameter("recommendSystemRequirement");
        GameAddDTO gameAddDTO = new GameAddDTO(id, title, price, description, ageRequirement, developerId, releaseDate, dlcId, reviewRatingId, miniumSystemRequirement, recommendSystemRequirement);
//        gameAddDTO.set

        gameServiceKiet.insertGameAdminDTO(gameAddDTO);
    }
}
