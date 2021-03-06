package kr.or.gobooke.book.controller;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.gobooke.book.domain.Book;
import kr.or.gobooke.book.service.BookService;

import kr.or.gobooke.book.service.BookServiceImpl;

import kr.or.gobooke.common.controller.Controller;
import kr.or.gobooke.common.controller.ModelAndView;
import kr.or.gobooke.common.web.BookParams;
import kr.or.gobooke.common.web.InexBookPageBuilder;


/**
 * 출판사명으로 책이름 가져오는 처리
 * 
 * /book/bookstock 요청에 대한 세부 컨트롤러
 * @author 김수진
 *
 */
public class BookStockListController implements Controller {
	
	private BookService bookService=new BookServiceImpl();

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)	throws ServletException {
		ModelAndView mav = new ModelAndView();
		
		// 조건 : 국내도서/국외도서. 페이지 값, 
		BookParams params = new BookParams();
		
		int page;
		
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
			params.setPage(page);
		}
		
		List<Book> list = bookService.listStock(params);
		int rowCount = bookService.stockpageCount(params);
		
		InexBookPageBuilder pageBuilder = new InexBookPageBuilder(params, rowCount);
		pageBuilder.build();
		
		mav.addObject("rowCount", rowCount);
		mav.addObject("list", list);
		mav.addObject("params", params);
		mav.addObject("pageBuilder", pageBuilder);
		
		mav.setView("/view/admin/adminstock.jsp");
		
		return mav;
	}

}




