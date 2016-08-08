package platform.helper;

//import java.util.Optional;


import java.util.Optional;

/**
 * Created by luosan on 2016/8/5.
 */
public class OptionalEtc {


    /**
     * 拓展Optional.of避免传入null空指针
     * @param value
     * @param <T>
     * @return
     */
    public static <T> Optional<T>  of(T value){
        Optional<T> a = null;
        a= Optional.of(value==null? (T)(Object)"": value);
        return a;
    }


    //这里遇到个障碍=传入的是一个泛型T对象，所以返回当然也是根据传入对象返回，那么上面的方式有问题，只能下面的
    //下面的不能满足要求
    public <T> Optional<String>  a(String value){
        return  Optional.of(value==null? "": value);
    }
}