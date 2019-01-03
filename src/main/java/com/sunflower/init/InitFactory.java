package com.sunflower.init;

import com.sunflower.util.RedisUtil;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class InitFactory {
    public static void init(){
        System.out.println("初始化======================初始化");
//        @SuppressWarnings("resource")
//        ApplicationContext context=new ClassPathXmlApplicationContext("classpath:redis-context.xml");
//        RedisUtil redisUtil = (RedisUtil) context.getBean("redisUtil");
    }
}