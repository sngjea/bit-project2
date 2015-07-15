package net.bitacademy.java67.dao;

import java.util.List;

import net.bitacademy.java67.domain.ReplyVo;


public interface ReplyDao {
  

  //리스트에 담아줘야지 뽑힘 체크!!!
  List<ReplyVo> selectReply(int vno);

  int insert(ReplyVo replyVo);

  int delete(int rno);


  int update(ReplyVo replyVo);


//  List<ReplyVo> selectReply(HashMap<String, Object> sqlParams);
  

}
