{*<!--
/*********************************************************************************
** The contents of this file are subject to the vtiger CRM Public License Version 1.0
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is:  vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
*
 ********************************************************************************/
-->*}
{strip}
<!DOCTYPE html>
<html>
    <head>
        <title>Login | Нэвтрэх</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- for Login page we are added -->
        <link href="libraries/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="libraries/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
        <link href="libraries/bootstrap/css/jqueryBxslider.css" rel="stylesheet" />
        <script src="libraries/jquery/jquery.min.js"></script>
        <script src="libraries/jquery/boxslider/jqueryBxslider.js"></script>
        <script src="libraries/jquery/boxslider/respond.min.js"></script>
        <script>
            jQuery(document).ready(function(){
                scrollx = jQuery(window).outerWidth();
                window.scrollTo(scrollx,0);
                slider = jQuery('.bxslider').bxSlider({
                    auto: true,
                    pause: 4000,
                    randomStart: true,
                    autoHover: true
                });
                jQuery('.bx-prev, .bx-next, .bx-pager-item').live('click', function(){
                    slider.startAuto();
                });
            });
        </script>
    </head>
    <body>
        <div class="container-fluid login-container">
            <div class="row-fluid">
                <div class="span2">
                    <div class="logo">
                        <img src="layouts/vlayout/skins/images/logo1.png">
                        <br />
                    </div>
                </div>
            </div>
            <div class="row-fluid">
                <div class="span12">
                    <div class="content-wrapper">
                        <div class="container-fluid">
                            <div class="row-fluid">
                                <div class="span6">
                              
                                </div>
                                <div class="span6">
                                    <div class="login-area">
                                        <div class="login-box" id="loginDiv">
                                            <div class="">
                                                <h3 class="login-header">Нэвтрэх</h3>
                                            </div>
                                            <form class="form-horizontal login-form" style="margin:0;" action="index.php?module=Users&action=Login" method="POST">
                                                {if isset($smarty.request.error)}
                                                    <div class="alert alert-error">
                                                        <p>Нууц үг буруу байна.</p>
                                                    </div>
                                                {/if}
                                                {if isset($smarty.request.fpError)}
                                                    <div class="alert alert-error">
                                                        <p>Цахим шуудан эсвэл хэрэглэгчийн нэр буруу байна.</p>
                                                    </div>
                                                {/if}
                                                {if isset($smarty.request.status)}
                                                    <div class="alert alert-success">
                                                        <p>Таны цахим шууданд нууц үгийг илгээлээ..</p>
                                                    </div>
                                                {/if}
                                                {if isset($smarty.request.statusError)}
                                                    <div class="alert alert-error">
                                                        <p>Мэйл серверт алдаа гарлаа.</p>
                                                    </div>
                                                {/if}
                                                <div class="control-group">
                                                 <label class="control-label" for="user_name"><b>Нэвтрэх нэр</b></label>
                                                    <div class="controls">
                                                        <input type="text" id="username" name="username" placeholder="User name">
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label class="control-label" for="user_name"><b>Нууц үг</b></label>
                                                    <div class="controls">
                                                        <input type="password" id="password" name="password" placeholder="*********">
                                                    </div>
                                                </div>
                                                <div class="control-group signin-button">
                                                    <div class="controls" id="forgotPassword">
                                                        <button type="submit" class="btn btn-primary sbutton">Нэвтэр</button>
                                                        &nbsp;&nbsp;&nbsp;<a>Нууц үгээ мартсан уу ?</a>
                                                    </div>
                                                </div>
                                            </form>
                                            <div class="login-subscript">
                                                <small> Алхимич Платформ 1.8.1</small>
                                            </div>
                                        </div> <!-- /#loginDiv -->
                                        <div class="login-box hide" id="forgotPasswordDiv">
                                            <form class="form-horizontal login-form" style="margin:0;" action="forgotPassword.php" method="POST">
                                                <div class="">
                                                    <h3 class="login-header">Нууц үг сэргээх</h3>
                                                </div>
                                                <div class="control-group">
                                                    <label class="control-label" for="user_name"><b>Нэвтрэх нэр</b></label>
                                                    <div class="controls">
                                                        <input type="text" id="user_name" name="user_name" placeholder="Username">
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label class="control-label" for="email"><b>Цахим шуудан</b></label>
                                                    <div class="controls">
                                                        <input type="text" id="emailId" name="emailId" placeholder="Email">
                                                    </div>
                                                </div>
                                                <div class="control-group signin-button">
                                                    <div class="controls" id="backButton">
                                                        <input type="submit" class="btn btn-primary sbutton" value="Илгээх" name="retrievePassword">
                                                        &nbsp;&nbsp;&nbsp;<a>Буцах</a>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="navbar navbar-fixed-bottom">
            <div class="navbar-inner">
                <div class="container-fluid">
                    <div class="row-fluid">
                        <div class="span6 pull-center">
                            <div class="footer-content">
                                <small>&#169 2014-{date('Y')}&nbsp;
                                    <a href="https://www.alchemist.mn"> Alchemist </a> |
                                    <a href="https://www.alchemist.mn/products/platform/privacy_policy.html"> Privacy Policy</a>
                                </small>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <script>
        jQuery(document).ready(function(){
            jQuery("#forgotPassword a").click(function() {
                jQuery("#loginDiv").hide();
                jQuery("#forgotPasswordDiv").show();
            });
            jQuery("#backButton a").click(function() {
                jQuery("#loginDiv").show();
                jQuery("#forgotPasswordDiv").hide();
            });
            jQuery("input[name='retrievePassword']").click(function (){
                var username = jQuery('#user_name').val();
                var email = jQuery('#emailId').val();
                var email1 = email.replace(/^\s+/,'').replace(/\s+$/,'');
                var emailFilter = /^[^@]+@[^@.]+\.[^@]*\w\w$/;
                var illegalChars = /[\(\)\<\>\,\;\:\\\"\[\]]/;
                if(username == ''){
                    alert('Please enter valid username');
                    return false;
                } else if(!emailFilter.test(email1) || email == ''){
                    alert('Please enater valid email address');
                    return false;
                } else if(email.match(illegalChars)){
                    alert("The email address contains illegal characters.");
                    return false;
                } else {
                    return true;
                }
            });
        });
    </script>
</html>
{/strip}
