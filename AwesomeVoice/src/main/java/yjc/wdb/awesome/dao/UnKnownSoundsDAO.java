package yjc.wdb.awesome.dao;

import java.util.List;

import yjc.wdb.awesome.bean.ChattingRoom;

public interface UnKnownSoundsDAO {
	public List<ChattingRoom> UnknownChattingRoom() throws Exception ;
	public void insertChattingRoom(ChattingRoom cr) throws Exception ;
}
