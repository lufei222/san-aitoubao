/**
 *
 */
package platform.filter;

import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author chenlf
 *
 *         2014-3-25
 */
public class MemberInterceptor implements HandlerInterceptor {

    public final static String SEESION_MEMBER_TYPE = "seesion_member_type";//网站
    public final static String SEESION_MEMBER = "seesion_member";//网站
    public final static String SEESION_MEMBER_ID = "seesion_member_id";
    public final static String SEESION_MEMBER2 = "seesion_member2";//运营系统
    public final static String SEESION_MEMBER_ID2 = "seesion_member_id2";
    /*
     * (non-Javadoc)
     * 
     * @see org.springframework.web.servlet.HandlerInterceptor#afterCompletion(javax.servlet.http.HttpServletRequest,
     * javax.servlet.http.HttpServletResponse, java.lang.Object, java.lang.Exception)
     */
    public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2,
                                Exception arg3) throws Exception {
        // TODO Auto-generated method stub

    }

    /*
     * (non-Javadoc)
     * 
     * @see org.springframework.web.servlet.HandlerInterceptor#postHandle(javax.servlet.http.HttpServletRequest,
     * javax.servlet.http.HttpServletResponse, java.lang.Object, org.springframework.web.servlet.ModelAndView)
     */
    public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2,
                           ModelAndView arg3) throws Exception {
        // TODO Auto-generated method stub

    }

    /*
     * (non-Javadoc)
     * 拦截mvc.xml配置的/member/**路径的请求
     * @see org.springframework.web.servlet.HandlerInterceptor#preHandle(javax.servlet.http.HttpServletRequest,
     * javax.servlet.http.HttpServletResponse, java.lang.Object)
     */
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
                             Object handler) throws Exception {
        //请求的路径
        String contextPath=request.getContextPath();
        String  url=request.getServletPath().toString();
        HttpSession session = request.getSession();

        Integer userType = (Integer) session.getAttribute(SEESION_MEMBER_TYPE);
        String user="";
        if(userType!=null&&userType==1&&!url.contains("admin")){
             user = (String) session.getAttribute(SEESION_MEMBER);
        }
        else if(userType!=null&&userType==2){
             user = (String) session.getAttribute(SEESION_MEMBER2);
        }
/*        //这里可以根据session的用户来判断角色的权限，根据权限来重定向不同的页面，简单起见，这里只是做了一个重定向
        if (StringUtils.isEmpty(user)&&!url.contains("/login/submit.do")) {
            //被拦截，重定向到login界面
//            response.sendRedirect(contextPath+"login/login.html?redirectURL="
//                    + URLEncoder.encode(url));
            response.sendRedirect(contextPath+"login/login.jsp?redirectURL="
                    + URLEncoder.encode(url));
            return false;
        }else if(StringUtils.isEmpty(user)&&url.contains("aitouwang/")||userType==2&&url.contains("aitouwang/")){
            //被拦截，重定向到login界面
//            response.sendRedirect(contextPath+"login/login.html?redirectURL="
//                    + URLEncoder.encode(url));
            response.sendRedirect("/aitouwang/login/login.jsp?redirectURL="
                    + URLEncoder.encode(url));
            return false;
        }*/
        return true;
    }

}