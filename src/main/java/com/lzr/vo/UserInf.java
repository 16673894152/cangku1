package com.lzr.vo;


import com.fasterxml.jackson.annotation.JsonFormat;

import java.sql.Timestamp;

public class UserInf {

  private long id;
  private String loginname;
  private String password;
  private int status;
  @JsonFormat(pattern="yyyy-MM-dd HH:mm",timezone = "GMT+8")
  private Timestamp createdate;
  private String username;


  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }


  public String getLoginname() {
    return loginname;
  }

  public void setLoginname(String loginname) {
    this.loginname = loginname;
  }


  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }


  public int getStatus() {
    return status;
  }

  public void setStatus(int status) {
    this.status = status;
  }

  @JsonFormat(pattern="yyyy-MM-dd HH:mm",timezone = "GMT+8")
  public Timestamp getCreatedate() {
    return createdate;
  }

  public void setCreatedate(Timestamp createdate) {
    this.createdate = createdate;
  }


  public String getUsername() {
    return username;
  }

  public void setUsername(String username) {
    this.username = username;
  }

  @Override
  public String toString() {
    return "UserInf{" +
            "id=" + id +
            ", loginname='" + loginname + '\'' +
            ", password='" + password + '\'' +
            ", status=" + status +
            ", createdate=" + createdate +
            ", username='" + username + '\'' +
            '}';
  }
}
