
package yjc.wdb.awesome;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import yjc.wdb.awesome.bean.MimiCryMenu;
import yjc.wdb.awesome.dao.LookForSoundsDAO;

@Controller
public class LookForSoundsController {
	
	@Inject
	private LookForSoundsDAO dao;
	

	@RequestMapping(value = "insertLookForSounds", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public String insertLookForSounds(HttpSession session, String b_title, String b_content) throws Exception {
		String m_id = (String) session.getAttribute("m_id");
		dao.insertLookForSoundsBoard(b_title, b_content, m_id);
	
		return "redirect:LookForSounds";
	}
	

	

	
	
	

}

