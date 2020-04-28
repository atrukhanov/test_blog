package com.worktask.blog.service;

import java.util.Date;
import java.util.Calendar;
import java.util.HashMap;

public class Metric {
    private static long currentTextId = 1;
    private static long nextTextId = 1;
    private static Date date = new Date();
    private static HashMap<Long, Integer> statistic = new HashMap<>();
    private static Calendar c = Calendar.getInstance();

    public static void setDate(long id){
        nextTextId = id;
       c.setTime(date);
       c.add(Calendar.DATE, 1);
       c.set(Calendar.HOUR_OF_DAY, 0);
       c.set(Calendar.MINUTE, 0);
       c.set(Calendar.SECOND, 0);
       c.set(Calendar.MILLISECOND, 0);
       date = c.getTime();
    }

    public static void setStatistic(long id){
        if (statistic.containsKey(id)) {
            statistic.compute(id, (k, v) -> v == null ? 1 : v+1);
        }
        else {
            statistic.put(id, 1);
        }
    }

    public static long getCurrentTextId() {
        return currentTextId;
    }

    public static void setCurrentTextId(long currentTextId) {
        Metric.currentTextId = currentTextId;
    }

    public static long getNextTextId() {
        return nextTextId;
    }

    public static void setNextTextId(long nextTextId) {
        Metric.nextTextId = nextTextId;
    }

    public static Date getDate() {
        return date;
    }

    public static void setDate(Date date) {
        Metric.date = date;
    }

    public static HashMap<Long, Integer> getStatistic() {
        return statistic;
    }

    public static void setStatistic(HashMap<Long, Integer> statistic) {
        Metric.statistic = statistic;
    }
}
