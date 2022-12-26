package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebListener;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.FactoryProvider;

 
public class SaveNoteServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doGet(req, resp);
	}




	private static final long serialVersionUID = 1L;
       
   
    public SaveNoteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 
		try
		{
			String Title=request.getParameter("title");
			String Content=request.getParameter("content");
			
			Note note=new Note(Title, Content, new Date());
			
		//	System.out.println("Id:"+note.getId() +"  "+note.getTitle()+" " +note.getContent()+" "+note.getAddDate());
			
		SessionFactory	factory=FactoryProvider.getSessionFactory();
				Session session=factory.openSession();
				//data can be save physically begin transaction.
				Transaction tx=session.beginTransaction();
				session.save(note);
				tx.commit();
				session.close();
				
				response.setContentType("text/html");
				PrintWriter out=response.getWriter();
				out.println("<h1 style='text-align:center;'>Your Note is Successfully added </h1>");
				out.println("<h1 style='text-align:center;'><a href='allnotes.jsp'>View All Notes</h1>");
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		
	}

}
