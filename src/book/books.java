package book;

import java.awt.print.Book;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.msit.books.Books;
import com.msit.util.SqlHelper;
import com.msit.books.*;

public class books {

	/**
	 * 根据分类 取得分页数据
	 */
	public List<Books> getfenlei(int pageSize, int pageIndex) {
		String sql = "SELECT * from books WHERE CategoryId="
				+ "ORDER BY PublishDate DESC " + "LIMIT " + pageSize
				* (pageIndex - 1) + "," + pageSize;
		// Limit 开始行,要取得的条数
		System.out.println(sql);
		try {
			return selectAll(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}


	// 根据图书编号查询图书
	public Books BookISBN(String isbn) throws SQLException {
		Books n = null;
		String sql = "select * from books where ISBN=" + isbn;
		List<Books> ns = selectAll(sql);
		if (null != ns && ns.size() >= 1) {
			n = ns.get(0);
		}
		return n;
	}

	// 根据分类查询书本信息
	public Books getFenleiByid(String nid) throws SQLException {
		Books n = null;
		String sql = "SELECT * from books WHERE CategoryId=" + nid;
		List<Books> ns = selectAll(sql);
		if (null != ns && ns.size() >= 1) {
			n = ns.get(0);
		}
		return n;
	}
	/**整本
	 * 取得分页数据
	 */
	public List<Books> getPageList(int pageSize,int pageIndex){
		String sql="SELECT * from books " +
				"ORDER BY PublishDate DESC " +
				"LIMIT "+pageSize*(pageIndex-1)+","+pageSize;
		//Limit 开始行,要取得的条数
		System.out.println(sql);
		try {
			return selectAll(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	/**根据分类
	 * 取得分页数据
	 */
	public List<Books> getfenlei(int pageSize,int pageIndex,String nid){
		String sql="SELECT * from books WHERE CategoryId=" +nid+
				" LIMIT "+pageSize*(pageIndex-1)+","+pageSize;
		//Limit 开始行,要取得的条数
		System.out.println(sql);
		try {
			return selectAll(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * 取得表的总数
	 * @return
	 */
	public int getBookCount(){
		int count=0;
		String sql="select count(*) from books";
		//创建链接
		Connection con = SqlHelper.getConnection();
		try {
			//创建执行对象
			Statement stm = con.createStatement();
			//执行得到结果集
			ResultSet rs = stm.executeQuery(sql);
			if(rs.next()){
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}
	
	//根据分类查询
	public int getfenleiCount(int s){
		int count=0;
		String sql="select count(*) from books where CategoryId="+s;
		//创建链接
		Connection con = SqlHelper.getConnection();
		try {
			//创建执行对象
			Statement stm = con.createStatement();
			//执行得到结果集
			ResultSet rs = stm.executeQuery(sql);
			if(rs.next()){
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}
	
	//查询单个 书本信息
	public Books getBookByid(String nid) throws SQLException{
		Books n =null;
		String sql="select * from books where Id="+nid;
		List<Books> ns = selectAll(sql);
		if(null!=ns && ns.size()>=1){
			n = ns.get(0);
		}
		return n;
	}
	
	public List<Books> selectBook() throws SQLException {
		String sql="select * from books  UnitPrice  LIMIT 0,6";
			return selectAll(sql);
		}
	
	public List<Books> selectBook2() throws SQLException {
		String sql="select * from books";
			return selectAll(sql);
		}
	//查询全部书本信息
	private List<Books> selectAll(String sql) throws SQLException {
		List<Books> book =new ArrayList<Books>();
		Connection con = SqlHelper.getConnection();
		Statement stm = con.createStatement();
		ResultSet rs = stm.executeQuery(sql);
		while (rs.next()) {
			Books n = new Books();
			 n.setId(rs.getInt("Id"));
			 n.setTitle(rs.getString("Title"));
			 n.setAuthor(rs.getString("Author"));
			 n.setPublisherId(rs.getInt("PublisherId"));
			 n.setPublishDate(rs.getString("PublishDate"));
			 n.setIsbn(rs.getString("ISBN"));
			 n.setWordsCount(rs.getInt("WordsCount"));
			 n.setUnitPrice(rs.getInt("UnitPrice"));
			 n.setContentDescription(rs.getString("ContentDescription"));
			 n.setAurhorDescription(rs.getString("AurhorDescription"));
			 n.setEditorComment(rs.getString("EditorComment"));
			 n.setToc(rs.getString("TOC"));
			 int categoryId = rs.getInt("categoryId");
				Categories c = null;
				c = categories(categoryId);
				n.setCategoryId(c);
			 n.setClicks(rs.getInt("Clicks"));
			 n.setNowRead(rs.getInt("NowRead"));
			 n.setOllRead(rs.getInt("ollRead"));
			 book.add(n);
		}
		stm.close();
		rs.close();
		con.close();
		return book;
	}
	public Categories categories(int categoryId) throws SQLException {
		Categories n = null;
		String sql = "select * from categories where Id=" + categoryId;
		List<Categories> ns = selectAll3(sql);
		if (null != ns && ns.size() >= 1) {
			n = ns.get(0);
		}
		return n;
	}

	private List<Categories> selectAll3(String sql) throws SQLException {
		List<Categories> ss = new ArrayList<Categories>();
		Connection con = SqlHelper.getConnection();
		Statement stm = con.createStatement();
		ResultSet rs = stm.executeQuery(sql);
		while (rs.next()) {
			Categories n = new Categories();
			n.setId(rs.getInt("Id"));
			n.setCname(rs.getString("cname"));
			ss.add(n);
		}
		return ss;
	}

		
}
