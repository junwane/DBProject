<<<<<<< HEAD
package yjc.wdb.awesome.dao;

import java.util.HashMap;
import java.util.List;

import yjc.wdb.awesome.bean.Board;
import yjc.wdb.awesome.bean.MimiCryMenu;
import yjc.wdb.awesome.bean.Writing;

public interface CopySoundsDAO {
	
	public List<MimiCryMenu> AllMimiCryMenu() throws Exception;
	
	public void insertCopyBoard(Board board, Writing writing) throws Exception;
	
	public List<HashMap> AllCopySounds() throws Exception;


}
=======
package yjc.wdb.awesome.dao;

import java.util.HashMap;
import java.util.List;

import yjc.wdb.awesome.bean.Board;
import yjc.wdb.awesome.bean.MimiCryMenu;
import yjc.wdb.awesome.bean.Writing;

public interface CopySoundsDAO {
	
	public List<MimiCryMenu> AllMimiCryMenu() throws Exception;
	
	public void insertCopyBoard(Board board, Writing writing) throws Exception;
	
	public List<HashMap> AllCopySounds() throws Exception;


}
>>>>>>> branch 'master' of https://github.com/junwane/DBProject.git
