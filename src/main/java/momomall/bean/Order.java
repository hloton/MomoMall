package momomall.bean;

public class Order {
    int Oid;
    int Pid;
    String Pname;
    String pimg;
    double Ptol;
    int Uid;
    String Fname;
    String Ostatus;
    String OtimeStr;



    //省略getter和setter}


    public int getOid() {
        return Oid;
    }

    public void setOid(int oid) {
        Oid = oid;
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
        return pimg;
    }

    public void setPimg(String pimg) {
        this.pimg = pimg;
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

    public String getFname() {
        return Fname;
    }

    public void setFname(String uname) {
        Fname = uname;
    }

    public String getOstatus() {
        return Ostatus;
    }

    public void setOstatus(String ostatus) {
        Ostatus = ostatus;
    }

    public String getOtimeStr() {
        return OtimeStr;
    }

    public void setOtimeStr(String otimeStr) {
        OtimeStr = otimeStr;
    }
}
