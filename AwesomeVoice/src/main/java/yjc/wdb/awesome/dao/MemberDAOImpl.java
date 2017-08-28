package yjc.wdb.awesome.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

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

}
