package com.Group1.CoinShell.controller.Yiwen;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.Group1.CoinShell.model.Yiwen.CustomizedUserAvatar;
import com.Group1.CoinShell.model.Yiwen.CustomizedUserAvatarDao;
import com.Group1.CoinShell.service.Yiwen.CustomizedUserAvatarService;

@Controller
public class CustomizedUserAvatarController {

	@Autowired
	private CustomizedUserAvatarService cuaService;
	@Autowired
	private CustomizedUserAvatarDao cuaDao;
	
	@GetMapping(value="avatar/delete/{id}")
	public boolean deleteCustomizedUserAvatar(@PathVariable Integer id) {
		cuaDao.deleteById(id);
		return true;
	}
	
	@PostMapping("administrator/account/uploadcua")
	public String addNewAvatar(@RequestParam("alias")String aliasAvatar, 
								  @RequestParam("base64")String userAvatarBase64) {
		CustomizedUserAvatar cua = new CustomizedUserAvatar();
		cua.setAliasAvatar(aliasAvatar);
		cua.setUserAvatarBase64(userAvatarBase64);
		// 後台傳入照片 in VarBinary(MAX)   #######################################
//		try {
//			byte[] bytes = file.getBytes();   //如果改用 varbinary 的話, base64就要改名成 MultipartFile file(formerly userAvatarBase64)
//			cua.setUserAvatarBase64(bytes);
//		}catch (IOException e) {
//			e.printStackTrace();
//		}
		cuaDao.save(cua);
		return "redirect:/administrator/account";
	}
	
	@GetMapping("administrator/account/editcua")
	public ModelAndView changePageToEditAvatar(@RequestParam("id")Integer id) {
		CustomizedUserAvatar cua = cuaService.findAvatarById(id);
		return new ModelAndView("backend/account/editcua","cua", cua);
	}
	
	//DeletebyId
	@GetMapping("administrator/account/deletecua")
	public String deleteAvatar(@RequestParam("id")Integer id) {
		cuaService.deleteAvatarById(id);
		return "redirect:/administrator/account";
	}
	

	@GetMapping("administrator/account/search")
	public String findAvatarByName(@RequestParam("alias") String aliasAvatar) {
		return "backend/store/one_cua";
	}
	
	//updateById
	//public String editAvatar  line 63 ~ 74 updatexxxbyid
 

}
