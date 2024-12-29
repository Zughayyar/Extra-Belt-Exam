package com.axsosacademy.extrabeltexam.controllers;


import com.axsosacademy.extrabeltexam.models.LoginUser;
import com.axsosacademy.extrabeltexam.models.User;
import com.axsosacademy.extrabeltexam.services.UserService;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class RegisterController {
    private final UserService userService;
    public RegisterController(UserService userService) {
        this.userService = userService;
    }

    // Register Method (POST REQUEST):
    @PostMapping("/register")
    public String registerUser(
            @Valid @ModelAttribute("newUser") User newUser,
            BindingResult bindingResult,
            Model model,
            HttpSession session
    ) {
        User loggedUser = userService.registerUser(newUser, bindingResult);
        if (bindingResult.hasErrors()) {
            model.addAttribute("newLogin", new LoginUser());
            return "login";
        }
        else {
            session.setAttribute("loggedUser", loggedUser);
            return "redirect:/dashboard";
        }

    }


}
