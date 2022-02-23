package com.example.lesson04.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.lesson04.dao.UserDAO;
import com.example.lesson04.model.NewUser;

@Service
public class UserBO {
	@Autowired
	private UserDAO userDAO;
	public void addNewUserAsField(String name, String yyyymmdd, String email, String introduce) {
		userDAO.InsertNewUserAsField(name, yyyymmdd, email, introduce);
	}
}