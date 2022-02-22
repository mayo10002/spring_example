package com.example.lesson03.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.lesson03.dao.ReviewDAO;
import com.example.lesson03.model.Review;

@Service
public class ReviewBO {
	@Autowired
	private ReviewDAO reviewDAO;

	public Review getReview(int id) {
		return reviewDAO.selectReview(id);
	}

	public int addReview(Review review) {
		// int : 지금 insert된 행이 몇 개인지 알려준다.
		return reviewDAO.InsertReview(review);
	}
	
	public int addReviewAsField(int storeId, String menu, String userName, 
			double point, String review) {
		return  reviewDAO.insertReviewAsField(storeId, menu, userName, point, review ); 
	}
}
