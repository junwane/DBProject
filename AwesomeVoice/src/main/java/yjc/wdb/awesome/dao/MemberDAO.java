
package yjc.wdb.awesome.dao;

import java.util.List;

import yjc.wdb.awesome.bean.Board;
import yjc.wdb.awesome.bean.Member;

public interface MemberDAO {
	public int login(Member member)throws Exception;
	public void account(Member member)throws Exception;
	public int useryn(String m_id)throws Exception;
	public List<Board> myPosts(String m_id)throws Exception;
	public String selectPhoto(String m_id)throws Exception;
}
