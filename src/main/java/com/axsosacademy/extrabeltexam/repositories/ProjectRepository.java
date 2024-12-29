package com.axsosacademy.extrabeltexam.repositories;

import com.axsosacademy.extrabeltexam.models.Project;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProjectRepository extends CrudRepository<Project, Long> {
    List<Project> findAll();

    Project findByTitle(String title);

    List<Project> findByUsersId(Long userId);
}
