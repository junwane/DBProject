package yjc.wdb.awesome.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import yjc.wdb.awesome.bean.ChattingRoom;

@Repository
public class UnKnownSoundsDAOImpl implements UnKnownSoundsDAO{
	
	@Inject
	private SqlSession sql;
	
	private static String namespace =
			"yjc.wdb.mapper.UnKnownSoundsMapper";

	@Override
	public List<ChattingRoom> UnknownChattingRoom() throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".UnknownChattingRoom");
	}

	@Override
	public void insertChattingRoom(ChattingRoom cr) throws Exception {
		// TODO Auto-generated method stub
		sql.selectList(namespace + ".insertChattingRoom", cr);
	}

	@Override
	public int chattingRoomCount(int cr_no) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace + ".chattingRoomCount", cr_no);
	}

	@Override
	public int chattingRoomNo(String m_id) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace + ".chattingRoomNo", m_id);
	}

	@Override
	public void insertChattingRoomEnter(ChattingRoom cr) throws Exception {
		// TODO Auto-generated method stub
		sql.insert(namespace + ".insertChattingRoomEnter",cr);
	}

	@Override
	public List<ChattingRoom> chattingRoonOther(int cr_no1) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".chattingRoonOther", cr_no1);
	}

	@Override
	public void exitChatting(ChattingRoom cr) throws Exception {
		// TODO Auto-generated method stub
		sql.delete(namespace + ".exitChatting", cr);
	}

	@Override
	public String unknownChattingOther(String m_id) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace + ".unknownChattingOther", m_id);
	}

}
