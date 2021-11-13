package com.example.boom;

import com.example.boom.controller.GreetingsController;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
//@ComponentScan(basePackages = "com.example.boom")
public class BoomApplication {

    public static void main(String[] args) {
        SpringApplication.run(BoomApplication.class, args);
    }

}
