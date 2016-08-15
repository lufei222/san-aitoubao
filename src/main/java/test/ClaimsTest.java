package test;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import platform.web.PagingBean;
//import claim.dao.ClaimService;
//import claim.domain.Claim;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by san-pc on 2016/3/2.
 */
public class ClaimsTest {
    private static class Person{
        Integer age;
        String name;

        public Integer getAge() {
            return age;
        }

        public void setAge(Integer age) {
            this.age = age;
        }

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }
    }
    public static void main(String[] args){

        ClaimsTest test = new ClaimsTest();
        String s = new String("hello");
        Integer a=new Integer(3);
        test.notice(s);
        System.out.println("String=" + s);
        System.out.println("Integer=" + a);
        Person person=new Person();
        person.setName("我是大明");
        test.changeName(person);
        System.out.println("person.name="+person.getName());

    }
    public static void notice(String str){
       // str = str.replace('h', 'x');
        str="diaomao";
    }
    public static void changeInt(Integer i){
        // str = str.replace('h', 'x');
        i=9;
    }
    public static void changeName(Person person){
        // str = str.replace('h', 'x');
        person.setName("我是可爱的小明");
    }
}
