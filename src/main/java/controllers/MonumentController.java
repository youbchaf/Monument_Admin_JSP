package controllers;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import ma.monument.metiers.CreatorLocal;
import ma.monument.metiers.MonumentLocal;
import ma.monument.metiers.TypeLocal;
import ma.monument.metiers.ZoneLocal;
import ma.monuments.entities.Creator;
import ma.monuments.entities.Monument;
import ma.monuments.entities.Type;
import ma.monuments.entities.Zone;

/**
 * Servlet implementation class MonumentController
 */
@WebServlet("/MonumentController")
public class MonumentController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@EJB
	MonumentLocal service;

	@EJB
	ZoneLocal zoneService;

	@EJB
	TypeLocal typeService;

	@EJB
	CreatorLocal creatorService;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MonumentController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		if (request.getParameter("op").equals("load")) {
			response.setContentType("application/json");
			List<Monument> mns = service.findAll();
			Gson json = new Gson();
			response.getWriter().write(json.toJson(mns));
		}
		if (request.getParameter("op").equals("add")) {
			System.out.println("#Moni "+request.getParameter("op"));
			System.out.println(request);
			String nom = request.getParameter("nom");
			String desc = request.getParameter("desc");
			String rank = request.getParameter("rank");
			String ov = request.getParameter("ov");
			String fer = request.getParameter("fer");
			String dtc = request.getParameter("dtc").replace("-", "/");
			double lat = Double.parseDouble(request.getParameter("lat"));
			double lng = Double.parseDouble(request.getParameter("lng"));
			int zone = Integer.parseInt(request.getParameter("zone"));
			int type = Integer.parseInt(request.getParameter("type"));
			int cre = Integer.parseInt(request.getParameter("cre"));
			boolean week = Boolean.parseBoolean(request.getParameter("week"));
			Monument m = new Monument();
			m.setNom(nom);
			m.setDescription(desc);
			m.setDateCreation(new Date(dtc));
			m.setHeure_open(ov);
			m.setHeure_close(fer);
			m.setRank(rank);
			m.setLatitude(lat);
			m.setLongitude(lng);
			m.setWeek(week);

			Zone z = zoneService.findById(zone);
			Type t = typeService.findById(type);
			Creator c = creatorService.findById(cre);

			m.setCreator(c);
			m.setZone(z);
			m.setType(t);

			service.add(m);
		}
		if (request.getParameter("op").equals("edit")) {
			System.out.println("#Moni "+request.getParameter("op"));
			System.out.println(request);
			String nom = request.getParameter("nom");
			String desc = request.getParameter("desc");
			String rank = request.getParameter("rank");
			String ov = request.getParameter("ov");
			String fer = request.getParameter("fer");
			String dtc = request.getParameter("dtc").replace("-", "/");
			double lat = Double.parseDouble(request.getParameter("lat"));
			double lng = Double.parseDouble(request.getParameter("lng"));
			int zone = Integer.parseInt(request.getParameter("zone"));
			int type = Integer.parseInt(request.getParameter("type"));
			int cre = Integer.parseInt(request.getParameter("cre"));
			boolean week = Boolean.parseBoolean(request.getParameter("week"));
			Monument m = new Monument();
			m.setNom(nom);
			m.setDescription(desc);
			m.setDateCreation(new Date(dtc));
			m.setHeure_open(ov);
			m.setHeure_close(fer);
			m.setRank(rank);
			m.setLatitude(lat);
			m.setLongitude(lng);
			m.setWeek(week);

			Zone z = zoneService.findById(zone);
			Type t = typeService.findById(type);
			Creator c = creatorService.findById(cre);
			int id = Integer.parseInt(request.getParameter("id"));
			m.setCreator(c);
			m.setZone(z);
			m.setType(t);
			m.setId(id);
		
			service.update(m);
		}
		if (request.getParameter("op").equals("del")) {
			int id = Integer.parseInt(request.getParameter("id"));
			service.delete(id);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
