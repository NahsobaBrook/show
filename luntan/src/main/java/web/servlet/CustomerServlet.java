package web.servlet;


import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import entity.Customer;
import service.CustomerService;
import service.CustomerServiceImpl;

@WebServlet("/customer/*")
@MultipartConfig(location="F:/userHead", maxFileSize=1024*1024*100)
public class CustomerServlet extends DispatcherServlet{
		
	private CustomerService  customerService = new CustomerServiceImpl();
	
	/**
	 * 注册方法
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void reg(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

		String account = request.getParameter("account");
		String password = request.getParameter("password");

		String finalHead = "moren.jpg";	
		Customer customer = new Customer();
		customer.setAccount(account);
		customer.setPassword(password);
		customer.setHead(finalHead);
		customer = customerService.registe(customer);
		if(customer == null){
			request.getRequestDispatcher("/reg.jsp").forward(request, response);
		}else{	
			HttpSession session = request.getSession();
			session.setAttribute("customer", customer);
			response.sendRedirect("/index.jsp");
		}
	}
	
	public void repeatId(HttpServletRequest request, HttpServletResponse response) throws IOException{
		String account = request.getParameter("account");
		PrintWriter out = response.getWriter();
		if(customerService.find(account) == null){		
			out.print(false);
		}else{
			out.print(true);		
		}
	}
	
	/**
	 * 登录方法
	 * @param request
	 * @param response
	 * @throws IOException
	 * @throws ServletException
	 */
	public void login(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		String account = request.getParameter("account");
		String password = request.getParameter("password");
		
		Customer customer = customerService.login(account, password);
		if(customer != null){
			HttpSession session = request.getSession();
			session.setAttribute("customer", customer);
			response.sendRedirect("/index.jsp");
		}else{
			request.setAttribute("error", "账号或密码错误");
			request.getRequestDispatcher("/login.jsp").forward(request, response);
		}
		
	}

}
