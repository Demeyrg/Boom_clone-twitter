package com.example.boom.controller;

import com.example.boom.entity.Role;
import com.example.boom.entity.User;
import com.example.boom.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @GetMapping
    @PreAuthorize("hasAuthority('ADMIN')")
    public String userList(Model model) {
        model.addAttribute(userService.findAll());
        return "userList";
    }
    @GetMapping("/{user}")
    @PreAuthorize("hasAuthority('ADMIN')")
    public String userEditForm(Model model,
                               @PathVariable User user
    ) {
        model.addAttribute("user", user);
        model.addAttribute("roles", Role.values());
        return "userEdit";
    }

    @PostMapping
    @PreAuthorize("hasAuthority('ADMIN')")
    public String userSave( @RequestParam String username,
                            @RequestParam Map<String, String> form,
                            @RequestParam("userId") User user
    ) {
        userService.saveUser(user, username, form);
        return "redirect:/user";
    }

    @GetMapping("profile")
    public String getProfile(Model model,
                             @AuthenticationPrincipal User user
    ) {
        model.addAttribute("username", user.getUsername());
        model.addAttribute("email", user.getEmail());
        return "profile";
    }

    @PostMapping("profile")
    public String updateProfile( @AuthenticationPrincipal User user,
                                 @RequestParam String email,
                                 @RequestParam String password
    ) {
        userService.updateProfile(user, email, password);
        return "redirect:/user/profile";
    }
}
