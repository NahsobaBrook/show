package dao;

import java.util.List;

import entity.Customer;
import entity.Reply;
import entity.Topic;

public interface CustomerDao {
	int save(Customer customer);
	
	Customer login(String account,String password);
	
	Customer select(String account);
	
	Reply insert (Reply reply);
	
	Topic mainSeng(Topic topic);
	
	List<Topic> selectAll();
	
	Topic topicId(String id);
	
	List<Reply> findTidPingLun(Integer tid);
	
	Customer findPingluner(String account);
	
	int changeHead(String changeHead,String account);
	
	List<Topic> topicAccount(String account);
	
	boolean delTopic(String id);
	
	List<Topic> limitFind(int begin,int end);
	
	List<Topic> topicLimit(String acount,int begin,int count);
}
