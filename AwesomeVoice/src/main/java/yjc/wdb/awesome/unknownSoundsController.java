package yjc.wdb.awesome;

import java.io.File;

import java.io.IOException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import yjc.wdb.awesome.bean.ChattingRoom;
import yjc.wdb.awesome.dao.UnKnownSoundsDAO;


@Controller
public class unknownSoundsController {
	
	@Inject
	private UnKnownSoundsDAO UnKnownDAO ;
	
	@RequestMapping(value = "createChattingRoom", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String createChattingRoom(HttpSession session, ChattingRoom cr, RedirectAttributes rttr,MultipartHttpServletRequest multi, Model model) throws Exception{
		
		String m_id = (String) session.getAttribute("m_id");
		cr.setCr_id(m_id);
		cr.setCr_abbot(m_id);
		
		String root = multi.getSession().getServletContext().getRealPath("/");
		String path = root+"resources/upload/";
		//System.out.println("cr_title : "+ cr.getCr_title());
		System.out.println("cr_titledd : "+ cr.getCr_image());

		System.out.println("path : "+ path);
		
		File dir = new File(path);
		if(!dir.isDirectory()){
			dir.mkdir();
		}
		
		MultipartFile cr_image = cr.getCr_image();
		if(cr_image != null){
			String fileName = cr_image.getOriginalFilename();
			cr.setFileName(fileName);
			try { 
					// 1. FileOutputStream 사용 
					// byte[] fileData = file.getBytes(); 
					// FileOutputStream output = new FileOutputStream("C:/images/" + fileName); 
					// output.write(fileData); 
					// 2. File 사용 
					File file = new File(path + fileName); 
					cr_image.transferTo(file); 
					
					System.out.println("fileName : " + fileName);
				} catch (IOException e) { e.printStackTrace(); } 
			// try - catch } // if // 데이터 베이스 처리를 현재 위치에서 처리 
			}


		
		UnKnownDAO.insertChattingRoom(cr);
		
		int cr_no = UnKnownDAO.chattingRoomNo(m_id);
		
		rttr.addAttribute("cr_no",cr_no);
		rttr.addAttribute("cr_title",cr.getCr_title());
		model.addAttribute(m_id);
			
		return "redirect:/UnknownSoundsChattingRoom";
	}
	
	@ResponseBody
	@RequestMapping(value="/chattingRoomCount", method = RequestMethod.POST)
	public int chattingRoomCount(String data_code) throws Exception {
		
		int cr_no = Integer.parseInt(data_code);
		
		int count =UnKnownDAO.chattingRoomCount(cr_no);
		System.out.println("data-code : " + data_code);
		
		return count ;
	}
	
	@RequestMapping(value="/chattingRoomEnter", method=RequestMethod.GET)
	public String chattingRoomEnter(String cr_no,RedirectAttributes rttr, HttpSession session,  ChattingRoom cr) throws Exception{
		System.out.println("cr_no : " + cr_no);
		int cr_no1 = Integer.parseInt(cr_no);
		String m_id = (String) session.getAttribute("m_id");
		
		cr.setCr_id(m_id);
		cr.setCr_no(cr_no1);
		
		UnKnownDAO.insertChattingRoomEnter(cr);
		List<ChattingRoom> cr_list =UnKnownDAO.chattingRoonOther(cr_no1);
		rttr.addAttribute("cr_no",cr_list.get(0).getCr_no());
		rttr.addAttribute("cr_id",cr_list.get(0).getCr_id());
		rttr.addAttribute("cr_title",cr_list.get(0).getCr_title());
		rttr.addAttribute("cr_image",cr_list.get(0).getCr_image());
		
		return "redirect:/UnknownSoundsChattingRoom";
		
	}
	@ResponseBody
	@RequestMapping(value="/exitChatting", method = RequestMethod.POST)
	public void exitChattin(String cr_no,HttpSession session, ChattingRoom cr) throws Exception {
		
		String m_id = (String)session.getAttribute("m_id");
		int cr_no1 = Integer.parseInt(cr_no);
		
		cr.setCr_id(m_id);
		cr.setCr_no(cr_no1);
		cr.setCr_room(cr_no1);
		UnKnownDAO.exitChatting(cr);
		

	}
	
	@ResponseBody
	@RequestMapping(value="/unknownChattingOther", method = RequestMethod.POST)
	public String unknownChattingOther(HttpSession session) throws Exception {
		
		String m_id = (String)session.getAttribute("m_id");

		String cr_id = UnKnownDAO.unknownChattingOther(m_id);
		
		System.out.println("cr_id + m_id : " + m_id);
		
		return cr_id ;
	}
	

}
