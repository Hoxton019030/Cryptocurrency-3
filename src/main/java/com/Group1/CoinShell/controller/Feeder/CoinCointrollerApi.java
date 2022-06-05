package com.Group1.CoinShell.controller.Feeder;


import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.Group1.CoinShell.model.Feeder.Coin;
import com.Group1.CoinShell.model.Feeder.CoinDao;
import com.Group1.CoinShell.model.Feeder.SetPriceH;
import com.Group1.CoinShell.model.Feeder.SetPriceL;
import com.Group1.CoinShell.model.Feeder.StarDTO;
import com.Group1.CoinShell.model.Feeder.Watch;
import com.Group1.CoinShell.model.Yiwen.Members;
import com.Group1.CoinShell.service.Feeder.CoinService;
import com.Group1.CoinShell.service.Feeder.SetPriceHService;
import com.Group1.CoinShell.service.Feeder.SetPriceLService;
import com.Group1.CoinShell.service.Feeder.WatchService;
import com.Group1.CoinShell.service.Hoxton.EmailSenderService;
import com.fasterxml.jackson.core.JsonProcessingException;

@Component // 在 SpringbootdemoApplication 注入@EnableScheduling 搭配下面@Scheduled 以啟動定時器排程
@RestController
public class CoinCointrollerApi {

