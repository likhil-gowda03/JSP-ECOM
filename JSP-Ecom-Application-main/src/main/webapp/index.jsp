<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); %>

<!DOCTYPE html>
<html lang="en">
<jsp:include page="templates/head.jsp"/>

<body>
<div class="site-wrap">
    <jsp:include page="templates/header.jsp"/>

    <section class="hero-split hero-split--merch" data-aos="fade">
        <div class="hero-grid">
            <div class="hero-copy">
                <div class="hero-kicker">Fan drops / limited offers</div>
                <h1 class="hero-title">Royal Challengers Bangalore merch, curated like a premium launch.</h1>
                <p>
                    A merch-first storefront for RCB fans. Shop jerseys, caps,
                    hoodies, and match-day essentials with a polished, premium home experience.
                </p>

                <div class="hero-offer-strip">
                    <span class="offer-chip offer-chip--accent">RCB matchday capsule</span>
                    <span class="offer-chip">Limited offers</span>
                </div>

                <div class="hero-actions">
                    <a href="#merch-capsules" class="btn btn-primary">Explore merch</a>
                    <a href="${pageContext.request.contextPath}/shop" class="btn btn-outline-primary">Open shop</a>
                </div>

                <div class="hero-stat-grid">
                    <div class="stat-card">
                        <strong>02</strong>
                        <span>Fan capsules</span>
                    </div>
                    <div class="stat-card">
                        <strong>24h</strong>
                        <span>Drop-ready ordering</span>
                    </div>
                    <div class="stat-card">
                        <strong>Pro</strong>
                        <span>SaaS-style layout</span>
                    </div>
                </div>
            </div>

            <div class="hero-panel">
                <div class="hero-stack hero-stack--single">
                    <div class="hero-card hero-card--primary">
                        <div class="hero-badge">RCB spotlight</div>
                        <img src="${pageContext.request.contextPath}/static/images/puma-rcb-jersey.png?v=20260506"
                             alt="Royal Challengers merchandise spotlight">
                    </div>
                </div>
            </div>
        </div>
    </section>

    <div class="site-section site-section-sm site-blocks-1">
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-lg-4 d-lg-flex mb-4 mb-lg-0 pl-4" data-aos="fade-up" data-aos-delay="">
                    <div class="icon mr-4 align-self-start">
                        <span class="icon-truck"></span>
                    </div>

                    <div class="text">
                        <h2 class="text-uppercase">Fast delivery</h2>
                        <p>Streamlined delivery experience with a storefront that feels premium from the first click.</p>
                    </div>
                </div>

                <div class="col-md-6 col-lg-4 d-lg-flex mb-4 mb-lg-0 pl-4" data-aos="fade-up" data-aos-delay="100">
                    <div class="icon mr-4 align-self-start">
                        <span class="icon-refresh2"></span>
                    </div>
                    <div class="text">
                        <h2 class="text-uppercase">Easy returns</h2>
                        <p>A clear product experience that makes shopping simple, confident, and visually focused.</p>
                    </div>
                </div>

                <div class="col-md-6 col-lg-4 d-lg-flex mb-4 mb-lg-0 pl-4" data-aos="fade-up" data-aos-delay="200">
                    <div class="icon mr-4 align-self-start">
                        <span class="icon-help"></span>
                    </div>
                    <div class="text">
                        <h2 class="text-uppercase">Support that feels human</h2>
                        <p>Helpful, high-trust messaging that matches the new editorial storefront experience.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="templates/collections-section.jsp"/>

    <jsp:include page="templates/featured-products.jsp"/>

    <div class="site-section merch-section" id="merch-capsules">
        <div class="container">
            <div class="row justify-content-center mb-5">
                <div class="col-md-9 site-section-heading text-center pt-4">
                    <div class="section-kicker section-kicker--dark">Merch capsules</div>
                    <h2>Royal Challengers Bangalore</h2>
                    <p class="section-subtitle mx-auto">
                        Curated fan gear with a premium launch feel, built for match day only.
                    </p>
                </div>
            </div>
            <div class="merch-grid merch-grid--single">
                <article class="merch-card merch-card--rcb" data-aos="fade-up">
                    <div class="merch-card__media">
                        <span class="merch-card__tag">IPL fan kit</span>
                        <img src="${pageContext.request.contextPath}/static/images/puma-rcb-jersey.png?v=20260506"
                             alt="Royal Challengers fan merch">
                    </div>
                    <div class="merch-card__body">
                        <div class="merch-card__eyebrow">Royal Challengers Bangalore</div>
                        <h3>RCB match-day merch</h3>
                        <p>
                            Jerseys, caps, and supporter essentials wrapped in a vivid red-and-gold story.
                        </p>
                        <div class="merch-card__meta">Offer ends in: <strong>02:14:08</strong></div>
                        <div class="merch-card__actions">
                            <a href="${pageContext.request.contextPath}/shop" class="btn btn-primary btn-sm">Shop RCB merch</a>
                            <a href="${pageContext.request.contextPath}/shop" class="btn btn-outline-primary btn-sm">See more drops</a>
                        </div>
                    </div>
                </article>
            </div>
        </div>
    </div>

    <jsp:include page="templates/footer.jsp"/>
</div>

<jsp:include page="templates/scripts.jsp"/>
</body>
</html>