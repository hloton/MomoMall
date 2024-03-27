package momomall.bean;

public class Address {
    private int addressId;
    private int userId;
    private String address;
    private String receiver;
    private String phone;

    // 构造器
    public Address() {}

    // 用于创建地址实例的构造器
    public Address(int addressId, int userId, String address, String receiver, String phone) {
        this.addressId = addressId;
        this.userId = userId;
        this.address = address;
        this.receiver = receiver;
        this.phone = phone;
    }

    // addressId的getter和setter
    public int getAddressId() {
        return addressId;
    }

    public void setAddressId(int addressId) {
        this.addressId = addressId;
    }

    // userId的getter和setter
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    // address的getter和setter
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    // receiver的getter和setter
    public String getReceiver() {
        return receiver;
    }

    public void setReceiver(String receiver) {
        this.receiver = receiver;
    }

    // phone的getter和setter
    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    // toString方法，用于打印地址信息
    @Override
    public String toString() {
        return "Address{" +
                "addressId=" + addressId +
                ", userId=" + userId +
                ", address='" + address + '\'' +
                ", receiver='" + receiver + '\'' +
                ", phone='" + phone + '\'' +
                '}';
    }
}
