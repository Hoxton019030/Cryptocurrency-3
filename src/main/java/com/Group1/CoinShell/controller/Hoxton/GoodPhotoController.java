package com.Group1.CoinShell.controller.Hoxton;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.Group1.CoinShell.model.Hoxton.GoodPhoto;
import com.Group1.CoinShell.service.Hoxton.GoodPhotoService;

@Controller
public class GoodPhotoController {
	
	@Autowired
	private GoodPhotoService goodPhotoService;
	
	@GetMapping("/newPhoto")
	public String newPhotoPage() {
		return "goodphoto/uploadPage";
	}
	
	@PostMapping("/fileUpload")
	public String postNewPhoto(HttpServletRequest req, @RequestParam("photoName")String name,@RequestParam("file") MultipartFile file 
			
//			@RequestParam("photoName") String name, 
//			                   @RequestParam("file") MultipartFile file
			                   
			) throws IOException {
		
		GoodPhoto goodPhoto = new GoodPhoto();
//		
//		// 過濾最前面和最後面的空格
//		String noBlankName = name.trim();
//		
//		try {
//			goodPhoto.setPhotoName(noBlankName);
			goodPhoto.setPhotoFile(file.getBytes());
//			
			goodPhotoService.insertGoodPhoto(goodPhoto);
//			
//			return "goodphoto/uploadSuccessPage";
//		} catch (IOException e) {
//			
//			e.printStackTrace();
//			return "index";
//		}
		
		return "index";
		
	}
	
	@GetMapping("/listGoodPhoto")
	public String listAllGoodPhotoPage(Model model) {
		List<GoodPhoto> list = goodPhotoService.listGoodPhoto();
		
		model.addAttribute("goodPhotoList", list);
		
		return "goodphoto/listPhoto";
	}
	
	@GetMapping("downloadImage/{id}")
	@ResponseBody
	public ResponseEntity<byte[]> downloadImage(@PathVariable("id") Integer id){
		GoodPhoto photo1 = goodPhotoService.getPhotoById(id);
		
		byte[] photoFile = photo1.getPhotoFile();
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.IMAGE_JPEG);
		                               // 要回傳的物件, header , httpstatus 回應
		return new ResponseEntity<byte[]>(photoFile, headers, HttpStatus.OK);
	}

}
