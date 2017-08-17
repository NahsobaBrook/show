package web.filter;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class EncodingReuqestWrapper extends HttpServletRequestWrapper {
	private String encoding;
	private String urlEncoding;

	public EncodingReuqestWrapper(HttpServletRequest request, String encoding, String urlEncoding) {
		super(request);
		this.encoding = encoding;
		this.urlEncoding = urlEncoding;
	}

	@Override
	public String getParameter(String name) {
		String value = super.getParameter(name);
		if (value != null) {
			try {
				value = new String(value.getBytes(urlEncoding), encoding);
			} catch (UnsupportedEncodingException e) {
				throw new RuntimeException(e);
			}
		}
		return value;
	}

}
