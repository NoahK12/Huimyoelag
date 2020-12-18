package interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	public LoginInterceptor() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		// 브라우져창의 주소를 가져옴 =>/myinterceptor/noticeList.do
		String uri = request.getRequestURI();

		// 끝에서 부터 검색해서 /가 걸리는 부분에서 인덱스값을 가져와 substring으로 출력
		String uri1 = uri.substring(uri.indexOf("/")+1); // noticeList.do
		String uri2 = uri1.substring(uri1.indexOf("/"));
		//List<String> a = uri.
		// 오버라이딩한 부분은 인자값 수정불가해서 선언따로 해줌
		HttpSession session = request.getSession();

		// 로그인 상태가 아니면
		if (session.getAttribute("userId") == null) {

			// uri는 dispatcher-gozip에서 설정해놓은 주소임
			response.sendRedirect("/huimyoelag/auth/login.do?returnUrl=" + uri2 + "&loginCheck=1");// noticeList.do를 넘겨줌
			return false; // noticeList의 controller 실행을 멈춤

		} else {
			return true; // true로 컨트롤러 실행됨
		}

	}// end preHandle

}// end class
