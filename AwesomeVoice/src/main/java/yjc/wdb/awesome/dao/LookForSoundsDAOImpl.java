package yjc.wdb.awesome.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class LookForSoundsDAOImpl implements LookForSoundsDAO{
	
	
	@Inject
	private SqlSession sql;
	
	private static String namespace =
			"yjc.wdb.mapper.LookForSoundsMapper";

	@Transactional
	@Override
	public void insertLookForSoundsBoard(String b_title, String b_content, String m_id) throws Exception {
		Map map = new HashMap();
		map.put("b_title", b_title);
		map.put("b_content", b_content);
		map.put("m_id", m_id);
		sql.insert(namespace+".insertLookForSoundsBoard", map);
		sql.insert(namespace+".insertLookForSoundsBoardWriting", map);
	}

	@Override
	public List<HashMap> AllLookForSounds() throws Exception {
		
		return sql.selectList(namespace+".AllLookForSounds");
	}

}
