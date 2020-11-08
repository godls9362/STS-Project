package com.human93.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthenticationInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		// session ��ü�� ������
		System.out.println("preHandle start");
        HttpSession session = request.getSession();
        // loginó���� ����ϴ� ����� ������ ��� �ִ� ��ü�� ������
        Object obj = session.getAttribute("login");

        if ( obj == null ){
        	// �α����� �ȵǾ� �ִ� ���������� �α��� ������ �ٽ� ��������(redirect)
            response.sendRedirect(request.getContextPath()+"/login");
            return false; // // ���̻� ��Ʈ�ѷ� ��û���� ���� �ʵ��� false�� ��ȯ��
        }

        // preHandle�� return�� ��Ʈ�ѷ� ��û url�� ���� �ǳ� �ȵǳĸ� �㰡�ϴ� �ǹ���
        // ���� true���ϸ� ��Ʈ�ѷ� url�� ���� ��.
        System.out.println("preHandle end");
        return true;
		
		//return super.preHandle(request, response, handler);
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		super.postHandle(request, response, handler, modelAndView);
		 System.out.println("postHandle end");
	}

}