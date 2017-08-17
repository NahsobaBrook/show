package dao;

import java.util.List;

import entity.Customer;
import entity.Reply;
import entity.Topic;

public class CustomerDaoImpl implements CustomerDao{

	@Override
	public int save(Customer customer) {
		String sql = "insert into customer value(?,?,?,?,?,?)";
		return BaseDao.executeUpdate(sql, 
				customer.getAccount(),
				customer.getPassword(),
				customer.getHead(),
				customer.getGrade(),
				customer.getScore(),
				customer.getLogintime());
	
	}

	@Override
	public Customer login(String account, String password) {
		String sql = "select * from customer where account=? and password=?";
		List<Customer> list =  (List<Customer>) BaseDao.executeQuery(Customer.class, sql, account,password);
		if(list.size() != 0){
			return list.get(0);
		}
		
		return null;
	}

	@Override
	public Customer select(String account) {
		String sql = "select * from customer where account=?";
		List<Customer> list = (List<Customer>)BaseDao.executeQuery(Customer.class,sql,account);
		if(list.size() != 0){
			return list.get(0);
		}
		return null;
	}

	@Override
	public Reply insert(Reply reply) {
		String sql = "insert into reply values(default,?,?,?,?)";
		int result = BaseDao.executeUpdate(sql, 
				reply.getAccount(),
				reply.getTid(),
				reply.getContent(),
				reply.getReplytime());
		if(result != -1){
			return reply;
		}
		return null;
	}

	@Override
	public Topic mainSeng(Topic topic) {
		String sql = "insert into topic values(default,?,?,?,?,?)";
		
		int result = BaseDao.executeUpdate(sql,
				topic.getAccount(),
				topic.getTitle(),
				topic.getContent(),
				topic.getSendtime(),
				topic.getLasttime());
		if(result != -1){
			return topic;
		}
		
		return null;
	}

	@Override
	public List<Topic> selectAll() {
		String sql = "select * from topic order by lasttime desc";
		List<Topic> list = (List<Topic>)BaseDao.executeQuery(Topic.class, sql);
		
		return list;
	}

	@Override
	public Topic topicId(String id) {
		String sql ="select * from topic where id=?";
		Topic topic = new Topic();
		List<Topic> list = (List<Topic>)BaseDao.executeQuery(Topic.class, sql, id);

		if(list.size() != 0){
			return list.get(0);
		}
		return null;
	}

	@Override
	public List<Reply> findTidPingLun(Integer tid) {
		String sql = "select * from reply where tid=?";
		List<Reply> list = (List<Reply>)BaseDao.executeQuery(Reply.class, sql, tid);

		if(list.size() != 0){
			
			return list;
		}
		return null;
	}

	@Override
	public Customer findPingluner(String account) {
		String sql = "select * from customer where account =?";
		List<Customer> list = (List<Customer>)BaseDao.executeQuery(Customer.class, sql, account);
		if(list.size() != 0){
			return list.get(0);		
		}
		return null;
	}

	@Override
	public int changeHead(String changeHead,String account) {
		String sql = "update customer set head=? where account=?";
		int result = BaseDao.executeUpdate(sql, changeHead,account);
		return result;
	}

	@Override
	public List<Topic> topicAccount(String account) {
		String sql = "select * from topic where account=?";
		List<Topic> list = (List<Topic>)BaseDao.executeQuery(Topic.class, sql, account);

		if(list.size() != 0){
			return list;
		}
		return null;
	}

	@Override
	public boolean delTopic(String id) {
		BaseDao.executeUpdate("delete from reply where tid=?", id);
		
		String sql = "delete from topic where id=?";
			int result = BaseDao.executeUpdate(sql, id);
			if(result != -1){
				return true;
			}
		return false;
	}

	@Override
	public List<Topic> limitFind(int begin, int end) {
		String sql = "select * from topic order by lasttime desc limit ?,?";
		List<Topic> list =  (List<Topic>) BaseDao.executeQuery(Topic.class,sql, begin,end);
		
		if(list.size() != 0){
			return list;
		}
		return null;
	}

	@Override
	public List<Topic> topicLimit(String account, int begin, int count) {
		String sql = "select * from topic where account=? order by lasttime desc limit ?,?";
		List<Topic> list = (List<Topic>) BaseDao.executeQuery(Topic.class, sql, account,begin,count);
		
		if(list.size() != 0){
			return list;
		}
		return null;
	}




}
