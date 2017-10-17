
package yjc.wdb.awesome.dao;

import java.util.HashMap;
import java.util.List;

import yjc.wdb.awesome.bean.Board;
import yjc.wdb.awesome.bean.MusicInfo;
import yjc.wdb.awesome.bean.Writing;

public interface SongSoundsDAO {
	
	public List<String> AllArtist() throws Exception;
	
	public List<MusicInfo> selectAlbum(String mi_artist) throws Exception;
	
	public void insertSongsBoard(Board board, String m_id) throws Exception;
	
	public List<HashMap> AllSongsSounds() throws Exception;

}
