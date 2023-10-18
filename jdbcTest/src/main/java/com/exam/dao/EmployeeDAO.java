package com.exam.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.exam.dto.EmployeeVO;

public class EmployeeDAO {
	private EmployeeDAO() {}
	private static EmployeeDAO instance = new EmployeeDAO();
	public static EmployeeDAO getInstance() {
		return instance;
	}
	
	public Connection getConnection() throws Exception {
		Connection conn = null;
		Context initContext = new InitialContext();
		Context envContext = (Context) initContext.lookup("java:/comp/env");
		DataSource ds = (DataSource) envContext.lookup("jdbc/TestDB");
		conn = ds.getConnection();
		return conn;
	}
	
	public int loginCheck(String id, String pw, String level) {
		int result = -1;
		
		String sql = "select pw, level from employee where id=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString("pw").equals(pw)) {
					if(rs.getString("level").equals(level)) {
						result = 2;
					} else {
						result = 1;
					}
				} else {
					result = 0;
				}
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	public EmployeeVO getEmployee(String id) {
		EmployeeVO eVo = null;
		String sql = "select * from employee where id=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				eVo = new EmployeeVO();
				eVo.setId(rs.getString("id"));
				eVo.setPw(rs.getString("pw"));
				eVo.setName(rs.getString("name"));
				eVo.setLevel(rs.getString("level"));
				eVo.setGender(rs.getString("gender"));
				eVo.setPhone(rs.getString("phone"));
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		return eVo;
	}
}
