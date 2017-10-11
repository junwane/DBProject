<<<<<<< HEAD
package yjc.wdb.awesome.dao;

import java.util.HashMap;
import java.util.List;

public interface LookForSoundsDAO {
	
	public void insertLookForSoundsBoard(String b_title, String b_content, String m_id) throws Exception;
	public List<HashMap> AllLookForSounds() throws Exception;
}
=======
package yjc.wdb.awesome.dao;

public interface LookForSoundsDAO {
	
	public void insertBoard(String b_title, String b_content) throws Exception;

}
>>>>>>> branch 'master' of https://github.com/junwane/DBProject.git
