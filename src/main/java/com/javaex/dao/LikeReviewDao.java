package com.javaex.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.LikeReviewVo;

@Repository
public class LikeReviewDao {

	@Autowired
	private SqlSession sqlSession;
	
	/*해당 서평 리스트 가져오기*/
	public List<LikeReviewVo> getLRist(int userNo){
		
		System.out.println("Dao.getlrList");
		List<LikeReviewVo> lrList = sqlSession.selectList("likeReview.likeReviewList", userNo);
		System.out.println(lrList.toString());
		return lrList;
	}
	
	/*서평 정보*/
	
//	public ReviewVo getLikeReviewVo(String userNo) {
//		System.out.println("dao.getLikeReviewVo");
//		ReviewVo lrVo = sqlSession.selectOne("likeReview.getLikeReviewVo", userNo);
//		return lrVo;
//	}
	
	
}