package com.lzr.vo;

import java.util.Arrays;

public class UserInfo {

    private int id;

    private String username;

    private String password;

    private byte[] img;

    public UserInfo(){}

    public int getId() {
        return id;
    }

    public void setId(int id) {
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

    public byte[] getImg() {
        return img;
    }

    public void setImg(byte[] img) {
        this.img = img;
    }

    public UserInfo(int id, String username, String password, byte[] img) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.img = img;
    }

    @Override
    public String toString() {
        return "UserInfo{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", img=" + Arrays.toString(img) +
                '}';
    }
}
