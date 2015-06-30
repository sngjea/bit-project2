package net.bitacademy.java67.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import net.bitacademy.java67.dao.BoardDao;
import net.bitacademy.java67.dao.BoardLogDao;
import net.bitacademy.java67.dao.VoteDao;
import net.bitacademy.java67.domain.BoardLogVo;
import net.bitacademy.java67.domain.BoardVo;
import net.bitacademy.java67.domain.VoteVo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/* Service 객체
 * - Business Logic 수행
 * - Transaction 처리
 * - 서비스 클래스의 메서드 이름을 지을 때 가능한 업무 용어를 사용한다.
 */

@Service
public class VoteService {
  @Autowired
  VoteDao voteDao;
  
  @Autowired
  BoardLogDao boardLogDao;
  
  public List<VoteVo> getVoteTable(int startIndex, int pageSize) {
	  
	  HashMap<String,Object> sqlParams = new HashMap<String,Object>();
	    sqlParams.put("startIndex", startIndex);
	    sqlParams.put("pageSize", pageSize);
	    
	  return voteDao.getVoteTable(sqlParams);
  }
  
  public List<VoteVo> getMyVoteTable(int startIndex, int pageSize, String userID) {
	  
	  HashMap<String,Object> sqlParams = new HashMap<String,Object>();
	  sqlParams.put("startIndex", startIndex);
	  sqlParams.put("pageSize", pageSize);
	  sqlParams.put("userID", userID);
	  
	  return voteDao.getMyVoteTable(sqlParams);
  }
  
  public int add(VoteVo vote, String ip) {
    
	
	  
	  int count = voteDao.insert(vote);
    
    BoardLogVo boardLog = new BoardLogVo();
    boardLog.setIp(ip);
    boardLog.setActionType(BoardLogVo.ACTION_INSERT);
    boardLog.setBoardNo(vote.getNo());
    boardLogDao.insert(boardLog);
    
    return count;
  }
  
  
  public VoteVo selectOne(int no, String ip) {
	  
	  
	  
	   
	  
	  BoardLogVo boardLog = new BoardLogVo();
	  boardLog.setIp(ip);
	  boardLog.setActionType(BoardLogVo.ACTION_INSERT);
	  boardLog.setBoardNo(no);
	  boardLogDao.insert(boardLog);
	  return voteDao.selectOne(no);
  }
  
  
  public int remove(int no, String ip) {
    int count = voteDao.delete(no);
    
    BoardLogVo boardLog = new BoardLogVo();
    boardLog.setIp(ip);
    boardLog.setActionType(BoardLogVo.ACTION_DELETE);
    boardLog.setBoardNo(no);
    boardLogDao.insert(boardLog);
    
    return count;
  }
  
  public int change(VoteVo vote, String ip) {
    int count = voteDao.update(vote);
    System.out.println(vote.getNo());
	  System.out.println(vote.getTitle());
	  System.out.println(vote.getPhotoOne());
	  System.out.println(vote.getPhotoTwo());
	  System.out.println(vote.getPhotoTag1());
	  System.out.println(vote.getPhotoTag2());
	  System.out.println(vote.getContent());
    
    BoardLogVo boardLog = new BoardLogVo();
    boardLog.setIp(ip);
    boardLog.setActionType(BoardLogVo.ACTION_UPDATE);
    boardLog.setBoardNo(vote.getNo());
    boardLogDao.insert(boardLog);
    
    return count;
  }
  
  public void check(VoteVo vote, String ip) {
	  System.out.println(vote.getNo());
	  System.out.println(vote.getUserID());
	  
	 
	  
	  BoardLogVo boardLog = new BoardLogVo();
	    boardLog.setIp(ip);
	    boardLog.setActionType(BoardLogVo.ACTION_UPDATE);
	    boardLog.setBoardNo(vote.getNo());
	    boardLogDao.insert(boardLog);
	  try{
	    voteDao.userIDcheck(vote);
	    System.out.println("voteServise, setTrue couse query doen't excute exception ");
	    
	  } catch (Exception e) {
		  if(e.getMessage().contains("Duplicate entry")) {
			  System.out.println("Duplicate entry");
			  return;
		  }
		  System.out.println("Execute Exception ");
	  }
	  
  }

}









