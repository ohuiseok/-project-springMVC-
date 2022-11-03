package com.ous.daily.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ous.daily.model.Diary;
import com.ous.daily.model.ImageFile;

@Mapper
public interface DiaryMapper {
	List<Diary> getDiaryByMonth(Diary diary);//String year, String month

	Diary getDiaryByDay(Diary diary);//String year, String month, String day

	void changeDiary(Diary diary);

	void deleteDiary(Diary diary);//String year, String month, String day

	long addDiary(Diary diary);

	List<ImageFile> getFile(Diary diary);

	void changeFile(ImageFile imageFile);

	void deleteFile(long no);

	void addFile(ImageFile imageFile);

}
