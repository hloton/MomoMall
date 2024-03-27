package momomall.bean;

public class User {
    private int Uid;
    private String Uname;
    private String Upw;
    private String Uph;
    private String avatar; // 头像路径

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public int getUid() {
        return Uid;
    }

    public void setUid(int uid) {
        Uid = uid;
    }

    public String getUname() {
        return Uname;
    }

    public void setUname(String uname) {
        Uname = uname;
    }

    public String getUpw() {
        return Upw;
    }

    public void setUpw(String upw) {
        Upw = upw;
    }

    public String getUph() {
        return Uph;
    }

    public void setUph(String uph) {
        Uph = uph;
    }
}
