package test;

import org.junit.Test;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

/**
 * Created by Administrator on 2016/4/13.
 */
public class UnitTest {
    @Test
    public void intTest() throws UnsupportedEncodingException {
//        int num0 = 64;
//        Integer num1 = 64;
//        System.out.println(num0 == num1);//true
//
//        Integer num2 = 126;//Integer 具有缓存, 范围为: -128 到 +127.
//        Integer num3 = 126;
//        System.out.println(num2 == num3); // false
          //  String s=java.net.URLDecoder.decode("%E5%B9%BF%E5%B7%9E","UTF-8");
//        String sd=new String(("%E5%B9%BF%E5%B7%9E").getBytes("GBK"));
//
//        System.out.println(sd);

        String s = "%E5%B9%BF%E5%B7%9E";
        byte[] b = s.getBytes("gbk");//编码
        String sa = new String(b, "gbk");//解码:用什么字符集编码就用什么字符集解码
        System.out.println(sa);

        b = "%E5%B9%BF%E5%B7%9E".getBytes("utf-8");//编码
        sa = new String(b, "utf-8");//解码
        System.err.println(sa);

       String s1= new String("%25E5%25B9%25BF%25E5%25B7%259E".getBytes("ISO8859-1"), "UTF-8");
        System.err.println("+++++++++++++++"+s1);

    }
}