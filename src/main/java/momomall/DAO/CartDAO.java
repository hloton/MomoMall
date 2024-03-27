package momomall.DAO;

import momomall.bean.Cart;
import momomall.bean.Product;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;


public class CartDAO {
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

    public List<Cart> getCartItemsByUserId(int userId) throws Exception {
        List<Cart> cartItems = new ArrayList<>();
        String query = "SELECT * FROM cart WHERE Uid = ?";
        System.out.println("获得Uid："+userId);
        try {
            initConnection();
            pst = conn.prepareStatement(query);
            pst.setInt(1, userId);
            rs = pst.executeQuery();

            while (rs.next()) {
                Cart cartItem = new Cart();
                cartItem.setPid(rs.getInt("Pid"));
                cartItem.setPname(rs.getString("Pname"));
                cartItem.setPimg(rs.getString("Pimg"));
                cartItem.setPprice(rs.getDouble("Pprice"));
                cartItem.setPnum(rs.getInt("Pnum"));
                cartItem.setPtol(rs.getDouble("Ptol"));
                cartItem.setUid(rs.getInt("Uid"));

                cartItems.add(cartItem);

            }
        } finally {
            System.out.println("查询完毕 关闭连接");
            closeConnection();
        }

        return cartItems;
    }

    public double updateCartQuantity(int productId, int newQuantity) throws Exception {
        double updatedPtol = 0;

        try {
            // 根据商品ID获取原购物车信息
            Cart cartItem = getCartItemByProductId(productId);

            // 更新购物车数量
            cartItem.setPnum(newQuantity);

            // 执行数据库更新
            String updateQuery = "UPDATE cart SET Pnum=? WHERE Pid=?";
            initConnection();
            pst = conn.prepareStatement(updateQuery);
            pst.setInt(1, newQuantity);
            pst.setInt(2, productId);
            pst.executeUpdate();

            // 查询更新后的 Ptol 值
            String selectQuery = "SELECT Ptol FROM cart WHERE Pid=?";
            pst = conn.prepareStatement(selectQuery);
            pst.setInt(1, productId);
            rs = pst.executeQuery();

            if (rs.next()) {
                updatedPtol = rs.getDouble("Ptol");
                cartItem.setPtol(updatedPtol); // 更新购物车项的 Ptol 属性
            }
        } finally {
            closeConnection();
        }

        return updatedPtol;
    }

    public Cart getCartItemByProductId(int productId) throws Exception {
        Cart cartItem = null;
        String query = "SELECT * FROM cart WHERE Pid = ?";

        try {
            initConnection();
            pst = conn.prepareStatement(query);
            pst.setInt(1, productId);
            rs = pst.executeQuery();

            if (rs.next()) {
                cartItem = new Cart();
                cartItem.setPid(rs.getInt("Pid"));
                cartItem.setPname(rs.getString("Pname"));
                cartItem.setPimg(rs.getString("Pimg"));
                cartItem.setPprice(rs.getDouble("Pprice"));
                cartItem.setPnum(rs.getInt("Pnum"));
                cartItem.setPtol(rs.getDouble("Ptol"));
                cartItem.setUid(rs.getInt("Uid"));
            }
        } finally {
            closeConnection();
        }

        return cartItem;
    }

    public void deleteProductByPid(int productId) throws Exception {
        try {
            // 删除数据库中对应Pid的购物车项
            String deleteQuery = "DELETE FROM cart WHERE Pid=?";
            initConnection();
            pst = conn.prepareStatement(deleteQuery);
            pst.setInt(1, productId);
            pst.executeUpdate();
        } finally {
            closeConnection();
        }
    }

    public void deleteAllByUid(int userId) throws Exception {
        try {
            // 删除数据库中对应Uid的购物车项
            System.out.println("deleteAllByUid被调用"+userId);
            String deleteQuery = "DELETE FROM cart WHERE Uid=?";
            initConnection();
            pst = conn.prepareStatement(deleteQuery);
            pst.setInt(1, userId);
            pst.executeUpdate();
        } finally {
            closeConnection();
        }
    }

