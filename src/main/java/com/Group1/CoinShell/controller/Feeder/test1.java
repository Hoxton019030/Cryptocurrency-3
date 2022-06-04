//package com.Group1.CoinShell.controller.Feeder;
//
//import java.time.LocalDate;
//import java.util.List;
//
//import javax.servlet.http.HttpSession;
//
//import org.json.JSONArray;
//import org.json.JSONObject;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.scheduling.annotation.Scheduled;
//import org.springframework.stereotype.Component;
//
//import com.Group1.CoinShell.model.Feeder.Coin;
//import com.Group1.CoinShell.model.Feeder.CoinDao;
//import com.Group1.CoinShell.model.Feeder.SetPrice;
//import com.Group1.CoinShell.model.Feeder.Watch;
//import com.Group1.CoinShell.model.Yiwen.Members;
//import com.Group1.CoinShell.model.Yiwen.MembersDao;
//import com.Group1.CoinShell.service.Feeder.CoinService;
//import com.Group1.CoinShell.service.Feeder.SetPriceService;
//import com.Group1.CoinShell.service.Feeder.WatchService;
//
//@Component
//public class test1 {
//
////	@Autowired
////	private CoinService coinService;
//	@Autowired
//	private CoinDao coinDao;
//	
//	private static MembersDao membersdao;
//	private static CoinService coinService;
//	private static WatchService watchService;
//	private static SetPriceService setPriceService;
//	
//	@Scheduled(initialDelay = 2000, fixedRate = 30000)
//	public static void test() {
////	public static void main(String[] args) {
//		
////		Integer memId1 = membersdao.findMemberByEMail("nbhd0320@gmail.com").getId();
////		Integer memId2 = membersdao.findMemberByEMail("").getId();
////		Integer memId3 = membersdao.findMemberByEMail("").getId();
////		Integer memId4 = membersdao.findMemberByEMail("").getId();
//	
//		
//		LocalDate todaysDate = LocalDate.now();
//		System.out.println(todaysDate);
////		SetPrice setPrice = new SetPrice();
////		
////		setPrice.setMemberId(1);
////		setPrice.setCoinId(1);
////		setPrice.setSetPrice(1);
////		setPriceService.save(setPrice);
////		String coin1 = coinService.findById1(75).getId();
////		String coin2 = coinService.findById1(77).getName();
////		String coin3 = coinService.findById1(15).getName();
//		
////		Watch watch = new Watch();
////		watch.setMemberId(memId1);
////		watch.setCoinId(52);
////		watchService.save(watch);
//		
//		//透過memId找到所有memId的List
////		List<Watch> watchMemId = watchService.findByMemberId(memId1);
////		System.out.println(watchMemId);
////		
////		//LIST格式
////		for(int i = 0; i < watchMemId.size(); i++) {
////			String coinName = watchMemId.get(i).getCoinId();
////			System.out.println("list==" + coinName);
////		}
//		
////		//JSON格式
////		JSONArray jArray = new JSONArray(watchMemId);
////		System.out.println(jArray);
////		
////		for(Object obj : jArray) {
////			JSONObject jo = (JSONObject) obj;
////			String coinName = jo.getString("coinName");
////			System.out.println("json==" + coinName);
////		}
//		
//			
//	}
//	
//	@Autowired
//	public void setWatchService(WatchService watchService) {
//		this.watchService = watchService;
//	}
//	
//	@Autowired
//	public void setMembersDao(MembersDao membersDao) {
//		this.membersdao = membersDao;
//	}
//	
//	@Autowired
//	public void setCoinService(CoinService coinService) {
//		this.coinService = coinService;
//	}
//	
//	@Autowired
//	public void setSetPriceService(SetPriceService setPriceService) {
//		this.setPriceService = setPriceService;
//	}
//	
//
//}
