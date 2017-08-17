package web.filter;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;

public class PathResolverResponseWrapper extends HttpServletResponseWrapper{

	private String contextPath;

	public PathResolverResponseWrapper(HttpServletResponse response, String contextPath) {
		super(response);
		this.contextPath = contextPath;
	}


	@Override
	public void sendRedirect(String location) throws IOException {
		if(location.startsWith("/")){
			location = contextPath + location;
		}
		super.sendRedirect(location);
	}

}
