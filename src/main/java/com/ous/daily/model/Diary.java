package com.ous.daily.model;

import lombok.Data;

@Data
public class Diary {
	long no;
	String title;
	String content;
	int year;
	int month;
	int day;
	String userId;
}
