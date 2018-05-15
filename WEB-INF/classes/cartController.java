//package loginController;
import Bean.Item;
import DAO.itemDAO;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class cartController extends HttpServlet
{
	public void doGet(HttpServletRequest req,HttpServletResponse resp) throws IOException,ServletException
	{
		resp.setContentType("text/html");
		PrintWriter out=resp.getWriter();
		Cookie[] cookies=req.getCookies();
		//String c=req.getParameter("id");
		String cat="";
		//out.println("length="+cookies.length);
		
		Item[] I=new Item[cookies.length];

		for(int i=0;i<cookies.length;i++)
			I[i]=new Item();
		//u.setN(n);
		itemDAO d=new itemDAO();
		for(int i=1;i<cookies.length;i++)
		{
			//out.println(cookies[i].getName());
			//out.println(cookies[i].getValue());
			I[i].setId(Integer.parseInt(cookies[i].getName()));
			d.getCart(I[i]);
		}
		//out.println(c);
		int sum=0;
		//for(int i=1;i<cookies.length;i++)
		//	sum+=Integer.parseInt(cookies[i].getValue())*I[i].getPrice();
		String color="";
		
		//	out.println(I[0].getName());
		
		for(int i=1;i<cookies.length;i++)
			{//out.println("<div class='products'><div class='col-lg-6'><div class='name col-lg-12'>"+I[i].getName()+"</div><div class='details col-lg-12'>"+I[i].getDetails()+"</div></div><div class='col-lg-3'>"+I[i].getPrice()+"</div></div>");
			//out.println("<div class='products col-lg-12'><div class='col-lg-6' style='cl;'>"+"<div class='col-lg-12'>"+I[i].getName()+"</div><div class='col-lg-12'>"+I[i].getDetails()+"</div></div>");
			//out.println("<div class='col-lg-3' style='float:right'>Rs."+I[i].getPrice()+"</div></div><br><br>");
			String name=I[i].getName();
			if(I[i].getType().equals("V"));
				color="green";
			if(I[i].getType().equals("NV"))
				color="red";
			sum+=Integer.parseInt(cookies[i].getValue())*I[i].getPrice();
			req.getRequestDispatcher("cartstuff.jsp?name="+name
				+"&price="+I[i].getPrice()
				+"&type="+I[i].getType()
				+"&quant="+cookies[i].getValue()
				+"&sum="+sum
				+"&id="+I[i].getId()
				+"&col="+color
				).include(req,resp);
			sum=0;
			}
		
			//out.println(f);-
	//		req.getRequestDispatcher("items.jsp").forward(req,resp);
		
	}
}