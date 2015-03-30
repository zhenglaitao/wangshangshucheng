package com.msit.biz;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.msit.books.userroles;
import com.msit.util.SqlHelper;

public class UserRoles {

	public List<userroles> userrolesselect() throws SQLException {
		String sql="select * from userroles";
			return selectAll(sql);
		}
	//查询全部书本信息
	private List<userroles> selectAll(String sql) throws SQLException {
		List<userroles> book =new ArrayList<userroles>();
		Connection con = SqlHelper.getConnection();
		Statement stm = con.createStatement();
		ResultSet rs = stm.executeQuery(sql);
		while (rs.next()) {
			userroles n = new userroles();
		     n.setId(rs.getInt("Id"));
		     n.setName(rs.getString("Name"));
			 book.add(n);
		}
		stm.close();
		rs.close();
		con.close();
		return book;
	}
}
