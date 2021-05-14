package com.itbank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.cafe.CafeDAO;
import com.itbank.cafe.CafeDTO;
import com.itbank.food.FoodDTO;

@Service
public class CafeService {

	@Autowired
	private CafeDAO dao;
	
	public List<FoodDTO> searchCafe(String search) {
		return dao.searchCafe(search);
	}

	public List<CafeDTO> getList() {
		return dao.getSelectAll();
	}

	public CafeDTO getOneList(String cname) {
		return dao.selectOne(cname);
	}

	public List<CafeDTO> selectOne(String addr) {
		return dao.selectOneAddr(addr);
	}

}
