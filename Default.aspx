<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <%-- Ẩn thanh url--%>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
    <meta name="format-detection" content="telephone=no" />
    <meta name="full-screen" content="yes" />
    <meta name="x5-full-screen" content="true" />
    <meta name="360-full-screen" content="true" />
    <meta name="mobile-web-app-capable" content="yes" />
    <meta name="keywords" content="Hệ thống Việt Nhật" />
    <meta name="description" content="Hệ thống Việt Nhật" />
    <link rel="apple-touch-icon" href="/images/icon-mobile-logo.png" />
    <link rel="shortcut icon" href="/images/icon-mobile-logo.ico" />
    <link rel="icon" href="/images/icon-mobile-logo.png" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="/css/books/globalBooks.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <title>Tiểu học</title>
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
</head>

<body class="body-mobi">
    <form id="form1" runat="server">
        <div class="header-top">
            <h5>Môn Học</h5>
        </div>
        <div class="page-view">
            <div class="container-fuild">
                <div class="block-book">
                    <div class="books-list">
                      
                        <div class="book-item">
                            <a href="/danh-muc-sach-1" class="book-card" style="text-decoration: none;">
                                <div class="book-card__cover">
                                    <div class="book-card__book">
                                        <div class="book-card__book-front">
                                            <img class="book-card__img" src="imageGame/Sach/TiengViet_1/Tieng-Viet.png" />
                                        </div>
                                        <div class="book-card__book-back"></div>
                                        <div class="book-card__book-side"></div>
                                    </div>
                                </div>
                                <div>
                                    <div class="book-card__title">
                                        Tiếng Việt 1 Tập 1
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="book-item">
                            <a href="/danh-muc-sach-2" class="book-card" style="text-decoration: none;">
                                <div class="book-card__cover">
                                    <div class="book-card__book">
                                        <div class="book-card__book-front">
                                            <img class="book-card__img" src="imageGame/Sach/Toan_1/Toan.png" />
                                        </div>
                                        <div class="book-card__book-back"></div>
                                        <div class="book-card__book-side"></div>
                                    </div>
                                </div>
                                <div>
                                    <div class="book-card__title">
                                        Toán 1 Tập 1
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="book-item">
                            <a href="/sach-tieng-viet-hai-3" class="book-card" style="text-decoration: none;">
                                <div class="book-card__cover">
                                    <div class="book-card__book">
                                        <div class="book-card__book-front">
                                            <img class="book-card__img" src="imageGame/Sach/TiengViet_2/Tieng-Viet.png" />
                                        </div>
                                        <div class="book-card__book-back"></div>
                                        <div class="book-card__book-side"></div>
                                    </div>
                                </div>
                                <div>
                                    <div class="book-card__title">
                                        Tiếng Việt 1 Tập 2
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="book-item">
                            <a href="/danh-muc-sach-4" class="book-card" style="text-decoration: none;">
                                <div class="book-card__cover">
                                    <div class="book-card__book">
                                        <div class="book-card__book-front">
                                            <img class="book-card__img" src="imageGame/Sach/Toan_2/Toan.png" />
                                        </div>
                                        <div class="book-card__book-back"></div>
                                        <div class="book-card__book-side"></div>
                                    </div>
                                </div>
                                <div>
                                    <div class="book-card__title">
                                        Toán 1 Tập 2
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="book-item">
                            <a href="/sach-tieng-viet-hai-6" class="book-card" style="text-decoration: none;">
                                <div class="book-card__cover">
                                    <div class="book-card__book">
                                        <div class="book-card__book-front">
                                            <img class="book-card__img" src="imageGame/SachKhoi_2/TiengViet_1/TiengViet_1.png" />
                                        </div>
                                        <div class="book-card__book-back"></div>
                                        <div class="book-card__book-side"></div>
                                    </div>
                                </div>
                                <div>
                                    <div class="book-card__title">
                                        Tiếng Việt 2 Tập 1
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="book-item">
                            <a href="/sach-khoi-hai-7" class="book-card" style="text-decoration: none;">
                                <div class="book-card__cover">
                                    <div class="book-card__book">
                                        <div class="book-card__book-front">
                                            <img class="book-card__img" src="imageGame/SachKhoi_2/Toan_1/Toan_1.png" />
                                        </div>
                                        <div class="book-card__book-back"></div>
                                        <div class="book-card__book-side"></div>
                                    </div>
                                </div>
                                <div>
                                    <div class="book-card__title">
                                        Toán 2 Tập 1
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="book-item">
                            <a href="/sach-tieng-viet-hai-8" class="book-card" style="text-decoration: none;">
                                <div class="book-card__cover">
                                    <div class="book-card__book">
                                        <div class="book-card__book-front">
                                            <img class="book-card__img" src="imageGame/SachKhoi_2/TiengViet_2/TiengViet_2.png" />
                                        </div>
                                        <div class="book-card__book-back"></div>
                                        <div class="book-card__book-side"></div>
                                    </div>
                                </div>
                                <div>
                                    <div class="book-card__title">
                                        Tiếng Việt 2 Tập 2
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="book-item">
                            <a href="/sach-khoi-hai-9" class="book-card" style="text-decoration: none;">
                                <div class="book-card__cover">
                                    <div class="book-card__book">
                                        <div class="book-card__book-front">
                                            <img class="book-card__img" src="imageGame/SachKhoi_2/Toan_2/Toan_2.png" />
                                        </div>
                                        <div class="book-card__book-back"></div>
                                        <div class="book-card__book-side"></div>
                                    </div>
                                </div>
                                <div>
                                    <div class="book-card__title">
                                        Toán 2 Tập 2
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="book-item">
                            <a href="/sach-khoi-hai-11" class="book-card" style="text-decoration: none;">
                                <div class="book-card__cover">
                                    <div class="book-card__book">
                                        <div class="book-card__book-front">
                                            <img class="book-card__img" src="imageGame/SachKhoi_3/Toan_1/Toan-3-tap-1.png" />
                                        </div>
                                        <div class="book-card__book-back"></div>
                                        <div class="book-card__book-side"></div>
                                    </div>
                                </div>
                                <div>
                                    <div class="book-card__title">
                                        Toán 3 Tập 1
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <%--<div class="math-triangle">

        <div class="col-item">
            <div class="math-triangle-item">
                <div class="square top">1</div>
                <div class="square left">2</div>
                <div class="square right"></div>
            </div>
        </div>
        <div class="col-item">

            <div class="math-triangle-item">
                <div class="square top">3</div>
                <div class="square left">44</div>
                <div class="square right"></div>
            </div>
        </div>
        <div class="col-item">
            <div class="math-triangle-item">
                <div class="square top">55</div>
                <div class="square left">10</div>
                <div class="square right"></div>
            </div>
        </div>
        <div class="col-item">
            <div class="math-triangle-item">
                <div class="square top"></div>
                <div class="square left">20</div>
                <div class="square right">32</div>
            </div>

        </div>
        <div class="col-item">
            <div class="math-triangle-item">
                <div class="square top"></div>
                <div class="square left">20</div>
                <div class="square right">32</div>
            </div>

        </div>
    </div>--%>
</body>
</html>
