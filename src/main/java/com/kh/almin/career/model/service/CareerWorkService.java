package com.kh.almin.career.model.service;

import java.util.List;
import java.util.Map;

import com.kh.almin.career.model.vo.MemberWork;

public interface CareerWorkService {
// ===================================================================================================================
	// 근무 일정 전체 조회(select)
	public List<Map<String, String>> selectWorkCalList(String userId) throws Exception;
// ===================================================================================================================
	// 근무 일정 입력(insert)
	public int insertWork(MemberWork insertMemberWork) throws Exception;
// ===================================================================================================================
	// 근무 일정 삭제(조건 : 유저 아이디, 일정 번호)
	public int deleteWork(MemberWork deleteMemberWork) throws Exception;
// ===================================================================================================================
	// 근무 일정 수정(받는 값 : 일정 번호(ID), 유저 아이디, 일정 제목, 일정 색상, 시작일(시간), 종료일(시간), 시급)
	public int updateWork(MemberWork updateMemberWork) throws Exception;
// ===================================================================================================================
}