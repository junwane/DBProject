package yjc.wdb.awesome.dao;

import java.util.List;

import yjc.wdb.awesome.bean.Board;
import yjc.wdb.awesome.bean.MimiCryMenu;

public interface CopySoundsDAO {
	
	public List<MimiCryMenu> AllMimiCryMenu() throws Exception;
	
	public void insertBoard(Board board) throws Exception;


}
