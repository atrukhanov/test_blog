package com.worktask.blog.controller;

import com.worktask.blog.entity.Text;
import com.worktask.blog.repository.TextRepository;
import com.worktask.blog.service.Metric;
import com.worktask.blog.service.UserService;
import org.springframework.ui.Model;
import org.springframework.stereotype.Controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import java.util.List;

@Controller
public class AdminController {
    @Autowired
    private UserService userService;
    @Autowired
    private TextRepository textRepository;


    @GetMapping("/admin/set-text")
    String getTexts(Model model){
        List<Text> allTexts = (List<Text>)textRepository.findAll();
        model.addAttribute("allTexts", allTexts);
        return "list_texts";
        }

    @PostMapping("/admin/set-text")
    String setText(@RequestParam(required = true, defaultValue = "") String id,
                   @RequestParam(required = true, defaultValue = "") String action,
                   Model model){
        if (action.equals("set")){
            Metric.setDate(Long.parseLong(id));
        }
        return "redirect:/text";
    }
    @GetMapping("/admin/statistics")
    String getStatistics(Model model) {
        List<Text> allTexts = (List<Text>) textRepository.findAll();

        if (Metric.getStatistic().values().isEmpty()){
            model.addAttribute("statistics", "No statistic");
            return "stats";
        }
        model.addAttribute("statistics", Metric.getStatistic().values());
        model.addAttribute("allTexts", allTexts);
        return "stats";
    }
    
}
