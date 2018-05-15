//package loginController;
import Bean.Item;
import DAO.itemDAO;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
// /import java.utils.*;
public class itemCookie extends HttpServlet
{
	public void doGet(HttpServletRequest req,HttpServletResponse resp) throws IOException,ServletException
	{
		
		Cookie items= new Cookie(req.getParameter("id"),req.getParameter("count"));
		Cookie[] cookies=req.getCookies();
		/*for(int i=0;i<cookies.length;i++)
		{
			if(items.getName().equals(cookies[i].getName()))
				{
					int ct=(Integer.parseInt(items.getValue())+Integer.parseInt(cookies[i].getValue()));
					items.setValue(Integer.toString(ct));
					break;
				}
		}
		*/
		resp.addCookie(items);
		
	}
}