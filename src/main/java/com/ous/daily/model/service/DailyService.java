package com.ous.daily.model.service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.ous.daily.model.Cert;
import com.ous.daily.model.Diary;
import com.ous.daily.model.FileList;
import com.ous.daily.model.ImageFile;
import com.ous.daily.model.User;

public interface DailyService {
	List<Diary> getDiaryByMonth(Diary diary) throws SQLException;// String year, String month

	Diary getDiaryByDay(Diary diary) throws SQLException;// String year, String month, String day

	void changeDiary(Diary diary,FileList fileList,MultipartFile[] upfile) throws SQLException, IllegalStateException, IOException;

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

	Cert existCert(String id) throws SQLException;

	void changeCert(Cert cert) throws SQLException;

	void deleteCert(String id) throws SQLException;

	void addCert(Cert cert) throws SQLException;
	

	void addArticle(Diary diary,MultipartFile[] upfile)throws SQLException, IllegalStateException, IOException;
}
