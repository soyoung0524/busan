package com.itbank.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.cart.CartDAO;
import com.itbank.cart.CartDTO;

@Service
public class CartService {

	@Autowired
	private CartDAO dao;

//	public CartDTO heartCheck(HashMap<String, Object> map) {
//		return dao.heartCheck(map);
//	}

	public CartDTO heartCheck(String sql) {
		System.out.println("서비스 sql  :" + sql);
		String chk = sql;

		String[] arr = chk.split(",");
		String cftname = arr[0];
		String id = arr[1];

		CartDTO dto = new CartDTO();
		dto.setId(id);
		dto.setCftname(cftname);

		return dao.heartCheck(dto);
	}

	public int insertHeart(String sql) {
		String chk = sql;

		String[] arr = chk.split(",");
		String cftname = arr[0];
		String id = arr[1];

		CartDTO dto = new CartDTO();
		dto.setId(id);
		dto.setCftname(cftname);

		return dao.insertHeart(dto);
	}

	public int updateHerat(String sql) {
		String chk = sql;

		String[] arr = chk.split(",");
		String cftname = arr[0];
		String id = arr[1];

		CartDTO dto = new CartDTO();
		dto.setId(id);
		dto.setCftname(cftname);

		return dao.updateHeart(dto);
	}

	public String heartCheckOne(String sql) {
		String chk = sql;

		String[] arr = chk.split(",");
		String cftname = arr[0];
		String id = arr[1];

		CartDTO dto = new CartDTO();
		dto.setId(id);
		dto.setCftname(cftname);

		return dao.heartCheckOne(dto);
	}

	public int allCount(String sql) {
		return dao.allCount(sql);
	}

	public int allWomanCount(String sql) {
		return dao.allWomanCount(sql);
	}

	public List<HashMap<String, Object>> getAgePercent(String sql) {

		return dao.getAgePercent(sql);
	}

	public int allManCount(String sql) {
		
		return dao.allManCount(sql);
	}
}
