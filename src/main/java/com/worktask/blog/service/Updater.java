package com.worktask.blog.service;

import java.util.TimerTask;

import com.worktask.blog.repository.TextRepository;
import org.springframework.beans.factory.annotation.Autowired;

public class Updater extends TimerTask{
    boolean startFlag = false;

    @Autowired
    TextRepository textRepository;

    @Override
    public void run() {
        update();
    }

    private void update (){
        Long nextId = Metric.getNextTextId();
        Metric.setCurrentTextId(nextId);
        long count = textRepository.count();
        Metric.setNextTextId((long)(1 + Math.random() * count));
    }
}
