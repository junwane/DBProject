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

}
