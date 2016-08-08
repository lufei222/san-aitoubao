/**
 *
 */
package login.controller;

//import login.dao.LoginService;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import platform.filter.MemberInterceptor;
import platform.util.Md5Util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.net.URLDecoder;

//import platform.domain.Users;

/**
 * @author chenlf
 *         <p/>
 *         2014-3-24
 */
@Controller
@RequestMapping("")
public class LoginControllerNew {
//    @Autowired
//    LoginService loginService;

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView login(String redirectURL, HttpServletRequest request) {
        ModelAndView view = new ModelAndView();
        //把拦截前路径存下来，以便登入成功可以直接请求到登录前的页面
        view.addObject("redirectURL", redirectURL);
        view.setViewName("/login");
        return view;
    }
    @RequestMapping(value = "/login/signup", method = RequestMethod.GET)
    public ModelAndView signup(String redirectURL, HttpServletRequest request) {
        ModelAndView view = new ModelAndView();
        view.setViewName("/aitouwang/login/signup");
        return view;
    }
    @RequestMapping(value = "/login/logout", method = RequestMethod.GET)
    @ResponseBody
    public String  logout( Integer userType, HttpServletRequest request) {
        HttpSession session = request.getSession();
        /*****************************退出登录*********************************************************/
        if(userType!=null&&userType==2){
            session.setAttribute("seesion_member2","");
            session.setAttribute("seesion_member_id2","");

        }else if(userType!=null&&userType==1){
            session.setAttribute("seesion_member","");
            session.setAttribute("seesion_member_id","");
        }
        return "退出成功" ;
    }
    @RequestMapping(value = "/login/submit", method = RequestMethod.POST)
    public String submit(String username, String password, Integer userType, String redirectURL,
                         HttpServletRequest request) {
        String url="redirect:/admin/index.do";
        request.setAttribute("password", password.trim());
        request.setAttribute("username", username.trim());
        password = Md5Util.md5(password);
//        Users users = new Users();
//        Users users2 = new Users();
//        if (userType == 1) {//来自网站
//            Customers customer = new Customers();
//            customer.setLoginName(username);
//            customer.setPassword(password);
//            Customers customers=new Customers();
//            customers = loginService.matchLoginName(customer);//查询用户名是否存在
//            if(customers==null){//用户名不存在
//                request.setAttribute("errorCode", 1);
//                return "/aitouwang/login/login";
//            }
//             customers = loginService.matchEntity(customer);//匹配用户名密码是否正确
//
//            if(customers==null){
//              request.setAttribute("errorCode", 2);
//              HttpSession session = request.getSession();
//            //  session.setAttribute("errorCode",2);//方法一：存到session然后redirect页面，
////              RequestDispatcher dispatcher = request.getRequestDispatcher("/aitouwang/login/login.jsp");
////              dispatcher .forward(request, response);
//              return "/aitouwang/login/login";//方法二。在jsp需要重新映射路径
//          }
//            users.setId(customers.getId());
//            users.setLoginName(customers.getLoginName());
//        } else if (userType == 2) {//来自运营系统
//            Staffs staff = new Staffs();
//            staff.setLoginName(username);
//            staff.setPassword(password);
//            Staffs staffs=new Staffs();
//            staffs = loginService.matchLoginName2(staff);//查询用户名是否存在
//            if(staffs==null){//用户名不存在
//                request.setAttribute("errorCode", 1);
//                return "/admin/login/login";
//            }
//            staffs = loginService.matchEntity2(staff);//匹配用户名密码是否正确
//            if(staffs==null){
//                request.setAttribute("errorCode", 2);
//                return "/admin/login/login";
//            }
//            users.setId(staffs.getId());
//            users.setLoginName(staffs.getLoginName());
//        }
//        if (StringUtils.isNotBlank(username) && StringUtils.isNotBlank(password)
//                && users != null) {
        if (StringUtils.isNotBlank(username) && StringUtils.isNotBlank(password)) {
            //当登陆成功是，将用户信息存放到session中去
            HttpSession session = request.getSession();
            //这里可以保存用户的集合获取id和名字或者其他需要的到session中
            session.setAttribute(MemberInterceptor.SEESION_MEMBER_TYPE, userType);
//            if (userType == 1) {//网站
//                session.setAttribute(MemberInterceptor.SEESION_MEMBER, users.getLoginName());
//                session.setAttribute(MemberInterceptor.SEESION_MEMBER_ID, users.getId());
//                 url="redirect:/aitouwang/index.do";
//            } else if (userType == 2) {//运营系统
//                session.setAttribute(MemberInterceptor.SEESION_MEMBER2, users.getLoginName());
//                session.setAttribute(MemberInterceptor.SEESION_MEMBER_ID2, users.getId());
//            }
//            if (StringUtils.isNotBlank(redirectURL)) {
//                return "redirect:" + URLDecoder.decode(redirectURL);
//            }
            return url;
        } else {
            if (StringUtils.isNotBlank(redirectURL)) {
                return "redirect:/login.htm?" + URLDecoder.decode(redirectURL);
            }
            return "redirect:/login/login.html";
        }
    }

    @RequestMapping(value = "/permissions", method = RequestMethod.GET)
    public ModelAndView permissions(String redirectURL, HttpServletRequest request) {
        ModelAndView view = new ModelAndView();
        //把拦截前路径存下来，以便登入成功可以直接请求到登录前的页面
        view.addObject("redirectURL", redirectURL);
        view.setViewName("/login");
        return view;
    }

//    @RequestMapping(value = "permissions", method = RequestMethod.GET)
//    @ResponseBody
//    public List<Permissions> selectAllPermissions(PagingBean<Permissions> pb, Integer userType) throws Exception {
//        return loginService.selectAllPermissions(pb,userType);
//    }

//
//    @RequestMapping(value = "permissions/curr_user/{userType}", method = RequestMethod.GET)
//    @ResponseBody
//    public List<Permissions> selectAllPermissionsOfCurrUser(@PathVariable Integer userType) throws Exception {
//        return loginService.selectAllPermissionsOfCurrUser(userType);
//    }

}