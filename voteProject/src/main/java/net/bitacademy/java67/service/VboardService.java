package net.bitacademy.java67.service;

import java.util.HashMap;
import java.util.List;

import net.bitacademy.java67.dao.BoardLogDao;
import net.bitacademy.java67.dao.ReplyDao;
import net.bitacademy.java67.dao.VboardDao;
import net.bitacademy.java67.domain.BoardLogVo;
import net.bitacademy.java67.domain.VboardVo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class VboardService {
 @Autowired
 VboardDao vboardDao;
 
 @Autowired
 BoardLogDao boardLogDao;
 
 @Autowired
 ReplyDao replyDao;
 
 
 
 
   public int size(String word) {
     return vboardDao.countAll(word);
   }
   
   public VboardVo get(int vno) {
     return vboardDao.selectOne(vno);
   }
 
 
   public int add(VboardVo vboard, String ip) {
     int count = vboardDao.insert(vboard);

     BoardLogVo boardLog = new BoardLogVo();
     boardLog.setIp(ip);
     boardLog.setActionType(BoardLogVo.ACTION_INSERT);
     boardLog.setBoardNo(vboard.getVno());
     boardLogDao.insert(boardLog);

     return count;

   }
   
   public int remove(int vno, String ip) {
     int count = vboardDao.delete(vno);
     
     BoardLogVo boardLog = new BoardLogVo();
     boardLog.setIp(ip);
     boardLog.setActionType(BoardLogVo.ACTION_DELETE);
     boardLog.setBoardNo(vno);
     boardLogDao.insert(boardLog);
     
     return count;
   }
   
   public int change(VboardVo vboard, String ip) {
     int count = vboardDao.update(vboard);
     
     
     System.out.println(vboard.getTitle() + "22222");
     BoardLogVo boardLog = new BoardLogVo();
     boardLog.setIp(ip);
     boardLog.setActionType(BoardLogVo.ACTION_UPDATE + "1111");
     boardLog.setBoardNo(vboard.getVno());
     boardLogDao.insert(boardLog);
     
     System.out.println(vboard.getVno());

     return count;
   }
   
   // 답변처리------------------------------------------------------------------------------------------
   
//  public int replyChange(VboardVo vboard, String ip) {
//    int count = vboardDao.replyUpdate(vboard);
//    
//    BoardLogVo boardLog = new BoardLogVo();
//    boardLog.setIp(ip);
//    boardLog.setActionType(BoardLogVo.ACTION_UPDATE + "1111");
//    boardLog.setBoardNo(vboard.getVno());
//    boardLogDao.insert(boardLog);
//    
//    return count;
//  }
//  public int replyAdd(VboardVo vboard, String ip) {
//    int count = vboardDao.replyInsert(vboard);
//    
//    BoardLogVo boardLog = new BoardLogVo();
//    boardLog.setIp(ip);
//    boardLog.setActionType(BoardLogVo.ACTION_INSERT);
//    boardLog.setBoardNo(vboard.getVno());
//    boardLogDao.insert(boardLog);
//    
//    return count;
//  }
//  
//  public int replyRemove(int vno, String ip) {
//    
//    int count = vboardDao.replyDelete(vno);
//    
//    BoardLogVo boardLog = new BoardLogVo();
//    boardLog.setIp(ip);
//    boardLog.setActionType(BoardLogVo.ACTION_DELETE);
//    boardLog.setBoardNo(vno);
//    boardLogDao.insert(boardLog);
//    
//    return count;
//    
//  }

//  public List<VboardVo> getTable(int startIndex, int pageSize) {
//
//    HashMap<String, Object> sqlParams = new HashMap<String, Object>();
//    sqlParams.put("startIndex", startIndex);
//    sqlParams.put("pageSize", pageSize);
//
//    return vboardDao.getTable(sqlParams);
//  }
  
  public List<VboardVo> list(
      int startIndex, int pageSize, String word, String order) {
    
    HashMap<String,Object> sqlParams = new HashMap<String,Object>();
    sqlParams.put("startIndex", startIndex);
    sqlParams.put("pageSize", pageSize);
    sqlParams.put("word", word);
    sqlParams.put("order", order);
    
    return vboardDao.selectList(sqlParams);
  }

//  public List<ReplyVo> selectReply(int vno) {
//
//    HashMap<String, Object> sqlParams = new HashMap<String, Object>();
//    sqlParams.put("vno", vno);
////    sqlParams.put("pageSize", pageSize);
//
//    return replyDao.selectReply(sqlParams);
//  }

  
   
}
