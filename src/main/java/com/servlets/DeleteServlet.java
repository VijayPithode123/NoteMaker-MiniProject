package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.FactoryProvider;


public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public DeleteServlet() {
        super();
        
    }

	 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		PrintWriter out=response.getWriter();
		
		
		
					String Note_Id=request.getParameter("note_id").trim();
				int  id=Integer.parseInt(Note_Id);
				
				 
				SessionFactory factory=FactoryProvider.getSessionFactory();
				Session session=factory.openSession();
				
//				Permanantly change database Transaction
				
				Transaction tx=session.beginTransaction();
				
				Note note=(Note)session.get(Note.class, id);
				session.delete(note);
				tx.commit();
				session.close();
				
				response.sendRedirect("allnotes.jsp");
				
				
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
