package kr.magasin.board.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import kr.magasin.board.model.dao.NoticeDao;
import kr.magasin.board.model.vo.Notice;
import kr.magasin.board.model.vo.PageData;
import kr.magasin.common.JDBCTemplate;

public class NoticeService {
	NoticeDao dao = new NoticeDao();
	public PageData noticeList(int reqPage) {
		// TODO Auto-generated method stub
		Connection conn = JDBCTemplate.getConnection();
		/*ArrayList<Notice> list = dao.noticeList(conn);*/
		int totalCount = dao.totalCount(conn);
	
		int numberPage = 15;
		int totalPage = (totalCount % numberPage ==0) ? (totalCount/ numberPage) : (totalCount/numberPage)+1;
		int start = (reqPage-1)* numberPage +1;
		int end = reqPage*numberPage;
		ArrayList<Notice> list = dao.noticeList(conn,start, end);
		String pageNavi = "";
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1) / pageNaviSize) * pageNaviSize + 1;
		if(pageNo!=1) {
			pageNavi += "<a class='btn paging-btn' href='/noticeList?reqPage="+(pageNo-1)+"'>이전</a>";
		}
		int i= 1;
		while(!(i++>pageNaviSize|| pageNo>totalPage)) {
			if(reqPage == pageNo) {
				pageNavi += "<span class='selectPage'>"+pageNo+"</span>";
			}else {
				pageNavi += "<a class='btn paging-btn' href='/noticeList?reqPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		if(pageNo <= totalPage) {
			pageNavi += "<a class='btn paging-btn' href='/noticeList?reqPage="+pageNo+ "'>다음</a>";
	
		}
		
		PageData pd = new PageData(pageNavi, list, null, null, null,null,null);
		
		JDBCTemplate.close(conn);
		return pd;
	}
	public Notice noticeOne(int noticeNo) {
		// TODO Auto-generated method stub
		Connection conn = JDBCTemplate.getConnection();
		Notice n = dao.noticeOne(conn, noticeNo);
		if(n!=null) {
			// 조회수UP
			int result = dao.noticeCountUp(conn,noticeNo);
			if(result>0) {
				JDBCTemplate.commit(conn);
				
			}else {
				JDBCTemplate.rollback(conn);
			}
		}
		JDBCTemplate.close(conn);
		return n;
	}
	public int noticeInsert(Notice n) {
		// TODO Auto-generated method stub
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.noticeInsert(conn,n);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
			
		}
		JDBCTemplate.close(conn);
		return result;
	}
	public int noticeUpdate(Notice n) {
		// TODO Auto-generated method stub
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.noticeUpdate(conn, n);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
		
	}
	public int noticeDelete(int noticeNo) {
		// TODO Auto-generated method stub
		Connection conn= JDBCTemplate.getConnection();
		int result = dao.noticeDelete(conn, noticeNo);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

}
