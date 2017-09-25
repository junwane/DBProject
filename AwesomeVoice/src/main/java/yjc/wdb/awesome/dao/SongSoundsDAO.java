package yjc.wdb.awesome.dao;

import java.util.List;

import yjc.wdb.awesome.bean.MusicInfo;

public interface SongSoundsDAO {
	
	public List<String> AllArtist() throws Exception;
	
	public List<MusicInfo> selectAlbum(String mi_artist) throws Exception;

}
