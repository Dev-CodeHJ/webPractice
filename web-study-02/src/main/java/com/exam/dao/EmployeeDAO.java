package com.exam.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.exam.dto.EmployeeVO;

import util.DBManager;

public class EmployeeDAO {
	private EmployeeDAO() {}
	private static EmployeeDAO instance = new EmployeeDAO();
	public static EmployeeDAO getInstance() {
		return instance;
	}
	//모든 사원 리스트를 불러오는 메소드
	public List<EmployeeVO> findAll() {
		String sql = "select * from employee";
		List<EmployeeVO> list = new ArrayList<EmployeeVO>();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				EmployeeVO eVo = new EmployeeVO();
				eVo.setId(rs.getString("id"));
				eVo.setName(rs.getString("name"));
				eVo.setLevel(rs.getString("level"));
				eVo.setGender(rs.getString("gender"));
				eVo.setPhone(rs.getString("phone"));
				list.add(eVo);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, stmt, rs);
		}
		return list;
	}
	//사원을 등록하는 메소드
	public void insertEmployee(EmployeeVO eVo) {
		String sql = "insert into employee values(?, ?, ?, ?, null, ?, ?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, eVo.getId());
			pstmt.setString(2, eVo.getPw());
			pstmt.setString(3, eVo.getName());
			pstmt.setString(4, eVo.getLevel());
			pstmt.setString(5, eVo.getGender());
			pstmt.setString(6, eVo.getPhone());
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}
	//id값을 받아서 해당 id와 일치하는 사원의 정보를 가져오는 메소드
	public EmployeeVO findById(String id) {
		String sql = "select * from employee where id=?";
		EmployeeVO eVo = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getConnection();
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
				eVo.setEnter(rs.getTimestamp("enter"));
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return eVo;
	}
	//사원 정보를 수정하는 메소드
	public void updateEmployee(EmployeeVO eVo) {
		String sql = "update employee set pw=?, name=?, level=?, gender=?, phone=? where id=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, eVo.getPw());
			pstmt.setString(2, eVo.getName());
			pstmt.setString(3, eVo.getLevel());
			pstmt.setString(4, eVo.getGender());
			pstmt.setString(5, eVo.getPhone());
			pstmt.setString(6, eVo.getId());
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}
	//사원 정보를 삭제하는 메소드
	public void deleteEmployee(String id) {
		String sql = "delete from employee where id=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}
}
