package welcome;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @RequestMapping(value = "index",method = RequestMethod.GET)
    public String atbIndex(ModelMap model, HttpServletRequest request) {
        HttpSession session = request.getSession();
        request.setAttribute("seesion_member2",session.getAttribute("seesion_member2"));//不能直接拿session对象的用户名，这个有点奇怪
        return "welcome/index";
    }

}