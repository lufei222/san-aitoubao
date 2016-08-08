package login.controller;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginController extends AbstractController {
    //成功与失败字段
    private String successView;
    private String failView;

    public String getSuccessView() {
        return successView;
    }

    public void setSuccessView(String successView) {
        this.successView = successView;
    }

    public String getFailView() {
        return failView;
    }

    public void setFailView(String failView) {
        this.failView = failView;
    }

    @Override
    protected ModelAndView handleRequestInternal(HttpServletRequest request,
                                                 HttpServletResponse response) throws Exception {
        //不应该是这样写，但是这样看起来比较容易理解
        String username = request.getParameter("username");
        String password = request.getParameter("password");
       /* Customers user = getLoginUser(username, password);
        //保存相应的参数，通过ModelAndView返回
        Map<String ,Object> model=new HashMap<String,Object>();
        if(user !=null){
            model.put("user", user);
            return new ModelAndView(getSuccessView(),model);
        }else{
            model.put("error", "用户名或密码输入错误！！！");
            return new ModelAndView(getFailView(),model);
        }*/
        return null;
    }
    //为了方便直接写的验证方法
//    public static Customers getLoginUser(String username,String password){
//        if(username.equals("test") && password.equals("test")){
//            System.out.println("输出成功罗三");
//            return null;
////            return new Customers(username,password);
//        }else{
//            return null;
//        }
//    }
}