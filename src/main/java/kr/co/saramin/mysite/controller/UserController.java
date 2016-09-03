package kr.co.saramin.mysite.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.saramin.mysite.service.UserService;
import kr.co.saramin.mysite.vo.UserVo;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired		 				// context에게 주입해달라는 얘기 
	UserService userService; 
	
	@RequestMapping("/joinform")
	public String joinform(){
		return "/WEB-INF/views/user/joinform.jsp";	
	}
	
	@RequestMapping(value="/join", method=RequestMethod.POST)
	@ResponseBody 
	public String join( @ModelAttribute UserVo userVo ){
		userService.join(userVo);
		return "redirect:/user/loginform";
	}
	
	@RequestMapping("/loginform")
	public String loginform(){
		return "/WEB-INF/views/user/loginform.jsp";	}
	

	@RequestMapping(value="/login")
	public String login( HttpSession session, @ModelAttribute UserVo userVo ){
		UserVo authUser = userService.login(userVo);
		
		if (authUser == null){
			return "redirect:/user/loginform?result=fail";
		}
		// 인증처리
		session.setAttribute("authUser", authUser);
		return "redirect:/index";		// 주의 전체 url아님 
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session){
		session.removeAttribute("authUser");
		session.invalidate();
		return "redirect:/index";
	}
}
