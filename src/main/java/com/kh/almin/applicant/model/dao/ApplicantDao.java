package com.kh.almin.applicant.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.almin.applicant.model.vo.Applicant;
import com.kh.almin.applicant.model.vo.LikeApplicant;
import com.kh.almin.applicant.model.vo.SearchApplicant;

@Repository
public class ApplicantDao {
//	private static final Logger logger = LoggerFactory.getLogger(ApplicantDao.class);
	@Autowired
	private SqlSession sqlSession;

	public List<Applicant> getApplicants() throws Exception {
		return sqlSession.selectList("Applicant.listApplicant");
	}

	public List<Applicant> searchApplicant(SearchApplicant searchApplicant) throws Exception {
		return sqlSession.selectList("Applicant.searchApplicant", searchApplicant);
	}

	public int likeApplicant(LikeApplicant likeApplicant) throws Exception {
		return sqlSession.insert("Applicant.doLike", likeApplicant);
	}

	public int dislikeApplicant(LikeApplicant likeApplicant) throws Exception {
		return sqlSession.delete("Applicant.disLike", likeApplicant);
	}

	public List<Applicant> listLike(String companyId) throws Exception {
		return sqlSession.selectList("Applicant.listLike", companyId);
	}

	public int checkLike(LikeApplicant likeApplicant) throws Exception {
		return sqlSession.selectOne("Applicant.checkLike", likeApplicant);
	}
}
