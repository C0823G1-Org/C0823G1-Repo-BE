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
    private static final IGameService gameService = new GameService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
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
                String indexString  =  req.getParameter("index");
                int index = Integer.parseInt(indexString);
                RequestDispatcher requestDispatcher = req.getRequestDispatcher("search/search.jsp");
                int count = gameService.count(txtSearch);
                int pageSize = 3;
                int endPage = 0;
                endPage = count / pageSize;
                if (count % endPage != 0){
                    endPage ++;
                }
                List<Game> listSearch = gameService.search(txtSearch,index,pageSize);
                List<Game> games = gameService.search("s",1,3);
                for (Game a : games){
                    System.out.println(a);
                }
                req.setAttribute("endPage",endPage);
                req.setAttribute("list",listSearch);
                requestDispatcher.forward(req,resp);
                break;
        }
    }


}
