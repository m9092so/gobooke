package kr.or.gobooke.cart.service;

import java.util.List;

import kr.or.gobooke.cart.dao.CartDao;
import kr.or.gobooke.cart.dao.JdbcCartDao;
import kr.or.gobooke.cart.domain.Cart;
import kr.or.gobooke.cart.domain.CartList;
import kr.or.gobooke.common.db.DaoFactory;
import kr.or.gobooke.common.web.Params;

/**
 * Users 비즈니스 메소드 선언
 * 
 * @author 김수진
 *
 */

public class CartServiceImpl implements CartService {
	
	CartDao cartDao = (CartDao) DaoFactory.getInstance().getDao(JdbcCartDao.class);

	@Override
	public void create(Cart cart) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<CartList> listAll(String userId) {
		return cartDao.listAll(userId);
	}

	@Override
	/** 카트리스트 부분 조회 */
	public List<CartList> listSome(String userId, int[] cartNoList){
		return cartDao.listSome(userId, cartNoList);
	}

	@Override
	/** 카트 수정 */
	public void update(String userId, String bookTitle, int qty) {
		cartDao.update(userId, bookTitle, qty);
	}

	@Override
	/** 카트 삭제 */
	public void deleteCart(String userId,String bookTitle) {
		cartDao.deleteCart(userId, bookTitle);
	}
	


}
