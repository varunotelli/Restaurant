package Bean;
public class Item
{
	String name="",category="",details="",type="";
	int price=0,id=0;
	public void setStuff(String n,String c,int p,String d,int i,String t)
	{
		name=n;
		category=c;
		details=d;
		price=p;
		id=i;
		type=t;
	}

	public void setId(int i)
	{
		id=i;
	}
	
	public String getType()
	{
		return type;
	}
	
	public String getName()
	{
		return name;
	}
	public String getCat()
	{
		return category;
	}
	public String getDetails()
	{
		return details;
	}
	public int getPrice()
	{
		return price;
	}

	public int getId()
	{
		return id;
	}


}