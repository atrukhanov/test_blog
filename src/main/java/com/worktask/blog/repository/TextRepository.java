package com.worktask.blog.repository;

import com.worktask.blog.entity.Text;
import org.springframework.data.repository.CrudRepository;

import java.util.Optional;

public interface TextRepository extends CrudRepository<Text, Long> {
    Optional<Text> findById(Long id);

}
