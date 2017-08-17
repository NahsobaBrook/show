package dao;


import java.lang.reflect.Field;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * 
 * @description 用来实现基础的数据访问操作
 * @classname BaseDao
 * @author 
 * @version 1.0
 * @date 2017年6月26日 上午11:55:47
 * @copyright 
 *
 */
public class BaseDao {


	private static String driver ="com.mysql.jdbc.Driver";
	private static String url = "jdbc:mysql://localhost/luntan";
	private static String user = "root";
	private static String password = "liruihao";

//	 static {
//	 Properties prop = new Properties();
//	 try {
//	 prop.load(ClassLoader.getSystemResourceAsStream("jdbc.properties"));
//	 db = prop.getProperty("db");
//	 driver = prop.getProperty(db + "_driver");
//	 url = prop.getProperty(db + "_url");
//	 user = prop.getProperty(db + "_user");
//	 password = prop.getProperty(db + "_password");
//	 } catch (IOException e) {
//	 e.printStackTrace();
//	 }
//	 }
	

//	public static void init(Properties prop) {
//			db = prop.getProperty("db");
//			driver = prop.getProperty(db + "_driver");
//			url = prop.getProperty(db + "_url");
//			user = prop.getProperty(db + "_user");
//			password = prop.getProperty(db + "_password");
//	}

	/**
	 * 获得数据库的连接对象 - Connection
	 * 
	 * @return 返回连接对象，如果失败返回null
	 */
	public static Connection getConnection() {
		try {
			// 加载驱动
			Class.forName(driver);
			
			// 获取Connection对象
			return DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 用来执行数据库的增加、删除、修改
	 * 
	 * @param sql
	 *            需要执行的SQL语句，其中参数使用?
	 * @param params
	 *            SQL语句中?对应的参数
	 * @return 返回受影响的行数，如果出现异常返回-1
	 */
	public static int executeUpdate(String sql, Object... params) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			// 得到连接对象
			conn = getConnection();
			// 根据SQL语句创建PreparedStatement对象
			
			pstmt = conn.prepareStatement(sql);
			// 设置参数
			if (params != null) {
				for (int i = 0; i < params.length; i++) {
					pstmt.setObject(i + 1, params[i]);
					
				}
			}
			// 执行语句得到结果
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 释放资源
			closeAll(null, pstmt, conn);
		}
		return -1;
	}

	/**
	 * 执行数据库的查询操作
	 * 
	 * @param sql
	 *            需要执行的SQL语句，其中参数使用?
	 * @param params
	 *            SQL语句中?所需的参数
	 * @return 执行成功返回List对象,出现异常返回null同时自动释放资源
	 */
	public static List<Map<String, Object>> executeQuery(String sql, Object... params) {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			// 得到连接对象
			conn = getConnection();
			// 根据SQL语句创建PreparedStatement对象
			pstmt = conn.prepareStatement(sql);
			// 设置参数
			if (params != null) {
				for (int i = 0; i < params.length; i++) {
					pstmt.setObject(i + 1, params[i]);
				}
			}
			// 执行语句并得到结果集
			rs = pstmt.executeQuery();

			ResultSetMetaData metaData = rs.getMetaData();
			
			String[] colNames = new String[metaData.getColumnCount()];
			
			
			for (int i = 0; i < colNames.length; i++) {
				colNames[i] = metaData.getColumnLabel(i + 1);
			}
			// 执行语句得到结果
			while (rs.next()) {
				Map<String, Object> obj = new HashMap<String, Object>();
				for (String key : colNames) {
					obj.put(key, rs.getObject(key));
				}
				// 把读取的一行数据添加到list集合中
				list.add(obj);
			}

			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 释放资源
			closeAll(rs, pstmt, conn);
		}
		return null;
	}

	public static List<? extends Object> executeQuery(Class clazz, String sql, Object... params) {
		List list = new ArrayList();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			if (params != null) {
				for (int i = 0; i < params.length; i++) {
					pstmt.setObject(i + 1, params[i]);
				}
			}
			rs = pstmt.executeQuery();
			// 得到查询的结果集中列名
			ResultSetMetaData metaData = rs.getMetaData();
			String[] colNames = new String[metaData.getColumnCount()];
			for (int i = 0; i < colNames.length; i++) {
				colNames[i] = metaData.getColumnLabel(i + 1);
			}

			while (rs.next()) {
				Object obj = clazz.newInstance();
				for (String colName : colNames) {
					setValue(obj, colName, rs.getObject(colName));
				}
				list.add(obj);
			}
			
				return list;
			

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(rs, pstmt, conn);
		}
		return null;
	}

	public static List<? extends Object> executeQuery(String className, String sql, Object... params) {
		try {
			return executeQuery(Class.forName(className), sql, params);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 释放数据库操作使用的资源
	 * 
	 * @param rs
	 *            需要关闭的结果集对象 - ResultSet
	 * @param stmt
	 *            需要关闭执行SQL语句的对象 - Statement
	 * @param conn
	 *            需要关闭的数据库连接对象 - Connection
	 */
	public static void closeAll(ResultSet rs, Statement stmt, Connection conn) {
		try {
			if (rs != null) {
				rs.close();
			}
			if (stmt != null) {
				stmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	private static void setValue(Object obj, String propName, Object value) {
		try {
			Class objClass = obj.getClass();
			Field field = objClass.getDeclaredField(propName);
			field.setAccessible(true);
			field.set(obj, value);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
