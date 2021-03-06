// 모달창 일정 등록 버튼
// let calSubmitBtn = document.getElementById('calSubmitBtn');
// calSubmitBtn.onclick = calSubmit;
// ========================================== 모달창 변수들 ==========================================
// 모달창 일정 등록 버튼 함수  ex) '2021-11-01T09:00'
//function calSubmit() {
//    console.log(12312312313123);
//    console.log(startDayTd.innerText);
//    console.log(endDayTd.innerText);
//    console.log(startTimeInput.value);
//    console.log(EndTimeInput.value);
//    console.log(12312312313123);
//
//    // 시작 날짜 + 시간
//    allStart = startDayTd.innerText + "T" + startTimeInput.value;
//
//    // 종료 날짜 + 시간
//    allEnd = endDayTd.innerText + "T" + EndTimeInput.value;
//    
//    // 시작일과 종료일이 같은데 종료시간이 시작시간 보다 빠를때
//    if (startDayTd.innerText === endDayTd.innerText && startTimeInput.value > EndTimeInput.value) {
//        alert('시간을 올바르게 입력해주세요');
//        EndTimeInput.value = "";
//    }
//
//    console.log(allStart);
//    console.log(allEnd);
//}

// 모달창 radio의 라벨 클릭시
for (let i = 0; i < labelEles.length; i++) {labelEles[i].onclick = changeColor;}

//모달창 버튼 4개 색깔 바꾸기
function changeColor() {
    console.log(this);
    if (this.style.backgroundColor == "royalblue" && this.style.color == "white") {
        this.style.backgroundColor = "white"; this.style.color = "royalblue";
        // console.log(this.nextElementSibling);
        // this.nextElementSibling.checked = false;
        $(this).siblings('.modalTypeLabel').css({"background-color":"royalblue","color":"white"});
    } else if(this.style.backgroundColor == "white" && this.style.color == "royalblue") {
        this.style.backgroundColor = "royalblue"; this.style.color = "white";
        $(this).siblings('.modalTypeLabel').css({"background-color":"white","color":"royalblue"});
    }
}

//// 모달창 팝업 callback function
//function modalUp() {
//    // 모달창 초기회(by 기존 일정 수정, 새로운 일정 추가)
//    startDayEle.innerText = "";
//    endDayEle.innerText = "";
//    startTimeEle.value = "";
//    endTimeEle.value = "";
//    titleEle.value = "";
//    fourbtnEleVal = "";
//    colorEle.value = "#0d6efd";
//    document.getElementById('calUpdateBtn').style.display = 'none'; // 수정 버튼 숨기기
//    
//    calUpdateBtn.style.display = 'none'; // 수정 버튼 숨기기
//    calSubmitBtn.style.display = 'block'; // 등록 버튼 보이기
//    calDeleteBtn.style.display = 'none'; // 삭제 버튼 숨기기
//    $(".modalTypeLabel").css({"background-color":"white","color":"royalblue"}); // 라벨 색깔 원래대로
//    for (let i = 0; i < inputRadioEle.length; i++) {inputRadioEle[i].checked = false;} // 라디오 버튼 체크 해제
//    
//    // 입력 모달창 타입 <label> 관련 코드
//	goLabelEle.style.display = 'block';
//	meetLabelEle.style.display = 'block';
//	workLabelEle.style.display = 'block';
//
//    modalBack.style.display = 'block';
//}

// 모달창 팝업 닫기(취소 버튼 눌렀을때)
function modalClose() {
    modalBack.style.display = 'none';
}

// 모달창 팝업 닫기(배경 눌렀을때)
window.onclick = () => {
    if (event.target == document.getElementById('ModalBg')) {
        modalBack.style.display = 'none';
    }
}

// 모달창 팝업 닫기(Esc 눌렀을때)
document.onkeydown = (event) => {
    if (event.keyCode == 27 && modalBack.style.display == 'block') {
        modalBack.style.display = 'none';
        miniCalBack.style.display = 'none';
    }
}

function miniCalUp() {
    // document.getElementById('miniCal').style.display = 'block';
    miniCalBack.style.display = 'block';
    document.getElementById('miniCal').style.display = 'block';
    // 시작일, 종료일 중 선택한 <div>의 id
    selectTest = event.target.id;

    console.log(this);
    console.log(event.target);
    console.log(event.target.id);
    console.log(selectTest);
}
// ========================== 미니 달력 load ==========================
window.onload = minicalLoad;

