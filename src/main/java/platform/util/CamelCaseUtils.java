package platform.util;

/**
 * Created by luosan on 2016/2/25.
 */
public class CamelCaseUtils {
    public CamelCaseUtils() {
        System.out.println("------------------华丽的分隔符-------------------------");
        String str = "Java string split test";
        String[] strarray = str.split("[_]");//  String[] strarray=str.split(" ",2);//使用limit，最多分割成2个字符串
        for (int i = 0; i < strarray.length; i++) {
            System.out.println(strarray[i]);
        }
        System.out.println("------------------华丽的分隔符-------------------------");
        String str2 = "ja2va_string_spl5it_te3st";
        String[] strarray2 = str2.split("[_235]");//可以
        // String[] strarray2=str2.split("_|3|5");//可以
        for (int i = 0; i < strarray2.length; i++) {
            System.out.println(strarray2[i]);
        }
        String str3 = "project_id_name";
        String[] strarray3 = str3.split("_", 2);
        strarray3[1] = initcap(strarray3[1]);
        String strNew = strarray3[0] + strarray3[1];
        System.out.println(strNew);
        System.out.println("------------------华丽的分隔符-------------------------");

        System.out.println("------------------华丽的分隔符-------------------------");
    }

    public static void main(String[] args) {
        new CamelCaseUtils();
    }

    /**
     * 功能：将输入字符串的首字母改成大写
     *
     * @param str
     * @return
     */
    private String initcap(String str) {
        char[] ch = str.toCharArray();
        if (ch[0] >= 'a' && ch[0] <= 'z') {
            ch[0] = (char) (ch[0] - 32);
        }
        return new String(ch);
    }

    /**
     *驼峰命名规则
     * @param input
     * @return
     */
    public String nameRules(String input){
        String[] tempAaary = input.split("_");
        String newColnames = "";
        StringBuffer tempSb = new StringBuffer();
        for (int i = 1; i < tempAaary.length; i++) {
            tempAaary[i] = initcap(tempAaary[i]);//转成首字母大写
        }
        System.out.println(tempAaary);
        for (int i = 0; i < tempAaary.length; i++) {
            tempSb.append(tempAaary[i]);
        }
        newColnames = tempSb.toString();//新的属性名称
        System.out.println("新出来的数组---" + newColnames);
        return newColnames;
    }
}
