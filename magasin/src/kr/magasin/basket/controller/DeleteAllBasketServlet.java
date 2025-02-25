package kr.magasin.basket.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.magasin.basket.model.service.BasketService;

/**
 * Servlet implementation class DeleteAllBasketServlet
 */
@WebServlet(name = "DeleteAllBasket", urlPatterns = { "/deleteAllBasket" })
public class DeleteAllBasketServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteAllBasketServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String basketUserId = request.getParameter("basketUserId");
		System.out.println("basketUserId DB 다녀오기 전 "+ basketUserId);
		BasketService service = new BasketService();
		int result = service.deleteAll(basketUserId);
		if(result>0) {
			System.out.println("basketUserId DB 다녀온 후 "+ basketUserId);
			RequestDispatcher rd = request.getRequestDispatcher("/listBasket?id="+basketUserId);
			rd.forward(request, response);
		}else {
			System.out.println("장바구니 전체 삭제 실패 ");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
