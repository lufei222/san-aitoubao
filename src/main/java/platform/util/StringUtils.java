package platform.util;

import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.regex.Pattern;

/**
 * 字符串工具类
 * 
 * @author caiwb
 */
public class StringUtils {

	private static final Pattern PhonePattern = Pattern.compile("^((13[0-9])|(15[^4,\\D])|(18[0,5-9]))\\d{8}$");
	private static final Pattern ChinesePattern = Pattern.compile("[\\u4e00-\\u9fa5]+");
	private static final Pattern CharacterPattern = Pattern.compile("^[A-Za-z]+$");
	
	public static boolean isEmptyByTrim(String text) {
		if (text == null)
			return true;

		if (text.trim().isEmpty())
			return true;

		return false;
	}
	
	public static boolean isNotEmptyByTrim(String text) {
		if (text == null)
			return false;

		if (text.trim().isEmpty())
			return false;

		return true;
	}

	public static Set<String> splitStrs2Set(String strs) {
    	Set<String> set = new HashSet<String>();
    	
    	if (StringUtils.isNotEmptyByTrim(strs)) {
    		for (String str : strs.split(",")) {
    			set.add(str);
			}
    	}
    	
    	return set;
    }
	
	public static String set2SplitStrs(Set<String> set) {
		if (set == null || set.isEmpty())
			return "";
		
		StringBuffer buffer = new StringBuffer();
		for (String str : set) {
			buffer.append(str).append(",");
		}
		
		return buffer.substring(0, buffer.length() - 1);
	}
	
	public static Set<Integer> splitStrs2IntSet(String strs) {
    	Set<Integer> set = new HashSet<Integer>();
    	
    	if (StringUtils.isNotEmptyByTrim(strs)) {
    		for (String str : strs.split(",")) {
    			set.add(Integer.parseInt(str));
			}
    	}
    	
    	return set;
    }
	/**
	 *  判断某个字符串是否存在于数组中
	 *  @param stringArray 原数组
	 *  @param source 查找的字符串
	 *  @return 是否找到
	 */
	public static boolean contains(String[] stringArray, String source) {
		// 转换为list
		List<String> tempList = Arrays.asList(stringArray);

		// 利用list的包含方法,进行判断
		if(tempList.contains(source))
		{
			return true;
		} else {
			return false;
		}
	}
	public static boolean isMobileNo(String phone) {
		return PhonePattern.matcher(phone).matches();
	}
	
	public static boolean hasChinese(String chinese) {
		return ChinesePattern.matcher(chinese).matches();
	}
	
	public static boolean isCharacter(String character) {
		return CharacterPattern.matcher(character).matches();
	}
}
