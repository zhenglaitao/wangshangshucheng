package book;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.msit.books.orderbook;
import com.msit.books.users;
import com.msit.util.SqlHelper;
import com.opensymphony.xwork2.ActionSupport;

public class dindan extends ActionSupport{

	// 查询单个 书本信息
		public List<orderbook> selectByNid() throws SQLException {
			String sql = "select * from orderbook";
			return selectAll(sql);
		}

		public orderbook select(String id) throws SQLException{
			orderbook u=null;
			String sql="select * from orderbook where id="+id;
			List<orderbook> ns= selectAll(sql);
			if(null!=ns&&ns.size()>=1){
				u=ns.get(0);
			}
			 return u;
		}
		
		private List<orderbook> selectAll(String sql) throws SQLException {
			List<orderbook> book =new ArrayList<orderbook>();
			Connection con = SqlHelper.getConnection();
			Statement stm = con.createStatement();
			ResultSet rs = stm.executeQuery(sql);
			while (rs.next()) {
				orderbook n = new orderbook();
				n.setId(rs.getInt("id"));
				n.setName(rs.getString("name"));
				n.setShengfen(rs.getString("shengfen"));
				n.setDizhi(rs.getString("dizhi"));
				n.setYoubian(rs.getString("youbian"));
				n.setDianhua(rs.getString("dianhua"));
				n.setShouji(rs.getString("shouji"));
				n.setEmail(rs.getString("email"));
				n.setShijian(rs.getString("shijian"));
				n.setJiage(rs.getString("jiage"));
				// 将新闻对象添加到集合当中
				book.add(n);
			}
			
			rs.close();
			con.close();
			return book;
		}
	
}
