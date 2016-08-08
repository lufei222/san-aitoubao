package test;

//import login.dao.LoginService;
import org.junit.BeforeClass;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * Created by san-pc on 2016/3/2.
 */
public class LoginTest {

//    @Autowired
//    public static LoginService loginService;

    @BeforeClass
    public static void init() {//junit之前init spring
        ApplicationContext context = new ClassPathXmlApplicationContext("classpath*:conf/root.xml");//
//        loginService = (LoginService) context.getBean("loginService");
    }



}
