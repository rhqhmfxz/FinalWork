package dao;

import java.io.IOException;


import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginFilter implements javax.servlet.Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// ��������������Ҫ�õ�request,response,session����
		HttpServletRequest servletRequest = (HttpServletRequest) request;
		HttpServletResponse servletResponse = (HttpServletResponse) response;
		HttpSession session = servletRequest.getSession();
		// ����û������URI
		String path = servletRequest.getRequestURI();
		//System.out.println(path);  
		// ��session��ȡ�û���Ϣ
		String empId = (String) session.getAttribute("userName");
		// ��½ҳ���������
		if(path.indexOf("/login.jsp") > -1) {
			chain.doFilter(servletRequest, servletResponse);
			return;
		}
		// �ж����û��ȡ��Ա����Ϣ,����ת����½ҳ��
		if (empId == null || "".equals(empId)) {
			// ��ת����½ҳ��
			servletResponse.sendRedirect("/login.jsp");
		} else {
		// �Ѿ���½,�����˴�����
			chain.doFilter(request, response);
		}	
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}

	
}