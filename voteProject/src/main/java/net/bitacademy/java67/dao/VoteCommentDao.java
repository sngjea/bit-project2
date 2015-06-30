package net.bitacademy.java67.dao;

import java.util.List;
import java.util.Map;

import net.bitacademy.java67.domain.VoteCommentVo;

/* 실습 내용: DAO를 인터페이스로 정의하기 */

public interface VoteCommentDao {
  
  List<VoteCommentVo> selectList(int userID);  
  

}











