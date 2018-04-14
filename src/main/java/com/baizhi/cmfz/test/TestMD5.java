package com.baizhi.cmfz.test;

import org.apache.commons.codec.digest.DigestUtils;

import java.util.Date;
import java.util.UUID;

public class TestMD5 {
    public static void main(String[] args) {
        /*String password="admin";
        *//*String salt="666";*//*
        String s1 = UUID.randomUUID().toString();
        String salt = s1.substring(0,5);


        String s = DigestUtils.md5Hex(password+salt);
        System.out.println(s);
        System.out.println(s1);
        System.out.println(salt);*/

/*        Date date =new Date();
        long time = date.getTime();
        System.out.println(time);
        */
        long millis = System.currentTimeMillis();
        try {
            Thread.sleep(3000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        long millis2 = System.currentTimeMillis();
       long time= millis2-millis;
        System.out.println(time);

    }
}
