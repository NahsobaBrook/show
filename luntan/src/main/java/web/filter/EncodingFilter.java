package web.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EncodingFilter implements Filter {

	private String encoding;
	private String urlEncoding;
	
	@Override
	public void init(FilterConfig config) throws ServletException {

		encoding = config.getInitParameter("encoding");
		urlEncoding = config.getInitParameter("urlEncoding");
		if (encoding == null) {
			encoding = "UTF-8";
		}
		if (urlEncoding == null) {
			urlEncoding = "ISO-8859-1";
		}
	}
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		// 先把请求和响应转换成HTTP的请求和相应
		HttpServletRequest httpServletRequest = (HttpServletRequest) request;
		HttpServletResponse httpServletResponse = (HttpServletResponse) response;
		// 设置请求和相应的编码（POST）
		httpServletRequest.setCharacterEncoding(encoding);
		httpServletResponse.setCharacterEncoding(encoding);
		// 判断是否是GET请求
		String method = httpServletRequest.getMethod().toUpperCase();
		if (method.equals("GET")) {
			httpServletRequest = new EncodingReuqestWrapper(httpServletRequest, encoding, urlEncoding);
		}
		
		// 設置响应的地址设置
//		httpServletResponse = new PathResolverResponseWrapper(httpServletResponse,httpServletRequest.getContextPath());
		
//		System.out.println("处理请求之前：设置编码");
		// 执行后续操作
		chain.doFilter(httpServletRequest, httpServletResponse);
//		System.out.println("处理请求之后：");
	}
	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

}
