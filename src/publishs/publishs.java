package publishs;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.msit.books.Publishers;
import com.msit.util.SqlHelper;
import com.opensymphony.xwork2.ActionSupport;

public class publishs extends ActionSupport {

	public List<Publishers> selectPu() throws SQLException {
		String sql="SELECT * from publishers";
			return selectAll(sql);
		}

	private List<Publishers> selectAll(String sql) throws SQLException {
		List<Publishers> ss =new ArrayList<Publishers>();
		Connection con = SqlHelper.getConnection();
		Statement stm = con.createStatement();
		ResultSet rs = stm.executeQuery(sql);
		while (rs.next()) {
			Publishers n = new Publishers();
			 n.setId(rs.getInt("Id"));
			 n.setPuName(rs.getString("puName"));
			 ss.add(n);
		}
		stm.close();
		rs.close();
		con.close();
		return ss;
	}

}
