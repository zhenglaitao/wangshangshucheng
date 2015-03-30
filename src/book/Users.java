package book;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.msit.books.users;
import com.msit.util.SqlHelper;
import com.msit.books.*;
public class Users {
	/**
	 * 根据ID查询其他
	 * @return
	 * @throws SQLException
	 */
	public users select(String id) throws SQLException{
		users u=null;
		String sql="select * from users where id="+id;
		List<users> ns= selectAll(sql);
		if(null!=ns&&ns.size()>=1){
			u=ns.get(0);
		}
		 return u;
	}
	
	/*
	 * 查询所有评论数据
	 */
	public List<users> selectUsers() throws SQLException{
		String sql="select * from users";
		return selectAll(sql);
	
	}
	
	//查询主体
		private List<users> selectAll(String sql) throws SQLException {
			List<users> news=new ArrayList<users>();
			Connection conn=SqlHelper.getConnection();
			Statement stm=conn.createStatement();
			ResultSet rs=stm.executeQuery(sql);
			while(rs.next()){
				users n=new users();
				n.setId(rs.getInt("Id"));
				n.setLoginId(rs.getString("LoginId"));
				n.setLoginPwd(rs.getString("LoginPwd"));
				n.setuName(rs.getString("uName"));
				n.setAddress(rs.getString("Address"));
				n.setPhone(rs.getString("Phone"));
				n.setMail(rs.getString("Mail"));
				int user=rs.getInt("UserRoleId");
				n.setUserRoleId(userroles1(user));
				news.add(n);	
			}
			rs.close();
			conn.close();
			return news;
		}
		 private userroles userroles1(int user) throws SQLException {
			 userroles n = null;
				String sql = "select * from userroles where Id=" + user;
				List<userroles> ns = selectAll3(sql);
				if (null != ns && ns.size() >= 1) {
					n = ns.get(0);
				}
				return n;
		}
		 private List<userroles> selectAll3(String sql) throws SQLException {
				List<userroles> ss = new ArrayList<userroles>();
				Connection con = SqlHelper.getConnection();
				Statement stm = con.createStatement();
				ResultSet rs = stm.executeQuery(sql);
				while (rs.next()) {
					userroles n = new userroles();
					n.setId(rs.getInt("Id"));
					n.setName(rs.getString("Name"));
					ss.add(n);
				}
				return ss;
			}
	
	 //注册
	   public int addComment(users user) throws SQLException{
		   int num = 0;
		   String sql="insert into users(Id,LoginId,LoginPwd,uName,Address,Phone,Mail,UserRoleId,UserStateId) " +
		   		"values(Id,?,?,?,?,?,?,1,1)";
		   Connection con= SqlHelper.getConnection();
		   try {
			PreparedStatement pstm = con.prepareStatement(sql);
			//给预编译 设置数据
			pstm.setInt(1,user.getId());
			pstm.setString(2, user.getLoginId());
			pstm.setString(3, user.getLoginPwd());
			pstm.setString(4, user.getuName());
			pstm.setString(5, user.getAddress());
			pstm.setString(6,user.getPhone());
			pstm.setString(7,user.getMail());
			pstm.setInt(9,user.getUserStateId());
			//执行
			num = pstm.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			con.close();
		}
		 return num;
	   }
}
