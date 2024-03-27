package momomall.DAO;

import momomall.bean.Product;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {
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

    public List<Product> getTopSixProducts() throws Exception {
        List<Product> productList = new ArrayList<>();

        String query = "SELECT  * FROM product limit 6";
        pst = conn.prepareStatement(query);
        rs = pst.executeQuery();

        while (rs.next()) {
            Product product = new Product();
            product.setPid(rs.getInt("Pid"));
            product.setPname(rs.getString("Pname"));
            product.setPimg(rs.getString("Pimg"));
            product.setPrice(rs.getDouble("Pprice"));
            product.setPintro(rs.getString("Pintro"));
            product.setPplace(rs.getString("Pplace"));
            productList.add(product);
        }

        return productList;
    }

    // 根据商品ID查询商品信息
    public Product getProductById(int pid) throws Exception {
        String query = "SELECT * FROM product WHERE Pid = ?";
        try (PreparedStatement pst = conn.prepareStatement(query)) {
            pst.setInt(1, pid);
            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    Product product = new Product();
                    product.setPid(rs.getInt("Pid"));
                    product.setPname(rs.getString("Pname"));
                    product.setPimg(rs.getString("Pimg"));
                    product.setPrice(rs.getDouble("Pprice"));
                    // 设置其他属性...
                    return product;
                }
            }
        }
        return null;
    }


        // ...其他代码...

        public List<Product> getAllProducts() throws Exception {
            List<Product> productList = new ArrayList<>();

            String query = "SELECT * FROM product";
            pst = conn.prepareStatement(query);
            rs = pst.executeQuery();

            while (rs.next()) {
                Product product = new Product();
                product.setPid(rs.getInt("Pid"));
                product.setPname(rs.getString("Pname"));
                product.setPimg(rs.getString("Pimg"));
                product.setPrice(rs.getDouble("Pprice"));
                product.setPintro(rs.getString("Pintro"));
                product.setPplace(rs.getString("Pplace"));
                productList.add(product);
            }

            return productList;
        }

    public List<Product> searchProducts(String searchText) {
        List<Product> products = new ArrayList<>();
            String sql = "SELECT * FROM product WHERE Pname LIKE ?";
            try (PreparedStatement statement = conn.prepareStatement(sql)) {
                statement.setString(1, "%" + searchText + "%");

                try (ResultSet resultSet = statement.executeQuery()) {
                    while (resultSet.next()) {
                        Product product = new Product();
                        // 设置product的属性
                        product.setPid(resultSet.getInt("Pid"));
                        product.setPname(resultSet.getString("Pname"));
                        product.setPrice(resultSet.getDouble("Pprice"));
                        product.setPintro(resultSet.getString("Pintro"));
                        product.setPplace(resultSet.getString("Pplace"));
                        product.setPimg(resultSet.getString("Pimg"));
                        products.add(product);
                    }
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

        return products;
    }

    public Product GetProductByPid(int Pid) throws Exception {
        String query = "SELECT * FROM product WHERE Pid = ? ";
        try (PreparedStatement pst = conn.prepareStatement(query)) {
            pst.setInt(1, Pid);
            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    Product product = new Product();
                    product.setPid(rs.getInt("Pid"));
                    product.setPname(rs.getString("Pname"));
                    product.setPimg(rs.getString("Pimg"));
                    product.setPintro(rs.getString("Pintro"));
                    product.setPplace(rs.getString("Pplace"));
                    product.setPrice(rs.getDouble("Pprice"));
                    // 设置其他属性...
                    return product;
                }
            }
        }
        return null;
    }

}
