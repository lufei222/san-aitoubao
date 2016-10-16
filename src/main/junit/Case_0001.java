package test;

import com.sun.org.apache.xpath.internal.SourceTree;
import org.junit.Test;

import java.util.Arrays;
import java.util.List;

/**
 * Created by Administrator on 2016/10/16.
 */
public class Case_0001 {
    /**
     * 原始类型数组不能作为asList的输入参数，否则会引起程序逻辑混乱
     */
    @Test
    public  void main(){
        int[] data={1,2,3,4,5};
        List list= Arrays.asList(data);
        System.out.print("元素类型："+list.get(0).getClass());
        System.out.println("前后是否相等:" + data.equals(list.get(0)));
        System.out.println("列表中的元素数量是："+list.size());//1

    }

    /**
     * 原始类型数组不能作为asList的输入参数，否则会引起程序逻辑混乱
     */
    @Test
    public void test2(){
        Integer[] data ={1,2,3,4,5};
        List list=Arrays.asList(data);
        System.out.println("列表中的元素数量是："+list.size());//5
    }
}
