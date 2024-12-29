package com.axsosacademy.extrabeltexam.controllers;

import com.axsosacademy.extrabeltexam.models.LoginUser;
import com.axsosacademy.extrabeltexam.models.User;
import com.axsosacademy.extrabeltexam.services.UserService;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class LoginController {
    private final UserService userService;
    public LoginController(UserService userService) {
        this.userService = userService;
    }


    @GetMapping("/")
    public String login(Model model) {
        model.addAttribute("newUser", new User());
        model.addAttribute("newLogin", new LoginUser());
        return "login";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }

    // Login method
    @PostMapping("/login")
    public String login(
            @Valid @ModelAttribute("newLogin") LoginUser newLogin,
            BindingResult bindingResult,
            HttpSession session,
            Model model
    ) {
        User loggedUser = userService.loginUser(newLogin, bindingResult);
        if (bindingResult.hasErrors()) {
            model.addAttribute("newUser", new User());
            return "login";
        }
        else {
            session.setAttribute("loggedUser", loggedUser);
            return "redirect:/dashboard";
        }
    }


}
