package net.bitacademy.java67.web;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.bitacademy.java67.dao.ReplyDao;
import net.bitacademy.java67.dao.VboardDao;
import net.bitacademy.java67.domain.ReplyVo;
import net.bitacademy.java67.domain.VboardVo;
import net.bitacademy.java67.service.VboardService;
import net.bitacademy.java67.service.VoteService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/vboard")
public class VboardController {

  @Autowired
  VboardService vboardService;
  
  @Autowired
  VoteService voteService;
  
  @Autowired
  VboardDao vboardDao;
  
  @Autowired
  ReplyDao replyDao;
  
  
  
  @RequestMapping("/list")
  public String list(
      @RequestParam(required=false,defaultValue="1") int pageNo, 
      @RequestParam(required=false,defaultValue="5") int pageSize, 
      @RequestParam(required=false) String word, 
      @RequestParam(required=false) String order, 
      Model model) throws Exception {

    model.addAttribute("list", vboardService.list(
        getStartIndexOfPage(pageNo, pageSize), pageSize, word, order));
    model.addAttribute("pageNo", pageNo);
    model.addAttribute("pageSize", pageSize);
    model.addAttribute("maxPage", countTotalPage(
                                    pageSize, vboardService.size(word)));
    
    return "vboard/list";
  }
  

  private int countTotalPage(int pageSize, int totalRecords) {
    int maxPage = totalRecords / pageSize;
    if (totalRecords % pageSize > 0) {
      maxPage++;
    }
    return maxPage;
  }
  
  
  @RequestMapping("/add")
  public String add(VboardVo vboard,HttpServletRequest request, HttpSession session) throws Exception {
    
    
    vboard.setUserID((String)session.getAttribute("userID"));
    System.out.println(vboard.getUserID()+ "되나?");
    vboardService.add(vboard, request.getRemoteAddr());
    
    return "redirect:list.do";
    
  }
  
//  @RequestMapping("/change")
//  public Object change(VboardVo vboard, HttpServletRequest request) throws Exception {
//    vboardService.change(vboard, request.getRemoteAddr());
//    
//    HashMap<String,Object> responseData = new HashMap<String,Object>();
//    
//    //db read
//    responseData.put("status", "success");
//    //put  dbread
//    
//    
//    return responseData;
//  }
  
  @RequestMapping("/change")
  public String change(VboardVo vboard, HttpServletRequest request) throws Exception {
    vboardService.change(vboard, request.getRemoteAddr());
    
    System.out.println(vboard.getVno());
    System.out.println(vboard.getTitle() + "11111");
    return "redirect:list.do";
  }
  
  @RequestMapping("/delete")
  public String delete(int vno, HttpServletRequest request) throws Exception {
    vboardService.remove(vno, request.getRemoteAddr());
    
    return "redirect:list.do";
  }
  
  @RequestMapping("/detail")
  public String detail(int vno, Model model) throws Exception {
    model.addAttribute("vboard", vboardService.get(vno));
    
    return "vboard/detail";
  }
  
  
  @RequestMapping("/replyDetail")
  public Object detail(int vno) throws Exception {
    System.out.println(vno +"컨트롤러 들어감");
    HashMap<String,Object> responseData = new HashMap<String,Object>();
    responseData.put("status", "success");
//    responseData.put("data", vboardService.selectReply(vno));
    responseData.put("data",replyDao.selectReply(vno));
    
    System.out.println(vno +"컨트롤러 나옴");
    return responseData;
  }
  
// 서비스 통과하는것 객체에 담는것
//  @RequestMapping("/replyDetail")
//  public Object detail(int vno) throws Exception {
//    System.out.println(vno +"컨트롤러 들어감");
//
//    //    HashMap<String,Object> sqlParams = new HashMap<String,Object>();
//    //      sqlParams.put("tno",tno);
//
//    HashMap<String,Object> responseData = new HashMap<String,Object>();
//
//    responseData.put("status", "success");
//    responseData.put("data",
//        vboardService.selectReply(vno));
//    
//    
//    System.out.println(vno +"컨트롤러 나옴");
//    return responseData;
//
//
//  }
  
  @RequestMapping("/replyAdd")
  public Object replyAdd(ReplyVo replyVo,  HttpSession session) throws Exception {
    replyVo.setUserID((String)session.getAttribute("userID"));
    replyDao.insert(replyVo);
    
    HashMap<String,Object> responseData = new HashMap<String,Object>();
    responseData.put("status", "success");
    
    return responseData;
  }
  
  @RequestMapping("/replyDelete")
  public Object delete(int rno) throws Exception {
    replyDao.delete(rno);
    
    HashMap<String,Object> responseData = new HashMap<String,Object>();
    responseData.put("status", "success");
    
    return responseData;
  }
  
  
  @RequestMapping("/replyChange")
  public Object update(ReplyVo replyVo) throws Exception{
     System.out.println(replyVo +"리플라이 업데이트1111");
     
           replyDao.update(replyVo);
    
    HashMap<String,Object> responseData = new HashMap<String,Object>();
    responseData.put("status", "success");
    System.out.println(replyVo +"리플라이 업데이트2222");

    return responseData;
  }
  
 
  
  //jquery------------------------------------------------------------------------
 
  private int getStartIndexOfPage(int pageNo, int pageSize) {
    return (pageNo - 1) * pageSize;
  }  
  
  
  //지우면 안됨
  @RequestMapping("/getVoteTable")
  public Object getVoteTable(
      @RequestParam(required=false,defaultValue="1") int pageNo,
      @RequestParam(required=false,defaultValue="3") int pageSize
      ) throws Exception {
    System.out.println("into getVoteTable function");

    //    HashMap<String,Object> sqlParams = new HashMap<String,Object>();
    //      sqlParams.put("tno",tno);

    HashMap<String,Object> responseData = new HashMap<String,Object>();

    responseData.put("status", "success");
    responseData.put("data",
        voteService.getVoteTable(
            getStartIndexOfPage(pageNo, pageSize),pageSize));

    System.out.println("1");
    return responseData;


  }
  
}