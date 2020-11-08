package com.human93.dotori00;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.human93.VO.MemberVO;
import com.human93.service.dotoriService;

@Controller
public class UserLogin {
	
	@Autowired
	dotoriService service;
	//spring은 싱글톤으로 객체 주입
	
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String loginForm() {
		System.out.println("Login controller");
		return "login";
	}
	
	@RequestMapping(value="/loginPro",method=RequestMethod.POST)
	public String loginProcess(HttpSession session,@RequestParam("uid") String id,@RequestParam("upwd") String pwd) {
		System.out.println("loginPro controller");
		String returnURL="";
		if(session.getAttribute("login")!=null) {
			session.removeAttribute("login");
		}
		MemberVO vo=service.selectOne(id);
		if(vo!=null && vo.getPwd().equals(pwd)) {
			session.setAttribute("login", vo);
			returnURL="redirect:/MemberStart";
		}else {
			returnURL="redirect:/login";
			//메세지 같이 보내기 
		}
		return returnURL;	
	}
	@RequestMapping(value="/logoutPro",method=RequestMethod.GET)
	public String logoutProcess(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
}
