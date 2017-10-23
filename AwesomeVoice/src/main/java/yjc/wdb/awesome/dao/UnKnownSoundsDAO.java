package yjc.wdb.awesome.dao;

import java.util.List;

import yjc.wdb.awesome.bean.ChattingRoom;

public interface UnKnownSoundsDAO {
	public List<ChattingRoom> UnknownChattingRoom() throws Exception ;
	public void insertChattingRoom(ChattingRoom cr) throws Exception ;
	public int chattingRoomCount(int cr_no) throws Exception ;
	public int chattingRoomNo(String m_id) throws Exception ;
	public void insertChattingRoomEnter(ChattingRoom cr) throws Exception ;
	public List<ChattingRoom> chattingRoonOther(int cr_no1) throws Exception ;
	public void exitChatting(ChattingRoom cr) throws Exception;
	public String unknownChattingOther(String m_id) throws Exception ;
}