	private static final String Requestmethod = null;
	@Autowired
	private CoinService coinService;
	@Autowired
	private CoinDao coinDao;
	@Autowired
	private WatchService watchService;
	@Autowired
	private EmailSenderService senderService;
	@Autowired
	private SetPriceHService setPriceHService;
	@Autowired
	private SetPriceLService setPriceLService;
	                                                    // 需搭配@Component
//	@Scheduled(initialDelay = 2000, fixedRate = 60000)  // 定時器 啟動專案 initialDelay 毫秒 後啟動 每 fixedRate 毫秒 RUN一次
	@PostMapping("coin/insert")
	public void updateCoin() throws JsonProcessingException {
		// 測試定時器有沒有動 顯示當前時間
		System.out.println(LocalDateTime.now());

		// 取得網頁內容並生成JAVA字串物件 網址內容本身就是JSON字串 故不用再轉JSON格式
		String strUrl    = "https://api.coinmarketcap.com/data-api/v3/cryptocurrency/listing?start=1&limit=100&sortBy=market_cap&sortType=desc&convert=USD&cryptoType=all&tagType=all&audited=false";
		String coinstr   = coinService.getContent(strUrl);

		
		//產生 [{"id":1,"coid":1.....}] 的JSON字串 (用字串切割器把 標頭 及 尾段 多餘字串去掉) 以便 轉成JSONArray
		String coinstr1  = coinstr.substring(coinstr.indexOf("["), coinstr.lastIndexOf("]") + 1); // +1 為切到 " ] " 後面一個字元 ( 目的為保留 " ] ")

		
		//切好的字串 產生JSONArray
		JSONArray jArray = new JSONArray(coinstr1);

		if (jArray != null) {
			for (Object obj : jArray) {
				JSONObject jo = (JSONObject) obj;

				Integer coid    = jo.getInt("id");
				String  name    = jo.getString("name");
				String  symbol  = jo.getString("symbol");
				String  slug    = jo.getString("slug");
//				String  tags    = jo.getJSONArray("tags").toString();  //list 目前不會寫
				Integer cmcRank = jo.getInt("cmcRank");
				Integer marketPairCount   = jo.getInt("marketPairCount");
				Double  circulatingSupply = jo.getDouble("circulatingSupply");
				Integer selfRCSupply      = jo.getInt("selfReportedCirculatingSupply");
				Double  totalSupply       = jo.getDouble("totalSupply");
				
				//如果 沒有 "maxSupply" 這個key 則補 key : value 為  "maxSupply" : 0.0
				if(!jo.has("maxSupply")) {
					jo.put("maxSupply", 0.0);
				}
				
				Double  maxSupply        = jo.getDouble("maxSupply");
				Integer isActive         = jo.getInt("isActive");
				String  lastUpdated      = jo.getString("lastUpdated");
				String  dateAdded        = jo.getString("dateAdded");
				String  quotesName       = jo.getJSONArray("quotes").getJSONObject(0).getString("name"); //找到quotes下的第1層[]裡面的key
				Double  price            = jo.getJSONArray("quotes").getJSONObject(0).getDouble("price");
				Double  volume24h        = jo.getJSONArray("quotes").getJSONObject(0).getDouble("volume24h");
				Double  marketCap        = jo.getJSONArray("quotes").getJSONObject(0).getDouble("marketCap");
				Double  percentChange1h  = jo.getJSONArray("quotes").getJSONObject(0).getDouble("percentChange1h");
				Double  percentChange24h = jo.getJSONArray("quotes").getJSONObject(0).getDouble("percentChange24h");
				Double  percentChange7d  = jo.getJSONArray("quotes").getJSONObject(0).getDouble("percentChange7d");
				Double  percentChange30d = jo.getJSONArray("quotes").getJSONObject(0).getDouble("percentChange30d");
				Double  percentChange60d = jo.getJSONArray("quotes").getJSONObject(0).getDouble("percentChange60d");
				Double  percentChange90d = jo.getJSONArray("quotes").getJSONObject(0).getDouble("percentChange90d");
				Double  fullyDilluttedMarketCap  = jo.getJSONArray("quotes").getJSONObject(0).getDouble("fullyDilluttedMarketCap");
				Double  marketCapByTotalSupply   = jo.getJSONArray("quotes").getJSONObject(0).getDouble("marketCapByTotalSupply");
				Double  ytdPriceChangePercentage = jo.getJSONArray("quotes").getJSONObject(0).getDouble("ytdPriceChangePercentage");
				Double  dominance   = jo.getJSONArray("quotes").getJSONObject(0).getDouble("dominance");
				Double  turnover    = jo.getJSONArray("quotes").getJSONObject(0).getDouble("turnover");
				boolean isAudited   = jo.getBoolean("isAudited");
//				String  auditor     = jo.getJSONArray("auditInfoList").getJSONObject(0).getString("turnover");      //這個KEY有些幣沒有 寫了會報錯
//				Integer auditStatus = jo.getJSONArray("auditInfoList").getJSONObject(0).getInteger("auditStatus");  //這個KEY有些幣沒有 寫了會報錯
//				String  reportUrl   = jo.getJSONArray("auditInfoList").getJSONObject(0).getString("reportUrl");     //這個KEY有些幣沒有 寫了會報錯
				

				Coin coin = new Coin();
				
				coin.setId(coid); // 依照排名順序給ID的順序 因為要做更新 所以ID不能一直增加 故用cmcRank值只有1到100 (save方法:已經有id的值會自動變更新)
//				coin.setCoid(coid);  // 承上 也可以直接用cmcRank當作主key (在beans頁面的cmcRank上注入@id) 但我想要有id 所以用上面的方法
				coin.setName(name);
				coin.setSymbol(symbol);
				coin.setSlug(slug);
//				coin.setTags(tags);
				coin.setCmcRank(cmcRank);
				coin.setMarketPairCount(marketPairCount);
				coin.setCirculatingSupply(circulatingSupply);
				coin.setSelfReportedCirculatingSupply(selfRCSupply);
				coin.setTotalSupply(totalSupply);
				coin.setMaxSupply(maxSupply);
				coin.setIsActive(isActive);
				coin.setLastUpdated(lastUpdated);
				coin.setDateAdded(dateAdded);
				coin.setQuotesName(quotesName);
				coin.setPrice(price);
				coin.setVolume24h(volume24h);
				coin.setMarketCap(marketCap);
				coin.setPercentChange1h(percentChange1h);
				coin.setPercentChange24h(percentChange24h);
				coin.setPercentChange7d(percentChange7d);
				coin.setPercentChange30d(percentChange30d);
				coin.setPercentChange60d(percentChange60d);
				coin.setPercentChange90d(percentChange90d);
				coin.setFullyDilluttedMarketCap(fullyDilluttedMarketCap);
				coin.setMarketCapByTotalSupply(marketCapByTotalSupply);
				coin.setDominance(dominance);
				coin.setTurnover(turnover);
				coin.setYtdPriceChangePercentage(ytdPriceChangePercentage);
				coin.setAudited(isAudited);
//				coin.setAuditor(auditor);
//				coin.setAuditStatus(auditStatus);
//				coin.setReportUrl(reportUrl);

				Coin upCoin = coinDao.save(coin);
			}
		}

	}

