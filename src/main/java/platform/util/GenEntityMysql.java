package platform.util;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Scanner;

/**
 * 从数据库表反射出实体类，自动生成实体类
 *
 * @author ls
 */
public class GenEntityMysql {

    private String packageOutPath = "main/java/platform/domain";//指定实体生成所在包的路径
    private String packageOutPath2 = "platform.domain";//指定import
    private String authorName = "san-pc";//作者名字
    private String tablename = "customers_projects";//表名
    private String[] colnames; // 列名数组
    private String[] colRemarks; //列名注释
    private String[] colTypes; //列名类型数组
    private int[] colSizes; //列名大小数组
    private boolean f_util = false; // 是否需要导入包java.util.*
    private boolean f_sql = false; // 是否需要导入包java.sql.*
    private boolean f_jpa = true; // 是否需要生成基于注解的JPA实体对象

    //数据库连接
    private static final String URL = "jdbc:mysql://localhost:3306/aitoubao";
    private static final String NAME = "root";
    private static final String PASS = "123456";
    private static final String DRIVER = "com.mysql.jdbc.Driver";
    private boolean isCamelCase = true; // 是否驼峰命名法
    private static int sqlType; // 数据库类型
    private static int namingRules; // 命名规则
    private static int count = 0;


    /*
     * 构造函数
     */
    public enum SqlEnum {
        mysql, oracle, sqlserver, access;
    }

    public enum SqlNum {
        //枚举有自己的构造方法数据域,
        //enum声明的就是一个类，不是特殊的class
        mysql(1), oracle(2), sqlserver(3), access(4);//这些是这个枚举类型已经包含的枚举出的值
        private int value; //这个例子里的数据属性value，而你的例子里是name和index

        private SqlNum(int value) { //构造方法
            this.value = value;
        }

        public int getValue() { //成员方法
            return value;
        }

    }