    // 根据用户ID和商品ID查询购物车中是否已有该商品
    public Cart getCartEntry(int uid, int pid) throws Exception {
        String query = "SELECT * FROM cart WHERE Uid = ? AND Pid = ?";
        try (PreparedStatement pst = conn.prepareStatement(query)) {
            pst.setInt(1, uid);
            pst.setInt(2, pid);
            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    Cart cart = new Cart();
                    cart.setPid(rs.getInt("Pid"));
                    cart.setPname(rs.getString("Pname"));
                    cart.setPimg(rs.getString("Pimg"));
                    cart.setPprice(rs.getDouble("Pprice"));
                    cart.setPnum(rs.getInt("Pnum"));
                    cart.setPtol(rs.getDouble("Ptol"));
                    cart.setUid(rs.getInt("Uid"));
                    return cart;
                }
            }
        }
        return null;
    }

    // 插入购物车条目
    public void insertCartEntry(Cart cart) throws Exception {
        String query = "INSERT INTO cart (Pid, Pname, Pimg, Pprice, Pnum,  Uid) VALUES (?, ?, ?, ?, ?, ?)";
        try (PreparedStatement pst = conn.prepareStatement(query)) {
            pst.setInt(1, cart.getPid());
            pst.setString(2, cart.getPname());
            pst.setString(3, cart.getPimg());
            pst.setDouble(4, cart.getPprice());
            pst.setInt(5, cart.getPnum());
            pst.setInt(6, cart.getUid());
            pst.executeUpdate();
        }
    }

    // 更新购物车条目
    public void updateCartEntry(Cart cart) throws Exception {
        String query = "UPDATE cart SET Pnum = ?  WHERE Uid = ? AND Pid = ?";
        try (PreparedStatement pst = conn.prepareStatement(query)) {
            pst.setInt(1, cart.getPnum());
            pst.setInt(2, cart.getUid());
            pst.setInt(3, cart.getPid());
            pst.executeUpdate();
        }
    }

    public List<Product> getToBeCheckOut() throws Exception {

        return null;
    }

    public Cart getCartByUidAndPid(int uid, int pid) throws Exception {
        Cart cart = null;
        try {
            initConnection();

            String sql = "SELECT Pid, Pname, Pimg, Pnum, Ptol FROM cart WHERE Uid=? AND Pid=?";
            pst = conn.prepareStatement(sql);
            pst.setInt(1, uid);
            pst.setInt(2, pid);
            rs = pst.executeQuery();

            if (rs.next()) {
                cart = new Cart();
                cart.setPid(rs.getInt("Pid"));
                cart.setPname(rs.getString("Pname"));
                cart.setPimg(rs.getString("Pimg"));
                cart.setPnum(rs.getInt("Pnum"));
                cart.setPtol(rs.getDouble("Ptol"));
            }
        } finally {
            closeConnection();
        }

        return cart;
    }

    public Cart SelectByPU(int uid, int pid) throws Exception {
        String sql = "SELECT Pname, Pimg, Ptol FROM cart WHERE Uid = ? AND Pid = ?";
        try (PreparedStatement pst = conn.prepareStatement(sql)) {
            pst.setInt(1, uid);
            pst.setInt(2, pid);

            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    Cart cart = new Cart();
                    cart.setPname(rs.getString("Pname"));
                    cart.setPimg(rs.getString("Pimg"));
                    cart.setPtol(rs.getDouble("Ptol"));
                    return cart;
                }
            }
        }
        return null;
    }

    public void OrderDeleteCart(int uid, int pid) throws Exception {
        String sql = "DELETE FROM cart WHERE Uid = ? AND Pid = ?";
        try (PreparedStatement pst = conn.prepareStatement(sql)) {
            pst.setInt(1, uid);
            pst.setInt(2, pid);
            pst.executeUpdate();
        }
    }


}
