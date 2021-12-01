package com.kh.almin.resume.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.almin.resume.model.dao.ResumeDao;
import com.kh.almin.resume.model.vo.MemberResume;

@Service
public class ResumeServicelmpl implements ResumeService {
	@Autowired
	private ResumeDao resumeDao;
	public int insertResume(MemberResume mr) throws Exception {
		return resumeDao.insertResume(mr);
	}
	public List<MemberResume> selectAllResume(MemberResume mr) throws Exception{
		return resumeDao.selectAllResume(mr);
	}
	public List<MemberResume> selectResume() throws Exception{
		return resumeDao.selectResume();
	}
	
}