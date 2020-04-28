package com.worktask.blog;

import com.worktask.blog.repository.TextRepository;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import java.util.TimerTask;
import java.util.Timer;
import com.worktask.blog.service.Updater;
import com.worktask.blog.service.Metric;
@SpringBootApplication
public class BlogApplication {

	public static void main(String[] args) {
		SpringApplication.run(BlogApplication.class, args);
		Metric.setDate(1);
		TimerTask updater = new Updater();
		Timer timer = new Timer();
		timer.scheduleAtFixedRate(updater,Metric.getDate(), 24L * 60L * 60L * 1000L);

	}

}
