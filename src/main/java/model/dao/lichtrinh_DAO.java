package model.dao;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import model.bean.lichtrinh;
import model.bean.tuyenduong;

public class lichtrinh_DAO {
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	private Connection getConnection() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection("jdbc:mysql://localhost:3307/btap", "root", "");
    }

	// Lấy danh sách tất cả lịch trình
    public ArrayList<lichtrinh> getList() {
        ArrayList<lichtrinh> result = new ArrayList<>();
        Connection cnn = null;
        Statement sm = null;
        ResultSet rs = null;

        try {
            cnn = getConnection();
            sm = cnn.createStatement();
            String sql = "SELECT * FROM lichtrinh";
            rs = sm.executeQuery(sql);
            while (rs.next()) {
            	lichtrinh lichtrinh = new lichtrinh();
            	lichtrinh.set_ma_lich_trinh(rs.getInt(1)) ;
            	lichtrinh.set_ma_tuyen_duong(rs.getInt(2));
            	lichtrinh.set_thoi_gian_xuat_phat(rs.getDate(3));
            	lichtrinh.set_danh_sach_ghe(rs.getString(4));
            	lichtrinh.set_so_ghe_trong(rs.getInt(5));
            	lichtrinh.set_trang_thai(rs.getBoolean(6));
                result.add(lichtrinh);
            }
        } catch (Exception e) {
            System.out.println("Error in getlichtrinhList: " + e.getMessage());
        } finally {
            closeResources(rs, sm, cnn);
        }

        return result;
    }
    
    // Lấy các lịch trình của 1 tuyến đường bằng mã tuyến đường
    public ArrayList<lichtrinh> get_lich_trinh_by_ma_tuyen_duong(int ma_tuyen_duong) {
        ArrayList<lichtrinh> result = new ArrayList<>();
        Connection cnn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            cnn = getConnection();
            String sql = "SELECT * FROM lichtrinh WHERE ma_tuyen_duong = ?";
            ps = cnn.prepareStatement(sql);
            ps.setInt(1, ma_tuyen_duong); 
            rs = ps.executeQuery();

            while (rs.next()) {
                lichtrinh lichtrinh = new lichtrinh();
                lichtrinh.set_ma_lich_trinh(rs.getInt(1)) ;
            	lichtrinh.set_ma_tuyen_duong(rs.getInt(2));
            	lichtrinh.set_thoi_gian_xuat_phat(rs.getDate(3));
            	lichtrinh.set_danh_sach_ghe(rs.getString(4));
            	lichtrinh.set_so_ghe_trong(rs.getInt(5));
            	lichtrinh.set_trang_thai(rs.getBoolean(6));
                result.add(lichtrinh);
            }
        } catch (Exception e) {
            System.out.println("Error in getListNVPB: " + e.getMessage());
        } finally {
            closeResources(rs, ps, cnn);
        }

        return result;
    }
    
    public lichtrinh getLichTrinhById(int maLichTrinh) {
        lichtrinh lichtrinh = null;
        Connection cnn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            cnn = getConnection();
            String query = "SELECT lt.*, td.diem_xuat_phat, td.diem_ket_thuc, td.gia_ve " +
                           "FROM lichtrinh lt " +
                           "JOIN tuyenduong td ON lt.ma_tuyen_duong = td.ma_tuyen_duong " +
                           "WHERE lt.ma_lich_trinh = ?";
            ps = cnn.prepareStatement(query);
            ps.setInt(1, maLichTrinh);
            rs = ps.executeQuery();

            if (rs.next()) {
                lichtrinh = new lichtrinh();
                lichtrinh.set_ma_lich_trinh(rs.getInt("ma_lich_trinh"));
                lichtrinh.set_ma_tuyen_duong(rs.getInt("ma_tuyen_duong"));
                lichtrinh.set_thoi_gian_xuat_phat(rs.getTimestamp("thoi_gian_xuat_phat"));
                lichtrinh.set_danh_sach_ghe(rs.getString("danh_sach_ghe"));
                lichtrinh.set_so_ghe_trong(rs.getInt("so_ghe_trong"));
                lichtrinh.set_trang_thai(rs.getBoolean("trang_thai"));

                // Xử lý thông tin từ bảng tuyenduong (nếu cần sử dụng ở nơi khác)
                String diemXuatPhat = rs.getString("diem_xuat_phat");
                String diemKetThuc = rs.getString("diem_ket_thuc");
                int giaVe = rs.getInt("gia_ve");

              
            }
        } catch (Exception e) {
            System.out.println("Error in getLichTrinhById: " + e.getMessage());
        } finally {
            closeResources(rs, ps, cnn);
        }

        return lichtrinh;
    }

    // Lấy lịch trình với mã lịch trình
    public lichtrinh get_lich_trinh_by_ma_lich_trinh(int id) {
    	lichtrinh lichtrinh = null;
        Connection cnn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            cnn = getConnection();
            String sql = "SELECT * FROM lichtrinh WHERE ma_lich_trinh = ?";
            ps = cnn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {
            	lichtrinh = new lichtrinh();
                lichtrinh.set_ma_lich_trinh(rs.getInt(1)) ;
            	lichtrinh.set_ma_tuyen_duong(rs.getInt(2));
            	lichtrinh.set_thoi_gian_xuat_phat(rs.getDate(3));
            	lichtrinh.set_danh_sach_ghe(rs.getString(4));
            	lichtrinh.set_so_ghe_trong(rs.getInt(5));
            	lichtrinh.set_trang_thai(rs.getBoolean(6));
            }
        } catch (Exception e) {
            System.out.println("Error in getlichtrinhById: " + e.getMessage());
        } finally {
            closeResources(rs, ps, cnn);
        }
        return lichtrinh;
    }
    
    // Thêm lịch trình mới
    public boolean insertlichtrinh(lichtrinh lichtrinh) {
        boolean isInserted = false;
        Connection cnn = null;
        PreparedStatement ps = null;

        try {
            cnn = getConnection();
            String sql = "INSERT INTO  lichtrinh ( ma_tuyen_duong , thoi_gian_xuat_phat, danh_sach_ghe, so_ghe_trong, trang_thai) VALUES (?, ?, ?, ?, ?)";
            ps = cnn.prepareStatement(sql);
            ps.setInt(1, lichtrinh.get_ma_tuyen_duong());
            ps.setDate(2, (java.sql.Date) lichtrinh.get_thoi_gian_xuat_phat());
            ps.setString(3, lichtrinh.get_danh_sach_ghe());
            ps.setInt(4, lichtrinh.get_so_ghe_trong());
            ps.setBoolean(5, lichtrinh.get_trang_thai());

            int rows = ps.executeUpdate();
            isInserted = rows > 0;
        } catch (Exception e) {
            System.out.println("Error in insertlichtrinh: " + e.getMessage());
        } finally {
            closeResources(ps, cnn);
        }

        return isInserted;
    }

    // Cập nhật thời gian xuất phát, số ghế trống, trạng thái của lịch trình
    public boolean updatelichtrinh(lichtrinh updatedlichtrinh) {
        boolean isUpdated = false;
        Connection cnn = null;
        PreparedStatement ps = null;

        try {
            cnn = getConnection();
            String sql = "UPDATE lichtrinh SET thoi_gian_xuat_phat = ?, so_ghe_trong = ?, trang_thai = ? WHERE ma_lich_trinh = ?";
            ps = cnn.prepareStatement(sql);
            ps.setDate(1, (java.sql.Date) updatedlichtrinh.get_thoi_gian_xuat_phat());
            ps.setInt(2, updatedlichtrinh.get_so_ghe_trong());
            ps.setBoolean(3, updatedlichtrinh.get_trang_thai());
            ps.setInt(4, updatedlichtrinh.get_ma_lich_trinh());

            isUpdated = ps.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println("Error in updatelichtrinh: " + e.getMessage());
        } finally {
            closeResources(ps, cnn);
        }

        return isUpdated;
    }
    
    //Tìm kiếm lịch trình theo thời gian xuất phát
    public ArrayList<lichtrinh> searchlichtrinh(String searchOption, Date searchValue) {
        ArrayList<lichtrinh> resultList = new ArrayList<>();
        Connection cnn = null;
        PreparedStatement ps = null;
        String query = "";
        
        switch (searchOption) {
            case "thoi_gian_xuat_phat":
                query = "SELECT * FROM lichtrinh WHERE thoi_gian_xuat_phat LIKE ?";
                break;
            default:
                query = "SELECT * FROM lichtrinh";
                break;
        }
        try {
        	cnn = getConnection();
        	PreparedStatement stmt = cnn.prepareStatement(query) ;
        
            stmt.setDate(1, (java.sql.Date) searchValue );
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                lichtrinh lichtrinh = new lichtrinh();

                lichtrinh.set_ma_lich_trinh(rs.getInt(1)) ;
            	lichtrinh.set_ma_tuyen_duong(rs.getInt(2));
            	lichtrinh.set_thoi_gian_xuat_phat(rs.getDate(3));
            	lichtrinh.set_danh_sach_ghe(rs.getString(4));
            	lichtrinh.set_so_ghe_trong(rs.getInt(5));
            	lichtrinh.set_trang_thai(rs.getBoolean(6));
            	
                resultList.add(lichtrinh);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
			e.printStackTrace();
		}finally {
            closeResources(ps, cnn);
        }
        return resultList;
    }

    private void closeResources(ResultSet rs, Statement sm, Connection cnn) {
        try {
            if (rs != null) rs.close();
            if (sm != null) sm.close();
            if (cnn != null) cnn.close();
        } catch (SQLException e) {
            System.out.println("Error closing resources: " + e.getMessage());
        }
    }

    private void closeResources(Statement sm, Connection cnn) {
        closeResources(null, sm, cnn);
    }
    

}
