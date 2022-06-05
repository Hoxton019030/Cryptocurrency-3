package com.Group1.CoinShell;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@EnableScheduling
@SpringBootApplication
public class CoinShellApplication {
	
//	@Autowired
//	private EmailSenderService senderService;
 
	public static void main(String[] args) {
		SpringApplication.run(CoinShellApplication.class, args);
	}
	
//	@EventListener(ApplicationReadyEvent.class)
//	public void sendMail() {
//		senderService.sendEmail("za546321@gmail.com", "標題", "內文");
//	}

}
