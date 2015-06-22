package net.bitacademy.java67.web;

import java.io.File;

import javax.servlet.ServletContext;
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
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/vote")
public class VoteController {
  @Autowired
  VoteService voteService;
  @Autowired
  ServletContext ctx;
//  @RequestMapping("/vlist")
//  public String list(
//      @RequestParam(required=false,defaultValue="1") int pageNo, 
//      @RequestParam(required=false,defaultValue="3") int pageSize, 
//      @RequestParam(required=false) String word, 
//      @RequestParam(required=false) String order, 
//      Model model) throws Exception {
//
//    model.addAttribute("list", voteService.list(
//        getStartIndexOfPage(pageNo, pageSize), pageSize, word, order));
//    model.addAttribute("pageNo", pageNo);
//    model.addAttribute("pageSize", pageSize);
//    model.addAttribute("maxPage", countTotalPage(
//                                    pageSize, voteService.size(word)));
//    
//    return "vote/BoardList";
//  }

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
  public String add(
		  MultipartFile photo1,
		  MultipartFile photo2,
		  VoteVo vote,
		  HttpServletRequest request,
		  Model model) throws Exception {
	  
	  System.out.println(vote.getTitle());
	  System.out.println(vote.getNo());
	  System.out.println(vote.getContent());
	  System.out.println(vote.getCategory());
	  System.out.println(vote.getPhotoTag1());
	  System.out.println(vote.getPhotoTag2());
	  System.out.println(photo1);
	  System.out.println(photo2);
	  String originalFilename01 = photo1.getOriginalFilename();
	   
	  String fileName1 = createFileName(photo1);
	  String fileName2 = createFileName(photo2);
	  
	  photo1.transferTo(new File(ctx.getRealPath("/upload") + "/" + fileName1));
	  photo2.transferTo(new File(ctx.getRealPath("/upload") + "/" + fileName2));
	  vote.setPhotoOne(fileName1);
	  vote.setPhotoTwo(fileName2);
    voteService.add(vote, request.getRemoteAddr());
    
    model.addAttribute("category", vote.getCategory());
    model.addAttribute("content", vote.getContent());
    model.addAttribute("photo1", fileName1 );
    model.addAttribute("photo2", fileName2);
    model.addAttribute("title", vote.getTitle());
    model.addAttribute("photoTag1", vote.getPhotoTag1());
    model.addAttribute("photoTag2", vote.getPhotoTag2());
    model.addAttribute("creatDate", vote.getCreateDate());
    
    return "vote/clicktovote";
  }
  
  int count = 0;
  
  
  synchronized private String createFileName(MultipartFile file) {
	  String originalFilename01 = file.getOriginalFilename();
	  int lastIndexForDot01 = originalFilename01.lastIndexOf(".");
	  String filename = System.currentTimeMillis() + "-" 
              + count() 
              + originalFilename01.substring(lastIndexForDot01);
	  return filename;
	  
  }
  synchronized private int count() {
	    if (count == 100) {
	      count = 0;
	    }
	    return ++count;
	  }
  
  @RequestMapping("/check")
  public String check(VoteVo vote, HttpServletRequest request) throws Exception {
	  System.out.println(vote.getNo());
	  Boolean i = voteService.check(vote, request.getRemoteAddr());
	  
	   	if(i) {
	   		System.out.println("뉴비 환영 ㅋ");
	   	}
	  return "redirect:home";
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
  
//  @RequestMapping("/vdetail")
//  public String detail(int no, Model model) throws Exception {
//    model.addAttribute("board", voteService.get(no));
//    
//    return "board/BoardDetail";
//  }

}










