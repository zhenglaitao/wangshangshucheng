package book;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.msit.books.Gouwuche;
import com.msit.util.SqlHelper;

public class gouwuche {
	// 查询购物车所有信息

	// 查询单个 书本信息
	public List<Gouwuche> selectByNid() throws SQLException {
		String sql = "select * from gouwuche";
		return selectAll(sql);
	}

	private List<Gouwuche> selectAll(String sql) throws SQLException {
		List<Gouwuche> book =new ArrayList<Gouwuche>();
		Connection con = SqlHelper.getConnection();
		Statement stm = con.createStatement();
		ResultSet rs = stm.executeQuery(sql);
		while (rs.next()) {
			Gouwuche n = new Gouwuche();
			n.setId(rs.getInt("id"));
			n.setBookname(rs.getString("Bookname"));
			n.setBookbianhao(rs.getString("bookbianhao"));
			n.setZuozhe(rs.getString("zuozhe"));
			n.setJiage(rs.getInt("jiage"));
			n.setShuliang(rs.getInt("shuliang"));
			// 将新闻对象添加到集合当中
			book.add(n);
		}
		
		rs.close();
		con.close();
		return book;
	}

	// 删除指定购物车信息
	public int deletegouwuche(String tid) throws SQLException {
		int num=0;
		String sql ="DELETE from gouwuche WHERE id="+tid;
		Connection con = SqlHelper.getConnection();
		Statement stm = con.createStatement();
		num = stm.executeUpdate(sql);
		return num;
	}
	//删除全部购物车信息
	public int deletegouwucheQU() throws SQLException {
		int num=0;
		String sql ="DELETE from gouwuche";
		Connection con = SqlHelper.getConnection();
		Statement stm = con.createStatement();
		num = stm.executeUpdate(sql);
		return num;
	}
	
	//添加购物车信息
	public int addGouwuche(Gouwuche gouwuche) throws SQLException {
		int num=0;
		//1.创建 添加的sql语句
		String sql="insert into gouwuche(id,Bookname,bookbianhao,zuozhe,jiage,shuliang) values(?,?,?,?,?,?)";
		//2.得到链接对象
		Connection conn = SqlHelper.getConnection();
		try {
			//3.创建预编译执行对象
			PreparedStatement pstmt = conn.prepareStatement(sql);
		    //4.给预编译sql设置数据
			pstmt.setString(1, gouwuche.getId()+"");
			pstmt.setString(2, gouwuche.getBookname());
			pstmt.setString(3, gouwuche.getBookbianhao());
			pstmt.setString(4, gouwuche.getZuozhe());
			pstmt.setInt(5, gouwuche.getJiage());
			pstmt.setInt(6, gouwuche.getShuliang());
			//5.执行预编译语句
			num=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			//6.关闭资源
			conn.close();
		}
		return num;
	}
}
