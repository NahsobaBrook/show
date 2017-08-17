package service;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 
 * @功能：更改时间格式变为String
 * @作者：李瑞豪
 * @时间：2017年7月27日
 * @地点：31班教室
 */
public class TimetoString {
	
	public String timeOut(Date date){
		SimpleDateFormat time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String isTime = time.format(date);
		
		return isTime;
	}
}
