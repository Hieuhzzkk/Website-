package com.example.demo.service;

import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;

import com.example.demo.entity.Users;
@Service
public interface IUsersService {
	Page<Users> getByPage(int pageNumber, int maxRecord);
	Page<Users> getByType(int pageNumber, int maxRecord,String keyWord);
}
