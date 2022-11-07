package com.ous.daily.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ous.daily.model.Diary;
import com.ous.daily.model.FileList;
import com.ous.daily.model.ImageFile;
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
	final int[] totalDay = { 0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };

	DailyService dailyService;
	private ServletContext servletContext;

	@Autowired
	public DailyController(DailyService dailyService, ServletContext servletContext) {
		super();
		this.dailyService = dailyService;
		this.servletContext = servletContext;
	}

	@GetMapping("/")
	String index() {

		return "login";
	}

	@PostMapping("/login")
	String login(HttpServletRequest request, User user, Model model) {
		try {
			User storeInfo = dailyService.existUser(user.getId());
			if (storeInfo == null) {
				model.addAttribute("msg", "존재하지 않는 아이디입니다.");
				return "login";
			}
			if ( !BCrypt.checkpw(user.getPass(),storeInfo.getPass())) {
				model.addAttribute("msg", "비밀번호가 다릅니다.");
				return "login";
			}
			
			HttpSession httpSession = request.getSession();
			httpSession.setAttribute("login", user);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "redirect:/error";
		}
		return "redirect:/calendar";
	}

	@GetMapping("/logout")
	String logout(HttpServletRequest request) {
		request.getSession().invalidate();
		return "redirect:/";
	}
	
	@GetMapping("/join")
	String join() {

		return "join";
	}

	@PostMapping("/join")
	String doJoin(User user, Model model) {
		try {
			User cmpUser = dailyService.existUser(user.getId());
			if (cmpUser != null) {
				model.addAttribute("msg","이미 존재하는 아이디 입니다.");
				return "join";
			}
			user.setPass(BCrypt.hashpw(user.getPass(), BCrypt.gensalt()));
			dailyService.addUser(user);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "redirect:/error";
		}

		return "redirect:/calendar";
	}

	@GetMapping("/calendar")
	String calendar(HttpServletRequest request,Model model, @RequestParam(value = "year", required = false, defaultValue = "0") int year,
			@RequestParam(value = "month", required = false, defaultValue = "0") int month) {
		Diary diary = new Diary();
		int curYear = Calendar.getInstance().get(Calendar.YEAR),
				curMonth = Calendar.getInstance().get(Calendar.MONTH) + 1;
		if (year == 0 || month == 0) {// 선택한 거 없으면, 현재 달력으로
			year = curYear;
			month = curMonth;
		}
		User user = (User) request.getSession().getAttribute("login");
		diary.setYear(year);// 선택한 연도로 가기
		diary.setMonth(month);// 선택한 달로 가기
		diary.setUserId(user.getId());
		try {

			List<Diary> diarys = dailyService.getDiaryByMonth(diary);// 선택한 다이어리 정보 가져오기
			List<Diary> viewDiarys = getCalendars(diarys, year, month);
			model.addAttribute("selectYear", year);
			model.addAttribute("selectMonth", month);
			model.addAttribute("year", curYear);
			if (curYear == year)
				model.addAttribute("month", curMonth);// 현재 연도를 선택했으면, 현재 달을 출력
			else
				model.addAttribute("month", 12);

			model.addAttribute("diarys", viewDiarys);

		} catch (SQLException e) {
			e.printStackTrace();
			return "redirect:/error";
		}

		return "calendar";
	}

	private List<Diary> getCalendars(List<Diary> diarys, int selectYear, int selectMonth) {
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.YEAR, selectYear);
		cal.set(Calendar.MONTH, selectMonth - 1);
		cal.set(Calendar.DATE, 1);

		List<Diary> viewDiarys = new ArrayList<Diary>();

		int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
		int cnt = 1;

		for (int i = 1; i < dayOfWeek; i++) {
			Diary empty = new Diary();
			empty.setDay(0);
			viewDiarys.add(empty);
		}

		for (Diary d : diarys) {
			if (cnt == d.getDay()) {
				viewDiarys.add(d);
				cnt++;
			} else {
				while (cnt != d.getDay()) {
					Diary empty = new Diary();
					empty.setDay(cnt);
					viewDiarys.add(empty);
					cnt++;
				}
				viewDiarys.add(d);
				cnt++;
			}
		}
		while (cnt <= totalDay[cal.get(Calendar.MONTH) + 1]) {
			Diary empty = new Diary();
			empty.setDay(cnt);
			viewDiarys.add(empty);
			cnt++;
		}
		while (viewDiarys.size() % 7 != 0) {
			Diary empty = new Diary();
			empty.setDay(0);
			viewDiarys.add(empty);
		}

		return viewDiarys;
	}

	@GetMapping("/show")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String fileName, String filePath) {
		File file = new File(servletContext.getRealPath("/upload") + File.separatorChar + filePath, fileName);
		ResponseEntity<byte[]> result = null;
		try {
			HttpHeaders headers = new HttpHeaders();
			headers.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file), headers, HttpStatus.OK);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}

	@PostMapping("/calendar")
	String postCalendar(HttpServletRequest request,Diary diary, Model model) {
		if (diary.getDay() == 0)
			return "redirect:/calendar";

		try {
			User user = (User) request.getSession().getAttribute("login");
			diary.setUserId(user.getId());
			Diary daily = dailyService.getDiaryByDay(diary);
			if (daily == null) {
				model.addAttribute("diary", diary);
				return "register";
			}
			List<ImageFile> files = dailyService.getFile(daily);

			model.addAttribute("daily", daily);
			model.addAttribute("files", files);
			return "view";

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "redirect:/error";
		}
	}

	@PostMapping("/write")
	String store(@ModelAttribute Diary diary, @RequestParam MultipartFile[] upfile, HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("login");
		diary.setUserId(user.getId());
		String content = diary.getContent().replaceAll("<", "&lt;");
		content = content.replaceAll(">", "&gt;");
		diary.setContent(content);// xxe 막기

		try {
			dailyService.addArticle(diary, upfile);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			return "redirect:/error";
		}

		return "redirect:/calendar";
	}

	@PostMapping("/modify")//page 이동
	String modify(Diary diary,Model model,HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("login");
		diary.setUserId(user.getId());
		List<ImageFile> files=null;
		Diary daily=null;
		try {
			daily = dailyService.getDiaryByDay(diary);
			files = dailyService.getFile(daily);
		} catch (SQLException e) {
			e.printStackTrace();
			return "redirect:/error";
		}
		model.addAttribute("daily", daily);
		model.addAttribute("files", files);
		
		return "modify";
	}
	
	@PostMapping("/store")//page 이동
	String store(Diary diary,FileList fileList, Model model,HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("login");
		diary.setUserId(user.getId());
		List<ImageFile> files=null;
		Diary daily=null;
		
		try {
			dailyService.changeDiary(diary);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(fileList!=null) {
			for(ImageFile file : fileList.getImageFiles()) {
				if(!file.getOrgName().equals("null"))
					files.add(file);
			}
		}

		model.addAttribute("daily", daily);
		model.addAttribute("files", files);
		return "redirect:/";
	}
	/*
	 * @GetMapping("/e-mail/{email}") void transferEmail(@PathVariable String email)
	 * { mailService.sendEmail("dkdlelxoa@naver.com", "noreply@diary.com",
	 * "[Diary]인증번호", "test"); }
	 */

}
