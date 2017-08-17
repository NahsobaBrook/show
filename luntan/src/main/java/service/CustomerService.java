package service;

import java.util.List;

import entity.Customer;
import entity.Reply;
import entity.Topic;

public interface CustomerService {
	/**
	 * 注册会员方法
	 * @param customer 会员
	 * @return 会员
	 */
	Customer registe(Customer customer);
	
	/**
	 * 登录论坛方法
	 * @param account 账号
	 * @param password 密码
	 * @return 会员
	 */
	Customer login(String account,String password);
	
	/**
	 * 查找会员方法
	 * @param account 账号
	 * @return 会员
	 */
	Customer find(String account);
	
	/**
	 * 生成回复贴方法
	 * @param reply
	 * @return 返回主贴
	 */
	Reply send(Reply reply);
	
	/**
	 * 生成主贴方法
	 * @param topic
	 * @return
	 */
	Topic mainSend(Topic topic);
	
	/**
	 * 查找全部
	 * @return
	 */
	List<Topic> findAll();
	
	/**
	 * 根据id查找主贴信息
	 * @param cardID
	 * @return
	 */
	Topic topicId(String tCard);
	
	/**
	 * 添加评论方法
	 * @param reply 评论对象
	 * @return
	 */
	Reply pingLun(Reply reply);
	
	List<Reply> findTidpingLun(Integer tid);
	
	/**
	 * 根据评论的账号找到Customer信息
	 * @param account
	 * @return
	 */
	Customer findPingLuner(String account);
	
	/**
	 * 修改头像
	 * @param finalHead
	 * @return
	 */
	boolean changeHead(String finalHead ,String account);
	
	/**
	 * 根据账号查找所对应的所有主贴
	 * @param account
	 * @return
	 */
	List<Topic> topicAccount(String account);
	
	/**
	 * 根据账号分页查询主贴内容
	 * @param account 查询主贴的账号
	 * @param begin	开始下标
	 * @param count 查询总数
	 * @return
	 */
	List<Topic> topiclimit(String account ,int begin,int count);
	
	/**
	 * 根据id删除主贴
	 * @param id
	 * @return
	 */
	boolean delTopic(String id);
	
	List<Topic> limitFind(String begin,String end);
}
