package com.worktask.blog.controller;

import com.worktask.blog.entity.Text;
import com.worktask.blog.repository.TextRepository;
import com.worktask.blog.service.Metric;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import java.util.Optional;

@Controller
public class ContentController {
    @Autowired
    TextRepository textRepository;


    long id = 1;

    @GetMapping("/text")
    String showText(Model model, @RequestParam(required = false, defaultValue = "", name = "direction") String direction,
                                @RequestParam(required = false, defaultValue = "", name = "id") String p_id){

        if (p_id.equals("")){
            id = Metric.getCurrentTextId();
        }
        else {
            if (direction.equals("next")) {
                id = Long.parseLong(p_id) + 1;
            }
            else if (direction.equals("prev") && id > 1) {
                id = Long.parseLong(p_id) - 1;;
            }
            else {
                id = Metric.getCurrentTextId();
            }
        }
        Optional<Text> text = textRepository.findById(id);
        if(text.isPresent()){
            model.addAttribute("title",text.get().getTitle());
            model.addAttribute("body",text.get().getBody());
            model.addAttribute("id",text.get().getId());
            Metric.setStatistic(text.get().getId());
        }
        else {
            model.addAttribute("title","No text with this id");
        }
        return "text";
    }


}
