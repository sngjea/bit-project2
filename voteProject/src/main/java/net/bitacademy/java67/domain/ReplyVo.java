package net.bitacademy.java67.domain;

import java.io.Serializable;
import java.util.Date;

public class ReplyVo  implements Serializable  {
  private static final long serialVersionUID = 1L;
  
  protected int rno;
  protected int vno;
  protected String comment;
  protected String userID;
  protected Date replyDate;
  
  
  
  public int getRno() {
    return rno;
  }
  public void setRno(int rno) {
    this.rno = rno;
  }
  public int getVno() {
    return vno;
  }
  public void setVno(int vno) {
    this.vno = vno;
  }
  public String getComment() {
    return comment;
  }
  public void setComment(String comment) {
    this.comment = comment;
  }
  public String getUserID() {
    return userID;
  }
  public void setUserID(String userID) {
    this.userID = userID;
  }
  public Date getReplyDate() {
    return replyDate;
  }
  public void setReplyDate(Date replyDate) {
    this.replyDate = replyDate;
  }
  

  
  
}
