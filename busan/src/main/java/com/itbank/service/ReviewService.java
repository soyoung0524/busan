package com.itbank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.review.ReviewDAO;
import com.itbank.review.ReviewDTO;

@Service
public class ReviewService {

   @Autowired private ReviewDAO dao;
   

   // 리뷰 등록
   public int insertReview(ReviewDTO dto) {
      return dao.insertReview(dto);
   }

   // 리뷰 음식점 전체목록불러오기
   public List<ReviewDTO> getSelectAllFood(String fname) {
	   return dao.selectAllFood(fname);
   }
   
   // 리뷰 카페 전체목록불러오기
   public List<ReviewDTO> getSelectAllCafe(String cname) {
	   return dao.selectAllCafe(cname);
   }
   // 리뷰 관광 전체목록불러오기
   public List<ReviewDTO> getSelectAllTour(String tname) {
	   return dao.selectAllTour(tname);
   }
   
}