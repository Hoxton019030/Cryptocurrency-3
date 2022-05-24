package com.Group1.CoinShell;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@EnableScheduling
@SpringBootApplication
public class CoinShellApplication {

	public static void main(String[] args) {
		SpringApplication.run(CoinShellApplication.class, args);
	}

}
