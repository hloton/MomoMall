package momomall.bean;

public class Cart {
    private int Pid;
    private String Pname;
    private String Pimg;
    private double Pprice;
    private int Pnum;
    private double Ptol;
    private int Uid;

//省略getter和setter}

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

    public double getPprice() {
        return Pprice;
    }

    public void setPprice(double pprice) {
        Pprice = pprice;
    }

    public int getPnum() {
        return Pnum;
    }

    public void setPnum(int pnum) {
        Pnum = pnum;
    }

    public double getPtol() {
        return Ptol;
    }

    public void setPtol(double ptol) {
        Ptol = ptol;
    }

    public int getUid() {
        return Uid;
    }

    public void setUid(int uid) {
        Uid = uid;
    }
}
