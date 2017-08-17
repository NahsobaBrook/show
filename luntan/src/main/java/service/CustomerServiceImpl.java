package service;

import java.util.Date;
import java.util.List;

import dao.CustomerDao;
import dao.CustomerDaoImpl;
import entity.Customer;
import entity.Reply;
import entity.Topic;

public class CustomerServiceImpl implements CustomerService{

	private CustomerDao customerdao = new CustomerDaoImpl();
	
	
	@Override
	public Customer registe(Customer customer) {

		//初始化各种数据
		customer.setGrade(1);
		customer.setScore(100);
		customer.setLogintime(new Date());
		int rows = customerdao.save(customer);
		if(rows ==1){
			customer.setPassword(null);
			return customer;
		}
		return null;
	}
	@Override
	public Customer login(String account, String password) {
		
		return customerdao.login(account, password);
	}
	
	
	@Override
	public Customer find(String account) {
		
		return customerdao.select(account);
	}
	@Override
	public Reply send(Reply reply) {
		return null;
	}
	@Override
	public Topic mainSend(Topic topic) {

		topic.setSendtime(new Date());
		topic.setLasttime(new Date());
		return customerdao.mainSeng(topic);
	}
	@Override
	public List<Topic> findAll() {
		return customerdao.selectAll();
	}
	@Override
	public Topic topicId(String tCard) {
		return customerdao.topicId(tCard);
	}
	
	@Override
	public Reply pingLun(Reply reply) {
		reply.setReplytime(new Date());
		
		return customerdao.insert(reply);
	}
	@Override
	public List<Reply> findTidpingLun(Integer tid) {
		return customerdao.findTidPingLun(tid);
	}
	@Override
	public Customer findPingLuner(String account) {

		return customerdao.findPingluner(account);
	}
	@Override
	public boolean changeHead(String finalHead ,String account) {
		
		return customerdao.changeHead(finalHead ,account) == 1;
	}
	@Override
	public List<Topic> topicAccount(String account) {
		
		return customerdao.topicAccount(account);
	}
	@Override
	public boolean delTopic(String id) {
		
		return customerdao.delTopic(id);
	}
	@Override
	public List<Topic> limitFind(String begins, String ends) {
		int begin = Integer.parseInt(begins);
		int end = Integer.parseInt(ends);
		return customerdao.limitFind(begin, end);
	}
	@Override
	public List<Topic> topiclimit(String account, int begin, int count) {
		
		return customerdao.topicLimit(account, begin, count);
	}
	
	
}
