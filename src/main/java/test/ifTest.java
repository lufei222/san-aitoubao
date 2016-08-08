package test;

import org.junit.Test;

/**
 * Created by Administrator on 2016/4/13.
 */
public class ifTest {
    @Test
    public void floatTest() {

        long startTime1 = System.currentTimeMillis();//获取当前时间
        String oushu = "";
//        for (float j = 0; j < float.MAX_VALUE; j++) {
            for (float i = 0; i <Math.pow(2147483647, 2); i++) {
                if (i % 2 == 0) {
                    oushu = "oushu";
                } else {
                    oushu = "jishu";
                }
            }
//        }
        long endTime1 = System.currentTimeMillis();//获取当前时间
        long startTime2 = System.currentTimeMillis();//获取当前时间
        System.out.println("if else程序运行时间：" + (endTime1 - startTime1) + "ms");

//        for (float j = 0; j < float.MAX_VALUE; j++) {
            for (float i = 0; i < Math.pow(2147483647,2); i++) {
                oushu = (i % 2 == 0) ? "oushu" : "jishu";
            }
//        }
        long endTime2 = System.currentTimeMillis();
        System.out.println("三目程序运行时间：" + (endTime2 - startTime2) + "ms");

    }
}