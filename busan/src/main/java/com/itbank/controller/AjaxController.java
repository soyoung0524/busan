package com.itbank.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.itbank.cafe.CafeDTO;
import com.itbank.cart.CartDTO;
import com.itbank.food.FoodDTO;
import com.itbank.review.ReviewDTO;
import com.itbank.service.CafeService;
import com.itbank.service.CartService;
import com.itbank.service.FoodService;
import com.itbank.service.ReviewService;
import com.itbank.service.TourService;
import com.itbank.tour.TourDTO;

@RestController
public class AjaxController {

	@Autowired
	CartService cs;
	@Autowired
	FoodService fs;
	@Autowired
	CafeService cafes;
	@Autowired
	ReviewService rs;
	@Autowired
	TourService ts;
	private ObjectMapper mapper = new ObjectMapper();

	// 좋아요
	@GetMapping("heart/{sql}")
	public String heart(@PathVariable String sql) {

		CartDTO check = new CartDTO();

		check = cs.heartCheck(sql);
		int row = 0;
		int upd = 0;

		if (check == null) {
			row = cs.insertHeart(sql);
		} else {
			upd = cs.updateHerat(sql);
		}
		return null;
	}

	// 좋아요 고정
	@GetMapping("heartnumber/{sql}")
	public String heartNumber(@PathVariable String sql) {

		System.out.println("뭐가에러지sql : " + sql);
		
		String row;
		row = cs.heartCheckOne(sql);
		System.out.println("row : " + row);

		
		//int row = cs.heartCheck(sql);
		
		return row;
	}

	// 남녀 좋아요 비율
	@GetMapping("allcount/{sql}")
	public String allCount(@PathVariable String sql) {

		 System.out.println("fefefefe : " + sql);
		int cnt = cs.allCount(sql);

	 System.out.println("cnt : " + cnt);
		int womanCnt = cs.allWomanCount(sql);
		int manCnt = cs.allManCount(sql);
		
		//.toString(womanCnt);
		
		System.out.println(Integer.toString(womanCnt) + ',' + Integer.toString(manCnt));
		
		String result = Integer.toString(womanCnt) + ',' + Integer.toString(manCnt);
		System.out.println("result : " + result);
	
		return result;
	}
	// 비로그인시 남녀좋아요 비율 

	// 10대,20대,30대... 그래프 비율
	@GetMapping("ageper/{sql}")
	public String agePercent(@PathVariable String sql) throws JsonProcessingException {

		int cnt = cs.allCount(sql);
		List<HashMap<String, Object>> list = cs.getAgePercent(sql);

		String json = "";
		json = mapper.writeValueAsString(list);
		return json;

	}

	// 음식점검색
	@GetMapping(value = "food/{search}", produces = "application/text;charset=utf8")
	public String searchFood(@PathVariable String search) throws JsonProcessingException {

		List<FoodDTO> foodList = fs.searchFood(search);

		String data = mapper.writeValueAsString(foodList);
		return data;
	}

	// 카페검색
	@GetMapping(value = "cafe/{search}", produces = "application/text;charset=utf8")
	public String searchCafe(@PathVariable String search) throws JsonProcessingException {

		List<FoodDTO> cafeList = cafes.searchCafe(search);

		String data = mapper.writeValueAsString(cafeList);
		return data;
	}
	
	// 관광지검색
	@GetMapping(value = "tour/{search}", produces = "application/text;charset=utf8")
	public String searchTour(@PathVariable String search) throws JsonProcessingException {
		
		List<TourDTO> tourList = ts.searchTour(search);
		
		String data = mapper.writeValueAsString(tourList);
		return data;
	}
	
	// 음식점 지도 클릭
	@GetMapping(value = "foodAddr/{addr}/", produces = "application/text;charset=utf8")
	public String foodAddr(@PathVariable String addr) throws JsonProcessingException {

		List<FoodDTO> foodList = fs.selectOne(addr);
		String data = mapper.writeValueAsString(foodList);
		return data;
	}

	// 카페 지도 클릭
	@GetMapping(value = "cafeAddr/{addr}/", produces = "application/text;charset=utf8")
	public String cafeAddr(@PathVariable String addr) throws JsonProcessingException {

		List<CafeDTO> foodList = cafes.selectOne(addr);
		String data = mapper.writeValueAsString(foodList);
		return data;
	}

	@GetMapping(value = "tourAddr/{addr}/", produces = "application/text;charset=utf8")
	public String tourAddr(@PathVariable String addr) throws JsonProcessingException {
		System.out.println(addr);
		List<TourDTO> tourList = ts.getSelectList(addr);
		String data = mapper.writeValueAsString(tourList);
		return data;
	}

	// 리뷰
	@PostMapping(value = "review", consumes = "application/json;charset=utf8")
	public int insertReview(@RequestBody ReviewDTO dto) {
		int row = rs.insertReview(dto);
		return row;
	}
	
	

}
