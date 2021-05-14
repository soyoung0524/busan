package com.itbank.cafe;

import java.util.List;

import com.itbank.food.FoodDTO;

public interface CafeDAO {

	List<FoodDTO> searchCafe(String search);

	List<CafeDTO> getSelectAll();

	CafeDTO selectOne(String cname);

	List<CafeDTO> selectOneAddr(String addr);

}
