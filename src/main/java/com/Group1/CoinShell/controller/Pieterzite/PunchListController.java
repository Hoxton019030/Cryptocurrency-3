package com.Group1.CoinShell.controller.Pieterzite;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.Group1.CoinShell.model.Pieterzite.PunchList;
import com.Group1.CoinShell.model.Yiwen.Members;
import com.Group1.CoinShell.service.Pieterzite.PunchListService;
import com.Group1.CoinShell.service.Pieterzite.RewardService;
import com.Group1.CoinShell.service.Yiwen.MembersService;

@Controller
public class PunchListController {

	@Autowired
	private PunchListService punchListService;

	@Autowired
	private RewardService rewardService;

	@Autowired
	private MembersService membersService;

	// 點擊 shop 連結到的頁面
	@GetMapping("/shop/myshell")
	public String goShop() {
		return "shop/MyShell";
	}
	
	
	@GetMapping("shop/OK") // 進行簽到
	public String goPunch(Model model, @RequestParam("Id") int id) {

		// 執行簽到並更新簽到表 (不包括獎勵)
		PunchList result = punchListService.goPunchIn(id);
		
		
		// 判斷
		if (result == null) {
			model.addAttribute("message", "未滿24小時不可再次簽到");
		}
		else {
			model.addAttribute("message", "簽到成功");

			// 獲取今天對應的獎勵
			int reward = rewardService.getReward(result.getPunchCount()%7);
			
			model.addAttribute("getReward", reward);
			// 計算獎勵 回傳給Member
			Members member = membersService.countReward(id, reward);
			// 儲存要回傳的使用者資料
			
			model.addAttribute("member", member);
			System.out.println("0000000");
		}
		return "punchOK";
	}

}
