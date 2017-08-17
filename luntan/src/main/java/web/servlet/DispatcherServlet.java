package web.servlet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class DispatcherServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		invoke(request, response);
		
	}
	
	
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		invoke(request, response);
	}



	public void invoke(HttpServletRequest request,HttpServletResponse response){
		//获得当前请求的URL地址
		String uri = request.getRequestURI();
		String contextPath = request.getContextPath();
		uri = uri.substring(contextPath.length());
		if(uri.startsWith("/")){
			uri = uri.substring(1);
		}
		if(uri.endsWith("/")){
			uri = uri.substring(0, uri.length()-1);
		}
		String methodName = null;
				
				//得到这个方法对象
			
					methodName = uri.split("/")[1];
					Method method = null;
					try {
						method = this.getClass().getMethod(methodName, HttpServletRequest.class,HttpServletResponse.class);
					} catch (NoSuchMethodException | SecurityException e) {
					
						e.printStackTrace();
					}
					try {
						method.invoke(this, request,response);
					} catch (IllegalAccessException | IllegalArgumentException | InvocationTargetException e) {
					
						e.printStackTrace();
					}
			
	}
	
}
