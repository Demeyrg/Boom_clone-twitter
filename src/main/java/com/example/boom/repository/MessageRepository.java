package com.example.boom.repository;

import com.example.boom.entity.Message;
import org.springframework.data.repository.CrudRepository;

import java.util.List;
import java.util.Optional;

public interface MessageRepository extends CrudRepository<Message, Integer> {

    List<Message> findByTag(String tag);

    Optional<Message> findByFilename(String name);
}

