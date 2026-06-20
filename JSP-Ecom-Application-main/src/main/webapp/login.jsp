<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<jsp:include page="templates/head.jsp"/>

<body>
<div class="auth-screen">
    <div class="auth-visual">
        <div class="auth-visual-card">
            <img src="${pageContext.request.contextPath}/static/images/puma-rcb-jersey.png?v=20260506" alt="Puma RCB Jersey">
            <div class="auth-visual-copy">
                <div class="auth-kicker">Member access</div>
                <h1 class="auth-title" style="color:#fff !important;">Welcome back.</h1>
                <p class="auth-note" style="color:rgba(255,255,255,0.78); max-width: 460px;">
                    Sign in to continue where you left off, manage your cart, and keep the storefront experience seamless.
                </p>
                <div class="chip-row">
                    <span class="chip">Fast checkout</span>
                    <span class="chip">Saved orders</span>
                    <span class="chip">Profile sync</span>
                </div>
            </div>
        </div>
    </div>
    <div class="auth-shell">
        <div class="auth-panel">
            <div class="auth-brand">JSP Ecom</div>
            <div class="auth-card">
                <div class="auth-kicker" style="color: var(--olive);">Login</div>
                <h2 class="auth-title">Access your account</h2>
                <p class="auth-note">Use your username and password to return to your storefront, orders, and profile.</p>

                <form action="login?status=typed" method="post" class="auth-form">
                    ${alert}

                    <div class="form-group mb-3">
                        <input class="form-control input100" type="text" name="username" placeholder="Username">
                    </div>
                    <div class="form-group mb-3">
                        <input class="form-control input100" type="password" name="password" placeholder="Password">
                    </div>
                    <div class="d-flex justify-content-between align-items-center mb-4 flex-wrap" style="gap: 12px;">
                        <label class="d-flex align-items-center mb-0" style="gap: 8px;">
                            <input type="checkbox" name="remember-me-checkbox">
                            <span class="small text-muted">Remember me</span>
                        </label>
                        <a href="#" class="auth-link">Forgot password?</a>
                    </div>

                    <button type="submit" class="login100-form-btn btn btn-primary w-100">Login</button>
                </form>
                <div class="text-center mt-4">
                    <p class="mb-0 text-muted">
                        Don't have an account?
                        <a href="register.jsp" class="auth-link">Create one</a>
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="templates/scripts.jsp"/>
</body>
</html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>Login</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" type="image/png" href="static/images/logo.png"/>
    <link rel="stylesheet" type="text/css" href="static/vendor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="static/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="static/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
    <link rel="stylesheet" type="text/css" href="static/vendor/animate/animate.css">
    <link rel="stylesheet" type="text/css" href="static/vendor/css-hamburgers/hamburgers.min.css">
    <link rel="stylesheet" type="text/css" href="static/vendor/animsition/css/animsition.min.css">
    <link rel="stylesheet" type="text/css" href="static/vendor/select2/select2.min.css">
    <link rel="stylesheet" type="text/css" href="static/vendor/daterangepicker/daterangepicker.css">
    <link rel="stylesheet" type="text/css" href="static/css/util.css">
    <link rel="stylesheet" type="text/css" href="static/css/main.css">

    <link rel="stylesheet" href="static/css/bootstrap.min.css">
    <link rel="stylesheet" href="static/css/magnific-popup.css">
    <link rel="stylesheet" href="static/css/jquery-ui.css">
    <link rel="stylesheet" href="static/css/owl.carousel.min.css">
    <link rel="stylesheet" href="static/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="static/css/aos.css">
    <link rel="stylesheet" href="static/css/style.css">
</head>

<body>
<div class="limiter">
    <div class="container-login100">
        <div class="shadow-lg p-2 p-lg-5 rounded" data-aos="fade-up">
            <div class="wrap-login100 p-t-50 p-b-90">
                <form action="login?status=typed" method="post" class="login100-form validate-form flex-sb flex-w">
                    <span class="login100-form-title p-b-51">
                        Login
                    </span>

                    ${alert}

                    <div class="wrap-input100 validate-input m-b-16" data-validate="Username is required">
                        <input class="input100" type="text" name="username" placeholder="Username">
                    </div>

                    <div class="wrap-input100 validate-input m-b-16" data-validate="Password is required">
                        <input class="input100" type="password" name="password" placeholder="Password">
                    </div>

                    <div class="flex-sb-m w-full p-t-3 p-b-24">
                        <div class="contact100-form-checkbox">
                            <input class="input-checkbox100" id="ckb1" type="checkbox" name="remember-me-checkbox">
                            <label class="label-checkbox100" for="ckb1">
                                Remember me
                            </label>
                        </div>

                        <div>
                            <a href="#" class="txt1">
                                Forgot?
                            </a>
                        </div>
                    </div>

                    <div class="container-login100-form-btn m-t-17">
                        <button type="submit" class="login100-form-btn">
                            Login
                        </button>
                    </div>
                </form>
            </div>

            <div class="text-center">
                <p class="txt1" style="color: #999999">
                    Don't have an account?
                    <a href="register.jsp" class="txt1">
                        Create here
                    </a>
                </p>
            </div>
        </div>
    </div>
</div>

<div id="dropDownSelect1"></div>

<script src="static/vendor/jquery/jquery-3.2.1.min.js"></script>
<script src="static/vendor/animsition/js/animsition.min.js"></script>
<script src="static/vendor/bootstrap/js/popper.js"></script>
<script src="static/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="static/vendor/select2/select2.min.js"></script>
<script src="static/vendor/daterangepicker/moment.min.js"></script>
<script src="static/vendor/daterangepicker/daterangepicker.js"></script>
<script src="static/vendor/countdowntime/countdowntime.js"></script>

<script src="static/js/jquery-3.3.1.min.js"></script>
<script src="static/js/jquery-ui.js"></script>
<script src="static/js/popper.min.js"></script>
<script src="static/js/bootstrap.min.js"></script>
<script src="static/js/owl.carousel.min.js"></script>
<script src="static/js/jquery.magnific-popup.min.js"></script>
<script src="static/js/aos.js"></script>
<script src="static/js/main.js"></script>
</body>
</html>
