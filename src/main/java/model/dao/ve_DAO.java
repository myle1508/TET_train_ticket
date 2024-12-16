package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.bean.ve;

public class ve_DAO {
	private Connection getConnection() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection("jdbc:mysql://localhost:3306/btap", "root", "");
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
            	ve.set_tong_tien(rs.getInt(6));
            	ve.set_thanh_toan(rs.getString(7));
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
            // Kiểm tra dữ liệu đầu vào
            if (ve.get_ma_nguoi_dung() <= 0 || ve.get_ma_lich_trinh() <= 0 || ve.get_so_ghe() < 0 || ve.get_tong_tien() < 0) {
                throw new IllegalArgumentException("Invalid ve data. Please check your input.");
            }

            cnn = getConnection();

//            // Kiểm tra trạng thái ghế trước khi thêm
//            String checkSql = "SELECT COUNT(*) FROM ve WHERE ma_lich_trinh = ? AND so_ghe = ?";
//            try (PreparedStatement checkPs = cnn.prepareStatement(checkSql)) {
//                checkPs.setInt(1, ve.get_ma_lich_trinh());
//                checkPs.setInt(2, ve.get_so_ghe());
//                ResultSet rs = checkPs.executeQuery();
//                if (rs.next() && rs.getInt(1) > 0) {
//                    throw new IllegalArgumentException("Ghế đã được đặt. Vui lòng chọn ghế khác!");
//                }
//            }

            // Thêm mới vé
            String sql = "INSERT INTO ve (ma_nguoi_dung, ma_lich_trinh, so_ghe, trang_thai, tong_tien, thanh_toan) VALUES (?, ?, ?, ?, ?, ?)";
            ps = cnn.prepareStatement(sql);
            ps.setInt(1, ve.get_ma_nguoi_dung());
            ps.setInt(2, ve.get_ma_lich_trinh());
            ps.setInt(3, ve.get_so_ghe());
            ps.setBoolean(4, ve.get_trang_thai());
            ps.setInt(5, ve.get_tong_tien());
            ps.setString(6, ve.get_thanh_toan());

            int rows = ps.executeUpdate();
            isInserted = rows > 0;

        } catch (SQLException e) {
            System.err.println("SQL Error in insertve: " + e.getSQLState() + " - " + e.getMessage());
        } catch (Exception e) {
            System.err.println("Unexpected error in insertve: " + e.getMessage());
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
    public List<ve> get_ve_list_By_ma_nguoi_dung(int id) {
        List<ve> veList = new ArrayList<>();
        Connection cnn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            cnn = getConnection();
            String sql = "SELECT * FROM ve WHERE ma_nguoi_dung = ?";
            ps = cnn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            while (rs.next()) {
                ve ve = new ve();
                ve.set_ma_ve(rs.getInt(1));
                ve.set_ma_nguoi_dung(rs.getInt(2));
                ve.set_ma_lich_trinh(rs.getInt(3));
                ve.set_so_ghe(rs.getInt(4));
                ve.set_trang_thai(rs.getBoolean(5));
                veList.add(ve);
            }
        } catch (Exception e) {
            System.out.println("Error in getVeListByUserId: " + e.getMessage());
        } finally {
            closeResources(rs, ps, cnn);
        }
        return veList;
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
