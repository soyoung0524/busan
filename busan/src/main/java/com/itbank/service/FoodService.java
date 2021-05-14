package com.itbank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.food.FoodDAO;
import com.itbank.food.FoodDTO;

@Service
public class FoodService {
	
	@Autowired private FoodDAO dao;
	
	
	// 음식점 전체 리스트
	public List<FoodDTO> getList() {
		return dao.getSelectAll();
	}

	// 선택한 음식점 
	public FoodDTO getOneList(String fname) {
		return dao.selectOne(fname);
	}
	
	// 검색
	public List<FoodDTO> searchFood(String search) {
		return dao.searchFood(search);
	}
	
	// 지도 클릭 리스트
	public List<FoodDTO> selectOne(String addr) {
		return dao.selectOneAddr(addr);
	}
	
	

}