	//定時從資料庫抓資料 到 路徑網址 預設/coin/getAll (已經在JSP AJAX設定輪詢 這邊就不用在訂時跟資料庫要資料了)
	//@Scheduled(initialDelay = 3000, fixedRate = 20000)
	@GetMapping("coin/getAll")
	public List<Coin> findAllcoin() {
		List<Coin> allCoinList = coinService.findAll();
		return allCoinList;
	}
	//http://localhost:8080/coinshell/coin/getAll
	
	@GetMapping("coin/getCoin")
	public List<Map<String, Object>> getCoin(HttpSession session) {
		
		Members member =(Members) session.getAttribute("login");
		
		List<Map<String, Object>> result;

		if(member != null) {
		Integer memId = member.getId();
		    result = coinService.getCoin(memId);
		} else {
		    result = coinService.getCoin();
		}

		return result; 
	}
	
	@PostMapping("coin/getSetCoin")
	public Map<String, String> insertSetCoin(@RequestBody StarDTO dto,HttpSession session) {
		
		Members member =(Members) session.getAttribute("login");
//		Integer memId = member.getId();
		String memEMail = member.geteMail();
		
		Integer memId = dto.getMemId();
		Integer coinId =dto.getCoinId();
		Float price =dto.getSetPrice(); 
		String type =dto.getType();
		
		System.out.println("MemId:   " + memId);
    	System.out.println("CoinId:   " + coinId);
    	System.out.println("setPrice:   " + price);
    	System.out.println("type:   " + type);
    	
    	String coinNAME = coinService.findByCoinId2(coinId).getName();
    	
    	if(type.equals("H")) {
    		SetPriceH setPriceH =new SetPriceH();
    		
        	setPriceH.setMemberId(memId);
        	setPriceH.setCoinId(coinId);
        	setPriceH.setSetPriceH(price);
        	setPriceHService.save(setPriceH);
        	
        	List<Map<String, Object>> heigher = coinService.getHeighSetCoin(memId);
        	
		if(heigher.size()!=0) {
			senderService.sendEmail(memEMail, "恭喜您設置的" + coinNAME + "達成目標", "恭喜您設置的 "+ coinNAME + " 價格高於 USD: " + price + " ,系統已為您清除設置條件");
			System.out.println("恭喜你=================================");
			setPriceHService.deletegetSetCoin(memId, coinId);
		}else {
			System.out.println("沒東西=================================");
			}
    	}
    	
    	if(type.equals("L")) {
    		SetPriceL setPriceL =new SetPriceL();
    		
        	setPriceL.setMemberId(memId);
        	setPriceL.setCoinId(coinId);
        	setPriceL.setSetPriceL(price);
        	setPriceLService.save(setPriceL);
        	
        	List<Map<String, Object>> lower = coinService.getLowerSetCoin(memId);
        	
		if(lower.size()!=0) {
			senderService.sendEmail(memEMail, "恭喜您設置的" + coinNAME + "達成目標", "恭喜您設置的 "+ coinNAME + " 價格低於 USD: " + price + " ,系統已為您清除設置條件");
			System.out.println("恭喜你=================================");
			setPriceLService.deletegetSetCoin(memId, coinId);
		}else {
			System.out.println("沒東西=================================");
			}
    	}
		
		Map<String, String> result = new HashMap<String, String>();
    	result.put("status", "200");
    	return result;
	}
	
