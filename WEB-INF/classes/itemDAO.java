package DAO;
import Bean.Item;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class itemDAO
{
	public int auth(Item[] I,String cat,String t)
	{
		int n=0;
		try
		{
		final String USER="root";
		final String PASS="varun";
		final String JDBC_DRIVER="com.mysql.jdbc.Driver";
		final String DB_URL="jdbc:mysql://localhost:3306/test";
		//PrintWriter out
		
		//return uname+" "+upass;
		Class.forName(JDBC_DRIVER);
		Connection conn=null;
		Statement stmt=null;
		conn=DriverManager.getConnection(DB_URL,USER,PASS);
		stmt=conn.createStatement();
		String sql="Select * from items where category='"+cat+"' and type='"+t+"'";
		ResultSet rs=stmt.executeQuery(sql);
		
		while(rs.next())
		{
			I[n].setStuff(rs.getString("name"),rs.getString("category"),rs.getInt("price"),rs.getString("details"),
				rs.getInt("id"),rs.getString("type"));


			n++;
		}
		rs.close();
		stmt.close();
		conn.close();
		return n;
		}
		catch(Exception e){System.out.println(e);}
		return 0;
	}
	public int getCart(Item I)
	{
		int n=0;
		try
		{
		final String USER="root";
		final String PASS="varun";
		final String JDBC_DRIVER="com.mysql.jdbc.Driver";
		final String DB_URL="jdbc:mysql://localhost:3306/test";
		//PrintWriter out
		
		//return uname+" "+upass;
		Class.forName(JDBC_DRIVER);
		Connection conn=null;
		Statement stmt=null;
		conn=DriverManager.getConnection(DB_URL,USER,PASS);
		stmt=conn.createStatement();
		String sql="Select * from items where id='"+I.getId()+"'";
		ResultSet rs=stmt.executeQuery(sql);
		
		while(rs.next())
		{
			I.setStuff(rs.getString("name"),rs.getString("category"),rs.getInt("price"),rs.getString("details"),
				rs.getInt("id"),rs.getString("type"));

			//n++;
		}
		rs.close();
		stmt.close();
		conn.close();
		//return n;
		}
		catch(Exception e){System.out.println(e);}
		return 0;
	}
}