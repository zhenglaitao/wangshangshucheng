package categories;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.msit.books.Books;
import com.msit.books.Categories;
import com.msit.util.SqlHelper;
import com.opensymphony.xwork2.ActionSupport;

public class categories extends ActionSupport {

public List<Categories> selectBook2() throws SQLException {
	String sql="SELECT * from categories ";
		return selectAll(sql);
	}

private List<Categories> selectAll(String sql) throws SQLException {
	List<Categories> ss =new ArrayList<Categories>();
	Connection con = SqlHelper.getConnection();
	Statement stm = con.createStatement();
	ResultSet rs = stm.executeQuery(sql);
	while (rs.next()) {
		Categories n = new Categories();
		 n.setId(rs.getInt("Id"));
		 n.setCname(rs.getString("cname"));
		 ss.add(n);
	}
	stm.close();
	rs.close();
	con.close();
	return ss;
}

}
