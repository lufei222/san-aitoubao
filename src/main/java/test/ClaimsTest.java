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

//    @Autowired
//    public static ClaimService claimService;

    @BeforeClass
    public static void init() {//junit之前init spring
        ApplicationContext context = new ClassPathXmlApplicationContext("classpath*:conf/root.xml");//
    //    claimService = (ClaimService) context.getBean("claimService");
    }

    @Test
    public void addClaim() throws Exception {
//        //  for(int i=0;i<2;i++) {
//        Claim claim = new Claim();
//        //claim.setCode("C2016032703" + i);
//        claim.setCode("C2016032703");
//        claim.setClaimsType(1);
//        claim.setApplicantId(16292);
//        claim.setApplicant("胡安");
//        claim.setStateCode("1");
//        claim.setFillerId(16224);
//        claim.setFillerName("胡柳茵");
//        claim.setStartDate(new Date());//新建日期
//        claim.setEditDate(new Date());//最后修改时间
//        claim.setEndDate(new Date());//完结时间
//        claim.setRemark("fed");
//         int claimId = 2408 ;
//        claim.setId(2407);
//        PagingBean<Claim> pb = new PagingBean<Claim>();
//        pb.setCondition(claim);
//     //   claimService.insertEntity(claim);//增加
//   //     claimService.updateEntity(claim);//修改
//        claimService.selectEntityById(claimId);//查询单条
//       // claimService.selectAllEntities(pb);//查询全部，
//        //claimService.selectEntities(pb);//分页查询，
//        //claimService.selectEntitiesCount(pb);//查询条数，
//        claimService.deleteEntity(claimId);//删除
//
//        System.out.println();
        //   }
    }

}
