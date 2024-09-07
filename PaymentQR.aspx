<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PaymentQR.aspx.cs" Inherits="PaymentQR" %>

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
    <title>Thanh toán</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="/css/books/globalBooks.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
        .cash-list {
            display: flex;
            flex-wrap: wrap;
        }

            .cash-list .cash-item {
                width: calc(25% - 1rem);
                margin: .5rem;
                padding: .5rem;
            }

        .cash-item {
            text-align: center;
            border-width: 4px;
            border-style: solid;
            border-color: rgb(0 0 0 / 20%);
            border-radius: .75rem;
            cursor: pointer;
            -webkit-transition: all .4s ease;
            transition: all .4s ease;
        }

            .cash-item:hover, .cash-item.active {
                border-color: #b51a1a;
                background-color: rgb(255 0 0 / 10%);
            }

                .cash-item:hover .cash-item__number, .cash-item.active .cash-item__number {
                    color: #b51a1a;
                }

                .cash-item:hover .cash-item__icon img, .cash-item.active .cash-item__icon img {
                    opacity: 1;
                }

            .cash-item .cash-item__icon img {
                width: 100%;
                height: 80px;
                object-fit: contain;
                object-position: center;
                opacity: .8;
                -webkit-transition: all .4s ease;
                transition: all .4s ease;
            }

            .cash-item .cash-item__number {
                font-size: 1.25rem;
                font-weight: 700;
                -webkit-transition: all .4s ease;
                transition: all .4s ease;
            }

        .btn-payment {
            display: inline-block;
            padding: .75rem 1.25rem;
            background-color: #b51a1a;
            color: #fff;
            text-decoration: none;
            border-radius: .25rem;
            font-size: 1rem;
        }

            .btn-payment:hover, .btn-payment:active {
                background-color: #da4e4e;
            }
    </style>
</head>
<body class="body-mobi">
    <form id="form1" runat="server">
        <div class="header-top">
            <h5>Thanh toán</h5>
        </div>
        <div class="page-view">
            <div class="container-fluid">
               
                <p class="mt-2 mb-3"><b><i class="fa fa-home" aria-hidden="true"></i>&nbsp;Cửa hàng:</b>&nbsp;<span>Việt Nhật Shop</span></p>
                <p><b>Chọn thanh toán:</b></p>
                <div class="cash-list">
                    <div class="cash-item">
                        <div class="cash-item__icon">
                            <img src="/images/icon-cash-2.png" alt="Alternate Text" />
                        </div>
                        <div class="cash-item__number">50.000 đ</div>
                    </div>
                    <div class="cash-item">
                        <div class="cash-item__icon">
                            <img src="/images/icon-cash-2.png" alt="Alternate Text" />
                        </div>
                        <div class="cash-item__number">100.000 đ</div>
                    </div>
                    <div class="cash-item">
                        <div class="cash-item__icon">
                            <img src="/images/icon-cash-2.png" alt="Alternate Text" />
                        </div>
                        <div class="cash-item__number">150.000 đ</div>
                    </div>
                    <div class="cash-item">
                        <div class="cash-item__icon">
                            <img src="/images/icon-cash-2.png" alt="Alternate Text" />
                        </div>
                        <div class="cash-item__number">200.000 đ</div>
                    </div>
                    <div class="cash-item">
                        <div class="cash-item__icon">
                            <img src="/images/icon-cash-2.png" alt="Alternate Text" />
                        </div>
                        <div class="cash-item__number">250.000 đ</div>
                    </div>
                    <div class="cash-item">
                        <div class="cash-item__icon">
                            <img src="/images/icon-cash-2.png" alt="Alternate Text" />
                        </div>
                        <div class="cash-item__number">300.000 đ</div>
                    </div>
                    <div class="cash-item">
                        <div class="cash-item__icon">
                            <img src="/images/icon-cash-2.png" alt="Alternate Text" />
                        </div>
                        <div class="cash-item__number">350.000 đ</div>
                    </div>

                </div>
                <div class="mt-5 text-center"><a href="javascript:void(0)" class="btn btn-payment">Thanh toán ngay</a></div>
            </div>
        </div>
    </form>
    <script>jQuery('.cash-item').click(function () {
            jQuery('.cash-item').removeClass('active');
            jQuery(this).addClass('active');
        })</script>
</body>
</html>
