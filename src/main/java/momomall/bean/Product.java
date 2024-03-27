package momomall.bean;

public class Product {
    private int Pid;
    private String Pname;
    private String Pimg;
    private double Price;
    private String Pintro;
    private String Pplace;

    private int num;

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public int getPid() {
        return Pid;
    }

    public void setPid(int pid) {
        Pid = pid;
    }

    public String getPname() {
        return Pname;
    }

    public void setPname(String pname) {
        Pname = pname;
    }

    public String getPimg() {
        return Pimg;
    }

    public void setPimg(String pimg) {
        Pimg = pimg;
    }

    public double getPrice() {
        return Price;
    }

    public void setPrice(double price) {
        Price = price;
    }

    public String getPintro() {
        return Pintro;
    }

    public void setPintro(String pintro) {
        Pintro = pintro;
    }

    public String getPplace() {
        return Pplace;
    }

    public void setPplace(String pplace) {
        Pplace = pplace;
    }
}
