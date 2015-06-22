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
  
  
  public int add(VoteVo vote, String ip) {
    
	
	  
	  int count = voteDao.insert(vote);
    
    BoardLogVo boardLog = new BoardLogVo();
    boardLog.setIp(ip);
    boardLog.setActionType(BoardLogVo.ACTION_INSERT);
    boardLog.setBoardNo(vote.getNo());
    boardLogDao.insert(boardLog);
    
    return count;
  }
  
//  public List<BoardVo> list(
//      int startIndex, int pageSize, String word, String order) {
//    
//    HashMap<String,Object> sqlParams = new HashMap<String,Object>();
//    sqlParams.put("startIndex", startIndex);
//    sqlParams.put("pageSize", pageSize);
//    sqlParams.put("word", word);
//    sqlParams.put("order", order);
//    
//    return voteDao.selectList(sqlParams);
//  }
//  
//  public int size(String word) {
//    return voteDao.countAll(word);
//  }
//  
//  public BoardVo get(int no) {
//    return voteDao.selectOne(no);
//  }
  
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
    
    BoardLogVo boardLog = new BoardLogVo();
    boardLog.setIp(ip);
    boardLog.setActionType(BoardLogVo.ACTION_UPDATE);
    boardLog.setBoardNo(vote.getNo());
    boardLogDao.insert(boardLog);
    
    return count;
  }
  
  public boolean check(VoteVo vote, String ip) {
	  System.out.println(vote.getNo());
	  
	 
	  boolean v =false;
	  
	  BoardLogVo boardLog = new BoardLogVo();
	    boardLog.setIp(ip);
	    boardLog.setActionType(BoardLogVo.ACTION_UPDATE);
	    boardLog.setBoardNo(vote.getNo());
	    boardLogDao.insert(boardLog);
	  try{
	    int count = voteDao.check(vote.getNo());
	    System.out.println("voteServise, setTrue couse query doen't excute exception ");
	    v=true;
	    
	  } catch (Exception e) {
		  
	  }
	  
	  return v ;
  }
}









