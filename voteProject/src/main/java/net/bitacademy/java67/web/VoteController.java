package net.bitacademy.java67.web;

import javax.servlet.http.HttpServletRequest;

import net.bitacademy.java67.domain.BoardVo;
import net.bitacademy.java67.domain.VoteVo;
import net.bitacademy.java67.service.BoardService;
import net.bitacademy.java67.service.VoteService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/vote")
public class VoteController {
  @Autowired
  VoteService voteService;
  
  @RequestMapping("/list")
  public String list(
      @RequestParam(required=false,defaultValue="1") int pageNo, 
      @RequestParam(required=false,defaultValue="3") int pageSize, 
      @RequestParam(required=false) String word, 
      @RequestParam(required=false) String order, 
      Model model) throws Exception {

    model.addAttribute("list", voteService.list(
        getStartIndexOfPage(pageNo, pageSize), pageSize, word, order));
    model.addAttribute("pageNo", pageNo);
    model.addAttribute("pageSize", pageSize);
    model.addAttribute("maxPage", countTotalPage(
                                    pageSize, voteService.size(word)));
    
    return "vote/BoardList";
  }

  private int getStartIndexOfPage(int pageNo, int pageSize) {
    return (pageNo - 1) * pageSize;
  }

  private int countTotalPage(int pageSize, int totalRecords) {
    int maxPage = totalRecords / pageSize;
    if (totalRecords % pageSize > 0) {
      maxPage++;
    }
    return maxPage;
  }
  
  @RequestMapping("/add")
  public String add(VoteVo vote, HttpServletRequest request) throws Exception {
	  System.out.println(vote.getTitle());
	  System.out.println(vote.getNo());
	  System.out.println(vote.getContent());
    voteService.add(vote, request.getRemoteAddr());
    
    return "redirect: 재민와_톰캣vote/add";
  }
  
  @RequestMapping("/change")
  public String change(VoteVo vote, HttpServletRequest request) throws Exception {
    voteService.change(vote, request.getRemoteAddr());
    System.out.println("in");
    return "redirect:list.do";
  }
  
  @RequestMapping("/delete")
  public String delete(int no, HttpServletRequest request) throws Exception {
    voteService.remove(no, request.getRemoteAddr());
    
    return "redirect:list.do";
  }
  
  @RequestMapping("/detail")
  public String detail(int no, Model model) throws Exception {
    model.addAttribute("board", voteService.get(no));
    
    return "board/BoardDetail";
  }

}










