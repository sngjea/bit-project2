package net.bitacademy.java67.web;

import java.io.File;
import java.util.HashMap;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.bitacademy.java67.dao.BoardDao;
import net.bitacademy.java67.dao.VoteDao;
import net.bitacademy.java67.domain.BoardVo;
import net.bitacademy.java67.domain.VoteVo;
import net.bitacademy.java67.service.BoardService;
import net.bitacademy.java67.service.VoteService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

@Controller
@RequestMapping("/vote")
public class VoteController {
	@Autowired
	VoteService voteService;
	@Autowired
	ServletContext ctx;

	@Autowired
	VoteDao voteDao;


	@RequestMapping(value="/set",method=RequestMethod.POST)
	public String login(String id,HttpServletResponse response, HttpSession session) {




		session.setAttribute("userID", id);
		System.out.println(session.getAttribute("userID"));
		System.out.println(session.toString());
		System.out.println("into vote/set");
		return "redirect:../home.html";

	}
	
	@RequestMapping("/sessionCheck") 
	public String sessionCheck(HttpSession session) {
		System.out.println("sessionCheck executing");
		System.out.println(session.getAttribute("userID"));
		if (session.getAttribute("userID") != null) {
			return "redirect:../home.html";
		}
		return "redirect:../";
	}
	
