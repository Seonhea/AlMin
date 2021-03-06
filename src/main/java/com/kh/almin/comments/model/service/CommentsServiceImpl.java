package com.kh.almin.comments.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.almin.comments.model.dao.CommentsDao;
import com.kh.almin.comments.model.vo.CommentsCompany;

@Service("commentsService")
public class CommentsServiceImpl implements CommentsService {
	@Autowired
	private CommentsDao commentsDao;

// ==============================================================================
	// 모든 후기 키워드 가져오기(insert)
	@Override
	public Map<String, List<String>> selectAllKeyWords() throws Exception {
		return commentsDao.selectAllKeyWords();
	}
// ==============================================================================
	// 후기 작성(insert)
	@Override
	public int insertComments(List<List<String>> commentsList, CommentsCompany commentsCompany, String insertOrUpdate) throws Exception {
		return commentsDao.insertComments(commentsList, commentsCompany, insertOrUpdate);
	}
// ==============================================================================
	// 특정 공고의 전체 후기 조회(select)
	@Override
	// public Map<String, Object> selectAllComments(int rNo, String userId) throws Exception {
	public Map<String, Object> selectAllComments(int rNo, String userId, int pageNum) throws Exception {
		return commentsDao.selectAllComments(rNo, userId, pageNum);
	}
// ==============================================================================
	// 후기 삭제 --> 조건 : 공고번호(CC_RECRUIT_NO) & 작성자 ID
	@Override
	public int deleteComment(int recruitNo, String id) throws Exception {
		return commentsDao.deleteComment(recruitNo, id);
	}
// ==============================================================================
	// 현재 접속자의 해당 공고 후기 작성 유무 확인
	@Override
	public int findComments(String userId, int recruitNo) throws Exception {
		return commentsDao.findComments(userId, recruitNo);
	}
// ==============================================================================
	// 후기 카테고리별 가장 많은 키워드보기
	@Override
	public ArrayList<Map<String, String>> showManyKeyWord(String recruitNo) throws Exception {
		return commentsDao.showManyKeyWord(recruitNo);
	}
}
