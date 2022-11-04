package com.ous.daily.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.ous.daily.model.Diary;
import com.ous.daily.model.User;
import com.ous.daily.model.service.DailyService;

@Controller
public class DailyController {
 
//	JavaMailSender mailSender;
//	
//	@Autowired
//	public DailyController(JavaMailSender mailSender) {
//		super();
//		this.mailSender = mailSender;
//	}
	/*
	 * @Autowired MailService mailService;
	 */
	final int[] totalDay={0,31,28,31,30,31,30,31,31,30,31,30,31};
	@Autowired
	DailyService dailyService;
	
	@GetMapping("/")
	String index() {

		return "login";
	}

	@PostMapping("/login")
	String login(HttpServletRequest request,User user,Model model) {
		try {
			User storeInfo = dailyService.existUser(user.getId());
			System.out.println(user);
			System.out.println(storeInfo);
			if(storeInfo==null ) {
				model.addAttribute("msg", "존재하지 않는 아이디입니다.");
				return "login";
			}
			if(!storeInfo.getId().equals(user.getId()) || !storeInfo.getPass().equals(user.getPass())) {
				model.addAttribute("msg", "비밀번호가 다릅니다.");
				return "login";
			}
			HttpSession  httpSession  = request.getSession();
			httpSession.setAttribute("login", user);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "redirect:/error";
		}
		return "redirect:/calendar";
	}

	@GetMapping("/join")
	String join() {

		return "join";
	}

	@PostMapping("/join")
	String doJoin(User user) {
		try {
			System.out.println(user);
			User cmpUser = dailyService.existUser(user.getId());
			if(cmpUser != null)
				return "redirect:/join";
			dailyService.addUser(user);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "redirect:/error";
		}
		
		return "redirect:/calendar";
	}

	@GetMapping("/calendar")
	String calendar(Model model) {
		Diary diary = new Diary();
		List<Diary> viewDiarys = new ArrayList<Diary>();
		Calendar cal = Calendar.getInstance();
		int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK)-(cal.get(Calendar.DATE 	)%7)+1;
		diary.setYear(cal.get(Calendar.YEAR));
		diary.setMonth(cal.get(Calendar.MONTH)+1);
		
		for(int i=1;i<dayOfWeek;i++) {
			Diary empty = new Diary();
			empty.setDay(0);
			viewDiarys.add(empty);
		}
		try {
			int cnt=1;
			List<Diary> diarys = dailyService.getDiaryByMonth(diary);
			for(Diary d : diarys) {
				if(cnt== d.getDay()) {
					viewDiarys.add(d);
					cnt++;
				}else {
					while(cnt!=d.getDay()) {
						Diary empty = new Diary();
						empty.setDay(cnt);
						viewDiarys.add(empty);
						cnt++;
					}
					viewDiarys.add(d);
					cnt++;
				}
			}
			while(cnt<=totalDay[cal.get(Calendar.MONTH)+1]) {
				Diary empty = new Diary();
				empty.setDay(cnt);
				viewDiarys.add(empty);
				cnt++;
			}
			while(viewDiarys.size()%7!=0) {
				Diary empty = new Diary();
				empty.setDay(0);
				viewDiarys.add(empty);
			}
			model.addAttribute("year",cal.get(Calendar.YEAR));
			model.addAttribute("month",cal.get(Calendar.MONTH)+1);
			model.addAttribute("diarys",viewDiarys);
			
		} catch (SQLException e) {
			e.printStackTrace();
			return "redirect:/error";
		}
		
		return "calendar";
	}

	@PostMapping("/calendar")
	String postCalendar() {
		
		return "join";
	}

	/*
	 * @GetMapping("/e-mail/{email}") void transferEmail(@PathVariable String email)
	 * { mailService.sendEmail("dkdlelxoa@naver.com", "noreply@diary.com",
	 * "[Diary]인증번호", "test"); }
	 */

}
