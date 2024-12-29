package com.axsosacademy.extrabeltexam.models;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "projects")
public class Project {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotEmpty(message = "Title is required!")
    @Size(min = 2, max = 255, message = "Title must be between 2 and 255 characters")
    private String title;

    @NotEmpty(message = "Description is required!")
    @Size(min = 3, max = 255, message = "Title must be between 3 and 255 characters")
    private String description;

    @NotNull(message = "Due Date is required!")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date dueDate;

    // Relations
    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(
            name = "users_projects",
            joinColumns = @JoinColumn(name = "user_id"),
            inverseJoinColumns = @JoinColumn(name = "project_id")
    )
    private List<User> users = new ArrayList<>();

    // Constructors
    public Project() {
    }

    public Project(String title, String description, Date dueDate) {
        this.title = title;
        this.description = description;
        this.dueDate = dueDate;
    }

    // Getters

    public Long getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public String getDescription() {
        return description;
    }

    public Date getDueDate() {
        return dueDate;
    }

    public List<User> getUsers() {
        return users;
    }


    // Setters

    public void setId(Long id) {
        this.id = id;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setDueDate(Date dueDate) {
        this.dueDate = dueDate;
    }

    public void setUsers(List<User> users) {
        this.users = users;
    }

    @ManyToMany(mappedBy = "projects")
    private Collection<User> users2;

    public Collection<User> getUsers2() {
        return users2;
    }

    public void setUsers2(Collection<User> users2) {
        this.users2 = users2;
    }
}
