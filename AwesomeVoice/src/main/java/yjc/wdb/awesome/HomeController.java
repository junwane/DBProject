package yjc.wdb.awesome;



import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
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
	

	@RequestMapping(value= "/account", method = RequestMethod.GET)
	public String account(Model model){
		return "account";
	}

	
	@RequestMapping(value = "/AllSounds", method = RequestMethod.GET)
	public String AllSounds(Model model) {
		String content = "allSounds";
		model.addAttribute("contents", content);
	
		return "index";
	}
	
	@RequestMapping(value = "/SongSounds", method = RequestMethod.GET)
	public String SongSounds(Model model) {
		String content = "songSounds";
		model.addAttribute("contents", content);
	
		return "index";
	}
	
	@RequestMapping(value = "/CopySounds", method = RequestMethod.GET)
	public String CopySounds(Model model) {
		String content = "copySounds";
		model.addAttribute("contents", content);
	
		return "index";
	}
	
	@RequestMapping(value = "/LookForSounds", method = RequestMethod.GET)
	public String LookForSounds(Model model) {
		String content = "lookForSounds";
		model.addAttribute("contents", content);
	
		return "index";
	}
	
	
	@RequestMapping(value = "/UnknownSounds", method = RequestMethod.GET)
	public String UnknownSounds(Model model) {
		String content = "unknownSounds";
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