	 @RequestMapping("/exitListUpdate")
	  public Object exitListUpdate(int no, HttpServletRequest request) throws Exception {
	    voteService.exitListUpdate(no, request.getRemoteAddr());
	    System.out.println("in exitListUpdate");
	    HashMap<String, Object> responseData = new HashMap<String, Object>();
	    responseData.put("status", "success");
	    return responseData;
	  }


	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		Gson gson = new Gson();
		System.out.println(session.getAttribute("userID"));
		System.out.println(session.toString());
		System.out.println("into vote/logout");
		session.invalidate();
		return "redirect:../";
	}



	@RequestMapping("/add")
	public String add(
			MultipartFile photo1,
			MultipartFile photo2,
			VoteVo vote,
			HttpServletRequest request,
			HttpSession session,
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
		vote.setUserID((String)session.getAttribute("userID"));
		String fileName1 = createFileName(photo1);
		String fileName2 = createFileName(photo2);

		photo1.transferTo(new File(ctx.getRealPath("/upload") + "/" + fileName1));
		photo2.transferTo(new File(ctx.getRealPath("/upload") + "/" + fileName2));

		if(session.getAttribute("userID") == null) {
			return "redirect:./?erorr:10";
		}

		vote.setUserID((String)session.getAttribute("userID"));
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
		System.out.println(vote.getNo());
		return "redirect:../showMyVote.html?no="+vote.getNo();
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

	@RequestMapping("/IDcheck")
	public String check(VoteVo vote, HttpServletRequest request,
			HttpSession session) throws Exception {

		System.out.println("into IDcheck");
		System.out.println(vote.getUserID());
		System.out.println(vote.getUserName());
		voteService.check(vote, request.getRemoteAddr());

		session.setAttribute("userID", vote.getUserID());
		session.setAttribute("userName", vote.getUserName());
		System.out.println("session's userID: " + session.getAttribute("userID"));
		return "redirect:../home.html";
	}

	@RequestMapping("/getVoteTable")
	public Object getVoteTable(
			@RequestParam(required=false,defaultValue="1") int pageNo,
			@RequestParam(required=false,defaultValue="3") int pageSize
			) throws Exception {
		System.out.println("into getVoteTable function");

		//	  HashMap<String,Object> sqlParams = new HashMap<String,Object>();
		//	    sqlParams.put("tno",tno);

		HashMap<String,Object> responseData = new HashMap<String,Object>();

		responseData.put("status", "success");
		responseData.put("data",
				voteService.getVoteTable(
						getStartIndexOfPage(pageNo, pageSize),pageSize));

		System.out.println("1");
		return responseData;


	}
	@RequestMapping("/getMyVoteEndTable")
	public Object getVoteEndTable(
			@RequestParam(required=false,defaultValue="1") int pageNo,
			@RequestParam(required=false,defaultValue="3") int pageSize,
			HttpSession session
			) throws Exception {
		System.out.println("into getMyVoteEndTable function");
		
		//	  HashMap<String,Object> sqlParams = new HashMap<String,Object>();
		//	    sqlParams.put("tno",tno);
		
		HashMap<String,Object> responseData = new HashMap<String,Object>();
		
		responseData.put("status", "success");
		responseData.put("data",
				voteService.getMyVoteEndTable(
						getStartIndexOfPage(pageNo, pageSize),pageSize,(String)session.getAttribute("userID")));
		
		System.out.println("1");
		return responseData;
		
		
	}
	@RequestMapping("/getMyVoteIngTable")
	public Object getVoteIngTable(
			@RequestParam(required=false,defaultValue="1") int pageNo,
			@RequestParam(required=false,defaultValue="3") int pageSize,
			HttpSession session
			) throws Exception {
		System.out.println("into getMyVoteIngTable function");
		
		//	  HashMap<String,Object> sqlParams = new HashMap<String,Object>();
		//	    sqlParams.put("tno",tno);
		
		HashMap<String,Object> responseData = new HashMap<String,Object>();
		
		responseData.put("status", "success");
		responseData.put("data",
				voteService.getMyVoteIngTable(
						getStartIndexOfPage(pageNo, pageSize),pageSize,(String)session.getAttribute("userID")));
		
		System.out.println("1");
		System.out.println("1");
		return responseData;
		
		
	}
	
	@RequestMapping("/getHotVoteTable")
	public Object getHotVoteTable(
			@RequestParam(required=false,defaultValue="1") int pageNo,
			@RequestParam(required=false,defaultValue="3") int pageSize
			) throws Exception {
		System.out.println("into getVoteTable function");
		
		//	  HashMap<String,Object> sqlParams = new HashMap<String,Object>();
		//	    sqlParams.put("tno",tno);
		
		HashMap<String,Object> responseData = new HashMap<String,Object>();
		
		responseData.put("status", "success");
		responseData.put("data",
				voteService.getVoteTable(
						getStartIndexOfPage(pageNo, pageSize),pageSize));
		
		System.out.println("1");
		return responseData;
		
		
	}
	
	@RequestMapping("/getMyVoteTable")
	public Object getMyVoteTable(
			@RequestParam(required=false,defaultValue="1") int pageNo,
			@RequestParam(required=false,defaultValue="3") int pageSize,
			HttpSession session
			) throws Exception {
		System.out.println("into getMyssVoteTable function");

		//	  HashMap<String,Object> sqlParams = new HashMap<String,Object>();
		//	    sqlParams.put("tno",tno);
		System.out.println(session.getAttribute("userID"));
		HashMap<String,Object> responseData = new HashMap<String,Object>();

		responseData.put("status", "success");
		responseData.put("data",
				voteService.getMyVoteTable(
						getStartIndexOfPage(pageNo, pageSize),
						pageSize,
						(String)session.getAttribute("userID")));

		System.out.println("2");
		return responseData;


	}
	private int getStartIndexOfPage(int pageNo, int pageSize) {
		return (pageNo - 1) * pageSize;
	}  

	//	private int countTotalPage(int pageSize, int totalRecords) {
	//	    int maxPage = totalRecords / pageSize;
	//	    if (totalRecords % pageSize > 0) {
	//	      maxPage++;
	//	    }
	//	    return maxPage;
	//	  }

	@RequestMapping("/change")
	public String change(VoteVo vote, HttpServletRequest request,
			MultipartFile photo1,
			MultipartFile photo2
			) throws Exception {
		String fileName1 = createFileName(photo1);
		String fileName2 = createFileName(photo2);
		photo1.transferTo(new File(ctx.getRealPath("/upload") + "/" + fileName1));
		photo2.transferTo(new File(ctx.getRealPath("/upload") + "/" + fileName2));
		vote.setPhotoOne(fileName1);
		vote.setPhotoTwo(fileName2);
		voteService.change(vote, request.getRemoteAddr());
		System.out.println("in");
		return "redirect:../showMyVote.html?no="+vote.getNo();
	}
	@RequestMapping("/selectOne")
	public Object selectOne(String no, HttpServletRequest request) throws Exception {
		System.out.println("no : " + no);
		System.out.println(" in selectOne");
		HashMap<String,Object> responseData = new HashMap<String,Object>();
		responseData.put("status", "success");
		System.out.println();
		responseData.put("data", voteDao.selectOne(Integer.parseInt(no)));
		return responseData;
	}

	@RequestMapping("/delete")
	public String delete(String no, HttpServletRequest request) throws Exception {
		System.out.println("in delete");
		System.out.println("in delete no : "+ no );
		voteService.remove(Integer.parseInt(no), request.getRemoteAddr());
		return "redirect:../myVote.html";
	}
	
	@RequestMapping("/voteCount")
	public Object voteCount(VoteVo vote, HttpServletRequest request) throws Exception {
		System.out.println("in voteCount no : "+ vote.getNo() );
		HashMap<String,Object> responseData = new HashMap<String,Object>();
		if(vote.getVoteCount1() != 0) {
			System.out.println("1");
			voteService.voteCount1(vote.getNo(), request.getRemoteAddr());
		} 

		if(vote.getVoteCount2() != 0) {
			System.out.println("2");
			voteService.voteCount2(vote.getNo(), request.getRemoteAddr());

		}
		responseData.put("status", "success");
		responseData.put("data", 
				voteService.selectOne(vote.getNo(), request.getRemoteAddr()));

		System.out.println(responseData.get("data"));
		return responseData;
	}

	//  @RequestMapping("/vdetail")
	//  public String detail(int no, Model model) throws Exception {
	//    model.addAttribute("board", voteService.get(no));
	//    
	//    return "board/BoardDetail";
	//  }

}










