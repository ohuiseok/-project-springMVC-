package com.ous.daily.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ous.daily.model.Diary;
import com.ous.daily.model.User;
import com.ous.daily.model.service.DailyService;

@RestController
@CrossOrigin("*")
public class DailyRestController {
	
	private DailyService dailyService;
	
	@Autowired
	public DailyRestController(DailyService dailyService) {
		super();
		this.dailyService = dailyService;
	}


	@PostMapping("/list")
	public ResponseEntity<?> listPage(HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("login");
		try {
			List<Diary> diarys = dailyService.getAllDiary(user.getId());
			return new ResponseEntity<List<Diary>>(diarys, HttpStatus.OK);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
}
