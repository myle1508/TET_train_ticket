package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import model.bean.ve;

public class ve_DAO {
	private Connection getConnection() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection("jdbc:mysql://localhost:3307/btap", "root", "");
    }
	
	// Lấy danh sách tất cả các vé
    public ArrayList<ve> getList() {
        ArrayList<ve> result = new ArrayList<>();
        Connection cnn = null;
        Statement sm = null;
        ResultSet rs = null;

        try {
            cnn = getConnection();
            sm = cnn.createStatement();
            String sql = "SELECT * FROM ve";
            rs = sm.executeQuery(sql);
            while (rs.next()) {
            	ve ve = new ve();
            	ve.set_ma_ve(rs.getInt(1));
            	ve.set_ma_nguoi_dung(rs.getInt(2));
            	ve.set_ma_lich_trinh(rs.getInt(3));
            	ve.set_so_ghe(rs.getInt(4));
            	ve.set_trang_thai(rs.getBoolean(5));
                result.add(ve);
            }
        } catch (Exception e) {
            System.out.println("Error in getveList: " + e.getMessage());
        } finally {
            closeResources(rs, sm, cnn);
        }

        return result;
    }

    // Thêm vé mới khi người mua đặt vé nè
    public boolean insertve(ve ve) {
        boolean isInserted = false;
        Connection cnn = null;
        PreparedStatement ps = null;

        try {
            cnn = getConnection();
            String sql = "INSERT INTO  ve (ma_nguoi_dung, ma_lich_trinh , so_ghe, trang_thai) VALUES (?, ?, ?, ?)";
            ps = cnn.prepareStatement(sql);
            ps.setInt(1, ve.get_ma_nguoi_dung());
            ps.setInt(2, ve.get_ma_lich_trinh());
            ps.setInt(3, ve.get_so_ghe());
            ps.setBoolean(4, ve.get_trang_thai());

            int rows = ps.executeUpdate();
            isInserted = rows > 0;
        } catch (Exception e) {
            System.out.println("Error in insertve: " + e.getMessage());
        } finally {
            closeResources(ps, cnn);
        }

        return isInserted;
    }

    // Lấy vé với mã vé
    public ve get_ve_By_ma_ve(int id) {
    	ve ve = null;
        Connection cnn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            cnn = getConnection();
            String sql = "SELECT * FROM ve WHERE ma_ve = ?";
            ps = cnn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {
            	ve = new ve();
                ve.set_ma_ve(rs.getInt(1));
            	ve.set_ma_nguoi_dung(rs.getInt(2));
            	ve.set_ma_lich_trinh(rs.getInt(3));
            	ve.set_so_ghe(rs.getInt(4));
            	ve.set_trang_thai(rs.getBoolean(5));
            }
        } catch (Exception e) {
            System.out.println("Error in getveById: " + e.getMessage());
        } finally {
            closeResources(rs, ps, cnn);
        }
        return ve;
    }
    
    // Lấy vé với mã người mua nha -> Xem tất cả các vé của 1 người dùng đã mua
    public ve get_ve_By_ma_nguoi_dung(int id) {
    	ve ve = null;
        Connection cnn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            cnn = getConnection();
            String sql = "SELECT * FROM ve WHERE ma_nguoi_dung = ?";
            ps = cnn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {
            	ve = new ve();
                ve.set_ma_ve(rs.getInt(1));
            	ve.set_ma_nguoi_dung(rs.getInt(2));
            	ve.set_ma_lich_trinh(rs.getInt(3));
            	ve.set_so_ghe(rs.getInt(4));
            	ve.set_trang_thai(rs.getBoolean(5));
            }
        } catch (Exception e) {
            System.out.println("Error in getveById: " + e.getMessage());
        } finally {
            closeResources(rs, ps, cnn);
        }
        return ve;
    }
    
    // Lấy vé với mã lịch trình -> Xem tất cả các vé có cùng lịch trình
    public ve get_ve_By_ma_lich_trinh(int id) {
    	ve ve = null;
        Connection cnn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            cnn = getConnection();
            String sql = "SELECT * FROM ve WHERE ma_lich_trinh = ?";
            ps = cnn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {
            	ve = new ve();
                ve.set_ma_ve(rs.getInt(1));
            	ve.set_ma_nguoi_dung(rs.getInt(2));
            	ve.set_ma_lich_trinh(rs.getInt(3));
            	ve.set_so_ghe(rs.getInt(4));
            	ve.set_trang_thai(rs.getBoolean(5));
            }
        } catch (Exception e) {
            System.out.println("Error in getveById: " + e.getMessage());
        } finally {
            closeResources(rs, ps, cnn);
        }
        return ve;
    }

    // Này là update vé về trạng thái khi mà bị hủy hay chi đó chớ không cần xóa cũng được nha
    public boolean updateve(ve updatedve) {
        boolean isUpdated = false;
        Connection cnn = null;
        PreparedStatement ps = null;

        try {
            cnn = getConnection();
            String sql = "UPDATE ve SET trang_thai = ? WHERE ma_ve = ?";
            ps = cnn.prepareStatement(sql);
            ps.setBoolean(1, updatedve.get_trang_thai());
            ps.setInt(2, updatedve.get_ma_ve());          

            isUpdated = ps.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println("Error in updateve: " + e.getMessage());
        } finally {
            closeResources(ps, cnn);
        }

        return isUpdated;
    }
    
    // Xóa luôn vé nè   
    public boolean deleteve(int id) {
        boolean isDeleted = false;
        Connection cnn = null;
        PreparedStatement ps = null;

        try {
            cnn = getConnection();           
            String sql = "DELETE FROM ve WHERE ma_ve = ?";
            ps = cnn.prepareStatement(sql);
            ps.setInt(1, id);
            isDeleted = ps.executeUpdate() > 0;
			
            
        } catch (Exception e) {
            System.out.println("Error in deleteve: " + e.getMessage());
        } finally {
            closeResources(ps, cnn);
        }
        return isDeleted;
    }

    // Thấy cũng không có tìm kiếm vé làm chi
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
