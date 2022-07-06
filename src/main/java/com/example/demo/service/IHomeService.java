package com.example.demo.service;

import org.springframework.data.domain.Page;

import com.example.demo.entity.Underwear;

public interface IHomeService {
	Page<Underwear> getByPage(int pageNumber, int maxRecord);
	Page<Underwear> getByType(int pageNumber, int maxRecord,String keyWord);
}
