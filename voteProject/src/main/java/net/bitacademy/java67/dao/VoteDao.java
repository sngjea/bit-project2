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

  VoteVo selectIng(int no);
  
  VoteVo selectEnd(int no);
  
  int delete(int no);
  
  int update(VoteVo vote);
  
  VoteVo userIDcheck(VoteVo vote);
  
  List<VoteVo> getVoteTable(Map<String,Object> paramMap);
  
  List<VoteVo> getMyVoteEndTable(Map<String,Object> paramMap);
  
  List<VoteVo> getMyVoteIngTable(Map<String,Object> paramMap);
  
  List<VoteVo> getMyVoteTable(Map<String,Object> paramMap);
  
  List<VoteVo> getHotVoteTable(Map<String,Object> paramMap);

  int voteCount1(int voteCount1);
  
  int voteCount2(int voteCount2);
  
  int exitVoteUpdate(int no);
}











