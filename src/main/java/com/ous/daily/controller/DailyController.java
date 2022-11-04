package com.ous.daily.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.ous.daily.model.User;

@Controller
public class DailyController {
	/*
	 * MailHandler sendMail = new MailHandler(mailSender);
	 * sendMail.setSubject("[RunninGo 인증메일 입니다.]"); //메일제목 sendMail.setText(
	 * "<h1>RunninGo 메일인증</h1>" + "<br>RunninGo에 오신것을 환영합니다!" +
	 * "<br>아래 [이메일 인증 확인]을 눌러주세요." +
	 * "<br><a href='http://localhost:8080/join/registerEmail?email=" +
	 * memberDto.getEmail() + "&mail_key=" + mail_key +
	 * "' target='_blank'>이메일 인증 확인</a>"); sendMail.setFrom("보내는사람@이메일", "러닝고");
	 * sendMail.setTo(memberDto.getEmail()); sendMail.send();
	 */
//	JavaMailSender mailSender;
//	
//	@Autowired
//	public DailyController(JavaMailSender mailSender) {
//		super();
//		this.mailSender = mailSender;
//	}

	@GetMapping("/")
	String index() {

		return "login";
	}

	@PostMapping("/login")
	String login(User user) {

		return null;
	}

	@GetMapping("/join")
	String join(User user) {

		return "join";
	}

	@GetMapping("/calendar")
	String calendar(Model model) {

		return "calendar";
	}

	@PostMapping("/calendar")
	String postCalendar() {

		return "join";
	}

	@GetMapping("/e-mail/{email}")
	void transferEmail(@PathVariable String email) {
//		MailHandler sendMail = new MailHandler(mailSender);
//		sendMail.setSubject("[RunninGo 인증메일 입니다.]"); // 메일제목
//		sendMail.setText("<h1>RunninGo 메일인증</h1>" + "<br>RunninGo에 오신것을 환영합니다!" + "<br>아래 [이메일 인증 확인]을 눌러주세요."
//				+ "<br><a href='http://localhost:8080/join/registerEmail?email=" + memberDto.getEmail() + "&mail_key="
//				+ mail_key + "' target='_blank'>이메일 인증 확인</a>");
//		sendMail.setFrom("보내는사람@이메일", "러닝고");
//		//ssendMail.setTo(memberDto.getEmail());
//		sendMail.send();
	}

}
