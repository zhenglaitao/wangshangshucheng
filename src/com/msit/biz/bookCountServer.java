package com.msit.biz;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.msit.books.Books;
import com.msit.books.bookCount;
import com.msit.util.SqlHelper;

public class bookCountServer {

	public int getBookCount() {
		int count = 0;
		String sql = "select count(*) from bookCount";
		// 创建链接
		Connection con = SqlHelper.getConnection();
		try {
			// 创建执行对象
			Statement stm = con.createStatement();
			// 执行得到结果集
			ResultSet rs = stm.executeQuery(sql);
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}
	public List<bookCount> getPageList(int pageSize, int pageIndex) {
		String sql = "SELECT * from bookCount " + "ORDER BY BookID DESC "
				+ "LIMIT " + pageSize * (pageIndex - 1) + "," + pageSize;
		// Limit 开始行,要取得的条数
		System.out.println(sql);
		try {
			return selectAll(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	
	public List<bookCount> selectOrderbooks() throws SQLException {
		String sql = "select * from bookCount";
		return selectAll(sql);
	}

	// 查询方法主体
	private List<bookCount> selectAll(String sql) throws SQLException {
		List<bookCount> book = new ArrayList<bookCount>();
		Connection con = SqlHelper.getConnection();
		Statement stm = con.createStatement();
		ResultSet rs = stm.executeQuery(sql);
		while (rs.next()) {
			bookCount n = new bookCount();
			n.setId(rs.getInt("Id"));
			int ID = rs.getInt("BookID");
			n.setBookID(Refer(ID));
			n.setUsersId(rs.getString("usersId"));
			n.setQuantity(rs.getInt("Quantity"));
			n.setUnitPrice(rs.getString("UnitPrice"));
			book.add(n);
		}
		stm.close();
		rs.close();
		con.close();
		return book;
	}

	private Books Refer(int id) throws SQLException {
		Books n = null;
		String sql = "select * from books where Id=" + id;
		List<Books> ns = selectAll2(sql);
		if (null != ns && ns.size() >= 1) {
			n = ns.get(0);
		}
		return n;
	}

	private List<Books> selectAll2(String sql) throws SQLException {
		List<Books> book = new ArrayList<Books>();
		Connection con = SqlHelper.getConnection();
		Statement stm = con.createStatement();
		ResultSet rs = stm.executeQuery(sql);
		while (rs.next()) {
			Books n = new Books();
			n.setId(rs.getInt("Id"));
			n.setTitle(rs.getString("Title"));
			book.add(n);
		}
		stm.close();
		rs.close();
		con.close();
		return book;
	}
	/**
	 * 分页
	 */

	
}