    public GenEntityMysql(int sqlType, int namingRules) {
        List<String> list = getTableName();
        StringBuilder sb = new StringBuilder();
        for (String s : list) {
            sb.append(s);
        }
        //   if  sb.toString();
        //     for (int p = 0; p < list.size(); p++) {//begin for1
        //        tablename = list.get(p);//begin for2
        //创建连接
        Connection con;
        //查要生成实体类的表
        String sql = "select * from " + tablename;
        PreparedStatement pStemt = null;
        try {
            try {
                Class.forName(DRIVER);
            } catch (ClassNotFoundException e1) {
                e1.printStackTrace();
            }
            con = DriverManager.getConnection(URL, NAME, PASS);
            pStemt = con.prepareStatement(sql);
            //     ResultSetMetaData rsmd = pStemt.getMetaData();
            //    int size = rsmd.getColumnCount();    //统计列

            /**********************改成下面获取注释的方法********************************/

            DatabaseMetaData dbmd = con.getMetaData();
            ResultSet resultSet = dbmd.getTables(null, "%", "%", new String[]{"TABLE"});
            while (resultSet.next()) {
                String tableName = resultSet.getString("TABLE_NAME");
                //System.out.println(tableName);
                if (tableName.equals(tablename)) {

                    //ResultSet rs =getConnection.getMetaData().getColumns(null, getXMLConfig.getSchema(),tableName.toUpperCase(), "%");//其他数据库不需要这个方法的，直接传null，这个是oracle和db2这么用
                    ResultSet rs = dbmd.getColumns(null, "%", tableName, "%");
                    // ResultSetMetaData rsmdForCol = resultSet.getMetaData();
                    // = rsmdForCol.getColumnCount();//统计列

                    int size = 0;
                    //  while(rs.next()){size+=1;}
                    rs.last();
                    size = rs.getRow();
                    rs.beforeFirst();
                    colnames = new String[size];
                    colRemarks = new String[size];
                    colTypes = new String[size];
                    colSizes = new int[size];
                    while (rs.next()) {
                        colnames[count] = rs.getString("COLUMN_NAME");
                        if(rs.getString("REMARKS").equals("1")){
                            colRemarks[count] ="--";
                        }
                        else{
                            colRemarks[count] = rs.getString("REMARKS");
                        }
                        colTypes[count] = rs.getString("TYPE_NAME").toLowerCase();

                        if (colTypes[count].equalsIgnoreCase("datetime")) {
                            f_util = true;
                        }
                        if (colTypes[count].equalsIgnoreCase("image") || colTypes[count].equalsIgnoreCase("text")) {
                            f_sql = true;
                        }
                        colSizes[count] = Integer.valueOf(rs.getString("DATA_TYPE"));;//这里修改
                        count++;
                    }

                }
            }


            /**********************改成上面获取注释的方法********************************/

/*            colnames = new String[size];
            colTypes = new String[size];
            colSizes = new int[size];
            for (int i = 0; i < size; i++) {
                colnames[i] = rsmd.getColumnName(i + 1);
                colTypes[i] = rsmd.getColumnTypeName(i + 1);

                if (colTypes[i].equalsIgnoreCase("datetime")) {
                    f_util = true;
                }
                if (colTypes[i].equalsIgnoreCase("image") || colTypes[i].equalsIgnoreCase("text")) {
                    f_sql = true;
                }
                colSizes[i] = rsmd.getColumnDisplaySize(i + 1);
            }*/

            String content = parse(colnames,colRemarks, colTypes, colSizes);

            try {
                File directory = new File("");
                String outputPath = directory.getAbsolutePath() + "/src/" + this.packageOutPath.replace(".", "/") + "/" + initcap(tablename) + ".java";
                FileWriter fw = new FileWriter(outputPath);
                PrintWriter pw = new PrintWriter(fw);
                pw.println(content);
                pw.flush();
                pw.close();
            } catch (IOException e) {
                e.printStackTrace();
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            //			try {
            //				con.close();
            //			} catch (SQLException e) {
            //				// TODO Auto-generated catch block
            //				e.printStackTrace();
            //			}
        }
        System.out.println("生成完毕！");

    }
    //   }//end for1

    /**
     * Java方法 得到当前数据库下所有的表名
     *
     * @param con
     */
    private List<String> getTableName() {
        List<String> list = new ArrayList<String>();
        try {
            DatabaseMetaData meta = DriverManager.getConnection(URL, NAME, PASS).getMetaData();
            ResultSet rs = meta.getTables(null, null, null, new String[]{"TABLE"});
            while (rs.next()) {
                list.add(rs.getString(3));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    /**
     * 功能：生成实体类主体代码
     *
     * @param colnames
     * @param colTypes
     * @param colSizes
     * @return
     */
    private String parse(String[] colnames,String[] colRemarks, String[] colTypes, int[] colSizes) {
        StringBuffer sb = new StringBuffer();
        sb.append("package " + this.packageOutPath2 + ";\r\n");
        sb.append("\r\n");

        //判断是否导入工具包
        if (f_util) {
            sb.append("import java.util.Date;\r\n");
            sb.append("import org.springframework.format.annotation.DateTimeFormat;\n;\r\n");
        }
        if (f_sql) {
            sb.append("import java.sql.*;\r\n");
        }

        //jpa

    /*    if(f_jpa){
            sb.append("import javax.persistence.Entity;\r\n");
            sb.append("import javax.persistence.GeneratedValue;\r\n");
            sb.append("import javax.persistence.GenerationType;\r\n");
            sb.append("import javax.persistence.Id;\r\n\r\n");
        }*/

        //注释部分
        sb.append("\t/**\r\n");
        sb.append("\t* " + tablename + " 实体类\r\n");
        sb.append("\t * " + new Date() + "\r\n");
        sb.append("\t * @" + this.authorName + "\r\n");
        sb.append("\t */ \r\n");

      /*  if(f_jpa){
            sb.append("@Entity\r\n");
        }*/
        //实体部分

        sb.append("public class " + initcap(tablename) + "{\r\n\r\n");
        processAllAttrs(sb);//属性
        processAllMethod(sb);//get set方法
        sb.append("}\r\n");

        //System.out.println(sb.toString());
        return sb.toString();
    }

    /**
     * 功能：生成所有属性
     *
     * @param sb
     */
    private void processAllAttrs(StringBuffer sb) {
        for (int i = 0; i < colnames.length; i++) {
            if (namingRules == 1) {
                if (colRemarks[i].length()>3) {
                    //属性注释部分
                    sb.append("\t/**\r\n");
                    sb.append("\t * " + colRemarks[i] + "\r\n");
                    sb.append("\t */ \r\n");
                }
                if(colnames[i].contains("date")){
                    sb.append("\t@DateTimeFormat(pattern=\"yyyy-MM-dd HH:mm:ss\")\r");
                }
                sb.append("\tprivate " + sqlType2JavaType(colTypes[i]) + " " + nameRules(colnames[i]) + ";\r\n");//普通不转换列名
            } else {
                sb.append("\tprivate " + sqlType2JavaType(colTypes[i]) + " " + nameRules(colnames[i]) + ";\r\n");//普通不转换列名
            }
        }
        sb.append("\r\n");
    }

    /**
     * 功能：生成所有方法
     *
     * @param sb
     */
    private void processAllMethod(StringBuffer sb) {

        for (int i = 0; i < colnames.length; i++) {

            if (f_jpa) {
                if (i == 0) {
                  /*  sb.append("\t/@Id\r\n");
                    sb.append("\t**@GeneratedValue(strategy = GenerationType.AUTO)\r\n");
                    sb.append("\tpublic " + sqlType2JavaType(colTypes[i]) + " get" + initcap(colnames[i]) + "(){\r\n");*/
                    //注释部分
                    sb.append("\t/**\r\n");
                    sb.append("\t * " + tablename + " ----------------------get and set---------------------- \r\n");
                    sb.append("\t * @" + this.authorName + "\r\n");
                    sb.append("\t */ \r\n");
                    sb.append("\tpublic " + sqlType2JavaType(colTypes[i]) + " get" + initcap(colnames[i]) + "(){\r\n");
                } else {
                    sb.append("\tpublic " + sqlType2JavaType(colTypes[i]) + " get" + initcap(colnames[i]) + "(){\r\n");
                }
            } else {
                sb.append("\tpublic " + sqlType2JavaType(colTypes[i]) + " get" + initcap(colnames[i]) + "(){\r\n");
            }
            sb.append("\t\treturn " + nameRules(colnames[i]) + ";\r\n");
            sb.append("\t}\r\n\r\n");
            sb.append("\tpublic void set" + initcap(colnames[i]) + "(" + sqlType2JavaType(colTypes[i]) + " " + nameRules(colnames[i]) + "){\r\n");
            sb.append("\t\tthis." + nameRules(colnames[i]) + "=" + nameRules(colnames[i]) + ";\r\n");
            sb.append("\t}\r\n\r\n");
        }

    }

    /**
     * 功能：将输入字符串的首字母改成大写
     *
     * @param str
     * @return
     */
    private String initcap(String str) {
        str = nameRules(str);
        char[] ch = str.toCharArray();
        if (ch[0] >= 'a' && ch[0] <= 'z') {
            ch[0] = (char) (ch[0] - 32);
        }

        return new String(ch);
    }

    /**
     * 功能：获得列的数据类型
     *
     * @param sqlType
     * @return
     */
    private String sqlType2JavaType(String sqlType) {

        if (sqlType.equalsIgnoreCase("bit")) {
            return "boolean";
        } else if (sqlType.equalsIgnoreCase("tinyint")) {
            return "byte";
        } else if (sqlType.equalsIgnoreCase("smallint")) {
            return "short";
        } else if (sqlType.equalsIgnoreCase("int") || sqlType.equalsIgnoreCase("INT UNSIGNED")) {
            //INT UNSIGNED无符号整形
            return "int";
        } else if (sqlType.equalsIgnoreCase("bigint")) {
            return "long";
        } else if (sqlType.equalsIgnoreCase("float")) {
            return "float";
        } else if (sqlType.equalsIgnoreCase("decimal") || sqlType.equalsIgnoreCase("numeric")
                || sqlType.equalsIgnoreCase("real") || sqlType.equalsIgnoreCase("money")
                || sqlType.equalsIgnoreCase("smallmoney")) {
            return "double";
        } else if (sqlType.equalsIgnoreCase("varchar") || sqlType.equalsIgnoreCase("char")
                || sqlType.equalsIgnoreCase("nvarchar") || sqlType.equalsIgnoreCase("nchar")
                || sqlType.equalsIgnoreCase("text")) {
            return "String";
        } else if (sqlType.equalsIgnoreCase("datetime") || sqlType.equalsIgnoreCase("timestamp")) {
            return "Date";
        } else if (sqlType.equalsIgnoreCase("image")) {
            return "Blod";
        }
        return null;
    }

    /**
     * 驼峰命名转换方法
     *
     * @param input
     * @return
     */
    public String nameRules(String input) {
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
        newColnames = tempSb.toString();//新的列名称
        return newColnames;
    }

    /**
     * 出口
     * TODO
     *
     * @param args
     */
    public static void main(String[] args) {
        SqlEnum sqlEnum = SqlEnum.access;
        //SqlNum sqlNum= SqlNum[];
        //namingRules=sqlNum.getValue();
        Scanner sc = new Scanner(System.in);
        // sqlNums sqlNumss=sqlNums.mysql;
        // String a= sc.next();// "triangle" or "rectangle" or "square' (Triangle("triangle")引号中的    部分）
        String a = "mysql";
        String b = "lcamelcase";
        SqlNums tempSqlNums = SqlNums.getEnumByValue(a);
        sqlType = tempSqlNums.getKey();//获取数据库类型
        NamingRules tempNamingRules = NamingRules.getIndex(b);
        namingRules = tempNamingRules.getIndex();//获取命名规则类型

        new GenEntityMysql(sqlType, namingRules);
    }

    /**
     * 数据库枚举
     * * 1：mysql:2：oracle:3：sqlserver
     */
    public enum SqlNums {
        mysql(1, "mysql"), oracle(2, "oracle"), sqlserver(3, "sqlserver");
        private final Integer key;
        private final String name;

        public String getName() {
            return name;
        }

        private SqlNums(Integer key, String name) {
            this.key = key;
            this.name = name;
        }

        public Integer getKey() {
            return key;
        }

        public static SqlNums getEnumByValue(String value) {
            for (SqlNums a : SqlNums.values()) {
                if (a.name.equals(value)) {
                    return a;
                }
            }
            return null;
        }
    }

    /**
     * 命名规则枚举
     * 1：小驼峰式:2：大驼峰式:3：匈牙利命名
     */
    public enum NamingRules {
        LCAMELlCASE("lcamelcase", 1), BCAMELlCASE("bcamelcase", 2), HUNGARY("hungary", 3);
        // 成员变量
        private String name;
        private int index;

        // 构造方法
        private NamingRules(String name, int index) {
            this.name = name;
            this.index = index;
        }

        public static NamingRules getName(int index) {
            for (NamingRules c : NamingRules.values()) {
                if (c.getIndex() == index) {
                    return c;
                }
            }
            return null;
        }

        public static NamingRules getIndex(String name) {
            for (NamingRules c : NamingRules.values()) {
                if (c.getName() == name) {
                    return c;
                }
            }
            return null;
        }

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        public int getIndex() {
            return index;
        }

        public void setIndex(int index) {
            this.index = index;
        }
    }
}