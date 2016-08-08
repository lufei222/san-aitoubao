package platform.web;

import java.util.List;
import java.util.Map;


/**
 * 分页对象
 *
 * @author luosan
 * @description
 * @date 2015-12-12
 */
public class    PagingBean<T> {

    /**
     * 排序字段
     */
    private String field;


    private T condition;


    /**
     * 总记录数
     */
    private Integer results;

    /**
     * 查询的结果
     */
    private Boolean result;

    /**
     * 表格结果列
     */
    private List<T> rows;

    /**
     *  某次查询的起始记录
     */
    private Integer start;

    /**
     * 当前页
     */
    private Integer pageIndex;

    /**
     * 页大小
     */
    private Integer limit;
    /**
     * 按钮动作集
     */
    public Map<String,Boolean> actions;



    public Integer getPageIndex() {

        return pageIndex;
    }

    public void setPageIndex(Integer pageIndex) {

        this.pageIndex = pageIndex;
    }

    public Integer getLimit() {

        return limit;
    }

    public void setLimit(Integer limit) {

        this.limit = limit;
    }



    public Integer getResults() {

        return results;
    }

    public void setResults(Integer results) {

        this.results = results;
    }

    public Boolean getResult() {

        return result;
    }

    public void setResult(Boolean result) {

        this.result = result;
    }

    public List<T> getRows() {

        return rows;
    }

    public void setRows(List<T> rows) {

        this.rows = rows;
    }




    public String getField() {

        return field;
    }

    public void setField(String field) {

        this.field = field;
    }

    public Integer getStart() {

        return start;
    }

    public void setStart(Integer start) {

        this.start = start;
    }

    public T getCondition() {

        return condition;
    }

    public void setCondition(T condition) {

        this.condition = condition;
    }

    public Map<String, Boolean> getActions() {
        return actions;
    }

    public void setActions(Map<String, Boolean> actions) {
        this.actions = actions;
    }
}
