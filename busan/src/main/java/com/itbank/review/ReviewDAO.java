package com.itbank.review;

import java.util.List;

public interface ReviewDAO {

	int insertReview(ReviewDTO dto);

	List<ReviewDTO> selectAllFood(String fname);

	List<ReviewDTO> selectAllCafe(String cname);

	List<ReviewDTO> selectAllTour(String tname);

}