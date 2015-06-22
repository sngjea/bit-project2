package net.bitacademy.java67.dao;

import java.util.List;
import java.util.Map;

import net.bitacademy.java67.domain.BoardVo;
import net.bitacademy.java67.domain.VoteVo;

/* 실습 내용: DAO를 인터페이스로 정의하기 */

public interface VoteDao {
  int insert(VoteVo vote);
  
  List<VoteVo> selectList(Map<String,Object> paramMap);  
  
  int countAll(String word);
  
  VoteVo selectOne(int no);
  
  int delete(int no);
  
  int update(VoteVo vote);
  
  int check(int id);

}











