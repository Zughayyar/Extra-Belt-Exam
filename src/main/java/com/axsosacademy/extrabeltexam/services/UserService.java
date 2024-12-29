package com.axsosacademy.extrabeltexam.services;


import com.axsosacademy.extrabeltexam.models.LoginUser;
import com.axsosacademy.extrabeltexam.models.Project;
import com.axsosacademy.extrabeltexam.models.User;
import com.axsosacademy.extrabeltexam.repositories.UserRepository;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import java.util.Optional;

@Service
public class UserService {
    private final UserRepository userRepository;
    private final ProjectService projectService;

    public UserService(UserRepository userRepository, ProjectService projectService) {
        this.userRepository = userRepository;
        this.projectService = projectService;
    }

    // Register Method:
    public User registerUser(User newUser, BindingResult bindingResult) {
        Optional<User> potentialUser = userRepository.findByEmail(newUser.getEmail());

        // Check if email is already taken
        if (potentialUser.isPresent()) {
            bindingResult.rejectValue("email", "email.exists", "Email already in use!");
        }

        // Check if passwords match
        if (!newUser.getPassword().equals(newUser.getConfirmPassword())) {
            bindingResult.rejectValue("confirmPassword", "Matches", "The Confirm Password must match Password!");
        }

        // Return null if result has errors
        if (bindingResult.hasErrors()) {
            return null;
        }

        // Hash and set password, save user to database
        String hashedPassword = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
        newUser.setPassword(hashedPassword);
        return userRepository.save(newUser);
    }

    // Login User:
    public User loginUser(LoginUser newLoginUser, BindingResult bindingResult) {
        // Find user in the DB by email
        Optional<User> potentialUser = userRepository.findByEmail(newLoginUser.getEmail());
        if (potentialUser.isEmpty()) {
            bindingResult.rejectValue("email", "NotFound", "Email not found!");
            return null;
        }

        // Get the user object
        User user = potentialUser.get();

        // Reject if BCrypt password match fails
        if (!BCrypt.checkpw(newLoginUser.getPassword(), user.getPassword())) {
            bindingResult.rejectValue("password", "Invalid", "Invalid Password!");
        }

        // Return null if result has errors
        if (bindingResult.hasErrors()) {
            return null;
        } else {
            return user;
        }

    }


    // Remove user form project
    public void removeUserFromProject(Long projectId, Long userId) {
        Optional<User> optionalUser = userRepository.findById(userId);
        if (optionalUser.isPresent()) {
            User user = optionalUser.get();
            Project project = projectService.getProjectById(projectId);
            user.getProjects().remove(project);
            userRepository.save(user);
        }
    }



}
