package yjc.wdb.awesome;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import yjc.wdb.awesome.bean.Board;
import yjc.wdb.awesome.bean.MimiCryMenu;
import yjc.wdb.awesome.bean.Writing;
import yjc.wdb.awesome.dao.CopySoundsDAO;

@Controller
public class CopySoundsController {
	
	@Inject 
	private CopySoundsDAO dao;
	
	@Resource(name = "uploadPath")
	private String uploadPath;
	
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
		
		return json.toString();
		
	
	}
	
	@RequestMapping(value = "insertCopyBoard", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String insertSongsBoard(Board board, int mm_no, HttpSession session, MultipartFile file) throws Exception {
		
		String m_id = (String) session.getAttribute("m_id");
		Writing writing = new Writing();
		writing.setM_id(m_id);
		writing.setMm_no(mm_no);
		
		System.out.println(board.getB_title()+ board.getB_content() + board.getMi_no());
		
		if(file.getOriginalFilename() != ""){
			  String b_voicefile =
				uploadReviewFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());

			  board.setB_voicefile(b_voicefile);
			  System.out.println(b_voicefile);
		}
	
		dao.insertCopyBoard(board, writing);
		
		return "redirect:CopySounds";
	}

}
