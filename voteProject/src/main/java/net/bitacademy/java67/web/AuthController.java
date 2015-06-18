package net.bitacademy.java67.web;

import java.util.HashMap;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.bitacademy.java67.dao.UserDao;
import net.bitacademy.java67.domain.UserVo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/* 실습 목표: 이메일 저장을 쿠키로 처리하기 */

@Controller
@RequestMapping("/cookie")
public class AuthController {
  @Autowired
  UserDao userDao;
  
  
  @RequestMapping(value="/set",method=RequestMethod.POST)
  public String login(String id,HttpServletResponse response, HttpSession session) {
    
   
    
    
      session.setAttribute("id", id);
      return "redirect:../board/list.do";
      
  }
  
  @RequestMapping("/logout")
  public String logout(HttpSession session) {
    session.invalidate();
    return "redirect:login.do";
  }
}












