package com.baizhi.cmfz.entity;

public class AdminDTO {
    private Integer id;
    private String username;
    private String password;
    private String salt;
    private Integer roleid;
    private  String rolename;

    public AdminDTO() {
    }

    public AdminDTO(Integer id, String username, String password, String salt, Integer roleid, String rolename) {

        this.id = id;
        this.username = username;
        this.password = password;
        this.salt = salt;
        this.roleid = roleid;
        this.rolename = rolename;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getSalt() {
        return salt;
    }

    public void setSalt(String salt) {
        this.salt = salt;
    }

    public Integer getRoleid() {
        return roleid;
    }

    public void setRoleid(Integer roleid) {
        this.roleid = roleid;
    }

    public String getRolename() {
        return rolename;
    }

    public void setRolename(String rolename) {
        this.rolename = rolename;
    }

    @Override
    public String toString() {
        return "AdminDTO{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", salt='" + salt + '\'' +
                ", roleid=" + roleid +
                ", rolename='" + rolename + '\'' +
                '}';
    }
}
