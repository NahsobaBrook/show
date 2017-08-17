package web.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entity.Customer;
import entity.Reply;
import entity.Topic;
import service.CustomerService;
import service.CustomerServiceImpl;
import service.TimetoString;

@WebServlet("/topic/*")
public class TopicServlet extends DispatcherServlet{
	
	CustomerService cussice = new CustomerServiceImpl();

	public void mainSend(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		List<Topic> list = new ArrayList<Topic>();

		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String Title1 = title.replace("<", "&lt");
		String newTitle = Title1.replace(">", "&gt");
		
		HttpSession session = request.getSession();
		Customer customer = (Customer)session.getAttribute("customer");
		
		Topic topic = new Topic();
		topic.setAccount(customer.getAccount());
		topic.setTitle(newTitle);
		topic.setContent(content);
		
		list.add(cussice.mainSend(topic));
		
		if(list.size() != 0){	
			
			response.sendRedirect("/index.jsp");
		}
	}

	public void toComment(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
	
		String cardId= request.getParameter("cardId");
		HttpSession session = request.getSession();
		session.setAttribute("cardId", cardId);
		request.getRequestDispatcher("/topic.jsp").forward(request, response);
	}
	
	public void pingLun(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException{

		String content = request.getParameter("content");
		HttpSession session = request.getSession();
		Reply reply = new Reply();
		Customer customer = (Customer)session.getAttribute("customer");
		System.out.println(customer.getAccount());
		reply.setAccount(customer.getAccount());
		reply.setContent(content);		
		reply.setTid(Integer.parseInt(request.getParameter("tId")));
		
		if(cussice.pingLun(reply) != null){
			request.getRequestDispatcher("/topic.jsp").forward(request, response);
		}
		
	}

	public void litmtTopic(HttpServletRequest request,HttpServletResponse response) throws IOException{
		String begin = request.getParameter("begin");
		String end = request.getParameter("end");
		PrintWriter out = response.getWriter();
		
		List<Topic> list = cussice.limitFind(begin, end);
		
		if(list != null){
			for (Topic topic : list) {
				String html;
				html = "<div class='row topic'>";
				html +="<h1><a href='/luntan/topic/toComment?cardId="+topic.getId()+"'>"+topic.getTitle()+"</a></h1>";
				TimetoString newTime = new TimetoString();
				html +="<time class='block-time'>"+newTime.timeOut(topic.getSendtime())+"</time>";
				html +="<div class='content'>"+topic.getContent()+"</div>";
				Customer tempCus = cussice.find(topic.getAccount());
				html +="<div class='customer'>";
				html += "<a href='/luntan/cushome/toHome?tempAccount="+topic.getAccount()+"'>";
				html += "<img src='/head/"+tempCus.getHead()+"' style='height: 30px;width: 30px;'/></a>";
				html += "<a style='font-size:1.5em;' href='/luntan/cushome/toHome?tempAccount="+topic.getAccount()+"'>"+topic.getAccount()+"</a>";
				html += "</div></div>";
				out.print(html);
			}
		}else{
			out.print("none");
		}
	}

	public void removeBtn(HttpServletRequest request,HttpServletResponse response) throws IOException{
		String begin = request.getParameter("begin");
		String end = request.getParameter("end");
		PrintWriter out = response.getWriter();
		
		Integer intBegin = Integer.parseInt(begin);
		Integer intEnd = Integer.parseInt(end);
		
		Integer newBegin = intBegin + intEnd;
		String finalBegin = newBegin.toString();
		
		if( cussice.limitFind(finalBegin, end) ==null){
			out.print("ok");
		}
	}
}
