package com.itbank.food;

import java.util.List;

public interface FoodDAO {

	List<FoodDTO> getSelectAll();

	FoodDTO selectOne(String fname);

	List<FoodDTO> searchFood(String search);

	List<FoodDTO> selectOneAddr(String addr);


}
