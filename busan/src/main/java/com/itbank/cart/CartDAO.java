package com.itbank.cart;

import java.util.HashMap;
import java.util.List;

public interface CartDAO {

//   CartDTO heartCheck(HashMap<String, Object> map);

//   String heartCheck(String cftname, String id);

   CartDTO heartCheck(CartDTO dto);

   int insertHeart(CartDTO dto);

   int updateHeart(CartDTO dto);

   String heartCheckOne(CartDTO dto);

   int allCount(String sql);

   int allWomanCount(String sql);

   List<HashMap<String, Object>> getAgePercent(String sql);

   int allManCount(String sql);

}