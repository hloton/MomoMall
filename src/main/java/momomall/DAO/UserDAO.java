package momomall.DAO;

import momomall.bean.User;

import java.sql.*;

public class UserDAO {
    private final String Driver = "com.mysql.cj.jdbc.Driver";
    private String url = "jdbc:mysql://localhost:3306/mall";
    private String user = "root";
    private String pw = "benxi630";

    public void initConnection() throws Exception {
        Class.forName(Driver);
    }

    public int checkLogin(User user) {
        System.out.println("调用了checkLogin");
        int uid = -1; // 默认值，表示登录失败

        try (Connection conn = DriverManager.getConnection(url, this.user, pw);
             PreparedStatement pst = conn.prepareStatement(
                     "SELECT Uid FROM userinfo WHERE (Uname = ? OR Uph = ?) AND Upw = ?")) {

            pst.setString(1, user.getUname());
            pst.setString(2, user.getUph());
            pst.setString(3, user.getUpw());

            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    uid = rs.getInt("Uid");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return uid;
    }


    public boolean insertUser(User user) {
        String query = "INSERT INTO userinfo (Uid, Uname, Upw, Uph) VALUES (?, ?, ?, ?)";

        try (Connection conn = DriverManager.getConnection(url, this.user, pw);
             PreparedStatement pst = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {
            pst.setInt(1, user.getUid());
            pst.setString(2, user.getUname());
            pst.setString(3, user.getUpw());
            pst.setString(4, user.getUph());

            int rowsAffected = pst.executeUpdate();

            if (rowsAffected > 0) {
                try (ResultSet generatedKeys = pst.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        user.setUid(generatedKeys.getInt(1));
                        System.out.println("用户插入成功，UID: " + user.getUid());
                        return true;
                    }
                }
            } else {
                System.out.println("用户插入失败");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public int getNextUid() {
        int nextUid = 0;

        try (Connection conn = DriverManager.getConnection(url, this.user, pw);
             PreparedStatement pst = conn.prepareStatement(
                     "SELECT MAX(Uid) FROM userinfo")){

            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                nextUid = rs.getInt(1) + 1;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return nextUid;
    }

    public boolean isUsernameExists(String username) {
        String query = "SELECT COUNT(*) FROM userinfo WHERE Uname = ?";

        try (Connection conn = DriverManager.getConnection(url, this.user, pw);
             PreparedStatement pst = conn.prepareStatement(query)) {

            pst.setString(1, username);

            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean isPhoneExists(String phone) {
        String query = "SELECT COUNT(*) FROM userinfo WHERE Uph = ?";

        try (Connection conn = DriverManager.getConnection(url, this.user, pw);
             PreparedStatement pst = conn.prepareStatement(query)) {

            pst.setString(1, phone);

            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    public User getByUid(int uid) {
        String query = "SELECT * FROM userinfo WHERE Uid = ?";

        try (Connection conn = DriverManager.getConnection(url, this.user, pw);
             PreparedStatement pst = conn.prepareStatement(query)) {

            pst.setInt(1, uid);

            try (ResultSet resultSet = pst.executeQuery()) {
                if (resultSet.next()) {
                    User user = new User();
                    user.setUid(resultSet.getInt("Uid"));
                    user.setUname(resultSet.getString("Uname"));
                    user.setUph(resultSet.getString("Uph"));
                    user.setAvatar(resultSet.getString("avatar"));
                    // 添加其他必要的属性设置
                    return user;
                }
            }
        } catch (Exception e) {
            throw new RuntimeException("Error fetching user with UID: " + uid, e);
        }
        return null; // 用户不存在或者数据库查询出错
    }

    public boolean updateUser(User user) {
        try (Connection conn = DriverManager.getConnection(url, this.user, pw);
             PreparedStatement pst = conn.prepareStatement(
                     "UPDATE userinfo SET Uname = ?, Uph = ? WHERE Uid = ?")) {

            pst.setString(1, user.getUname());
            pst.setString(2, user.getUph());
//            pst.setString(3, user.getGender()); // 确保这个字段在数据库中存在
            pst.setInt(3, user.getUid());

            int rowsAffected = pst.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updatePassword(User user, String newPassword) {
        try (Connection conn = DriverManager.getConnection(url, this.user, pw);
             PreparedStatement pst = conn.prepareStatement(
                     "UPDATE userinfo SET Upw = ? WHERE Uid = ?")) {

            pst.setString(1, newPassword);
            pst.setInt(2, user.getUid());

            int rowsAffected = pst.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateAvatar(int userId, String avatarPath) {
        String sql = "UPDATE userinfo SET avatar = ? WHERE Uid = ?";

        try (Connection conn = DriverManager.getConnection(url, this.user,pw);
             PreparedStatement pst = conn.prepareStatement(sql)) {

            pst.setString(1, avatarPath);
            pst.setInt(2, userId);

            int rowsAffected = pst.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
