package com.test.mvc;

public class Paging
{
	
	// ■ 전체 페이지 수를 구하는 메소드
	// numPerPage : 한 페이지에 표시할 데이터(게시물)의 수
	// allPostCount : 전체 데이터(게시물) 수
	public int getPageCount(int numPerPage, int allPostCount)
	{
		int pageCount = 0;
		pageCount = allPostCount / numPerPage;
		
		// 나눈 값이 0으로 나누어떨어지지 않으면 1 추가!
		// 왜?? 23개 게시글을 10개씩 보여주면 기본 2페이지에 『3개만 보여줄 1페이지』가 추가되니까
		if (allPostCount%numPerPage != 0)
		{
			pageCount++;
		}
		
		return pageCount;
	}
	
	
	// ■ 페이징 처리 기능의 메소드
	// currentPage : 현재 표시할 페이지
	// totalPage : 전체 페이지 수
	// listUrl : 링크를 설정할 url
	public String pageIndexList(int pageNum, int pageCount, String url)
	{
		StringBuffer strList = new StringBuffer();
		
		int numPerBlock = 10;
		//-- 페이징 처리 시 게시물 리스트 하단의 숫자
		//-- ex 1 2 3 4 5 6 7 8 9 10 다음 끝으로
		
		int currentPageSetup;
		//-- 현재 페이지
		
		int page;
		int n;
		//-- 이전 페이지 블럭과 같은 처리에서 이동하기 위한 변수
		// (얼마만큼 이동해야 하는지 ...)
		
		
		// 페이징 처리가 별도로 필요하지 않은 경우
		//-- 데이터가 존재하지 않거나 데이터의 수가
		// 1 페이지도 못채우는 경우는 별도로 페이징 처리를 할 필요가 없다.
		if(pageNum==0)
			return "";
		
		
		// ※ 페이지 요청을 처리하는 과정에서
		// URL 경로의 패턴에 대한 처리
		/*
			- 클라이언트 요청의 형태 → List.jsp → (가공) → List.jsp + 『?』 + pageNum=1
			? 없을땐 ? 붙여주기
			
			- 클라이언트 요청의 형태 → List.jsp?subject=study → (가공) → List.jsp?subject=study + 『&』 + pageNum=1
			? 있을땐 & 붙여주기
		*/
		
		// 링크를 설정할 URL 에 대한 선가공 처리~!!
		if(url.indexOf("?") != -1)	// 링크를 설정할 URL 에 『?』가 들어있으면 ...
		{
			url = url + "&";	// List.jsp?어쩌구=어쩌구 + 『&』
		}
		else							// 링크를 설정할 URL 에 『?』가 없으면 ...
		{
			url = url + "?";	// List.jsp + 『?』
		}
		//-- 예를 들어, 검색값이 존재하면
		// 이미 request 값에 searchKey 값과 searchValue 값이 들어있는 상황이므로
		// 『&』를 붙여서 속성값을 추가해 주어야 한다.
		
		
		// currentPageSetup = 표시할 첫 페이지보다 -1
		currentPageSetup = (pageNum / numPerBlock) * numPerBlock;
		//-- 만약 현재 페이지가 5페이지라면 currentPage는 5
		// 리스트 하단에 보여줄 페이지 갯수가 10이면 numPerBlock는 10
		// 5 / 10 은 0 이며 ... 여기에 *10 (10을 곱해도) 0이다.
		// 그러면 .. currentPageSetup 은 0이 되는 것이다.
		
		// 하지만, 현재 페이지가 11페이지라면 ... 즉, currentPage가 11이라면
		// 11 / 10 은 1 이며 ... 여기에 *10하면 10이다.
		// 그러면 .. currentPageSetup 은 10이 되는 것이다.
		
		// 근데 이러면 10페이지일땐 0, 20페이지일땐 10 ...
		
		if (pageNum % numPerBlock == 0)
		{
			currentPageSetup = currentPageSetup - numPerBlock;
		}
		//-- 만약 위 처리에서
		// 현재 페이지가 20페이지였다면 (currentPage=20)
		// 20 / 10 = 2 이며 .. 여기에 *10 은 20이 되는데
		// 이와 같은 상황이라면 다시 10을 빼서 10으로 만들어주기 위한 구문
		
		
		// ● 1 페이지 (맨처음으로)
		if ( (pageCount>numPerBlock) && (currentPageSetup>0))
			{
				strList.append(" <a href='" + url + "pageNum =1'>1</a>");
			}
		//-- 1~10을 보여줄 땐 맨처음으로 버튼 필요없음!
		//-- listUrl 은 위에서 이미 전처리가 끝난 상황이기 때문에
		// ? 나 & 가 붙은 상태
		// 이로인해 결과는 ?pageNum=1 이거나 ...&pageNum=1 이 되는 상황
		
		
		// ● Prev (이전으로)
		n = pageNum - numPerBlock;
		//-- n : 해당 페이지만큼 앞으로 가기 위한 변수
		
		if ( (pageCount>numPerBlock) && (currentPageSetup>0) )
		{
			strList.append(" <a href='" + url + "pageNum=" + n + "'>Prev</a>");
		}
		//-- currentPageSetup 이 0 보다 큰 경우는
		// 이미 페이지가 11 이상이라는 의미이며
		// 이 때, 현재 페이지가 (currentPage)가 11 이상일 경우
		// 『Prev』를 붙이기 위한 구문.
		// -- 『Prev』 를 클릭할 경우
		// n 변수 페이지로 이동하는데
		// 12 에서 『Prev』 할 경우 2 페이지가 되고,
		// 22 에서 『Prev』 할 경우 12 페이지가 될 수 있도록 처리하는 방식이다.
		
		
		// ● 각 페이지 바로가기
		page = currentPageSetup + 1;
		//-- 『+1』을 수행하는 이유는
		// 앞에서 currentPageSetup 에서 10을 가져왔다면
		// 10부터 시작하는 것이 아니라 ***
		// 바로가기 페이지는 11부터 시작해야 하기 때문이다.
		
		while ( (page<=pageCount) && (page<=currentPageSetup+numPerBlock) )
		{
			
			// 내가 13페이지에 있으면 13페이지는 링크걸리면 안댐! 그래서 스타일만!!!
			if (page == pageNum)
			{
				strList.append(" <span style='color:orange; font-weight:bold;'>" + page + "</span>");
			}
			else
			{
				strList.append(" <a href='" + url + "pageNum=" + page + "'>" + page + "</a>");
			}
			
			page++;
		}
		
		
		// ● Next (다음으로)
		n = pageNum + numPerBlock;
		if( (pageCount-currentPageSetup) > numPerBlock )
		{
			strList.append(" <a href='" + url + "pageNum=" + n + "'>Next</a>");
		}
		
		
		// ● 마지막 페이지 (맨마지막으로)
		// 마지막페이지는 마지막페이지 넘버가 들어가야함
		if( (pageCount>numPerBlock) && (currentPageSetup + numPerBlock)<pageCount )
		{
			strList.append(" <a href='" + url + "pageNum=" + pageCount + "'>" + pageCount + "</a>");
		}
		
		// 원래는 태그마다 앞에 공백 태그 만들어야하는데 귀찮아서 띄어쓰기로~
		
		return strList.toString();
		
	}
}
