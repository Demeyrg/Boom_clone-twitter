package com.example.boom.controller;

import com.example.boom.entity.Message;
import com.example.boom.entity.User;
import com.example.boom.repository.MessageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.server.ResponseStatusException;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.io.IOException;
import java.util.Map;
import java.util.Optional;
import java.util.UUID;

@Controller
public class MainController {

    @Autowired
    private MessageRepository messageRepo;

    @GetMapping("/")
    public String greeting(Map<String, Object> model) {
        return "greeting";
    }

    @GetMapping("/main")
    public String main(
            @RequestParam(required = false, defaultValue = "") String filter,
            Model model
    ) {

        Iterable<Message> messages;

        if (filter != null && !filter.isEmpty()) {
            messages = messageRepo.findByTag(filter);
        } else {
            messages = messageRepo.findAll();
        }

        model.addAttribute("messages",messages);
        model.addAttribute("filter", filter);
        return "main";
    }

    @PostMapping("/main")
    public String add(
            @AuthenticationPrincipal User user,
            @Valid Message message,
            BindingResult bindingResult,
            Model model,
            @RequestParam("file")MultipartFile file
    ) throws IOException {
        message.setAuthor(user);

        if(bindingResult.hasErrors()) {
            Map<String, String> errorsMap = ControllerUtils.getErrors(bindingResult);

            model.addAttribute("message", message);
            model.mergeAttributes(errorsMap);
        } else {

            if (file != null && !file.getOriginalFilename().isEmpty()) {

                message.setImg(file.getBytes());
                String resultFileName = UUID.randomUUID().toString() + "." + file.getOriginalFilename();
                message.setFilename(resultFileName);

            }

            messageRepo.save(message);
        }
        Iterable<Message> messages = messageRepo.findAll();
        model.addAttribute("messages",messages);
        return "main";
    }

    @ResponseBody
    @GetMapping(value = "/img/messages/{name}", produces = MediaType.IMAGE_JPEG_VALUE)
    public byte[] img(@PathVariable("name") String name, HttpServletResponse response) throws IOException {

        Optional<Message> messageSearchResult = messageRepo.findByFilename(name);
        //Удали если что из репозитория метод
        if(messageSearchResult.isPresent()) {
            Message message = messageSearchResult.get();
            if (message.getImg() != null  && message.getImg().length > 0){
                byte[] img = message.getImg();

                response.setContentType("image/jpeg");
                response.setContentLength(img.length);
                response.getOutputStream().write(img);

                return message.getImg();
            }
        }
        // если выполнение дошло до данной строки, значит ничего не было найдено
        // выбрасываем 404
        throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Image Not Found");
    }
}
