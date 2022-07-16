package com.test.mvc;

public class MoneyCalendar
{

	public String getyOptions(int sYear)
	{		
		String yOptions = "";
		
		for(int year=(sYear-2); year<=(sYear+2); year++)
		{
			if(year==sYear)
				yOptions += "<option value='" + year + "'selected='selected'>" + year + "</option>";
			else
				yOptions += "<option value='" + year + "'>" + year + "</option>";
		}
		
		return yOptions;
	}
	
	public String getmOptions(int sMonth)
	{
		String mOptions = "";
		
		for (int month=1; month<=12; month++)
		{
			if(month==sMonth)
				mOptions += "<option value='" + month + "' selected='selected'>" + month + "</option>";
			else
				mOptions += "<option value='" + month + "'>" + month + "</options>";
		}
		
		return mOptions;
	}
	
	public String getCalendar(int sYear, int sMonth)
	{
		
		// Calendar 객체 생성
		java.util.Calendar cal = java.util.Calendar.getInstance();
		
		// 오늘
		cal.add(java.util.Calendar.MONTH, 0);
		int nowYear = cal.get(java.util.Calendar.YEAR);
		int nowMonth = cal.get(java.util.Calendar.MONTH)+1;
		int nowDay = cal.get(java.util.Calendar.DAY_OF_MONTH);
		
		// 월별 날짜
		int[] months = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
		
		if (sYear%4==0 && sYear%100!=0 || sYear%400==0)
			months[1] = 29;
		
		// 총 날 수 누적 변수
		int nalsu;
		
		// 요일
		String[] weekNames = {"일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"};
		
		nalsu = (sYear-1)*365 + (sYear-1)/4 - (sYear-1)/100 + (sYear-1)/400;
		
		for(int i=0; i<sMonth-1; i++)
			nalsu += months[i];
		nalsu++;
		int week = nalsu%7;
		int lastDay = months[sMonth-1];
		
		// 달력 그리기
		String calStr = "";
		
		calStr += "<table border='1'  class='col-12' id='calendar'>";
		
		// 요일 이름 발생
		calStr += "<tr>";
		for (int i=0; i<weekNames.length; i++)
		{
			if(i==0)									// 일요일
				calStr += "<th style='font-weight:bold; text-align:center; color:red;'>" + weekNames[i] + "</th>";
			else if(i==6)								// 토요일
				calStr += "<th style='font-weight:bold; text-align:center; color:blue;'>" + weekNames[i] + "</th>";
			else										// 평일
				calStr += "<th style='font-weight:bold; text-align:center;'>" + weekNames[i] + "</th>";
		}
		calStr += "</tr>";
		// 빈 칸 공백 td 발생
		calStr += "<tr>";
		for (int i=1; i<=week; i++)
			calStr += "<td class= 'blank'></td>";

		// 날짜 td 발생
		for (int i=1; i<=lastDay; i++)
		{
			week++;								//-- 날짜가 하루씩 찍힐 때 마다(구성이 이루어질 때 마다) 요일도 함께 1씩 증가~!!!	check~!!!
				
			if(sYear==nowYear && sMonth == nowMonth && i==nowDay && week%7==0) //-- 토요일인 오늘
				calStr += "<td id="+i+" class='nowSat'></td>";
			else if (sYear==nowYear && sMonth == nowMonth && i==nowDay && week%7==1) //-- 일요일인 오늘
				calStr += "<td id="+i+" class='nowSun'></td>";
			else if(sYear==nowYear && sMonth == nowMonth && i==nowDay)		//-- 평일인 오늘
				calStr += "<td id="+i+" class='now'></td>";
			
			
			else if( (sYear<=nowYear && sMonth<nowMonth) || (sYear==nowYear && sMonth==nowMonth && i<nowDay)  )		//-- 과거
				calStr += "<td id="+i+" class='past'></td>";
			
			
			else if( (sYear>=nowYear && sMonth>nowMonth) || (sYear==nowYear && sMonth==nowMonth && i>nowDay)  )		//-- 미래
				calStr += "<td id="+i+" class='future'></td>";
			
			
			else if (week%7==0)															//-- 오늘이 아닌 토요일
				calStr += "<td id="+i+" class='sat'></td>";
			else if (week%7==1)															//-- 오늘이 아닌 일요일
				calStr += "<td id="+i+" class= 'sun'></td>";
			else																		//-- 오늘이 아닌 평일
				calStr += "<td id="+i+"></td>";
				
			if(week%7 == 0)
				calStr += "</tr><tr>";
		}
		
		// 빈칸 공백 td 발생
		for (int i=0 ; i<=week; i++, week++)
		{
			if (week%7==0)
				break;
			calStr += "<td class= 'blank'></td>";
		}
		
		if (week%7!=0)
			calStr += "</tr>";
		
		calStr += "</table>";
		
		
		return calStr;
		
	}
}
