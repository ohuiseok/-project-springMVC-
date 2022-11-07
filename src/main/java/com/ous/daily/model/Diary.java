package com.ous.daily.model;

import java.util.List;

import lombok.Data;

@Data
public class Diary {
	private long no;
	private String title;
	private String content;
	private int year;
	private int month;
	private int day;
	private String userId;
	private List<ImageFile> imagefiles;
}
