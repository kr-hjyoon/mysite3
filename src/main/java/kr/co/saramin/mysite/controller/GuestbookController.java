package kr.co.saramin.mysite.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.saramin.mysite.service.GuestbookService;
import kr.co.saramin.mysite.vo.GuestbookVo;

@Controller
@RequestMapping("/guestbook")
public class GuestbookController {
	@Autowired
	private GuestbookService guestbookService;

	@RequestMapping(value={"","/list"})
	public String list(Model model) {
		List<GuestbookVo> list = guestbookService.getList();
		System.out.println(list);
		model.addAttribute("list", list);
		return "guestbook/list";
	}
	@RequestMapping("/list2")
	public String list2(Model model) {
		List<HashMap<String,String>> list = guestbookService.getList2();
		
		System.out.println(list);
		model.addAttribute("list", list);
		return "guestbook/list";
	}
}
