// 구글 캘린더 ID
//let ggCalId = 'chsh9410@gmail.com';
let ggCalId = 'raddernepa@gmail.com';

// 구글 캘린더 한국 달력 ID
let ggCaKoId = 'ko.south_korea#holiday@group.v.calendar.google.com';

// 드래그로 수정한 시작 날짜
let dragUpdateStart;

// 드래그로 수정한 종료 날짜
let dragUpdateEnd;

// 드래그 수정 조건에 사용될 id
let dragId;

// ==========================================================================================
// 경력 insert 버튼
let careerIsertBtn = document.getElementById('career_insert_btn');

// 업무 직종 <select>
let jobTypeSelect = document.getElementById('job_type');

// 근무 직종 <select>
let jobPeriodSelect = document.getElementById('job_period');

// 근무 내용 <input>
let careerInputEle = document.getElementById('careerTitle');

// 개인 경력 입력 <table>
let careerInputTable = document.getElementById('careerInputTable');

// 급여 & 매장명을 담는 <table>
let moneyTable = document.getElementById('moneyTabelReal');

// 차트 load 오류 문제를 막기 위한 변수
let chartLoad;

// 켈린더 전체 영역
let calDiv = document.getElementById('calendar');

// chart 전체 영역
let chartDiv = document.getElementById('chartBox');

// (지원 / 면접일자), (근무 관리) calender를 구분하기 위한 변수()
let selectCal = "";

// (지원 / 면접일자) 달력 선택 버튼
let needCalButn = document.getElementById('needCalBtn');

// (근무 관리) 달력 선택 버튼
let workCalButn = document.getElementById('workCalBtn');

// (경력 관리) 선택 버튼
let careerCalButn = document.getElementById('careerCalBtn');

// 사이드 (경력 추가) 버튼
let careerInsertBtn = document.getElementById('careerInsertBtn');

// 모달 배경(검은 배경)
let modalBack = document.getElementById('ModalBg');

// 미니 달력 모달칭 배경
let miniCalBack = document.getElementById('mimiCalbg');

// 시급 입력 <label>
let moneyLabelEle = document.getElementById('work_money_label');

// 제목 입력칸
let titleEle = document.getElementById('recipient-name');

// 시작일 입력칸
let startDayEle = document.getElementById('startDay');

// 종료일 입력칸
let endDayEle = document.getElementById('endDay');

// 시작 시간 입력칸
let startTimeEle = document.getElementById('startTime');

// 종료 시간 입력칸
let endTimeEle = document.getElementById('endTime');

// 색깔 입력칸
let colorEle = document.getElementById('colorPicker');

// 일정 추가 모달창에서 시작일, 종료일 <div>의 id를 담을 변수
let selectTest;

// 클릭한 이벤트의 ID 번호
let eventGroupId;

// 시작 날짜 + 시간
let allStart;

// 종료 날짜 + 시간
let allEnd

// 입력 모달창 상단 버튼 4개
let labelEles = document.getElementsByClassName('modalTypeLabel');

// 지원 <label>
let goLabelEle = document.getElementById('goLabel');

// 면접 <label>
let meetLabelEle = document.getElementById('meetLabel');

// 근무 <label>
// let workLabelEle = document.getElementById('workLabel');

// 기타 <label>
let otherLabelEle = document.getElementById('"otherLabel"');

// 라디오 버튼 element(모달창 4개의 라디오 버튼)
let inputRadioEle = document.querySelectorAll(".typeRadio");

// 클릭된 라디오 버튼의 value
let fourbtnEleVal;

// 근무 & 시급 입력 정규식
let workTimeMoneyReg = /^[0-9]/;
// let workTimeMoneyReg = /^[0-9]{1,10}$/;

// 시급 입력 <input>
let workMoneyInputEle = document.getElementById("money_input");

// 근무 시간 입력 <input>
let workTimeInputEle = document.getElementById("time_input");

// 근무 & 시급 입력 <div> 박스
let workTimeBox = document.getElementById("work_time_money_box");

// 시급  <label>
let moneyLabel = document.getElementById("money_label_id");

// 근무시간  <label>
let workLabel = document.getElementById("time_label_id");

// 모달창 일정 등록 버튼
let calSubmitBtn = document.getElementById('calSubmitBtn');

// 모달창 일정 수정 버튼
let calUpdateBtn = document.getElementById('calUpdateBtn');

//모달창 일정 삭제 버튼
let calDeleteBtn = document.getElementById('calDeleteBtn');

//달력 최상단 제목 <div>
let topCalTitle = document.getElementById('top_title');

// Ajax를 통해 @PathVariable로 보낼 경로(근무 / 구직 관리)
const getPath = "/almin/careers/calender/" + userId;

//Ajax를 통해 @PathVariable로 보낼 경로(근무 관리)
const getWorkPath = "/almin/careers/works/" + userId;