package com.bww.java_beltexam.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.bww.java_beltexam.models.LoginUser;
import com.bww.java_beltexam.models.Review;
import com.bww.java_beltexam.models.TvShow;
import com.bww.java_beltexam.models.User;
import com.bww.java_beltexam.services.TvShowService;
import com.bww.java_beltexam.services.UserService;

@Controller
public class UserController {

	private static UserService userServ;
	private static TvShowService showServ;

	public UserController(UserService userServ, TvShowService showServ) {
		this.userServ = userServ;
		this.showServ = showServ;
	}

	@GetMapping("/")
	public String signIn(Model model) {
		model.addAttribute("registerringUser", new User());
		model.addAttribute("loginUser", new LoginUser());
		return "login.jsp";
	}

	@PostMapping("/register")
	public String register(@Valid @ModelAttribute("registerringUser") User registerringUser, BindingResult result,
			Model model, HttpSession session) {
		if (!registerringUser.getPassword().equals(registerringUser.getConfirmPassword())) {
			result.rejectValue("confirm", "Match", "Confirm Password must match Password!");
		}
		if (userServ.getUser(registerringUser.getEmail()) != null) {
			result.rejectValue("email", "Unique", "Email already in use!");
		}

		if (result.hasErrors()) {
			model.addAttribute("loginUser", new LoginUser());
			return "login.jsp";
		} else {
			session.setAttribute("user", userServ.create(registerringUser));
			return "redirect:/shows";
		}
	}

	@PostMapping("/login")
	public String login(@Valid @ModelAttribute("loginUser") LoginUser loginUser, BindingResult result, Model model,
			HttpSession session) {
		User loggingInUser = userServ.login(loginUser, result);
		if (result.hasErrors()) {
			model.addAttribute("registerringUser", new User());
			return "login.jsp";
		} else {
			session.setAttribute("user", loggingInUser);
			return "redirect:/shows";
		}
	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("user");
		return "redirect:/";
	}
}
	
