package net.bitacademy.java67.domain;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class VoteCommentVo implements Serializable {
	private static final long serialVersionUID = 1L;




	protected int    		no;
	protected int    		userID;
	protected String    	comment;
	
	
	@Override
	public String toString() {
		return "VoteCommentVo [no=" + no + ", comment=" + comment + "]";
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	
	
	
	
	
	
	
	



}
