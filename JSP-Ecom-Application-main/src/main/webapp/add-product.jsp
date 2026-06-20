<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); %>

<!DOCTYPE html>
<html lang="en">
<jsp:include page="templates/head.jsp"/>

<body>
<div class="site-wrap">
    <jsp:include page="templates/header.jsp"/>

    <div class="bg-light py-3">
        <div class="container">
            <div class="row">
                <div class="col-md-12 mb-0"><a href="${pageContext.request.contextPath}/">Home</a> <span class="mx-2 mb-0">/</span> <a href="${pageContext.request.contextPath}/product-management">Products management</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">Add product</strong></div>
            </div>
        </div>
    </div>

    <div class="site-section">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-9">
                    <div class="bg-white shadow-sm rounded p-4 p-lg-5">
                        <div class="d-flex justify-content-between align-items-center mb-4 flex-wrap" style="gap: 12px;">
                            <div>
                                <h2 class="text-black mb-1">Add product details</h2>
                                <p class="text-muted mb-0">Create a new product listing for the storefront.</p>
                            </div>
                            <a href="${pageContext.request.contextPath}/product-management" class="btn btn-outline-primary btn-sm">Back to products</a>
                        </div>

                        <form action="${pageContext.request.contextPath}/add-product" method="post" enctype="multipart/form-data">
                            <div class="form-group row">
                                <div class="col-md-12">
                                    <label for="product-name" class="text-black">Name <span class="text-danger">*</span></label>
                                    <input name="product-name" type="text" class="form-control" id="product-name" required>
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col-md-12">
                                    <label for="product-image" class="text-black">Image <span class="text-danger">*</span></label>
                                    <input name="product-image" type="file" class="form-control" id="product-image" accept="image/*" required>
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col-md-12">
                                    <label for="product-price" class="text-black">Price (INR) <span class="text-danger">*</span></label>
                                    <input name="product-price" type="number" step="0.01" min="0" class="form-control" id="product-price" required>
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col-md-12">
                                    <label for="product-description" class="text-black">Description <span class="text-danger">*</span></label>
                                    <textarea name="product-description" id="product-description" cols="30" rows="7" class="form-control" required></textarea>
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col-md-12">
                                    <label for="product-amount" class="text-black">Amount <span class="text-danger">*</span></label>
                                    <input name="product-amount" type="number" min="0" class="form-control" id="product-amount" required>
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col-md-12">
                                    <label for="product-category" class="text-black">Category <span class="text-danger">*</span></label>
                                    <select name="product-category" id="product-category" class="form-control" required>
                                        <c:forEach items="${category_list}" var="o">
                                            <option value="${o.id}">${o.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>

                            <div class="d-flex justify-content-end" style="gap: 12px;">
                                <a href="${pageContext.request.contextPath}/product-management" class="btn btn-outline-primary">Cancel</a>
                                <button type="submit" class="btn btn-primary">Save product</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="templates/footer.jsp"/>
</div>

<jsp:include page="templates/scripts.jsp"/>
</body>
</html>