package net.bitacademy.java67.domain;

import java.io.Serializable;
import java.util.Date;

public class VboardVo implements Serializable {
  private static final long serialVersionUID = 2L;

  protected int vno;
  protected String title;
  protected String content;
  protected Date createDate;
  protected String comment;
  protected String userID;
  protected String password;
  
  
  
  public int getVno() {
    return vno;
  }
  public void setVno(int vno) {
    this.vno = vno;
  }
  public String getTitle() {
    return title;
  }
  public void setTitle(String title) {
    this.title = title;
  }
  public String getContent() {
    return content;
  }
  public void setContent(String content) {
    this.content = content;
  }
  public Date getCreateDate() {
    return createDate;
  }
  public void setCreateDate(Date createDate) {
    this.createDate = createDate;
  }
  public String getComment() {
    return comment;
  }
  public void setComment(String comment) {
    this.comment = comment;
  }
  
  
  public String getPassword() {
    return password;
  }
  public void setPassword(String password) {
    this.password = password;
  }
  
  
  public String getUserID() {
    return userID;
  }
  
  public void setUserID(String userID) {
    this.userID = userID;
  }
  

}
