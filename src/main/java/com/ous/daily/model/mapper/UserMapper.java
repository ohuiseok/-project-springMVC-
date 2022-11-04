package com.ous.daily.model.mapper;

import java.sql.SQLException;

import org.apache.ibatis.annotations.Mapper;

import com.ous.daily.model.Cert;
import com.ous.daily.model.User;

@Mapper
public interface UserMapper {
	User existUser(String id) throws SQLException;;

	void changeUser(User user) throws SQLException;;

	void deleteUser(String id) throws SQLException;;

	void addUser(User user) throws SQLException;;

	Cert existCert(String id) throws SQLException;;

	void changeCert(Cert cert) throws SQLException;;

	void deleteCert(String id) throws SQLException;;

	void addCert(Cert cert) throws SQLException;;
}
