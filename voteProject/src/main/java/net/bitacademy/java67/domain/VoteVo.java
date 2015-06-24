package net.bitacademy.java67.domain;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class VoteVo implements Serializable {
	private static final long serialVersionUID = 1L;




	protected int    		no;
	protected int     		voteCount1;
	protected int     		voteCount2;
	protected String    	photoOne;
	protected String    	photoTwo;
	protected String    	title;
	protected String    	photoTag1;
	protected String    	photoTag2;
	protected List<String>  comment;
	protected Date    		createDate;
	protected int     		views;
	protected String  		userID;
	protected String  		content;
	protected String  		category;
	
	
	
	
	
	
	
	@Override
	public String toString() {
		return "VoteVo [no=" + no + ", voteCount1=" + voteCount1
				+ ", voteCount2=" + voteCount2 + ", photoOne=" + photoOne
				+ ", photoTwo=" + photoTwo + ", title=" + title
				+ ", photoTag1=" + photoTag1 + ", photoTag2=" + photoTag2
				+ ", comment=" + comment + ", createDate=" + createDate
				+ ", views=" + views + ", userID=" + userID + ", content="
				+ content + ", category=" + category + "]";
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	
	public String getPhotoTag1() {
		return photoTag1;
	}
	public void setPhotoTag1(String photoTag1) {
		this.photoTag1 = photoTag1;
	}
	public String getPhotoTag2() {
		return photoTag2;
	}
	public void setPhotoTag2(String photoTag2) {
		this.photoTag2 = photoTag2;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	
	
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getVoteCount1() {
		return voteCount1;
	}
	public void setVoteCount1(int voteCount1) {
		this.voteCount1 = voteCount1;
	}
	public int getVoteCount2() {
		return voteCount2;
	}
	public void setVoteCount2(int voteCount2) {
		this.voteCount2 = voteCount2;
	}

	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	
	public Date getCreateDate() {
		return createDate;
	}
	public String getPhotoOne() {
		return photoOne;
	}
	public void setPhotoOne(String photoOne) {
		this.photoOne = photoOne;
	}
	public String getPhotoTwo() {
		return photoTwo;
	}
	public void setPhotoTwo(String photoTwo) {
		this.photoTwo = photoTwo;
	}
	public List<String> getComment() {
		return comment;
	}
	public void setComment(List<String> comment) {
		this.comment = comment;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}  



}
