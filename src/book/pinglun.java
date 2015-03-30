package book;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.msit.books.Books;
import com.msit.books.readercomments;
import com.msit.util.SqlHelper;

public class pinglun {
	public List<readercomments> selectpinglun(String nid) throws SQLException {
			String sql="select * from readercomments where BookId="+nid;
			return selectAll(sql);
	}

	//查询全部书本信息
	private List<readercomments> selectAll(String sql) throws SQLException {
		List<readercomments> reader =new ArrayList<readercomments>();
		Connection con = SqlHelper.getConnection();
		Statement stm = con.createStatement();
		ResultSet rs = stm.executeQuery(sql);
		while (rs.next()) {
			readercomments n = new readercomments();
			 n.setId(rs.getInt("Id"));
			 n.setBookId(rs.getInt("BookId"));
			 n.setReaderName(rs.getString("ReaderName"));
			 n.setTitle(rs.getString("Title"));
			 n.setRcomment(rs.getString("rComment"));
			 n.setRdate(rs.getString("rDate"));
			 reader.add(n);
		}
		stm.close();
		rs.close();
		con.close();
		return reader;
	}

		
}
