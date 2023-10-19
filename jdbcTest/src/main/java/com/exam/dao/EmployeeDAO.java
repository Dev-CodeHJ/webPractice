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
	//입력받은 아이디값과 일치하는 사원이 있다면 사원정보를 불러오는 메서드
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
	//입력받은 사원정보를 db에 등록하는 메서드
	public int registerEmployee(EmployeeVO eVo) {
		int result = -1;
		String sql = "insert into employee(id, pw, name, level, gender, phone) values(?, ?, ?, ?, ?, ?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		if(idCheck(eVo.getId()) == 1) {			//result= 1:성공 0:id중복 -1:insert실패
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, eVo.getId());
				pstmt.setString(2, eVo.getPw());
				pstmt.setString(3, eVo.getName());
				pstmt.setString(4, eVo.getLevel());
				pstmt.setString(5, eVo.getGender());
				pstmt.setString(6, eVo.getPhone());
				result = pstmt.executeUpdate();
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if(pstmt != null) pstmt.close();
					if(conn != null) conn.close();
				} catch(Exception e) {
					e.printStackTrace();
				}
			}
		} else {
			result = idCheck(eVo.getId());
		}
		return result;
	}
	//id중복체크 메서드
	public int idCheck(String id) {
		int result = 0;
		String sql = "select id from employee where id=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(!rs.next()) {
				result = 1;
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
	//회원정보 수정하는 메서드
	public int updateEmployee(EmployeeVO eVo) {
		int result = -1;
		String sql = "update employee set pw=?, name=?, level=?, gender=?, phone=? where id=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, eVo.getPw());
			pstmt.setString(2, eVo.getName());
			pstmt.setString(3, eVo.getLevel());
			pstmt.setString(4, eVo.getGender());
			pstmt.setString(5, eVo.getPhone());
			pstmt.setString(6, eVo.getId());
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn!= null) conn.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
}
