package com.ous.daily.model.mapper;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ous.daily.model.Cert;
import com.ous.daily.model.Diary;
import com.ous.daily.model.ImageFile;
import com.ous.daily.model.User;

@Mapper
public interface DiaryMapper {
	List<Diary> getDiaryByMonth(Diary diary) throws SQLException;// String year, String month

	Diary getDiaryByDay(Diary diary) throws SQLException;// String year, String month, String day

	void changeDiary(Diary diary) throws SQLException;

	void deleteDiary(Diary diary) throws SQLException;// String year, String month, String day

	long addDiary(Diary diary) throws SQLException;

	List<ImageFile> getFile(Diary diary) throws SQLException;

	void changeFile(ImageFile imageFile) throws SQLException;

	void deleteFile(long no) throws SQLException;

	void addFile(ImageFile imageFile) throws SQLException;

	User existUser(String id) throws SQLException;

	void changeUser(User user) throws SQLException;

	void deleteUser(String id) throws SQLException;

	void addUser(User user) throws SQLException;

	Cert existCert(String id);

	void changeCert(Cert cert);

	void deleteCert(String id);

	void addCert(Cert cert);
	
	long getLastNo();
	
	List<Diary> getAllDiary(String userId)throws SQLException;
}
