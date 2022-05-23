package com.Group1.CoinShell.controller.Yiwen;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

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
	
	@PostMapping("/signup")
	public String postSignUp(@ModelAttribute("memberBean") Members members) {
		SimpleDateFormat sdf = new SimpleDateFormat();
		Date date = new Date();
		sdf.applyPattern("yyyy-MM-dd HH:mm:ss");
		members.setCustomizedUserName("defaultUser");
		members.setCustomizedUserAvatar("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAUIAAADmCAIAAAAvNRuHAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAAFiUAABYlAUlSJPAAAADuSURBVHhe7cExAQAAAMKg9U/tawggAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA4NWT3AAHCzkfXAAAAAElFTkSuQmCC");
		members.setMyShell(0);
		members.setJoinTime(date);
//		Members resMem = dao.save(members);
//		memService.insert(resMem);
		memService.save(members);
		return "signupOK";
		
	}
	
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
	

}
