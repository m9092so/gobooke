package kr.or.gobooke.common.web;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

/**
 *
 * EL에서 사용할 클래스(static) 메소드 정의 
 * @author 박성준
 *
 */
public class ELUtil {
	
	/** 쿠키에 저장된 한글 디코딩 처리  */
	public static String decode(String cookieValue){
		String str = null;
		try {
			str = URLDecoder.decode(cookieValue, "utf-8");
		} catch (UnsupportedEncodingException e) {}
		return str;
	}

}
