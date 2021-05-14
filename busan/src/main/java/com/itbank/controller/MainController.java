package com.itbank.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.cafe.CafeDTO;
import com.itbank.food.FoodDTO;
import com.itbank.insert.MemberDTO;
import com.itbank.local.LocalDTO;
import com.itbank.review.ReviewDTO;
import com.itbank.service.CafeService;
import com.itbank.service.FoodService;
import com.itbank.service.InsertService;
import com.itbank.service.LocalService;
import com.itbank.service.ReviewService;
import com.itbank.service.TourService;
import com.itbank.tour.TourDTO;

@Controller
public class MainController {

	@Autowired
	private FoodService fs;
	@Autowired
	private CafeService cafes;
	@Autowired
	private InsertService is;
	@Autowired
	private ReviewService rs;
	@Autowired
	private LocalService localService;
	@Autowired
	private TourService ts;

	// 메인페이지
	@RequestMapping(value = "")
	public ModelAndView index(ModelAndView mav) {
		mav.setViewName("index");
		String today = new SimpleDateFormat("yyyyMMdd").format(new Date());
		String h1 = new SimpleDateFormat("kk").format(new Date());
		int h2 = Integer.parseInt(h1);
		
		if(h2 % 2 == 0) { h2 -= 3; }
		else { h2 -= 4; }
		
		if(h2 <= 0) {
			h2 = 0;
		}
		if(h2 > 11) {
			h2 = 11;
		}
		
		String hour = String.format("%02d00", h2);
		System.out.println(h2);
		

		List<LocalDTO> localList = localService.getLocalList();
		int localListSize = localList.size();

		mav.addObject("today", today);
		mav.addObject("hour", hour);
		mav.addObject("localList", localList);
		mav.addObject("localListSize", localListSize);

		return mav;
	}

	@GetMapping("food")
	public ModelAndView food() {
		ModelAndView mav = new ModelAndView("food");
		List<FoodDTO> list = fs.getList();
		mav.addObject("list", list);

		return mav;
	}

	@GetMapping("cafe")
	public ModelAndView cafe() {
		ModelAndView mav = new ModelAndView("cafe");
		List<CafeDTO> list = cafes.getList();
		mav.addObject("list", list);

		return mav;
	}

	@GetMapping("join")
	public String join() {
		return "join";
	}

	@PostMapping("join")
	public ModelAndView insertSuc(MemberDTO user) {
		ModelAndView mav = new ModelAndView();
		
		int row = is.insertNewbie(user);
		
		if(row == 1) {
			mav.setViewName("redirect:/login");
		}
		else {
			mav.setViewName("join");
		}
		return mav;
	}

	@GetMapping("login")
	public String login() {
		return "login";
	}

	// 로그인
	@PostMapping("login")
	public String joinSuc(MemberDTO user, HttpSession session) {

		MemberDTO login = new MemberDTO();
		login = is.loginCheck(user);
		if (login != null) {
			session.setAttribute("login", login);
			session.setAttribute("id", login.getId());
			return "redirect:/";
		}
		return "login";
	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate(); // 세션을 지워버린다.
		return "redirect:/";
	}

	// 음식점 하나 보기
	@GetMapping("foodInfo/{fname}")
	public ModelAndView foodInfo(@PathVariable String fname, HttpSession session) {

		ModelAndView mav = new ModelAndView("foodInfo");

		String id = (String) session.getAttribute("id");

		FoodDTO dto = fs.getOneList(fname);
		String addr = dto.getFaddr().split(" ")[1];
		String menu1 = dto.getFmenu().split(",")[0];
		String menu2 = dto.getFmenu().split(",")[1];

		mav.addObject("dto", dto);
		mav.addObject("addr", addr);
		mav.addObject("menu1", menu1);
		mav.addObject("menu2", menu2);

		List<ReviewDTO> reviewList = rs.getSelectAllFood(fname);

		mav.addObject("reviewList", reviewList);

		return mav;
	}

	// 카페 하나 보기
	@GetMapping("cafeInfo/{cname}")
	public ModelAndView cafeInfo(@PathVariable String cname, HttpSession session) {

		ModelAndView mav = new ModelAndView("cafeInfo");

		String id = (String) session.getAttribute("id");

		CafeDTO dto = cafes.getOneList(cname);
		String addr = dto.getCaddr().split(" ")[1];
		String menu1 = dto.getCmenu().split(",")[0];
		String menu2 = dto.getCmenu().split(",")[1];

		mav.addObject("dto", dto);
		mav.addObject("addr", addr);
		mav.addObject("menu1", menu1);
		mav.addObject("menu2", menu2);

		List<ReviewDTO> reviewList = rs.getSelectAllCafe(cname);

		mav.addObject("reviewList", reviewList);

		return mav;
	}

	@GetMapping("tour")
	public ModelAndView tour() {
		ModelAndView mav = new ModelAndView("tour");

		List<TourDTO> list = ts.getTourList();
		mav.addObject("tourList", list);

		return mav;
	}

	// 관광지 하나보기
	@GetMapping("tourInfo/{tname}/")
	public ModelAndView tourinfo(@PathVariable String tname) {
		ModelAndView mav = new ModelAndView("tourInfo");
		TourDTO dto = ts.getSelectOne(tname);
		String addr = dto.getTaddr().split(" ")[1];

		List<ReviewDTO> reviewList = rs.getSelectAllTour(tname);

		
		mav.addObject("reviewList", reviewList);
		mav.addObject("dto", dto);
		mav.addObject("addr", addr);
		return mav;
	}

}
