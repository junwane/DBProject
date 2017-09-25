package yjc.wdb.awesome;

import java.util.List;

import javax.inject.Inject;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import yjc.wdb.awesome.bean.MimiCryMenu;
import yjc.wdb.awesome.dao.CopySoundsDAO;

@Controller
public class CopySoundsController {
	
	@Inject 
	private CopySoundsDAO dao;
	
	@RequestMapping(value = "AllMimiCryMenu", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String AllMimiCryMenu() throws Exception {
		
		List<MimiCryMenu> list = dao.AllMimiCryMenu();
		
		JSONObject json = new JSONObject();
		JSONArray jsonArray = new JSONArray();
		
		for(int i = 0; i < list.size(); i++) {
			
			JSONObject copyCategory = new JSONObject();
			
			copyCategory.put("mm_no", list.get(i).getMm_no());
			copyCategory.put("mm_name", list.get(i).getMm_name());
			
			jsonArray.add(copyCategory);
		}
		
	
		

		json.put("copyCategory", jsonArray);
		
		System.out.println("gkdfjladfjldjfdlfjldjf" +json.toString());
		return json.toString();
		
	
	}

}
