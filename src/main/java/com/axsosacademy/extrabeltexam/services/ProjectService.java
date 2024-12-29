package com.axsosacademy.extrabeltexam.services;

import com.axsosacademy.extrabeltexam.models.Project;
import com.axsosacademy.extrabeltexam.models.User;
import com.axsosacademy.extrabeltexam.repositories.ProjectRepository;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class ProjectService {
    private final ProjectRepository projectRepository;
    public ProjectService(ProjectRepository projectRepository) {
        this.projectRepository = projectRepository;
    }


    // Get All Projects
    public List<Project> getAllProjects() {
        return projectRepository.findAll();
    }

    // Create New Project
    public void addProject(Project project) {
        projectRepository.save(project);
    }

    // Get Project by Title:
    public Project getProjectByTitle(String title) {
        return projectRepository.findByTitle(title);
    }

    // Get Project by ID:
    public Project getProjectById(long id) {
        return projectRepository.findById(id).orElse(null);
    }

    // Add user to a project if not exists
    public void assignProjectToUser(Project project, User user) {
        if (!project.getUsers().contains(user)) {
            project.getUsers().add(user);
            projectRepository.save(project);
        }
    }


    // Get All Projects by User
    public List<Project> getProjectsByUser(User user) {
        return projectRepository.findByUsersId(user.getId());
    }

    // Get Projects Not Involved By User
    public List<Project> getProjectsNotInvolvingUser(User user) {
        List<Project> allProjects = projectRepository.findAll();
        allProjects.removeAll(getProjectsByUser(user));
        return allProjects;
    }




}
