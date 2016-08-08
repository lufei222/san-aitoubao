package test;

//import hrm.dao.CompanyService;
//import hrm.dao.EmployeeService;
//import hrm.domain.Companies;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import platform.web.PagingBean;
import platform.util.StringUtils;

/**
 * Created by san-pc on 2016/3/2.
 */
public class CompanyTest {

//    @Autowired
//    EmployeeService employeeService;
//    @Autowired
//    static CompanyService companyService;
    @BeforeClass
    public static void init() {//junit之前init spring
        ApplicationContext context = new ClassPathXmlApplicationContext("classpath*:conf/root.xml");//
     //   companyService = (CompanyService) context.getBean("companyService");
//        PropertyConfigurator.configure( " D:/Code/conf/log4j.properties " );
//        Logger logger  =  Logger.getLogger(TestLog4j. class  );
//        logger.debug( " debug " );
//        logger.error(" error " );
    }

    @Test
    public void addProject() throws Exception {
//        Project project = new Project();
//        project.setProjectName("七32天通知贷");
//        project.setProjectCode("20151601032046");
//        project.setProjectType("通知贷");
//        project.setInterestDate(7);
//        project.setInterestRatio(0.0009);
//        project.setCompanyId(1);
//        project.setCompanyName("网金控股公司");
//        project.setLinkmanId(Long.valueOf(16292 + ""));
//        project.setLinkmanName("胡平安");
//        project.setCreateId(16309);
//        project.setCreaterName("罗峰");
//        project.setBudgetIncome(12000);
//        project.setBudgetExpenses(1000);
//        project.setRealExpenses(2000);
//        project.setCreateDate(new Date());//创建日期
//        project.setEditDate(new Date());//最后修改时间
//        project.setPstartDate(new Date());//竞标日期
//        project.setPfullDate(new Date());//满标日期
//        project.setPvalueDate(new Date());//起息日期
//        project.setPendDate(new Date());//回款日期
//        project.setPrealendDate(new Date());//实际回款日期
//        project.setRemark("测试数据543654654");
//        project.setStateCode("0");
//        project.setProjectId(1942);
//
//        // int projectId = 1954;
//
//        PagingBean<Project> pb = new PagingBean<Project>();
//        pb.setCondition(project);
//        // projectService.selectEntityById(projectId);//查询单条
//
//        //projectService.selectAllEntities(pb);//查询全部，
//        //projectService.selectEntities(pb);//分页查询，
//        //projectService.selectEntitiesCount(pb);//查询条数，
//        //projectService.insertEntity(project);//增加
//        projectService.updateEntity(project);//修改
//        //projectService.deleteEntity(projectId);//删除
//


//            String keyword = null;
//        Companies queryCondition=new Companies();
//        PagingBean<Companies> pb=new PagingBean<Companies>();
//            if (StringUtils.isNotEmptyByTrim(queryCondition.getKeyword())) {
//                //   keyword = new String(queryCondition.getKeyword().getBytes("ISO-8859-1"), "utf-8");
//                keyword=queryCondition.getKeyword();
//            }
//            queryCondition.setKeyword("三");
//            pb.setCondition(queryCondition);
//          //  companyService.selectEntities(pb);
//        Companies companies =companyService.findCompanyById(111537);
//        System.out.println(companies.getCompanyName()+"--"+ companies.getLinkName()+"="+ companies.getLinkId());
        }
    }


