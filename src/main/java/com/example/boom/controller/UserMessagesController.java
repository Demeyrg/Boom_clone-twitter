package com.example.boom.controller;

import com.example.boom.entity.Message;
import com.example.boom.entity.User;
import com.example.boom.repository.MessageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ObjectUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.transaction.Transactional;
import javax.validation.Valid;
import java.io.IOException;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

@Controller
@RequestMapping("/user-messages")
public class UserMessagesController {

    @Autowired
    private MessageRepository messageRepo;

    @GetMapping
    public String userMessagesRedirect(@AuthenticationPrincipal User currentUser) {
        return "redirect:/user-messages/" + currentUser.getId();
    }

    @GetMapping(value = "/{user}")
    public String userMessages(
            @AuthenticationPrincipal User currentUser,
            @PathVariable User user,
            @RequestParam(required = false) Message message,
            Model model
    ) {
        Set<Message> messages = user.getMessages();

        model.addAttribute("messages", messages);
        model.addAttribute("message", message);
        model.addAttribute("isCurrentUser", currentUser.equals(user));

        return "userMessages";
    }

    @PostMapping("/{user}")
    public String updateMessage(
            @AuthenticationPrincipal User currentUser,
            @PathVariable(name = "user") Long id,
            @RequestParam(required = false,name = "id") Message message,
            @RequestParam("text") String text,
            @RequestParam("tag") String tag,
            @RequestParam("file") MultipartFile file
            ) throws IOException {
        if (message == null) {
            return "redirect:/user-messages/" + id;
        }

        if(message.getAuthor().equals(currentUser)) {

            text = text.trim();
            if(!ObjectUtils.isEmpty(message.getText()) && !text.equals("")){
                message.setText(text);
            }
            tag = tag.trim();
            if(!ObjectUtils.isEmpty(message.getTag()) && !tag.equals("")) {
                message.setTag(tag);
            }

                if (file != null && !file.getOriginalFilename().isEmpty()) {
                message.setImg(file.getBytes());
                String resultFileName = UUID.randomUUID().toString() + "." + file.getOriginalFilename();
                message.setFilename(resultFileName);
            }
            messageRepo.save(message);
        }

        return "redirect:/user-messages/" + id;
    }

}
