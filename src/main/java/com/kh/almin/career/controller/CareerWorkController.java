package com.kh.almin.career.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.almin.career.model.service.CareerNeedService;
import com.kh.almin.career.model.service.CareerWorkService;
import com.kh.almin.career.model.vo.MemberNeed;
import com.kh.almin.career.model.vo.MemberWork;

@Controller
@RequestMapping("/careers")
public class CareerWorkController {
	@Autowired
	private CareerWorkService careerWorkService;
	
	private static final Logger logger = LoggerFactory.getLogger(CareerWorkController.class);
// ===================================================================================================================
	// 근무 일정 전체 조회(select)
	@GetMapping(value = "/works/{userId}", produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String selectWorkCalList(@PathVariable("userId") String userId) throws Exception {
		System.out.println("@work GetMapping 진입");
		System.out.println("@work PathVariable(\"userId\") : " + userId);
		
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		
		List<Map<String, String>> workList = null;
		
		try {
			workList = careerWorkService.selectWorkCalList(userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String jsonStr = gson.toJson(workList);
		System.out.println("jsonStr : " + jsonStr);
		return jsonStr;
	}
// ===================================================================================================================
	// 근무 일정 입력(insert)
	@PostMapping("/works")
	@ResponseBody
	public String insertWork(@RequestBody String insertInfo) {
		System.out.println("works @PostMapping(\"/insertneed\") 진입");
		System.out.println("insertInfo : " + insertInfo);
		
		Gson gson = new GsonBuilder().create();
		MemberWork insertMemberWork = gson.fromJson(insertInfo, MemberWork.class);
		System.out.println("insertMemberWork : " + insertMemberWork);
		
		int result = 0;
		try {result = careerWorkService.insertWork(insertMemberWork);} catch (Exception e) {e.printStackTrace();}
		
		String resultStr = "";
		if (result == 1) {resultStr = "ok";} else {resultStr = "false";}
		return resultStr;
	}
// ===================================================================================================================
	// 근무 일정 삭제(조건 : 유저 아이디, 일정 번호)
	@DeleteMapping(value = "/works")
	@ResponseBody
	public String deleteWork(@RequestBody String deleteInfo) {
		System.out.println("works @DeleteMapping(\"/insertneed\") 진입");
		System.out.println("deleteInfo : " + deleteInfo);
		
		Gson gson = new GsonBuilder().create();
		MemberWork deleteMemberWork = gson.fromJson(deleteInfo, MemberWork.class);
		System.out.println("insertMemberWork : " + deleteMemberWork);
		
		int result = 0;
		try {result = careerWorkService.deleteWork(deleteMemberWork);} catch (Exception e) {e.printStackTrace();}
		
		String resultStr = "";
		if (result == 1) {resultStr = "ok";} else {resultStr = "false";}
		return resultStr;
	}
// ===================================================================================================================
	// 근무 일정 수정(받는 값 : 일정 번호(ID), 유저 아이디, 일정 제목, 일정 색상, 시작일(시간), 종료일(시간), 시급)
	@PatchMapping("/works")
	@ResponseBody
	public String updateWork(@RequestBody String updateInfo) {
		System.out.println("works @PatchMapping(\"/insertneed\") 진입");
		System.out.println("updateInfo : " + updateInfo);
		
		Gson gson = new GsonBuilder().create();
		MemberWork updateMemberWork = gson.fromJson(updateInfo, MemberWork.class);
		System.out.println("updateMemberWork : " + updateMemberWork);
		
		int result = 0;
		try {result = careerWorkService.updateWork(updateMemberWork);} catch (Exception e) {e.printStackTrace();}
		
		String resultStr = "";
		if (result == 1) {resultStr = "ok";} else {resultStr = "false";}
		return resultStr;
	}
// ===================================================================================================================
	// 차트에서 근무 데이터 조회(년&월 기준)
	@GetMapping(value = "/workchart/{userId}", produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String chartNeed(@PathVariable("userId") String userId, @RequestParam(name = "year") String year, @RequestParam(name = "month") String month) {
		System.out.println("chartWork 진입");
		System.out.println("userId : " + userId + ", year : " + year + ", month : " + month);
		
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		List<Map<String, String>> workMapChart = null;
		try {
			workMapChart = careerWorkService.chartWork(userId, year, month);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String jsonStr = "";
		jsonStr = gson.toJson(workMapChart);
		System.out.println("jsonStr : " + jsonStr);
		
		return jsonStr;
	}
// ===================================================================================================================
	// 이벤트 수정 by 드래그
	@PatchMapping(value = "/workupdatedrag")
	@ResponseBody
	public String updateCalDrag(@RequestBody String updateDragInfo) {
		System.out.println("Drag @PatchMapping 진입");
		System.out.println("updateDragInfo : " + updateDragInfo);
		
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		
		MemberWork dragMemberWork = gson.fromJson(updateDragInfo, MemberWork.class);
		System.out.println("dragMemberNeed : " + dragMemberWork);
		
		int result = 0;
		try {
			result = careerWorkService.updateCalDrag(dragMemberWork);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String resultStr = "";
		if(result == 1) {resultStr = "ok";}
		else if(result == 0) {resultStr = "false";}
		return resultStr;
	}
// ===================================================================================================================
	// 예외처리
	@ExceptionHandler
	private ModelAndView handleMemberException(Exception e) {
		logger.error(e.getMessage());
		
		//나중에 500error.jsp에서 "errorMessage" 표시해주기 + 뒤로가기, 홈으로 이동 버튼
		ModelAndView mv = new ModelAndView();
		mv.addObject("errorMessage", e.getMessage());
		mv.setViewName("error/500error");
		return mv ;
	}
}

















