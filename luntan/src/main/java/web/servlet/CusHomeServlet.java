package web.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import entity.Customer;
import entity.Topic;
import net.sf.json.JSONObject;
import service.CustomerServiceImpl;
import service.ImageCutService;

/**
 * 
 * @功能：个人主页
 * @作者：李瑞豪
 * @时间：2017年7月21日
 * @地点：31班教室
 */

@WebServlet("/cushome/*")
@MultipartConfig(location="F:/beforeHead", maxFileSize=1024*1024*100)
public class CusHomeServlet extends DispatcherServlet{
	
	CustomerServiceImpl customerServlet = new CustomerServiceImpl();

	public void changeHead(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		
		int dataX = Integer.parseInt(request.getParameter("dataX"));
		int dataY = Integer.parseInt(request.getParameter("dataY"));
		int dataWidth = Integer.parseInt(request.getParameter("dataWidth"));
		int dataHeight = Integer.parseInt(request.getParameter("dataHeight"));
				
		HttpSession session = request.getSession();
		Customer customer = (Customer)session.getAttribute("customer");
		Part part = request.getPart("inputImage");
	
		String contentDisposition = part.getHeader("Content-Disposition");
		String finalHead;
		if(part.getSize() != 0){
			//获得上传文件的后缀名并生成唯一图片文件名
		String [] heads = contentDisposition.split("\\.");
		String imageFormat = heads[heads.length-1].replace("\"", "");
		SimpleDateFormat time = new SimpleDateFormat("yyyyMMddHHmmss");
		String date = time.format(new Date());
		finalHead = customer.getAccount() + date +"." + imageFormat;
		
		part.write(finalHead);
		String inImageFile = "F:/beforeHead/"+finalHead;
		String outImageFile = "F:/userHead/" +finalHead;
		ImageCutService cutService = new ImageCutService();
		
		Map<String,Object> result = cutService.cutImage(inImageFile, outImageFile, dataX, dataY, dataWidth, dataHeight, imageFormat);
		if(result.get("success") != null){
			customer.setHead(finalHead);
			customerServlet.changeHead(finalHead,customer.getAccount());	
			request.setAttribute("homeCus",customer);
			request.getRequestDispatcher("/cusHome.jsp").forward(request, response);
		}
	
		
		}else{
			//当没有上传文件的时候
			response.sendRedirect("/cusHome.jsp");
		}	
	}

	public void toHome(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String account = request.getParameter("tempAccount");
		Customer customer = customerServlet.find(account);
		
		request.setAttribute("homeCus",customer);
		request.getRequestDispatcher("/cusHome.jsp").forward(request, response);
		
	}

	public void delTopic(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
			String delId = request.getParameter("delId");
			HttpSession session = request.getSession();
			Customer customer = (Customer)session.getAttribute("customer");
			
			if(customerServlet.delTopic(delId)){
				request.setAttribute("homeCus",customer);
				request.getRequestDispatcher("/cusHome.jsp").forward(request, response);
			}else{
				System.out.println("删除失败");
			}
	}
	
	public void limitPage(HttpServletRequest request, HttpServletResponse response) throws IOException{

		int page = Integer.parseInt(request.getParameter("page"));
		
		HttpSession session = request.getSession();
		Customer customer = (Customer)session.getAttribute("customer");
		
		List<Topic> list = customerServlet.topiclimit(customer.getAccount(), (page-1)*5, 5);
		
		JSONObject json = new JSONObject();
		json.put("limitTopic", list);
		
		response.getWriter().print(json);
		
	}
}
