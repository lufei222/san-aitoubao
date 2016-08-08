<%@ page import="java.util.Date" %>
<%@ page import="java.util.logging.Logger" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="ele-seller-orders">
    <% Logger logger= Logger.getLogger(this.getClass().getName());%>

    <div class="listwrap">
          <p class="list-tit clearfix">
            <span class="item"></span>
            <span class="item w150">订单号</span>
            <span class="item w100">总数量(吨)</span>
            <span class="item w100">总金额</span>
            <span class="item w80">状态</span>
            <span class="item w80">配送方式</span>
            <span class="item w100">下单日期</span>
            <span class="item w100">订单来源</span>
          </p>
          <ul>

            <c:forEach var="dataMapJsp" items="${dataMap}">
              fdfd
              <li class="row">
                <div class="clearfix"></div>
                 <% String message = "counter="
                  + pageContext.findAttribute("dataMapJsp")
                  + " dataMap="
                  + pageContext.findAttribute("dataMapJsp");
                  logger.info( message );
                  %>
                  <td>${dataMap.key}</td>
                  <td>${dataMap.value}</td>
                <c:forEach var="mapItem" items="${dataMapJsp.value}">
                  <% String message2 = "counter="
                  + pageContext.findAttribute("mapItem")
                  + " dataMap="
                  + pageContext.findAttribute("mapItem");
                  logger.info( message2 );
                  %>
                  <p>----------------------</p>
                  <td>${mapItem.key}</td>
                  <td>${mapItem.value}</td>
               </c:forEach>
                <%--点击后显示的内容start--%>
                <div class="rowdetail">
                  <p class="detit clearfix">
                    <span class="deitem w50">期现货</span>
                    <span class="deitem w60">品种</span>
                    <span class="deitem w100">牌号</span>
                    <span class="deitem w100">生产商</span>
                    <span class="deitem w70">仓库城市</span>
                    <span class="deitem w80">仓库</span>
                    <span class="deitem w90">单价</span>
                    <span class="deitem w80">数量（吨）</span>
                    <span class="deitem w90">金额</span>
                  </p>
                  <ul class="derow-wrap">
                 <%--   <c:forEach items="${order.purchaseOrderItem}" var="orderItem" varStatus="vs">
                      <li class="derow clearfix">
                        &lt;%&ndash;<span class="deitem w50">${orderItem.isFuture}</span>&ndash;%&gt;
                        <span class="deitem w50">
                        <c:choose>
                          <c:when test="${orderItem.isFuture==false}">现货</c:when>
                          <c:when test="${orderItem.isFuture==true}">期货</c:when>
                        </c:choose>
                        </span>
                        <span class="deitem w60">${orderItem.category}</span>
                        <span class="deitem w100">${orderItem.designation}</span>
                        <span class="deitem w100">${orderItem.manufacturerName}</span>
                        <span class="deitem w70">${orderItem.warehouseCityName}</span>
                        <span class="deitem w80">${orderItem.warehouseName}</span>
                        <span class="deitem w90">￥${orderItem.price}</span>
                        <span class="deitem w80">${orderItem.weight}</span>
                        <span class="deitem w90 c-f70">￥${orderItem.amount}</span>
                      </li>
                    </c:forEach>--%>
                  </ul>
                </div>
                  </c:forEach>
                  <%--点击后显示的内容end--%>
          </ul>

    </div>

    </div>



</div>

