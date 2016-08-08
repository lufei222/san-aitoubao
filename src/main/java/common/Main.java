/**
 * 单元测试-疯狂java讲义学习
 */
package common;

import com.sun.org.apache.xpath.internal.SourceTree;
import com.sun.scenario.effect.impl.sw.sse.SSEBlend_SRC_OUTPeer;

import java.awt.print.Book;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.*;

public class Main {

    public static void main(String[] args) {
        // test1();
        test2();
        test3();
        test4();
        test5();
        test6();
      //  test7();

    }

    public static void test1() {
        System.out.println("Hello World!");
        StringBuilder sb = new StringBuilder();
        sb.append("java");
        System.out.println(sb);

        sb.insert(0, "hello");
        System.out.println(sb);

        sb.replace(5, 6, ",");
        System.out.println(sb);

        sb.delete(5, 6);
        System.out.println(sb);
        sb.reverse();
        System.out.println(sb);
        Math.sqrt(2.3);
        System.out.println("math++" + Math.abs(-3));
        Random rand = new Random();
        Float aFloat = 100f;
        //   System.out.println(rand.nextFloat(aFloat));
        Calendar c = Calendar.getInstance();
        System.out.println(c.get(Calendar.DAY_OF_YEAR));
    }

    public static void test2() {
        Collection books = new HashSet();
        books.add("疯狂java讲义");
        books.add("基于j2ee的ajax企业应用实战");
        books.add("Struts2权威指南");
        Iterator it = books.iterator();
        while (it.hasNext()) {
            String book = (String) it.next();
            System.out.println(book);
            if (book.equals("Struts2权威指南")) {
                it.remove();
            }
            book = "测试字符串";
        }
        System.out.println(books);

    }

    public static void test3() {
        TreeSet nums = new TreeSet();
        StringBuffer buffer = new StringBuffer();
        nums.add(5);
        nums.add(2);
        nums.add(10);
        nums.add(-9);
        System.out.println(nums);
        TreeSet TS = new TreeSet();
        TS.add(new String("STRUCTS权威指南"));
        //   TS.add(new Date());
        System.out.println(TS.first());
    }

    enum Season {
        SPRINBG, SUMMER, FALL, WINTER
    }

    public static void test4() {
        EnumSet es1 = EnumSet.noneOf(Season.class);
        System.out.println(es1);
    }

    public static void test5() {
        List books = new ArrayList();
        books.add(new String("轻量级J2EE企业应用实践"));
        books.add(new String("Struts2权威指南)"));
        books.add(new String("基于J2EE的Ajax宝典"));
        System.out.println(books);
        books.add(1, new String("ROR敏捷开发最佳实践"));
        for(int i=0;i<books.size();i++){
            System.out.println(books.get(i));
        }
        //删除第san个元素
        books.remove(2);
        System.out.println(books);
        //判断指定元素以在list集合中的位置：输出1，表明位于第二位
        System.out.println(books.indexOf((new String("ROR敏捷开发最佳实践"))));
        //将第二个元素替换成新的字符串对象
        books.set(1, new String("Struts2权威指南"));
        System.out.println(books);
        System.out.println(books.subList(1, 2));

    }
    public static void test6(){
        //java如何获取ip地址？
        try {
            InetAddress addr = InetAddress.getLocalHost();
            String localname=addr.getHostName();
            String localip=addr.getHostAddress();
            System.out.println("本机名称是："+ localname);
            System.out.println("本机的ip是 ："+localip);
        } catch (UnknownHostException e) {
            e.printStackTrace();
        }

    }
}