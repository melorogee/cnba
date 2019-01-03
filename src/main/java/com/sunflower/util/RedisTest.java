package com.sunflower.util;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import redis.clients.jedis.Jedis;

public class RedisTest {
    public static void main(String[] args) {
        //连接本地的 Redis 服务
//        Jedis jedis = new Jedis("154.8.170.29",6379,5000);
//        jedis.select(0);
//        System.out.println("Connection to server sucessfully");
//        //查看服务是否运行
//        System.out.println("Server is running: "+jedis.ping());
//        System.out.println("Server is running: "+jedis.get("wufanxin"));
        @SuppressWarnings("resource")
        ApplicationContext context=new ClassPathXmlApplicationContext("classpath:redis-context.xml");
        RedisUtil redisUtil=(RedisUtil) context.getBean("redisUtil");
        redisUtil.set("wufanxin_1031","hahahaha");
        String value = String.valueOf(redisUtil.get("wufanxin_1031"));
        System.out.println(value);
    }
}
