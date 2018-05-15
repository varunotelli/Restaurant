//package loginController;
import Bean.Item;
import DAO.itemDAO;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class itemController extends HttpServlet
{
	public void doGet(HttpServletRequest req,HttpServletResponse resp) throws IOException,ServletException
	{
		resp.setContentType("text/html");
		PrintWriter out=resp.getWriter();
		String c=req.getParameter("val");
		String t=req.getParameter("type");
		String cat="";
		//out.println(c);
		
		Item[] I=new Item[10];

		for(int i=0;i<10;i++)
			I[i]=new Item();
		//u.setN(n);
		
		//out.println(c);
		itemDAO d=new itemDAO();
		int n=d.auth(I,c,t);
		
		
			//out.println(I[0].getName());
		for(int i=0;i<n;i++)
			{//out.println("<div class='products'><div class='col-lg-6'><div class='name col-lg-12'>"+I[i].getName()+"</div><div class='details col-lg-12'>"+I[i].getDetails()+"</div></div><div class='col-lg-3'>"+I[i].getPrice()+"</div></div>");
			//out.println("<div class='products col-lg-12'><div class='col-lg-6' style='cl;'>"+"<div class='col-lg-12'>"+I[i].getName()+"</div><div class='col-lg-12'>"+I[i].getDetails()+"</div></div>");
			//out.println("<div class='col-lg-3' style='float:right'>Rs."+I[i].getPrice()+"</div></div><br><br>");
			String name=I[i].getName();

			req.getRequestDispatcher("items.jsp?name="+name
				+"&details="+I[i].getDetails()
				+"&price="+I[i].getPrice()
				+"&id="+I[i].getId()
				+"&index="+i	
				).include(req,resp);
			}
			//out.println(f);-
	//		req.getRequestDispatcher("items.jsp").forward(req,resp);
		
	}
}