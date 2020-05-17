package pr;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class paperreview {

	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
		CreateTable();
		post();
		get();
		
	}
			public static ArrayList<String> get() throws Exception{
				try {
					Connection conn = getConnection();
					PreparedStatement statement = conn.prepareStatement("SELECT first,last FROM tre LIMIT 1");
					
					ResultSet result = statement.executeQuery();
				
					ArrayList<String> array = new ArrayList<String>();
					while(result.next()) {
						System.out.print(result.getString("first"));
						System.out.print(" ");
						System.out.println(result.getString("last"));
						
						array.add(result.getString("last"));
						
					}
					System.out.println("All records have been selected!");
					return array;
					
				}catch(Exception e) {System.out.println(e);} 
				return null;
				
			}
	
		public static void post() throws Exception{
			 final String var1="john";
			 final String var2="Miller";
			 try {
				 Connection conn = getConnection();
				 PreparedStatement posted = conn.prepareStatement("INSERT INTO tre(first,last) VALUES('"+var1+"', '"+var2+"')");
				 
				 posted.executeUpdate();
			 }catch(Exception e) {System.out.println(e);}
			 finally {
				 System.out.println("Insert completed.");
			 }
					
		}
 		public static void CreateTable() throws Exception{
			try {
				Connection conn = getConnection();
				PreparedStatement Create = conn.prepareStatement("CREATE TABLE IF NOT EXISTS tre(id int NOT NULL AUTO_INCREMENT, first varchar(20), last varchar(20), PRIMARY KEY(id))");
				Create.executeUpdate();				
			}catch(Exception e) {System.out.println(e);}
			finally {System.out.println("Function complete.");}
			
		}
	
		public static Connection getConnection() throws Exception{
			try {
				String driver = "com.mysql.jdbc.Driver";
				String url = "jdbc:mysql://localhost:3306/assignment?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
				String username = "root";
				String password = "swift#55";
				Class.forName(driver);
				
				Connection conn = DriverManager.getConnection(url,username,password);
				System.out.println("Connected");
				return conn;
			} catch(Exception e) {System.out.println(e);}
			
			
			return null;
			
		}
 }

