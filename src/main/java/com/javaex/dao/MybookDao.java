package com.javaex.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.MybookVo;

@Repository
public class MybookDao {
	
	@Autowired
	private SqlSession sqlSession;

	
	public List<MybookVo> getList(int userNo){
		System.out.println("MybookDao.getList()");
		
		List<MybookVo> mbList = sqlSession.selectList("mybook.selectList", userNo);
		System.out.println(mbList.toString());
		
		return mbList;
	}
	
	public List<MybookVo> getPopular(int userNo){
		System.out.println("MybookDao.getPopular()");
		
		List<MybookVo> mbList = sqlSession.selectList("mybook.selectpopular", userNo);
		System.out.println(mbList.toString());
		
		return mbList;
	}
	
	public int checklike(MybookVo checklike){
		System.out.println("MybookDao.checklike()");
		
		List<MybookVo> likecount = sqlSession.selectList("mybook.checklike", checklike);
		int count = likecount.size();
		
		System.out.println(count+"건 조회됨");
				
		return count;
	}
	
	public void like(MybookVo checklike) {
		System.out.println("MybookDao.like()");
		
		int count = sqlSession.insert("mybook.like", checklike);
		System.out.println(count+"건을 좋아요하였습니다.");
	}
	
	
	
	
	public void dislike(MybookVo checklike) {
		System.out.println("MybookDao.dislike()");
		
		int count = sqlSession.delete("mybook.dislike", checklike);
		System.out.println(count+"건을 좋아요 취소하였습니다.");
	}
	
	
}
