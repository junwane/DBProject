
package yjc.wdb.awesome.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import yjc.wdb.awesome.bean.Board;
import yjc.wdb.awesome.bean.MimiCryMenu;
import yjc.wdb.awesome.bean.Writing;

@Repository
public class CopySoundsDAOImpl implements CopySoundsDAO {

	@Inject
	private SqlSession sql;
	
	private static String namespace =
			"yjc.wdb.mapper.CopySoundsMapper";
	
	@Override
	public List<MimiCryMenu> AllMimiCryMenu() throws Exception {
		
		return sql.selectList(namespace+".AllMimiCryMenu");
	}

	@Transactional
	@Override
	public void insertCopyBoard(Board board, Writing writing) throws Exception {
		sql.insert(namespace+".insertCopyBoard", board);
		sql.insert(namespace+".insertCopyBoardWriting", writing);
		
	}

	@Override
	public List<HashMap> AllCopySounds() throws Exception {
		return sql.selectList(namespace+".AllCopySounds");
	}

}
