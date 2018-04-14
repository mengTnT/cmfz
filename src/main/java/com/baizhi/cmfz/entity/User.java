package com.baizhi.cmfz.entity;

public class User {
    private Integer userId;
    private String telphone;
    private String password;
    private String userImage;
    private String nickname;
    private String name;
    private String sex;
    private String autograph;
    private String userSheng;
    private String userShi;
    private String siId;

    @Override
    public String toString() {
        return "User{" +
                "userId=" + userId +
                ", telphone='" + telphone + '\'' +
                ", password='" + password + '\'' +
                ", userImage='" + userImage + '\'' +
                ", nickname='" + nickname + '\'' +
                ", name='" + name + '\'' +
                ", sex='" + sex + '\'' +
                ", autograph='" + autograph + '\'' +
                ", userSheng='" + userSheng + '\'' +
                ", userShi='" + userShi + '\'' +
                ", siId='" + siId + '\'' +
                '}';
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getTelphone() {
        return telphone;
    }

    public void setTelphone(String telphone) {
        this.telphone = telphone;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUserImage() {
        return userImage;
    }

    public void setUserImage(String userImage) {
        this.userImage = userImage;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getAutograph() {
        return autograph;
    }

    public void setAutograph(String autograph) {
        this.autograph = autograph;
    }

    public String getUserSheng() {
        return userSheng;
    }

    public void setUserSheng(String userSheng) {
        this.userSheng = userSheng;
    }

    public String getUserShi() {
        return userShi;
    }

    public void setUserShi(String userShi) {
        this.userShi = userShi;
    }

    public String getSiId() {
        return siId;
    }

    public void setSiId(String siId) {
        this.siId = siId;
    }

    public User() {
    }

    public User(Integer userId, String telphone, String password, String userImage, String nickname, String name, String sex, String autograph, String userSheng, String userShi, String siId) {
        this.userId = userId;
        this.telphone = telphone;
        this.password = password;
        this.userImage = userImage;
        this.nickname = nickname;
        this.name = name;
        this.sex = sex;
        this.autograph = autograph;
        this.userSheng = userSheng;
        this.userShi = userShi;
        this.siId = siId;
    }
}
