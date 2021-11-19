package com.example.boom.repository;

import com.example.boom.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User,Long> {
    User findByUsername(String username);

    User findByActivationCode(String code);
}
