package com.ous.daily.model.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ous.daily.model.Cert;
import com.ous.daily.model.Diary;
import com.ous.daily.model.ImageFile;
import com.ous.daily.model.User;
import com.ous.daily.model.mapper.DiaryMapper;
import com.ous.daily.model.mapper.UserMapper;

@Service
public class DailyServiceImpl implements DailyService {

	DiaryMapper diaryMapper;
	UserMapper userMapper;

	@Autowired
	public DailyServiceImpl(DiaryMapper diaryMapper, UserMapper userMapper) {
		super();
		this.diaryMapper = diaryMapper;
		this.userMapper = userMapper;
	}

	@Override
	public List<Diary> getDiaryByMonth(Diary diary) throws SQLException {
		// TODO Auto-generated method stub
		return diaryMapper.getDiaryByMonth(diary);
	}

	@Override
	public Diary getDiaryByDay(Diary diary) throws SQLException {
		// TODO Auto-generated method stub
		return diaryMapper.getDiaryByDay(diary);
	}

	@Override
	@Transactional
	public void changeDiary(Diary diary) throws SQLException {
		// TODO Auto-generated method stub
		diaryMapper.changeDiary(diary);
	}

	@Override
	@Transactional
	public void deleteDiary(Diary diary) throws SQLException {
		// TODO Auto-generated method stub
		diaryMapper.deleteDiary(diary);
	}

	@Override
	@Transactional
	public long addDiary(Diary diary) throws SQLException {
		// TODO Auto-generated method stub
		return diaryMapper.addDiary(diary);
	}

	@Override
	public List<ImageFile> getFile(Diary diary) throws SQLException {
		// TODO Auto-generated method stub
		return diaryMapper.getFile(diary);
	}

	@Override
	@Transactional
	public void changeFile(ImageFile imageFile) throws SQLException {
		// TODO Auto-generated method stub
		diaryMapper.changeFile(imageFile);
	}

	@Override
	@Transactional
	public void deleteFile(long no) throws SQLException {
		// TODO Auto-generated method stub
		diaryMapper.deleteFile(no);
	}

	@Override
	@Transactional
	public void addFile(ImageFile imageFile) throws SQLException {
		// TODO Auto-generated method stub
		diaryMapper.addFile(imageFile);
	}

	@Override
	public User existUser(String id) throws SQLException {
		// TODO Auto-generated method stub
		return userMapper.existUser(id);
	}

	@Override
	@Transactional
	public void changeUser(User user) throws SQLException {
		// TODO Auto-generated method stub
		userMapper.changeUser(user);
	}

	@Override
	@Transactional
	public void deleteUser(String id) throws SQLException {
		// TODO Auto-generated method stub
		userMapper.deleteUser(id);
	}

	@Override
	@Transactional
	public void addUser(User user) throws SQLException {
		// TODO Auto-generated method stub
		userMapper.addUser(user);
	}

	@Override
	public Cert existCert(String id) throws SQLException {
		// TODO Auto-generated method stub
		return userMapper.existCert(id);
	}

	@Override
	@Transactional
	public void changeCert(Cert cert) throws SQLException {
		// TODO Auto-generated method stub
		userMapper.changeCert(cert);
	}

	@Override
	@Transactional
	public void deleteCert(String id) throws SQLException {
		// TODO Auto-generated method stub
		userMapper.deleteCert(id);
	}

	@Override
	@Transactional
	public void addCert(Cert cert) throws SQLException {
		// TODO Auto-generated method stub
		userMapper.addCert(cert);
	}

}
