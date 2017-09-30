package yjc.wdb.awesome.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import yjc.wdb.awesome.bean.Board;
import yjc.wdb.awesome.bean.MusicInfo;
import yjc.wdb.awesome.bean.Writing;

@Repository
public class SongSoundsDAOImpl implements SongSoundsDAO {
	
	@Inject
	private SqlSession sql;
	
	private static String namespace =
			"yjc.wdb.mapper.SongSoundsMapper";

	@Override
	public List<String> AllArtist() throws Exception {
		
		return sql.selectList(namespace+".AllArtist");
	}

	@Override
	public List<MusicInfo> selectAlbum(String mi_artist) throws Exception {
		
		return sql.selectList(namespace+".selectAlbum", mi_artist);
	}

	@Transactional
	@Override
	public void insertSongsBoard(Board board, String m_id) throws Exception {
		 sql.insert(namespace+".insertSongsBoard", board);
		 sql.insert(namespace+".insertSongsBoardWriting", m_id);
		
	}

	@Override
	public List<HashMap> AllSongsSounds() throws Exception {
		// TODO Auto-generated method stub
		return  sql.selectList(namespace+".AllSongsSounds");
	}

}
