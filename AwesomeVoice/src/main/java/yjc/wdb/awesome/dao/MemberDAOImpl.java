
package yjc.wdb.awesome.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import yjc.wdb.awesome.bean.Board;
import yjc.wdb.awesome.bean.Member;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace =
			"yjc.wdb.mapper.UserMapper";
	
	@Override
	public int login(Member member) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".login", member);
	}

	@Override
	public void account(Member member) throws Exception {
		// TODO Auto-generated method stub
		System.out.println(member.getM_info());
		session.insert(namespace+".account", member);
	}

	@Override
	public int useryn(String m_id) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".useryn", m_id);
	}

	@Override
	public List<Board> myPosts(String m_id) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".myPosts", m_id);
	}

	@Override
	public String selectPhoto(String m_id) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".selectPhoto", m_id);
	}

}

