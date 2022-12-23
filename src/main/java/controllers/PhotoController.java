package controllers;

import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.google.gson.Gson;

import ma.monument.metiers.MonumentLocal;
import ma.monument.metiers.PhotoLocal;
import ma.monuments.entities.Monument;
import ma.monuments.entities.Photo;

/**
 * Servlet implementation class PhotoController
 */
@WebServlet("/PhotoController")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
		maxFileSize = 1024 * 1024 * 10, // 10 MB
		maxRequestSize = 1024 * 1024 * 100 // 100 MB
)
public class PhotoController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@EJB
	PhotoLocal service;

	@EJB
	MonumentLocal monService;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PhotoController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		if (request.getParameter("op") != null && request.getParameter("op").equals("load")) {
			response.setContentType("application/json");
			List<Photo> fotos = service.findAll();
			Gson json = new Gson();
			response.getWriter().write(json.toJson(fotos));
		}
		if (request.getParameter("op")==null) {
			int monId = Integer.parseInt(request.getParameter("mon"));
			System.out.println("id : "+monId);
			Monument m = monService.findById(monId);
			Part filePart = request.getPart("file");
			String fileName = filePart.getSubmittedFileName();
			String ext = "."; 
			int index = fileName.lastIndexOf('.');
		    if(index > 0) {
		      ext +=fileName.substring(index + 1);
		    }
			String url = "";
			for (Part part : request.getParts()) {
				url = "C:\\upload\\" + UUID.randomUUID() + ext;
				part.write(url);
			}
			Photo f = new Photo();
			f.setUrl(url);
			f.setMonument(m);
			service.add(f);
			response.sendRedirect(request.getContextPath() + "/photos.jsp");
			//response.getWriter().print("The file uploaded sucessfully.");
			
		}
		if (request.getParameter("op") != null && request.getParameter("op").equals("del")) {
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
