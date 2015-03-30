package com.msit.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * 数据库工具类
 * 
 * @author jeson
 */
public class SqlHelper {

	// 连接需要的数据 (这些数据直接写到加密后的数据文件中)
	private static String driverName = "com.mysql.jdbc.Driver";
	private static String url = "jdbc:mysql://127.0.0.1:3306/book";
	private static String user = "root";
	private static String password = "root";

	// 声明静态连接对象
	private static Connection connection = null;

	// 编写静态块（比构造函数还早） 用来加载驱动类
	static {
		try {
			Class.forName(driverName);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}// end

	// 获得连接对象
	public static Connection getConnection() {
		// 创建连接对象
		try {
			connection = DriverManager.getConnection(url, user, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return connection;
	}

	/**
	 * 执行 添加 删除 修改的sql语句
	 * 
	 * @param sql
	 * @return 受影响行数
	 */
	public static int executeNotQuerty(String sql) {
		int num = 0;
		// 1.得到连接对象
		Connection conn = getConnection();
		// 2.创建命令执行对象
		Statement state = null;
		try {
			state = conn.createStatement();
			// 3.执行sql脚本 得到返回值
			num = state.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(null, state, conn);
		}
		return num;
	}

	/**
	 * 关闭资源的方法
	 * @param rs 结果集
	 * @param state 执行对象
	 * @param conn 连接对象
	 */
	public static void close(ResultSet rs, Statement state, Connection conn) {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				System.out.println("关闭结果集异常！！！");
				e.printStackTrace();
			}
		}
		if (state != null) {
			try {
				state.close();
			} catch (SQLException e) {
				System.out.println("关闭执行对象异常！！！");
				e.printStackTrace();
			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				System.out.println("关闭连接对象异常！！！");
				e.printStackTrace();
			}
		}
		rs = null;
		state = null;
		conn = null;
	}// end
	
	/**
	 * 执行查询语句的方法
	 * @param sql
	 * @return 结果集
	 */
	public static ResultSet executeQuery(String sql) {
		ResultSet rs = null;
		// 1.得到连接对象
		Connection conn = getConnection();
		// 2.创建命令对象
		Statement state = null;
		try {
			state = conn.createStatement();
			// 执行查询方法 得到结果集
			rs = state.executeQuery(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 3.关闭资源
			// close(null, state, conn);
		}
		return rs;
	}// end
	
	/**
	 * 执行预编译sql的方法
	 * @param sql
	 * @param pams
	 * @return
	 * @throws SQLException 
	 */
	public static int executePreparedStatement(String sql,String[] pams) throws SQLException {
		int num = 0;
		PreparedStatement pstm = null;
		try {
			// 1.
			pstm = getConnection().prepareStatement(sql);
			// 填充占位符的数据
			for (int i = 1; i < pams.length; i++) {
				pstm.setString(i, pams[i-1]);
			}
			// 执行sql语句
			num = pstm.executeUpdate();// 只能执行非查询语句
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			pstm.close();
			connection.close();
		}
		return num;
	}// end
}