	@DeleteMapping("coin/deletegetSetCoin/{id}")
    public Map<String, String> deletegetSetCoin(@RequestBody StarDTO dto) {
    	System.out.println("delete :  MemId =  "       + dto.getMemId());
    	System.out.println("delete :  CoinId =  " + dto.getCoinId());
    	
    	 Integer memId =dto.getMemId();
    	 Integer coinId =dto.getCoinId();
    	
    	 setPriceHService.deletegetSetCoin(memId,coinId);
    	 setPriceLService.deletegetSetCoin(memId,coinId);
    	
    	Map<String, String> result = new HashMap<String, String>();
    	result.put("status", "200");
    	return result;
    }
	
	
	//已經在JSP AJAX設定輪詢 這邊就不用在訂時跟資料庫要資料了
	@GetMapping("coin/page/{pageNumber}")
	public List<Coin> findByPage(@PathVariable Integer pageNumber) {
		Pageable pgb = PageRequest.of(pageNumber - 1, 10, Sort.Direction.ASC, "cmcRank");

		Page<Coin> page = coinDao.findAll(pgb);

		List<Coin> list = page.getContent();

		return list;
	}
	//http://localhost:8080/coinshell/coin/page/1
	@GetMapping("coin/getlastest")
	public Coin findLastestCurrencyInformation(@RequestParam("currencyName") String currencyName) {
		Coin lastestCoin=coinService.findLastestCurrencyInformation(currencyName);
		return lastestCoin;
		//http://localhost:8080/coinshell/coin/getlastest?currencyName=btc
		
	}
	
	//透過回傳NAME查詢
	@GetMapping("/watch")
	public List<Coin> watchCoinName(@RequestParam("name") String name) {
		
		List<Coin> coin = coinService.findByName(name);
		
		return coin;
	}
	
    @PostMapping("/insertWatch")
    public Map<String, String> insertWatch(@RequestBody StarDTO dto) {
    	
//    	Members member =(Members) session.getAttribute("login");
//    	Integer memId = member.getMemId();
//    	System.out.println(memId);
    	
    	System.out.println("MemId:   " + dto.getMemId());
    	System.out.println("CoinId:   " + dto.getCoinId());
    	
    	Watch watch = new Watch();
    	watch.setMemberId(dto.getMemId());
    	watch.setCoinId(dto.getCoinId());
    	watchService.save(watch);
    	
    	Map<String, String> result = new HashMap<String, String>();
    	result.put("status", "200");
    	return result;
    }
    @DeleteMapping("/deleteWatch/{id}")
    public Map<String, String> deleteWatch(@RequestBody StarDTO dto) {
    	System.out.println("delete :  MemId =  "       + dto.getMemId());
    	System.out.println("delete :  CoinId =  " + dto.getCoinId());
    	
    	 Integer memId =dto.getMemId();
    	 Integer coinId =dto.getCoinId();
    	
    	watchService.deleteByCoinId(memId,coinId);
    	
    	Map<String, String> result = new HashMap<String, String>();
    	result.put("status", "200");
    	return result;
    }
	
    //透過name跟symbol模糊查詢
    @ResponseBody
    @GetMapping("/coin/select")
    public List<Coin> selectCoinByName(@RequestParam String name) {
    	List<Coin> SelectCoin;
    	
    	SelectCoin = coinService.findByName2(name);
    	
    	return SelectCoin;
    }
    
//    @PostMapping("/")
//    public Coin coinList(Model model,@RequestBody StarDTO dto){
//    	System.out.println("拿到了吧~~~~~~~~~" + dto.getCoinId());
//    	Coin coin = coinService.findByCoinId2(dto.getCoinId());
//    	System.out.println(coin);
//		model.addAttribute("coin", coin);
//		System.out.println(model);
//		
//		
//		return coin;
//    }
    
    //點選鈴鐺 拿到coinId > 跑findByCoinId方法> 回傳物件 >給AJAX拿
	@GetMapping("/coin/getId")
	public List<Coin> coinList(@RequestParam Integer coinId) {
		
		List<Coin> coin = coinService.findByCoinId(coinId);
		
		return coin;
	}
    
}
