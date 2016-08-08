package claim.controller;

import claim.domain.Person;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import platform.helper.OptionalEtc;
import platform.web.PagingBean;

import javax.servlet.http.HttpServletRequest;
import java.io.PrintWriter;
import java.util.*;

/**
 * Created by 三 on 2016/1/3.
 */

@Controller
@RequestMapping("claim")
//@RequestMapping("linktest")
public class ClaimController {
//    @Autowired
//    AttachmentService attachmentService;
    @RequestMapping(value = "index", method = RequestMethod.GET)
    public String listView(ModelMap model) {
        return "claim/index_claim";
    }
    @RequestMapping(value = "etrade", method = RequestMethod.GET)
    public String etradeView(ModelMap model) {
        return "electronicDisk1/electronic_disk_index";
    }
    public final static int a=0;



//    /**
//     * 保存附件
//     * @param binData
//     * @return
//     */
//    private Integer saveAttachment(byte[] binData) {
//        Attachment attachment = new Attachment();
//        attachment.setBinData(binData);
//        attachment.setTemp(true);
////        attachment.setCreatedAt(new Date());
//        attachmentService.insertEntity(attachment);
//        return attachment.getId();
//    }


    /**
     * 分页查询
     *
     * @param pb
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "listtest", method = RequestMethod.GET)
    @ResponseBody
    public PagingBean<Person> listtest(PagingBean<Person> pb, Person claim) {
        List<Person> personList=new ArrayList<Person>();
        Person person1=new Person();
        Person person2=new Person();

        person1.setName(OptionalEtc.of(null));
        person1.setHobby("乒乓球");
        person1.setId(1);
//        person1.setAdWord(Optional.of("luosa222n"));


        person2.setName(Optional.of("lufei"));
        person2.setHobby("打鬼子");
        person2.setId(2);
//        person2.setAdWord(Optional.of("luos会议决议an"));

        personList.add(person1);
        personList.add(person2);

        pb.setRows(personList);
        return pb;
    }
    /**
     * 更新
     *
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "updatetest", method = RequestMethod.POST)
    @ResponseBody
    public void updatetest(Person person, BindingResult result) throws Exception {
        //  ValidatorHelper.validate(result);
        System.out.println(person);
//        claimService.updateEntity(person);
    }
    @RequestMapping(value = "testMap", method = RequestMethod.GET)
    public String testMap(ModelMap model ,HttpServletRequest request) {
        Map<Integer,Map<Integer,String>> dataMap=new HashMap<Integer, Map<Integer,String>>();
        Map<Integer,String> map1= new HashMap<Integer, String>();
        map1.put(1,"luosan");
        map1.put(2,"luosan2");
        map1.put(3,"luosan3");
        Map<Integer,String> map2= new HashMap<Integer, String>();
        map1.put(1,"lufei");
        map1.put(2,"lufei1");
        map1.put(3,"lufei2");
        dataMap.put(1,map1);
        dataMap.put(2,map1);
        dataMap.put(3,map1);
        request.setAttribute("dataMap",dataMap);
        return "test/testMap";
    }
    @RequestMapping(value = "index1", method = RequestMethod.GET)
    public String index1(ModelMap model ,HttpServletRequest request) {
        return "test/aIndex";
    }
    @RequestMapping(value = "index1Detail", method = RequestMethod.GET)
    public String index1Detail(ModelMap model ,Person person,HttpServletRequest request) {
        request.setAttribute("id",person.getId());
        return "test/toB";
    }
    @RequestMapping(value = "openapi", method = RequestMethod.GET)
    public String openapi(ModelMap model ,HttpServletRequest request) {
        return "test/openapi";
    }

    /**
     * 方式二不带参数不能提交
     *
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "spring2", method = RequestMethod.POST)
    @ResponseBody
    public void spring2(BindingResult result) throws Exception {//HttpServletRequest request,
        //  ValidatorHelper.validate(result);
//        claimService.updateEntity(claim);
        throw new Exception("luoxingx ");
    }
    /**
     * 方式三不带参数不能提交
     *
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "spring3", method = RequestMethod.POST)
    @ResponseBody
    public void spring3(BindingResult result,PrintWriter printWriter) throws Exception {//HttpServletRequest request,
        //  ValidatorHelper.validate(result);
//        claimService.updateEntity(claim);
        throw new Exception("luoxingx ");
    }
    /**
     * 方式四带参数不能提交——失败
     *
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "spring4", method = RequestMethod.POST)
    @ResponseBody
    public void spring4(BindingResult result) throws Exception {//HttpServletRequest request,
        //  ValidatorHelper.validate(result);
//        claimService.updateEntity(claim);
        throw new Exception("luoxingx ");
    }
    /**
     * 方式五带PrintWriter参数不能提交——失败
     *
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "spring5", method = RequestMethod.POST)
    @ResponseBody
    public void spring5(BindingResult result,PrintWriter printWriter) throws Exception {//HttpServletRequest request,
        //  ValidatorHelper.validate(result);
//        claimService.updateEntity(claim);
        throw new Exception("luoxingx ");
    }
    /**
     * 方式六参数放第一个——成功
     *
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "spring6", method = RequestMethod.POST)
    @ResponseBody
    public void spring6(BindingResult result) throws Exception {//HttpServletRequest request,
        //  ValidatorHelper.validate(result);
//        claimService.updateEntity(claim);
        throw new Exception("luoxingx ");
    }
    /**
     * 方式七参数放第一个且有printwriter——成功
     *
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "spring7", method = RequestMethod.POST)
    @ResponseBody
    public void spring7(BindingResult result,PrintWriter printWriter) throws Exception {//HttpServletRequest request,
        //  ValidatorHelper.validate(result);
//        claimService.updateEntity(claim);
        throw new Exception("luoxingx ");
    }
    /******** *******/
    /**
     * 方式六七去除参数printwriter——失败
     *
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "spring8", method = RequestMethod.POST)
    @ResponseBody
    public void spring8(BindingResult result) throws Exception {//HttpServletRequest request,
        //  ValidatorHelper.validate(result);
//        claimService.updateEntity(claim);
        throw new Exception("luoxingx ");
    }
//    public String submitSellerPrice(HttpServletRequest request,@Valid SupplierPrice supplierPriceBindingResult bindingResult,PrintWriter printWriter) throws Exception {

/*    @RequestMapping(value = "update", method = RequestMethod.POST)
    @ResponseBody
    public void updateEntity(Claim claim, BindingResult result) throws Exception {
        //  ValidatorHelper.validate(result);
        claimService.updateEntity(claim);
    }*/


    /*************************测试promise1************************************/
    @RequestMapping(value="promiseIndex",method=RequestMethod.GET)
    public String promiseIndex() {
        return "test/promise";
    }

    @RequestMapping(value="promise1",method=RequestMethod.GET)
    @ResponseBody
    public String testPromise1(String test1) throws Exception{
        return "promise1 dealMsg";
    }
    @RequestMapping(value="promise2",method = RequestMethod.GET)
    @ResponseBody
    public String testPromise2(String test2) throws Exception{
        return "promise2 dealMsg";
    }
    @RequestMapping(value="promise3",method = RequestMethod.GET)
    @ResponseBody
    public String testPromise3(String test2) throws Exception{
        return "promise3";
    }
}
