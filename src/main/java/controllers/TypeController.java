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

import ma.monument.metiers.TypeLocal;
import ma.monuments.entities.Type;
import ma.monuments.entities.Ville;

/**
 * Servlet implementation class TypeController
 */
@WebServlet("/TypeController")
public class TypeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@EJB
	TypeLocal service;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TypeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (request.getParameter("op").equals("load")) {
			response.setContentType("application/json");
			List<Type> types = service.findAll();
			Gson json = new Gson();
			response.getWriter().write(json.toJson(types));
		}
		if (request.getParameter("op").equals("add")) {
			String libelle = request.getParameter("libelle");
			Type t = new Type();
			t.setLibelle(libelle);
			service.add(t);
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
