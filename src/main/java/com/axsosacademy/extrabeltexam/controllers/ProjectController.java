package com.axsosacademy.extrabeltexam.controllers;

import com.axsosacademy.extrabeltexam.models.Project;
import com.axsosacademy.extrabeltexam.models.User;
import com.axsosacademy.extrabeltexam.services.ProjectService;
import com.axsosacademy.extrabeltexam.services.UserService;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ProjectController {

    private final ProjectService projectService;
    private final UserService userService;

    public ProjectController(ProjectService projectService, UserService userService) {
        this.projectService = projectService;
        this.userService = userService;
    }

    @GetMapping("/dashboard")
    public String dashboard(HttpSession session, Model model) {
        if (session.getAttribute("loggedUser") != null) {
            User loggedUser = (User) session.getAttribute("loggedUser");
            model.addAttribute("userProjects", projectService.getProjectsByUser(loggedUser));
            model.addAttribute("otherProjects", projectService.getProjectsNotInvolvingUser(loggedUser));
            return "dashboard";
        }
        else {
            return "redirect:/";
        }
    }

    @GetMapping("/projects/new")
    public String newProject(@ModelAttribute("newProject") Project newProject, HttpSession session) {
        if (session.getAttribute("loggedUser") != null) {
            return "projectNew";
        }
        else {
            return "redirect:/";
        }

    }

    @PostMapping("/books/new/addProject")
    public String addProject(
            @Valid @ModelAttribute("newProject") Project newProject,
            BindingResult bindingResult,
            HttpSession session
    ) {
        if (bindingResult.hasErrors()) {
            return "projectNew";
        }
        else {
            projectService.addProject(newProject);
            User loggedUser = (User) session.getAttribute("loggedUser");
            Project project = projectService.getProjectByTitle(newProject.getTitle());
            projectService.assignProjectToUser(project, loggedUser);
            return "redirect:/dashboard";
        }

    }

    // Join Team
    @PostMapping("/joinTeam")
    public String userJoinProject(HttpSession session, @RequestParam("projectId") Long projectId) {
        User loggedUser = (User) session.getAttribute("loggedUser");
        Project thisProject = projectService.getProjectById(projectId);
        projectService.assignProjectToUser(thisProject, loggedUser);
        return "redirect:/dashboard";
    }

    // Leave Team:
    @PostMapping("/leaveTeam")
    public String userLeaveProject(HttpSession session, @RequestParam("projectId") Long projectId) {
        User loggedUser = (User) session.getAttribute("loggedUser");
        Project thisProject = projectService.getProjectById(projectId);
        userService.removeUserFromProject(thisProject.getId(), loggedUser.getId());
        return "redirect:/dashboard";
    }
}
