<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DanhMucTieuHoc.aspx.cs" Inherits="DanhMucTieuHoc" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <%-- Ẩn thanh url--%>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
    <meta name="format-detection" content="telephone=no" />
    <meta name="full-screen" content="yes" />
    <meta name="x5-full-screen" content="true" />
    <meta name="360-full-screen" content="true" />
    <meta name="mobile-web-app-capable" content="yes" />
    <title></title>
    <link href="css/owl.carousel.min.css" rel="stylesheet" />
    <link href="css/owl.theme.default.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="/css/books/globalBooks.css" rel="stylesheet" />
    <%--<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>--%>

    <link rel="stylesheet" href="/css/bootstrap4.6.2.css">
    <script src="/js/bootstrap462/jquery.slim.min.js" ></script>
    <script src="/js/bootstrap462/bootstrap.bundle.min.js" ></script>

    <script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ" crossorigin="anonymous"></script>
    <script src="/js/owl.carousel.min.js"></script>
    <script src="/js/current-device.min.js"></script>
    <script type="text/javascript">
        window.ladi_viewport = function () {
            var width =
                window.outerWidth > 0 ? window.outerWidth : window.screen.width;
            var widthDevice = width;
            var is_desktop = width >= 768;
            var content = "";
            if (
                typeof window.ladi_is_desktop == "undefined" ||
                window.ladi_is_desktop == undefined
            ) {
                window.ladi_is_desktop = is_desktop;
            }
            if (!is_desktop) {
                widthDevice = 520;
            } else {
                widthDevice = "device-width";
                //widthDevice = 960;
            }
            content = "width=" + widthDevice + ", user-scalable=no";
            var scale = 1;
            if (
                !is_desktop &&
                widthDevice != window.screen.width &&
                window.screen.width > 0
            ) {
                scale = window.screen.width / widthDevice;
            }
            if (scale != 1) {
                content +=
                    ", initial-scale=" +
                    scale +
                    ", minimum-scale=" +
                    scale +
                    ", maximum-scale=" +
                    scale;
            }
            var docViewport = document.getElementById("viewport");
            if (!docViewport) {
                docViewport = document.createElement("meta");
                docViewport.setAttribute("id", "viewport");
                docViewport.setAttribute("name", "viewport");
                document.head.appendChild(docViewport);
            }
            docViewport.setAttribute("content", content);
        };
        window.ladi_viewport();

    </script>
    <style>
        
    </style>
