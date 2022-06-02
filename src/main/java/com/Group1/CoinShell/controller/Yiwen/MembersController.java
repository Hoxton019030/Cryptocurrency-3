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
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.Group1.CoinShell.model.Yiwen.Members;
import com.Group1.CoinShell.model.Yiwen.MembersDao;
import com.Group1.CoinShell.service.Hoxton.EmailSenderService;
import com.Group1.CoinShell.service.Yiwen.MembersService;

@Controller
public class MembersController {
	
	@Autowired
	MembersService memService;
	
	@Autowired
	EmailSenderService senderService;
	
	@Autowired
	MembersDao dao;
	
	@GetMapping("/signup")
	public String signupPage(Model model) {
		model.addAttribute("memberBean", new Members());
		return "signup";
	}	
	
	@PostMapping("/signup")
	public String signUp(@RequestParam("e-mail")String eMail ,@RequestParam("password") String password) {
		SimpleDateFormat sdf = new SimpleDateFormat();
		senderService.sendEmail(eMail, "恭喜你註冊CoinShell會員！", "歡迎你"+eMail+"！　\r\n 一起在虛擬貨幣的海洋中漫遊吧！");
		Date date = new Date();
		Members member = new Members();
		member.setCustomizedUserAvatar(5);
		member.setMyShell(1000);
		member.setCoin(1000);
		member.seteMail(eMail);
		member.setJoinTime(date);
		member.setPassword(password);
		member.setCustomizedUserName("New User");
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
		memService.updateCustomizedUserAvatarById(id, avatarId);
		return "redirect:/account/set";
	}
	
	
	@PostMapping("")
	public String selectAvatar(@Param("emotion") Integer customizedUserAvatar) {
		return null;
	}
	
	@PostMapping("account/changeUsername")
	public String updateCustomizedUserNameById
	(@RequestParam("customizedUserName")String customizedUserName,
			@RequestParam("eMail")String eMail,
			@RequestParam("id")Integer id,
			HttpSession httpSession) {
		memService.updateCustomizedUserNameById(customizedUserName, id);
		Members member = memService.findMemberByEMail(eMail);
		httpSession.setAttribute("login", member);
		return "/account/set";
	}
	
	@PostMapping("account/sendResetEmail")
	public String sendResetEmail
	(@RequestParam("eMail")String eMail) {
		senderService.sendEmail(eMail, "重置密碼認證信", "更改你的密碼呦");
		return "redirect:/";
	}
	
	
//	@GetMapping("account/resetPassword")
//	public String resetPassword
//	(@RequestParam("id"))
	
	

}
