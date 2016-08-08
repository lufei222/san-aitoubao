package welcome;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
//import project.domain.Project;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/aitouwang")
public class AitouwangController {

//    @Autowired
//    ProjectService projectService;
    /**
     * 说明requestMapping的值可以加斜杠和不加
     * @param model
     * @return
     */
    @RequestMapping(value = "index", method = RequestMethod.GET)

    public String index(ModelMap model,HttpServletRequest request) {
        HttpSession session = request.getSession();
        request.setAttribute("seesion_member",session.getAttribute("seesion_member"));//不能直接拿session对象的用户名，这个有点奇怪
        return "aitouwang/index_aitouwang";
    }

    @RequestMapping(value = "projectDetail/{id}", method = RequestMethod.GET)
    public String projectDetail(@PathVariable Integer id,HttpServletRequest request) {
        request.setAttribute("projectId",id);
        request.setAttribute("projectId",id);
        HttpSession session = request.getSession();
        request.setAttribute("seesion_member",session.getAttribute("seesion_member"));//不能直接拿session对象的用户名，这个有点奇怪
        return "aitouwang/projectDetail";
    }
/*    @RequestMapping(value = "findProjectDetailById/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Project findProjectDetailById(@PathVariable Integer id) {
        return projectService.selectEntityById(id);
    }*/

}