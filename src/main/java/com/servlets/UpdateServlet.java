package com.servlets;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.FactoryProvider;


public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
     
    public UpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
			String noteid=request.getParameter("note_id".trim());
			int id=Integer.parseInt(noteid);
			String title=request.getParameter("title");
			String content=request.getParameter("content");
			
			
			SessionFactory factory=FactoryProvider.getSessionFactory();
			
			Session s=factory.openSession();
			Note note=s.get(Note.class, id);
			
			
			Transaction tx=s.beginTransaction();
			 note.setTitle(title);
			 note.setContent(content);
			 note.setAddDate(new Date());
			 tx.commit();
			 s.close();
			 
			 response.sendRedirect("allnotes.jsp");
			 
			
			
			
			
	}

}