function minicalLoad() {
let calendar = document.querySelector('.calendar')

const month_names = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December']

isLeapYear = (year) => {
    return (year % 4 === 0 && year % 100 !== 0 && year % 400 !== 0) || (year % 100 === 0 && year % 400 ===0)
}

getFebDays = (year) => {
    return isLeapYear(year) ? 29 : 28
}

generateCalendar = (month, year) => {
    // console.log("===================");
    // console.log(month);
    // console.log(year);

    let calendar_days = calendar.querySelector('.calendar-days')
    let calendar_header_year = calendar.querySelector('#year')

    let days_of_month = [31, getFebDays(year), 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

    calendar_days.innerHTML = ''

    let currDate = new Date()
    if (!month && month != 0) month = currDate.getMonth()
    if (!year) year = currDate.getFullYear()
    // console.log("@@@@@");
    // console.log(month);
    // console.log(year);
    let curr_month = `${month_names[month]}`
    // console.log(`${month_names[month]}`);
    month_picker.innerHTML = curr_month
    calendar_header_year.innerHTML = year

    // get first day of month
    
    let first_day = new Date(year, month, 1)

    for (let i = 0; i <= days_of_month[month] + first_day.getDay() - 1; i++) {
        let day = document.createElement('div')
        if (i >= first_day.getDay()) {
            day.classList.add('calendar-day-hover')
            day.innerHTML = i - first_day.getDay() + 1
            day.innerHTML += `<span></span>
                            <span></span>
                            <span></span>
                            <span></span>`
            // if (i - first_day.getDay() + 1 === currDate.getDate() && year === currDate.getFullYear() && month === currDate.getMonth()) {
            //     day.classList.add('curr-date')
            // } //오늘날짜 class 추가 되는거
        }
        calendar_days.appendChild(day)
    }

    let dayEle = document.getElementsByClassName('calendar-day-hover');
    for (let i = 0; i < dayEle.length; i++) {
        dayEle[i].onclick = dayEleInnerText;
    }
}
function dayEleInnerText() {
    let todayNum = ((parseInt(this.innerText)) < 10) ? ("0" + this.innerText) : this.innerText;
    let monthName = document.getElementById('month-picker').innerText;
    let yearNum = document.getElementById('year').innerText;
    let monthNum;
    switch (document.getElementById('month-picker').innerText) {
        case 'January': monthNum = '01'; break;
        case 'February': monthNum = '02'; break;
        case 'March': monthNum = '03'; break;
        case 'April': monthNum = '04'; break;
        case 'May': monthNum = '05'; break;
        case 'June': monthNum = '06'; break;
        case 'July': monthNum = '07'; break;
        case 'August': monthNum = '08'; break;
        case 'September': monthNum = '09'; break;
        case 'October': monthNum = '10'; break;
        case 'November': monthNum = '11'; break;
        case 'December': monthNum = '12'; break;
    }
    console.log(monthName);
    console.log(yearNum);
    console.log(monthNum);
    console.log(todayNum);
    console.log(selectTest);
    
    // 시작일, 종료일 <div>에 넣을 값
    let saveDate = yearNum + "-" + monthNum + "-" + todayNum;
    console.log(saveDate);

    if (selectTest === 'startDay') {
        startDayEle.innerText = saveDate;
        miniCalBack.style.display = 'none'; 
        minicalLoad();
    } else if (selectTest === 'endDay') {
        endDayEle.innerText = saveDate;
        miniCalBack.style.display = 'none';
        minicalLoad();
    }

    // 시작일과 종료일의 날짜 순서가 이상할때
    // 1. 시작일 칸을 선택해서 순서가 이상할때
    if (selectTest === 'startDay' && startDayEle.innerText > endDayEle.innerText && endDayEle.innerText != "") {
        startDayEle.innerText = "";
        minicalLoad(); // 미니 달력 초기화
        alert("날짜를 올바르게 선택해주세요");
    }

    // 1. 종료일 칸을 선택해서 순서가 이상할때
    if (selectTest === 'endDay' && startDayEle.innerText > endDayEle.innerText && endDayEle.innerText != "") {
        endDayEle.innerText = "";
        minicalLoad(); // 미니 달력 초기화
        alert("날짜를 올바르게 선택해주세요");
    }

    // 날짜 선택하면 달력 감추기
    // calendar.style.display = 'none';
}
// 지켜야할 형식
// '2021-11-11T19:00:00'
// '2021-11-11T09:00:00'

let month_list = calendar.querySelector('.month-list');
$('#apple').children().remove();

month_names.forEach((e, index) => {
    let month = document.createElement('div')
    month.innerHTML = `<div data-month="${index}">${e}</div>`
    month.querySelector('div').onclick = () => {
        month_list.classList.remove('show')
        curr_month.value = index
        generateCalendar(index, curr_year.value)
    }
    month_list.appendChild(month)
})

let month_picker = calendar.querySelector('#month-picker')

month_picker.onclick = () => {
    month_list.classList.add('show')
    month_list.style.backgroundColor = 'white';
}

let currDate = new Date()

let curr_month = {value: currDate.getMonth()}
let curr_year = {value: currDate.getFullYear()}

generateCalendar(curr_month.value, curr_year.value)

document.querySelector('#prev-year').onclick = () => {
    --curr_year.value
    generateCalendar(curr_month.value, curr_year.value)
}

document.querySelector('#next-year').onclick = () => {
    ++curr_year.value
    generateCalendar(curr_month.value, curr_year.value)
}

let dark_mode_toggle = document.querySelector('.dark-mode-switch');
}
// ========================== 미니 달력 load ==========================