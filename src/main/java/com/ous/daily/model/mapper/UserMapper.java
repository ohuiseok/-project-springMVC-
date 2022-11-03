package com.ous.daily.model.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.ous.daily.model.Cert;
import com.ous.daily.model.User;
@Mapper
public interface UserMapper {
	User existUser(String id);
	void changeUser(User user);
	void deleteUser(String id);
	void addUser(User user);
	
	Cert existCert(String id);
	void changeCert(Cert cert);
	void deleteCert(String id);
	void addCert(Cert cert);
}
