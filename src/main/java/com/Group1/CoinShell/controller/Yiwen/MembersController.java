package com.Group1.CoinShell.controller.Yiwen;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.Group1.CoinShell.model.Yiwen.Members;
import com.Group1.CoinShell.model.Yiwen.MembersDao;
import com.Group1.CoinShell.service.Yiwen.MembersService;

@Controller
public class MembersController {
	
	@Autowired
	MembersService memService;
	
	@Autowired
	MembersDao dao;
	
	@GetMapping("/signup")
	public String signupPage(Model model) {
		model.addAttribute("memberBean", new Members());
		return "signup";
	}
	
//	@PostMapping("/signup")
//	public String postSignUp(@ModelAttribute("memberBean") Members members) {
//		SimpleDateFormat sdf = new SimpleDateFormat();
//		Date date = new Date();
//		// TODO: 之後要寫沒有填 email /pwd 註冊失敗的條件式
//		sdf.applyPattern("yyyy-MM-dd HH:mm:ss");
//		members.setCustomizedUserName("defaultUser");
//		members.setCustomizedUserAvatar("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAUIAAADmCAIAAAAvNRuHAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAAFiUAABYlAUlSJPAAAADuSURBVHhe7cExAQAAAMKg9U/tawggAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA4NWT3AAHCzkfXAAAAAElFTkSuQmCC");
//		members.setMyShell(0);
//		members.setJoinTime(date);
//		Members resMem = dao.save(members);
//		memService.insert(resMem);
//		memService.save(members);
//		return "signupOK";
//	}
	
	@PostMapping("/signup")
	public String signUp(@RequestParam("e-mail")String eMail ,@RequestParam("password") String password) {
		SimpleDateFormat sdf = new SimpleDateFormat();
		Date date = new Date();
		Members member = new Members();
		member.setCustomizedUserAvatar(5);
		member.setMyShell(1000);
		member.setCoin(1000);
		member.seteMail(eMail);
		member.setJoinTime(date);
		member.setPassword(password);
		member.setCustomizedUserName("New User");
		// if (DAO.findMemberByEMail()){
		// return "/index";
		// }else{
		memService.save(member);
		return "signupOK";
	}
	
	@GetMapping("/account/set")
	public String getAccountSet(Model model) {
		model.addAttribute("memberBean", new Members());
		return "/account/set";
	}
	
	@GetMapping("/account/referral")
	public String getReferral(Model model) {
		model.addAttribute("memberBean", new Members());
		return "/account/referral";
	}
	
	@GetMapping("/aboutUs/intro")
	public String getIntro() {
		return "aboutUs/intro";
	}
	
	@GetMapping("/account/privacy")
	public String getPrivacy() {
		return "account/privacy";
	}
	
	@GetMapping("/account/cookie")
	public String getCookie() {
		return "account/cookie";
	}
	

	@GetMapping("/login")
	public String getloginPage(Model model) {
		model.addAttribute("memberBean", new Members());
		return "login";
	}

	
	@PostMapping("/login")
	public String postLogin(@RequestParam("eMail") String eMail, 
			HttpSession httpSession, RedirectAttributes redirectAttributes) {
		Members memRes = dao.findMemberByEMail(eMail);
		
		if(memRes == null) {
			redirectAttributes.addFlashAttribute("loginError", "帳號密碼錯誤，請重新輸入");
			return "redirect:/";
		}
		httpSession.setAttribute("login", memRes);
		return "index";
	}
	
	
//	public String updateAvatar() {
//		
//		return null;
//	}
	
	@GetMapping("/logout")
	public String LogOut(HttpSession httpSession, HttpServletRequest request, HttpServletResponse response,
			RedirectAttributes redirectAttributes) {
		request.getSession().invalidate();
		Cookie[] cookies = request.getCookies();
		for (Cookie c : cookies) {
			if (c.getName().equals("JSESSIONID")) {
				c.setMaxAge(0);
				break;
			}
		}
		return "redirect:/";
		
	}
	
	@PostMapping("account/selectAvatar")
	public String updateCustomizedUserAvatarById(@RequestParam("id") Integer id, @RequestParam("radio-emotion") Integer avatarId) {
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@id="+id);
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@number="+avatarId);
		
		
		memService.updateCustomizedUserAvatarById(id, avatarId);
		return "redirect:/account/set";
		
	}
	
	
		
//		Members resMem = memService.findMemberByEMail(members.geteMail());
//		if(resMem.getPassword().equals(members.getPassword())){
//			System.out.println("登入成功");
//		}else {
//			System.out.println("登入失敗");
//		}


	
//	public String postSignUp(@ModelAttribute("memberBean") Members members) {
//		
//	}
	
//	@GetMapping("/signup")
//	public String signupPage() {
//		return "signup";
//	}
	
//	@PostMapping("/signup")
//	public String postForm(@ModelAttribute("memberBean") Members members) {
//		System.out.println(members.geteMail());
//		System.out.println(123);
//		return "loginOK";
//	}
	
	@PostMapping("")
	public String selectAvatar(@Param("emotion") Integer customizedUserAvatar) {
		return null;
	}
	

}
