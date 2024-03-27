package momomall.DAO;

import momomall.bean.Order;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class OrderDAO {
    private final String Driver = "com.mysql.cj.jdbc.Driver";
    private String url = "jdbc:mysql://localhost:3306/mall";
    private String user = "root";
    private String pw = "benxi630";
    private Connection conn = null;
    private PreparedStatement pst = null;
    private ResultSet rs = null;

    public void initConnection() throws Exception{
        Class.forName(Driver);
        conn = DriverManager.getConnection(url,user,pw);
    }

    public void closeConnection() throws Exception {
        if (pst != null) {
            pst.close();
        }
        if (conn != null) {
            conn.close();
        }
    }

    public boolean InsertByPU(Order order) throws Exception {
        String sql = "INSERT INTO oder (Pid, Pname, Pimg, Ptol, Fname, Ostatus, Otime, Uid) VALUES (?, ?, ?, ?, ?, '已支付', NOW(), ?)";
        try (PreparedStatement pst = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            pst.setInt(1, order.getPid());
            pst.setString(2, order.getPname());
            pst.setString(3, order.getPimg());
            pst.setDouble(4, order.getPtol());
            pst.setString(5, order.getFname());
            pst.setInt(6, order.getUid());
            int affectedRows = pst.executeUpdate();

            if (affectedRows == 0) {
                throw new SQLException("Inserting order failed, no rows affected.");
            }
            return affectedRows > 0;  // 如果受影响的行数大于0，说明插入成功，返回true
        }

    }

    public List<Order> selectOrderByUid(int Uid) throws SQLException {
        List<Order> orders = new ArrayList<>();

        String sql = "SELECT * FROM oder WHERE Uid = ? ORDER BY Oid DESC ";
        pst = conn.prepareStatement(sql);
        pst.setInt(1, Uid);
        rs = pst.executeQuery();

        while (rs.next()) {
            Order order = new Order();
            order.setOid(rs.getInt("Oid"));
            order.setPid(rs.getInt("Pid"));
            order.setPname(rs.getString("Pname"));
            order.setPimg(rs.getString("Pimg"));
            order.setPtol(rs.getDouble("Ptol"));
            order.setUid(rs.getInt("Uid"));
            order.setFname(rs.getString("Fname"));
            order.setOstatus(rs.getString("Ostatus"));

            // 处理Timestamp类型，将其转换为字符串表示
            Timestamp timestamp = rs.getTimestamp("Otime");
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String oTimeStr = sdf.format(timestamp);
            order.setOtimeStr(oTimeStr);

            orders.add(order);
        }

        return orders;
    }

    public boolean deleteOrder(int orderId) {
        String sql = "DELETE FROM Oder WHERE Oid = ?";

        try (Connection conn = DriverManager.getConnection(url, this.user, pw);
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, orderId);
            int affectedRows = stmt.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
