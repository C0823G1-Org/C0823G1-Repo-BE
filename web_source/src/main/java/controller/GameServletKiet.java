package controller;

import model.BundleHasGame;
import model.GameAddDTO;
import model.Image;
import model.Video;
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
            case "edit_game":
                showEditForm(req, resp);

        }
    }

    private void showEditForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        GameAddDTO gameAddDTO = gameServiceKiet.selectUser(name);
        req.setAttribute("gameAddDTO", gameAddDTO);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("game_manager/edit.jsp");
        requestDispatcher.forward(req, resp);
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
                case "edit_game":
                    editGame(req,resp);
        }
    }

    private void editGame(HttpServletRequest req, HttpServletResponse resp) {

    }

    private void addGame(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String title = req.getParameter("title");
        double price = Double.parseDouble(req.getParameter("price"));
        String description = "game hay";
        int ageRequirement = 1;
        int developerId = 1;
        String releaseDate = "2003-09-09";
        int dlcId = 1;
        int reviewRatingId = Integer.parseInt(req.getParameter("reviewRatingId"));
        String miniumSystemRequirement = "may yeu";
        String recommendSystemRequirement = "may khoe";
        GameAddDTO gameAddDTO = new GameAddDTO(id, title, price, description, ageRequirement, developerId, releaseDate,
                dlcId, reviewRatingId, miniumSystemRequirement, recommendSystemRequirement);
        gameServiceKiet.insertGameAdminDTO(gameAddDTO);
//        bundle
        int idBundle = 1;
        BundleHasGame bundleHasGame = new BundleHasGame(id, idBundle);
        gameServiceKiet.insertBundle(bundleHasGame);
//        video
        String urlVideo = req.getParameter("urlVideo");
        Video video = new Video(urlVideo, id);
        gameServiceKiet.insertVideo(video);
//        image
        String urlImage = req.getParameter("urlImage");
        int imageType = 1;
        Image image = new Image(urlImage, id, imageType);
        gameServiceKiet.insertImage(image);
        resp.sendRedirect("game-servlet?action=game");
    }
}
