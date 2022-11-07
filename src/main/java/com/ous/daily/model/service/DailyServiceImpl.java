package com.ous.daily.model.service;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.ous.daily.model.Cert;
import com.ous.daily.model.Diary;
import com.ous.daily.model.FileList;
import com.ous.daily.model.ImageFile;
import com.ous.daily.model.User;
import com.ous.daily.model.mapper.DiaryMapper;
import com.ous.daily.model.mapper.UserMapper;

@Service
public class DailyServiceImpl implements DailyService {

	private DiaryMapper diaryMapper;
	private UserMapper userMapper;
	private ServletContext servletContext;

	@Autowired
	public DailyServiceImpl(DiaryMapper diaryMapper, UserMapper userMapper, ServletContext servletContext) {
		super();
		this.diaryMapper = diaryMapper;
		this.userMapper = userMapper;
		this.servletContext = servletContext;
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
	public void changeDiary(Diary diary,FileList fileList,MultipartFile[] upfile) throws SQLException, IllegalStateException, IOException {
//		fileList.getImageFiles()
		List<ImageFile> storeFiles = diaryMapper.getFile(diary);
		List<ImageFile> remainFiles = fileList.getImageFiles();
		List<ImageFile> deleteFiles = new ArrayList<ImageFile>();
		
		for(ImageFile storeFile : storeFiles) {
			boolean same = false;
			for(ImageFile remainFile : remainFiles) {
				if(remainFile.getChangeName().equals(storeFile.getChangeName())) {
					same = true;
					remainFile.setChangeName(storeFile.getChangeName());
					remainFile.setDiaryNo(storeFile.getDiaryNo());
					remainFile.setOrgName(storeFile.getOrgName());
					remainFile.setSaveFolder(storeFile.getSaveFolder());
				}
			}
			if(!same) { //이번에 선택한 파일들 중에, 저장된 파일명과 같은 게 없으면 삭제하기
				deleteFiles.add(storeFile);
			}
		}
		
		for(ImageFile deleteFile : deleteFiles) {
			String realPath = servletContext.getRealPath("/upload")+ File.separator + deleteFile.getSaveFolder()
			+File.separator+deleteFile.getChangeName();

	        File file = new File(realPath);
	        file.delete();
	        
		}
		
		
		diaryMapper.changeDiary(diary);//다이어리 데이터 수정
		
		diaryMapper.deleteFile(diary.getNo());//원래있던 거 다 삭제
		for(ImageFile remainFile : remainFiles) {//다시 있던 거는 저장
			diaryMapper.addFile(remainFile);
		}
		for (MultipartFile file : upfile) {//추가 기입한 파일 저장
			if (!file.isEmpty()) {
				String realPath = servletContext.getRealPath("/upload");
				String today = new SimpleDateFormat("yyMMdd").format(new Date());
				String saveFolder = realPath + File.separator + today;
				File folder = new File(saveFolder);
				if (!folder.exists())
					folder.mkdirs();

				ImageFile imageFile = new ImageFile();
				imageFile.setDiaryNo(diary.getNo());
				imageFile.setOrgName(file.getOriginalFilename());
				imageFile.setSaveFolder(today);
				String saveFileName = UUID.randomUUID().toString()
						+ file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf('.'));
				imageFile.setChangeName(saveFileName);
				file.transferTo(new File(folder, saveFileName));
				System.out.println(imageFile);
				diaryMapper.addFile(imageFile);
			}
		}
		
		
		//해당 날짜 diary변경 
		//해당 데이터 변경...
		//diaryMapper.changeDiary(diary);
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

	@Override
	@Transactional
	public void addArticle(Diary diary, MultipartFile[] upfile)
			throws SQLException, IllegalStateException, IOException {
		// TODO Auto-generated method stub
		diaryMapper.addDiary(diary);
		System.out.println("!!!!!!!!!" + upfile.length);
		for (MultipartFile file : upfile) {
			if (!file.isEmpty()) {
				String realPath = servletContext.getRealPath("/upload");
				String today = new SimpleDateFormat("yyMMdd").format(new Date());
				String saveFolder = realPath + File.separator + today;
				File folder = new File(saveFolder);
				if (!folder.exists())
					folder.mkdirs();

				ImageFile imageFile = new ImageFile();
				imageFile.setDiaryNo(diaryMapper.getLastNo());
				imageFile.setOrgName(file.getOriginalFilename());
				imageFile.setSaveFolder(today);
				String saveFileName = UUID.randomUUID().toString()
						+ file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf('.'));
				imageFile.setChangeName(saveFileName);
				file.transferTo(new File(folder, saveFileName));
				System.out.println(imageFile);
				diaryMapper.addFile(imageFile);
			}
		}
	}

}
