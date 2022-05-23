package com.Group1.CoinShell.controller.Yiwen;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.Group1.CoinShell.model.Yiwen.Members;

@Controller
public class MembersController {

	@GetMapping("/signup")
	public String signupPage(Model model) {
		model.addAttribute("memberBean", new Members());
		return "coinshell/signup";
	}
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
