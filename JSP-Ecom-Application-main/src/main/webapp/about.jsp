<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<jsp:include page="templates/head.jsp"/>

<body>
<div class="site-wrap">
    <% request.setAttribute("about_active", "active"); %>
    <jsp:include page="templates/header.jsp"/>

    <div class="bg-light py-3">
        <div class="container">
            <div class="row">
                <div class="col-md-12 mb-0"><a href="${pageContext.request.contextPath}/">Home</a> <span class="mx-2 mb-0">/</span> <strong
                        class="text-black">About</strong></div>
            </div>
        </div>
    </div>

    <div class="site-section border-bottom" data-aos="fade">
        <div class="container">
            <div class="row mb-5">
                <div class="col-md-6">
                    <div class="block-16">
                        <figure>
                            <img src="static/images/blog_1.jpg" alt="Image placeholder" class="img-fluid rounded">
                            <a href="https://vimeo.com/channels/staffpicks/93951774" class="play-button popup-vimeo">
                                <span class="ion-md-play"></span>
                            </a>
                        </figure>
                    </div>
                </div>

                <div class="col-md-1">

                </div>

                <div class="col-md-5">
                    <div class="site-section-heading pt-3 mb-4">
                        <h2 class="text-black">How JSP Ecom Started</h2>
                    </div>
                        <p>
                            JSP Ecom was built as a practical JSP/Servlet storefront for learning how a real e-commerce
                            flow works end to end. The project covers browsing, product detail pages, carts, checkout,
                            and order history in one connected application.
                        </p>
                        <p>
                            The goal of this redesign is to make the storefront feel editorial and modern while keeping
                            the Java backend, JDBC data flow, and Tomcat deployment model simple and readable.
                        </p>

                </div>
            </div>
        </div>
    </div>

    <div class="site-section border-bottom" data-aos="fade">
        <div class="container">
            <div class="row justify-content-center mb-5">
                <div class="col-md-7 site-section-heading text-center pt-4">
                    <h2>The Team</h2>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 col-lg-3">

                    <div class="block-38 text-center">
                        <div class="block-38-img">
                            <div class="block-38-header">
                                <img src="static/images/person_1.jpg" alt="Image placeholder" class="mb-4">
                                <h3 class="block-38-heading h4">Frontend Experience</h3>
                                <p class="block-38-subheading">Visual identity</p>
                            </div>
                            <div class="block-38-body">
                                <p>Handles the visual language, hero sections, product cards, and responsive layout used
                                    across the storefront.</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3">
                    <div class="block-38 text-center">
                        <div class="block-38-img">
                            <div class="block-38-header">
                                <img src="static/images/person_2.jpg" alt="Image placeholder" class="mb-4">
                                <h3 class="block-38-heading h4">Catalog Layer</h3>
                                <p class="block-38-subheading">Products and categories</p>
                            </div>
                            <div class="block-38-body">
                                <p>Keeps product browsing, search, and category collections aligned with the database-backed
                                    listing pages.</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3">
                    <div class="block-38 text-center">
                        <div class="block-38-img">
                            <div class="block-38-header">
                                <img src="static/images/person_3.jpg" alt="Image placeholder" class="mb-4">
                                <h3 class="block-38-heading h4">Cart Logic</h3>
                                <p class="block-38-subheading">Session management</p>
                            </div>
                            <div class="block-38-body">
                                <p>Manages product quantity, cart totals, checkout flow, and the final order confirmation path.</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3">
                    <div class="block-38 text-center">
                        <div class="block-38-img">
                            <div class="block-38-header">
                                <img src="static/images/person_4.jpg" alt="Image placeholder" class="mb-4">
                                <h3 class="block-38-heading h4">Deployment Flow</h3>
                                <p class="block-38-subheading">Tomcat and WAR packaging</p>
                            </div>
                            <div class="block-38-body">
                                <p>Packages the application into a WAR, clears stale deployments, and starts Tomcat with the latest UI.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="site-section site-section-sm site-blocks-1 border-0" data-aos="fade">
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-lg-4 d-lg-flex mb-4 mb-lg-0 pl-4" data-aos="fade-up" data-aos-delay="">
                    <div class="icon mr-4 align-self-start">
                        <span class="icon-truck"></span>
                    </div>
                    <div class="text">
                        <h2 class="text-uppercase">Fast delivery</h2>
                        <p>Delivery messaging is kept clear and premium so the storefront feels trustworthy from the first screen.</p>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4 d-lg-flex mb-4 mb-lg-0 pl-4" data-aos="fade-up" data-aos-delay="100">
                    <div class="icon mr-4 align-self-start">
                        <span class="icon-refresh2"></span>
                    </div>
                    <div class="text">
                        <h2 class="text-uppercase">Easy returns</h2>
                        <p>Shopping flows are arranged to reduce friction and make browsing, cart review, and checkout simple.</p>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4 d-lg-flex mb-4 mb-lg-0 pl-4" data-aos="fade-up" data-aos-delay="200">
                    <div class="icon mr-4 align-self-start">
                        <span class="icon-help"></span>
                    </div>
                    <div class="text">
                        <h2 class="text-uppercase">Human support</h2>
                        <p>Support messaging stays clear and direct, matching the cleaner visual system used across the app.</p>
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