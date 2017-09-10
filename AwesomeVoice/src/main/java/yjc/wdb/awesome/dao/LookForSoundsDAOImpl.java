package yjc.wdb.awesome.dao;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class LookForSoundsDAOImpl implements LookForSoundsDAO{
	
	
	@Inject
	private SqlSession sql;
	
	private static String namespace =
			"yjc.wdb.mapper.LookForSoundsMapper";

	@Override
	public void insertBoard(String b_title, String b_content) throws Exception {
		Map map = new HashMap();
		map.put("b_title", b_title);
		map.put("b_content", b_content);
		sql.insert(namespace+".insertBoard", map);
	}

}
