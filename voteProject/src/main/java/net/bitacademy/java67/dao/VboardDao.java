package net.bitacademy.java67.dao;

import java.util.List;
import java.util.Map;

import net.bitacademy.java67.domain.VboardVo;

public interface VboardDao {
  
  int insert(VboardVo vboard);
  
  List<VboardVo> selectList(Map<String,Object> paramMap);
  
  int countAll(String word);
  
  VboardVo selectOne(int vno);
  
  int delete(int vno);
  
  int update(VboardVo vboard);
  
  VboardVo userIDcheck(VboardVo vboard);


//  int replyUpdate(VboardVo vboard);
//
//  int replyInsert(VboardVo vboard);
//
//  int replyDelete(int vno);


  // 댓글

//  int selectReply(int vno);
  
  
  

  


}
