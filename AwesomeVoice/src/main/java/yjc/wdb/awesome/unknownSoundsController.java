package yjc.wdb.awesome;

import java.io.File;
import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import yjc.wdb.awesome.bean.ChattingRoom;
import yjc.wdb.awesome.dao.UnKnownSoundsDAO;

@Controller
public class unknownSoundsController {
	
	@Inject
	private UnKnownSoundsDAO UnKnownDAO ;
	
	@RequestMapping(value = "createChattingRoom", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String createChattingRoom(HttpSession session, ChattingRoom cr, MultipartHttpServletRequest multi, Model model) throws Exception{
		
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
		
		model.addAttribute(m_id);
			
		return "redirect:/UnknownSoundsChattingRoom";
	}
}
