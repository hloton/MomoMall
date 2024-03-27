package momomall.DAO;

import momomall.bean.Address;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AddressDAO {

    private final String Driver = "com.mysql.cj.jdbc.Driver";
    private String url = "jdbc:mysql://localhost:3306/mall";
    private String user = "root";
    private String pw = "benxi630";

    public void initConnection() throws Exception {
        Class.forName(Driver);
    }

    public List<Address> getAllAddressesByUserId(int userId) {
        List<Address> addresses = new ArrayList<>();
        try (   Connection connection = DriverManager.getConnection(url, this.user, pw);
                PreparedStatement pst = connection.prepareStatement("SELECT * FROM Address WHERE uid = ?")){
            pst.setInt(1, userId);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                Address address = new Address();
                address.setAddressId(rs.getInt("address_id"));
                address.setUserId(rs.getInt("Uid"));
                address.setAddress(rs.getString("address"));
                address.setReceiver(rs.getString("receiver"));
                address.setPhone(rs.getString("phone"));
                addresses.add(address);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return addresses;
    }

    public boolean addAddress(Address address) {
        String sql = "INSERT INTO Address (uid, address, receiver, phone) VALUES (?, ?, ?, ?)";

        try (Connection connection = DriverManager.getConnection(url, this.user, pw);
             PreparedStatement pst = connection.prepareStatement(sql)) {

            pst.setInt(1, address.getUserId());
            pst.setString(2, address.getAddress());
            pst.setString(3, address.getReceiver());
            pst.setString(4, address.getPhone());

            int rowsAffected = pst.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateAddress(Address address) {
        String sql = "UPDATE Address SET address = ?, receiver = ?, phone = ? WHERE address_id = ? AND uid = ?";

        try (Connection connection = DriverManager.getConnection(url, this.user, pw);
             PreparedStatement pst = connection.prepareStatement(sql)) {

            pst.setString(1, address.getAddress());
            pst.setString(2, address.getReceiver());
            pst.setString(3, address.getPhone());
            pst.setInt(4, address.getAddressId());
            pst.setInt(5, address.getUserId());

            int rowsAffected = pst.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteAddress(int addressId, int userId) {
        String sql = "DELETE FROM Address WHERE address_id = ? AND uid = ?";

        try (Connection connection = DriverManager.getConnection(url, this.user, pw);
             PreparedStatement pst = connection.prepareStatement(sql)) {

            pst.setInt(1, addressId);
            pst.setInt(2, userId);

            int rowsAffected = pst.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}

