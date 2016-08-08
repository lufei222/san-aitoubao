/**
 *
 */
package platform.helper;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.math.BigInteger;
import java.security.MessageDigest;

/**
 * MD5工具类
 */
public class MD5Helper {

	private static final Logger LOGGER = LoggerFactory.getLogger(MD5Helper.class);

	private final static String[] hexDigits = { "0", "1", "2", "3", "4", "5",
			"6", "7", "8", "9", "a", "b", "c", "d", "e", "f" };

	public static Long md5Little64(String text) {
		return md5Little64(text, "utf-8");
	}

	public static Long md5Little64(String text, String charsetName) {
		MessageDigest digest = null;
		try {
			digest = MessageDigest.getInstance("MD5");

			digest.update(text.getBytes(charsetName));
		} catch (Exception e) {
			LOGGER.error(e.getMessage(), e);

			return null;
		}

		return new BigInteger(1, digest.digest()).longValue();
	}

	/**
	 * 转换字节数组为16进制字串
	 *
	 * @param b
	 *            字节数组
	 * @return 16进制字串
	 */
	public static String byteArrayToHexString(byte[] b) {
		if (b == null)
			return "";
		StringBuffer resultSb = new StringBuffer();
		for (int i = 0; i < b.length; i++) {
			resultSb.append(byteToHexString(b[i]));
		}
		return resultSb.toString();
	}

	private static String byteToHexString(byte b) {
		int n = b;
		if (n < 0)
			n = 256 + n;
		int d1 = n / 16;
		int d2 = n % 16;
		return hexDigits[d1] + hexDigits[d2];
	}

	/**
	 * 编码
	 *
	 * @param data 数据
	 * @return MD5返回值
	 */
	public static String encode(String data) {
		if (data == null)
			return encode("");
		String resultString = "";
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			resultString = byteArrayToHexString(md.digest(data.getBytes()));
		} catch (Exception ex) {
			resultString = data;
		}
		return resultString;
	}
}
