
package yjc.wdb.awesome.dao;

import yjc.wdb.awesome.bean.Member;

public interface MemberDAO {
	public int login(Member member)throws Exception;
	public void account(Member member)throws Exception;
	public int useryn(String m_id)throws Exception;
}
