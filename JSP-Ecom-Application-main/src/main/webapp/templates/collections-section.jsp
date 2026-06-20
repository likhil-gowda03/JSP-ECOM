<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); %>

<div class="site-section site-blocks-2">
    <div class="container">
        <div class="row">
            <c:forEach items="${category_list}" var="o">
                <c:set var="loweredName" value="${fn:toLowerCase(o.name)}" />
                <c:choose>
                    <c:when test="${loweredName == 'sports'}">
                        <c:set var="categoryImg" value="https://images.unsplash.com/photo-1461896836934-ffe607ba8211?w=500" />
                    </c:when>
                    <c:when test="${loweredName == 'watches'}">
                        <c:set var="categoryImg" value="https://images.unsplash.com/photo-1524592094714-0f0654e20314?w=500" />
                    </c:when>
                    <c:when test="${loweredName == 'shoes'}">
                        <c:set var="categoryImg" value="https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=500" />
                    </c:when>
                    <c:otherwise>
                        <c:set var="categoryImg" value="${pageContext.request.contextPath}/static/images/${loweredName}.jpg?v=20260506" />
                    </c:otherwise>
                </c:choose>

                <div class="col-sm-6 col-md-6 col-lg-4 mb-4 mb-lg-0" data-aos="fade" data-aos-delay="">
                    <a class="block-2-item" href="${pageContext.request.contextPath}/category?category_id=${o.id}">
                        <figure class="image">
                            <img src="${categoryImg}" alt="${o.name}" class="img-fluid" 
                                 onerror="this.onerror=null; this.src='${pageContext.request.contextPath}/static/images/placeholder.svg';"
                                 style="height: 350px; width: 100%; object-fit: cover;">
                        </figure>

                        <div class="text">
                            <span class="text-uppercase">Collections</span>
                            <h3>${o.name}</h3>
                        </div>
                    </a>
                </div>
            </c:forEach>
        </div>
    </div>
</div>