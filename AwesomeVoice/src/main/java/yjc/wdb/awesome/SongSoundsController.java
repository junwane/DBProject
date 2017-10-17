package yjc.wdb.awesome;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import yjc.wdb.awesome.bean.Board;
import yjc.wdb.awesome.bean.MusicInfo;
import yjc.wdb.awesome.bean.Writing;
import yjc.wdb.awesome.dao.SongSoundsDAO;

@Controller
public class SongSoundsController {
	
	

	@Inject 
	private SongSoundsDAO dao;
	
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	@RequestMapping(value = "AllArtist", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String AllArtist() throws Exception {
		
		List<String> list = dao.AllArtist();
		
		JSONObject json = new JSONObject();
		JSONArray jsonArray = new JSONArray();
		
		for(int i = 0; i < list.size(); i++) {
			
			JSONObject artist = new JSONObject();
			
			artist.put("singer", list.get(i));
			
			jsonArray.add(artist);
		}
		
		json.put("mi_artist", jsonArray);
		
		return json.toString();
	}
	
	
	
	@RequestMapping(value = "selectAlbum", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String selectAlbum(String mi_artist) throws Exception {
		
		List<MusicInfo> list = dao.selectAlbum(mi_artist);
		
		JSONObject json = new JSONObject();
		JSONArray jsonArray = new JSONArray();
		
		for(int i = 0; i < list.size(); i++) {
			
			JSONObject artist = new JSONObject();
			
			artist.put("mi_no", list.get(i).getMi_no());
			artist.put("mi_nm", list.get(i).getMi_title());
			
			jsonArray.add(artist);
		}
		
		json.put("musicInfo", jsonArray);
		
		return json.toString();
	}

	
	@RequestMapping(value = "insertSongsBoard", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String insertSongsBoard(Board board, HttpSession session, MultipartFile file) throws Exception {
		
		String m_id = (String) session.getAttribute("m_id");
		
		System.out.println(board.getB_title()+ board.getB_content() + board.getMi_no());
		
		if(file.getOriginalFilename() != ""){
			  String b_voicefile =
				uploadReviewFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());

			  board.setB_voicefile(b_voicefile);
			  System.out.println(b_voicefile);
		}
	
		dao.insertSongsBoard(board, m_id);
		
		return "redirect:SongSounds";
	}
}

