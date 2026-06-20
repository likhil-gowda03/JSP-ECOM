<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<footer class="site-footer border-top">
    <div class="container">
        <div class="footer-shell">
            <div class="footer-brand">
                <div class="footer-brand__mark">JSP Ecom</div>
                <h3 class="footer-heading mb-4">Fan merch store</h3>
                <p>
                    Premium fan gear for Royal Challengers IPL and Red Bull Racing, laid out with a polished,
                    SaaS-style merchandising experience.
                </p>

                <div class="chip-row chip-row--dark">
                    <span class="chip chip--dark">Limited offers</span>
                    <span class="chip chip--dark">RCB drops</span>
                    <span class="chip chip--dark">Red Bull Racing</span>
                </div>
            </div>

            <div class="footer-links">
                <h3 class="footer-heading mb-4">Shop</h3>
                <ul class="list-unstyled">
                    <li><a href="${pageContext.request.contextPath}/shop">All merch</a></li>
                    <li><a href="${pageContext.request.contextPath}/shop">RCB jersey drops</a></li>
                    <li><a href="${pageContext.request.contextPath}/shop">Red Bull racing capsule</a></li>
                    <li><a href="${pageContext.request.contextPath}/order-history">Order history</a></li>
                </ul>
            </div>

            <div class="footer-promo">
                <a href="${pageContext.request.contextPath}/shop" class="footer-drop-card">
                    <img src="${pageContext.request.contextPath}/static/images/puma-rcb-jersey.png?v=20260506"
                         alt="Royal Challengers merchandise">
                    <div class="footer-drop-card__eyebrow">Royal Challengers</div>
                    <h4>Match-day merch</h4>
                    <p>Jerseys, caps, and fan-ready bundles.</p>
                </a>

                <a href="${pageContext.request.contextPath}/shop" class="footer-drop-card footer-drop-card--dark">
                    <img src="${pageContext.request.contextPath}/static/images/red-bull-racing-capsule.svg?v=20260506"
                         alt="Red Bull Racing merchandise">
                    <div class="footer-drop-card__eyebrow">Red Bull Racing</div>
                    <h4>Race-week merch</h4>
                    <p>Premium fan gear with a paddock edge.</p>
                </a>
            </div>

            <div class="footer-contact">
                <div class="block-5 mb-5">
                    <h3 class="footer-heading mb-4">Contact Info</h3>
                    <ul class="list-unstyled">
                        <li class="address">203 Fake St. Mountain View, San Francisco, California, USA</li>
                        <li class="phone"><a href="tel://23923929210">+2 392 3929 210</a></li>
                        <li class="email">emailaddress@domain.com</li>
                    </ul>
                </div>

                <div class="block-7">
                    <form action="#" method="post">
                        <label for="email_subscribe" class="footer-heading">Subscribe</label>
                        <div class="form-group">
                            <input type="text" class="form-control py-4" id="email_subscribe" placeholder="Email">
                            <input type="submit" class="btn btn-sm btn-primary" value="Send">
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <div class="footer-bottom">
            <p>
                Copyright &copy;<script>document.write(new Date().getFullYear());</script>
                JSP Ecom. All rights reserved.
            </p>
            <p class="footer-credit">
                Template base by <a href="https://colorlib.com" target="_blank" rel="noreferrer">Colorlib</a>.
                Refreshed for the RCB and Red Bull Racing fan store.
            </p>
        </div>
    </div>
</footer>
