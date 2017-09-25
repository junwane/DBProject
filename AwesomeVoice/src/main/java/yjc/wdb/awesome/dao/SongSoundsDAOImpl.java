package yjc.wdb.awesome.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import yjc.wdb.awesome.bean.MusicInfo;

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

}
