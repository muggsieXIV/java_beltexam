package com.bww.java_beltexam.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bww.java_beltexam.models.Review;
import com.bww.java_beltexam.models.TvShow;
import com.bww.java_beltexam.models.User;
import com.bww.java_beltexam.services.TvShowService;
import com.bww.java_beltexam.services.UserService;

@Controller
public class HomeController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private static TvShowService showServ;

	public HomeController(TvShowService showServ) {
		this.showServ = showServ;
	}

	@GetMapping("/shows")
	public String shows(Model model, HttpSession session) {
		User loggedInUser = (User) session.getAttribute("user");
		if (loggedInUser == null) {
			return "redirect:/";
		}
		model.addAttribute("allShows", showServ.getTvShow());
		return "dashboard.jsp";
	}

	@RequestMapping("/shows/new")
	public String createTvShowPage(@ModelAttribute("newShow") TvShow newShow) {
		return "createTvShow.jsp";
	}
	
	@PostMapping("/createShow")
	public String createTvShow(@ModelAttribute("newShow") TvShow newShow, Model model) {
		showServ.saveTvShow(newShow);
		return "redirect:/shows";
	}

	@GetMapping("/show/{id}")
	public String showMain(@PathVariable("id") Long id, Model model, HttpSession session) {
		User loggedInUser = (User) session.getAttribute("user");
		if (loggedInUser == null) {
			return "redirect:/";
		}
		model.addAttribute("someShow", showServ.getTvShow(id));
		model.addAttribute("newReview", new Review());
		return "showTvShow.jsp";
	}

	@PostMapping("/shows/{id}/review")
	public String reviewShow(@Valid @ModelAttribute("newReview") Review newReview, BindingResult result,
			@PathVariable("id") Long id, Model model, HttpSession session) {
		User loggedInUser = (User) session.getAttribute("user");
		if (result.hasErrors()) {
			model.addAttribute("someShow", showServ.getTvShow(id));
			return "showTvShow.jsp";
		}
		newReview.setTvShow(showServ.getTvShow(id));
		newReview.setUser(loggedInUser);
		Review review = showServ.create(newReview);
		if (review == null) {
			result.rejectValue("rating", "unique", "You have already reviewed this Show!");
			model.addAttribute("someShow", showServ.getTvShow(id));
			return "showTvShow.jsp";
		}
		return "redirect:/show/" + id;
	}

	@GetMapping("edit/show/{id}")
	public String edit(@PathVariable("id") Long id, Model model, HttpSession session) {
		model.addAttribute("someShow", showServ.getTvShow(id));
		return "editShow.jsp";
	}

	@PostMapping("/show/update/{id}")
	public String updateShow(@PathVariable("id") Long id, @Valid @ModelAttribute("someShow") TvShow someShow,
			BindingResult result) {
		if (result.hasErrors()) {
			return "editShow.jsp";
		} else {
			showServ.update(someShow, id);
			return "redirect:/show/" + id;
		}
	}
	
	@RequestMapping("/shows/destroy/{id}")
	public String destroy(@PathVariable("id") Long Id) {
		showServ.destory(Id);
		return "redirect:/shows";
	}
}