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
import ma.monuments.entities.Creator;


/**
 * Servlet implementation class CreatorController
 */
@WebServlet("/CreatorController")
public class CreatorController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@EJB
	CreatorLocal service;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CreatorController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getParameter("op").equals("load")) {
			response.setContentType("application/json");
			List<Creator> crs = service.findAll();
			Gson json = new Gson();
			response.getWriter().write(json.toJson(crs));
		}
		if (request.getParameter("op").equals("add")) {
			String nom = request.getParameter("nom");
			String desc = request.getParameter("desc");
			String db = request.getParameter("db").replace("-", "/");
			String df = request.getParameter("df").replace("-", "/");
			Creator c = new Creator();
			c.setDateDebut(new Date(db));
			c.setDateFin(new Date(df));
			c.setDescription(desc);
			c.setNom(nom);
			service.add(c);
		}
		if (request.getParameter("op").equals("edit")) {
			String nom = request.getParameter("nom");
			String desc = request.getParameter("desc");
			String db = request.getParameter("db").replace("-", "/");
			String df = request.getParameter("df").replace("-", "/");
			int id = Integer.parseInt(request.getParameter("id"));
			Creator c = new Creator();
			c.setDateDebut(new Date(db));
			c.setDateFin(new Date(df));
			c.setDescription(desc);
			c.setNom(nom);
			c.setId(id);
			service.update(c);
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