</head>
<body class="body-mobi">
    <form id="form1" runat="server">
        <div class="catelogy-tieuhoc">
            <div class="box-header">
                <div class="box-header__login">
                    <a class="btn btn-login" data-toggle="modal" data-target="#modalLogin" href="javascript:void(0)">Đăng nhập</a>
                    <img class="box-header__login--avatar" src="/images/user_noimage.jpg" alt="Alternate Text" />
                </div>
                <div class="box-header__time"><a class="btn btn-link" data-toggle="modal" data-target="#modalAchievements" href="javascript:void(0)">30:30</a></div>
                <div class="box-header__star">
                    <img class="box-header__star--img" src="/images/icon-star.png" alt="Alternate Text" />
                    <div class="box-header__star--number">10</div>
                </div>
            </div>
            <a href="javascript:void(0)" class="btn-position btn-config" data-toggle="modal" data-target="#modalConfig">
                <img src="/images/icon-config.png" alt="Alternate Text" />

            </a>
            <div class="block-slide-cate">
                <div id="slide-cate" class="owl-carousel owl-theme">
                    <div class="item">
                        <a href="javascript:void(0)" class="cate-item-slide select">
                            <div class="cate-item-slide__star">
                                <img src="/images/anhgif/1sao.png" />
                            </div>
                            <div class="cate-item-slide__text">Bài 1</div>
                        </a>
                    </div>
                    <div class="item">
                        <a href="javascript:void(0)" class="cate-item-slide select">
                            <div class="cate-item-slide__star">
                                <img src="/images/anhgif/1sao.png" />
                            </div>
                            <div class="cate-item-slide__text">Bài 1</div>
                        </a>
                    </div>
                    <div class="item">
                        <a href="javascript:void(0)" class="cate-item-slide select">
                            <div class="cate-item-slide__star">
                                <img src="/images/anhgif/1sao.png" />
                            </div>
                            <div class="cate-item-slide__text">Bài 1</div>
                        </a>
                    </div>
                    <div class="item">
                        <a href="javascript:void(0)" class="cate-item-slide select">
                            <div class="cate-item-slide__star">
                                <img src="/images/anhgif/1sao.png" />
                            </div>
                            <div class="cate-item-slide__text">Bài 1</div>
                        </a>
                    </div>
                    <div class="item">
                        <a href="javascript:void(0)" class="cate-item-slide select">
                            <div class="cate-item-slide__star">
                                <img src="/images/anhgif/1sao.png" />
                            </div>
                            <div class="cate-item-slide__text">Bài 1</div>
                        </a>
                    </div>
                    <div class="item">
                        <a href="javascript:void(0)" class="cate-item-slide select">
                            <div class="cate-item-slide__star">
                                <img src="/images/anhgif/1sao.png" />
                            </div>
                            <div class="cate-item-slide__text">Bài 1</div>
                        </a>
                    </div>
                    <div class="item">
                        <a href="javascript:void(0)" class="cate-item-slide disable">
                            <div class="cate-item-slide__star">
                                <img src="/images/anhgif/1sao.png" />
                            </div>
                            <div class="cate-item-slide__text">Bài 1</div>
                        </a>
                    </div>
                    <div class="item">
                        <a href="javascript:void(0)" class="cate-item-slide disable">
                            <div class="cate-item-slide__star">
                                <img src="/images/anhgif/1sao.png" />
                            </div>
                            <div class="cate-item-slide__text">Bài 1</div>
                        </a>
                    </div>
                    <div class="item">
                        <a href="javascript:void(0)" class="cate-item-slide disable">
                            <div class="cate-item-slide__star">
                                <img src="/images/anhgif/1sao.png" />
                            </div>
                            <div class="cate-item-slide__text">Bài 1</div>
                        </a>
                    </div>
                    <div class="item">
                        <a href="javascript:void(0)" class="cate-item-slide disable">
                            <div class="cate-item-slide__star">
                                <img src="/images/anhgif/1sao.png" />
                            </div>
                            <div class="cate-item-slide__text">Bài 1</div>
                        </a>
                    </div>

                </div>
            </div>
        </div>
        <div class="modal fade" id="modalConfig" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="">Cấu hình</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <div class="form-group">
                            <div class="custom-control custom-switch">
                                <input type="checkbox" class="custom-control-input" id="cbAmThanh" />
                                <label class="custom-control-label" for="cbAmThanh">Âm thanh</label>
                            </div>

                        </div>
                        <div class="mt-4 mb-2 text-center"><a href="javascript:void(0)" class="btn btn-outline-primary">Chia sẽ link</a></div>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary">Lưu</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="modalLogin" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label>Tài khoản</label><input type="text" class="form-control" name="name" value="" />
                        </div>
                        <div class="form-group">
                            <label>Mật khẩu</label><input type="password" class="form-control" name="name" value="" />
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary">Đăng nhập</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="modalAchievements" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="">Thành tích đạt được</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label>Bài 1</label>
                            <img src="/images/anhgif/1sao.png" />
                        </div>
                        <div class="form-group">
                            <label>Bài 2</label>
                            <img src="/images/anhgif/2sao.png" />
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <script>
            jQuery('#slide-cate').owlCarousel({
                loop: false,
                dots: false,
                rewind: true,
                margin: 20,
                autoWidth: true,

            });
        </script>
    </form>
</body>
</html>
