package yjc.wdb.awesome;



import java.io.File;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import yjc.wdb.awesome.bean.ChattingRoom;
import yjc.wdb.awesome.bean.Member;
import yjc.wdb.awesome.dao.CopySoundsDAO;
import yjc.wdb.awesome.dao.LookForSoundsDAO;
import yjc.wdb.awesome.dao.MemberDAO;
import yjc.wdb.awesome.dao.SongSoundsDAO;
import yjc.wdb.awesome.dao.UnKnownSoundsDAO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Inject
	private MemberDAO memberDao;
	
	@Inject
	private SongSoundsDAO songSoundsDao;
	
	@Inject
	private CopySoundsDAO copySoundsDAO;

	@Inject
	private LookForSoundsDAO lookForSoundsDAO;
	
	@Inject
	private UnKnownSoundsDAO unknownSoundsDAO;

	@Resource(name = "uploadPath")
	private String uploadPath;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/mainPage", method = RequestMethod.GET)
	public String home(Model model) {
		String content = "mainPage";
		model.addAttribute("contents", content);
	
		return "index";
	}
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String login(Model model) {
		return "login";
	}
	
	@ResponseBody
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login2(Model model, HttpServletRequest req, HttpSession session, Member member) throws Exception {
		member.setM_id(req.getParameter("username"));
		member.setM_pw(req.getParameter("password"));
		
		

		if(memberDao.login(member) == 1){
			session.setAttribute("m_id", req.getParameter("username"));
			return "success";
		}
		else{
			return "fail";
		}
	}
	
	@RequestMapping(value= "/account", method = RequestMethod.GET)
	public String account(Model model){
		return "account";
	}

	@RequestMapping(value= "/useryn", method = RequestMethod.GET)
	@ResponseBody
	public int useryn(Model model, HttpServletRequest req)throws Exception{
		int useryn = memberDao.useryn(String.valueOf(req.getParameter("m_id")));
		return useryn;
	}
	
	@RequestMapping(value= "/account", method = RequestMethod.POST)
	public String account2(Model model, Member member, MultipartFile file, MultipartFile file2, HttpServletRequest req)throws Exception{
		req.setCharacterEncoding("utf-8");
		
		if(file2.getOriginalFilename() != ""){
			  String m_voice=
				uploadReviewFileUtils.uploadFile(uploadPath, file2.getOriginalFilename(), file2.getBytes());

			  member.setM_voice(m_voice);
		}
		if(file.getOriginalFilename() != ""){
			  String m_img=
				uploadReviewFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
			
			  member.setM_img(m_img);
		  }
		memberDao.account(member);
		return "login";
	}
	
	private String uploadFile(String originalName, byte[] fileData) throws Exception {

		/*UUID uid = UUID.randomUUID();*/

		String savedName = /*uid.toString() + "_" +*/ originalName;

		File target = new File(uploadPath, savedName);

		FileCopyUtils.copy(fileData, target);

		return savedName;
	}
	
	@RequestMapping(value = "/AllSounds", method = RequestMethod.GET)
	public String AllSounds(Model model) {
		String content = "allSounds";
		model.addAttribute("contents", content);
	
		return "index";
	}
	
	@RequestMapping(value = "/SongSounds", method = RequestMethod.GET)
	public String SongSounds(Model model) throws Exception {
		String content = "songSounds";
		List<HashMap> list = songSoundsDao.AllSongsSounds();
		model.addAttribute("list1", list);
		model.addAttribute("contents", content);
	
		return "index";
	}
	
	@RequestMapping(value = "/CopySounds", method = RequestMethod.GET)
	public String CopySounds(Model model) throws Exception {
		List<HashMap> list = copySoundsDAO.AllCopySounds();
		String content = "copySounds";
		model.addAttribute("list1", list);
		model.addAttribute("contents", content);
	
		return "index";
	}
	
	@RequestMapping(value = "/LookForSounds", method = RequestMethod.GET)
	public String LookForSounds(Model model) throws Exception {
		List<HashMap> list = lookForSoundsDAO.AllLookForSounds();
		
		String content = "lookForSounds";
		
		model.addAttribute("list1", list);
		model.addAttribute("contents", content);
	
		return "index";
	}
	
	
	@RequestMapping(value = "/UnknownSounds", method = RequestMethod.GET)
	public String UnknownSounds(Model model) throws Exception {
		
		List<ChattingRoom> list = unknownSoundsDAO.UnknownChattingRoom() ;
		
		String content = "unknownSounds";
		
		System.out.println(list.get(0).getCr_title());
		model.addAttribute("list", list);
		model.addAttribute("contents", content);
	
		return "index";
	}
	
	@RequestMapping(value = "/UnknownSoundsChattingRoom", method = RequestMethod.GET)
	public String UnknownSoundsChattingRoom(Model model) {
		String content = "unknownSoundsChattingRoom";
		model.addAttribute("contents", content);
	
		return "index";
	}
	
	@RequestMapping(value = "/GradeSounds", method = RequestMethod.GET)
	public String GradeSounds(Model model) {
		String content = "gradeSounds";
		model.addAttribute("contents", content);
	
		return "index";
	}
	
	@RequestMapping(value = "/MyPage", method = RequestMethod.GET)
	public String MyPage(Model model) {
		String content = "MyPage";
		model.addAttribute("contents", content);
	
		return "index";
	}

}
