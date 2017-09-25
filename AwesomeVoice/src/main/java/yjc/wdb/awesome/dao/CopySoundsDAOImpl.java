package yjc.wdb.awesome.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import yjc.wdb.awesome.bean.Board;
import yjc.wdb.awesome.bean.MimiCryMenu;

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

	@Override
	public void insertBoard(Board board) throws Exception {
		sql.insert(namespace+".insertBoard", board);
		
	}

}
