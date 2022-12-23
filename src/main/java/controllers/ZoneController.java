package controllers;

import java.io.IOException;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import ma.monument.metiers.VilleLocal;
import ma.monument.metiers.ZoneLocal;
import ma.monuments.entities.Ville;
import ma.monuments.entities.Zone;

/**
 * Servlet implementation class ZoneController
 */
@WebServlet("/ZoneController")
public class ZoneController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@EJB
	ZoneLocal service;
	
	@EJB
	VilleLocal villeService;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ZoneController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (request.getParameter("op").equals("load")) {
			response.setContentType("application/json");
			List<Zone> zones = service.findAll();
			Gson json = new Gson();
			response.getWriter().write(json.toJson(zones));
		}
		if (request.getParameter("op").equals("add")) {
			String nom = request.getParameter("nom");
			int vid = Integer.parseInt(request.getParameter("villeId"));
			Ville v = villeService.findById(vid);
			Zone z = new Zone();
			z.setNom(nom);
			z.setVille(v);
			service.add(z);
		}
		if (request.getParameter("op").equals("del")) {
			int id = Integer.parseInt(request.getParameter("id"));
			service.delete(id);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
