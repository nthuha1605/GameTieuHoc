<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_MasterPage.master" AutoEventWireup="true" CodeFile="Admin_Default.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headlink" runat="Server">
    <link href="/css/the.css" rel="stylesheet" />
    <link href="/css/owl.carousel.min.css" rel="stylesheet" />
    <link href="/css/owl.theme.default.min.css" rel="stylesheet" />
    <link href="admin_css/app-quan-tri.css" rel="stylesheet" />
    <link href="admin_css/ribon.css" rel="stylesheet" />
    <link href="admin_css/admin_style.css" rel="stylesheet" />
    <script src="js/jquery.min.js"></script>
    <script src="js/owl.carousel.min.js" defer></script>
    <script>
        function myDuyet(id) {
            document.getElementById("<%=txtThongBao_id.ClientID%>").value = id
            document.getElementById("<%=btnXem.ClientID%>").click();
        }
        function hiddenThanhVien() {
            document.getElementById("div_ThanhVien").style.display = "none";
        }
    </script>
    <script> 
        $(document).ready(function () {
            $('.owl-carousel').owlCarousel({
                responsive: {
                    0: {
                        items: 1,
                    },
                    600: {
                        items: 2,
                    },
                    800: {
                        items: 2,
                    },
                    900: {
                        items: 2,
                    },
                    1000: {
                        items: 2,
                    },
                    1200: {
                        items: 3,
                    },
                    1300: {
                        items: 4,
                    },
                    1500: {
                        items: 4,
                    }
                }
            })
        });
    </script>

    <style>
        .heading-gtcl {
            background-image: url(admin_images/gia-tri-cot-loi.png);
        }

        .modal-content {
            background-image: url(admin_images/backguond-letter.png);
        }

        .heading-gtcl {
            background-image: url(admin_images/gia-tri-cot-loi.png);
        }

        .block-midmap {
            overflow: auto;
            max-width: 69rem;
            position: relative;
        }

            .block-midmap img {
                max-width: 69rem;
            }

        .owl-controls {
            display: none;
        }

        .owl-carousel {
            width: 84%;
        }

        .coler-01 {
            background-image: url(admin_images/hoc-tap.png);
        }

        /*.coler-icon-1 {
            color: deeppink;
        }*/

        .coler-02 {
            background-image: url(admin_images/trach-nhiem.png);
        }

        /*.coler-icon-2 {
            color: orangered;
        }*/

        .coler-03 {
            background-image: url(admin_images/tan-tam.png);
        }

        /*.coler-icon-3 {
            color: blue;
        }*/

        .coler-04 {
            background-image: url(admin_images/long-biet-on.png);
        }

        /*.coler-icon-4 {
            color: mediumpurple;
        }*/
        .infor {
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="hihead" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="himenu" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="hibodyhead" runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="hibodywrapper" runat="Server">
    <div class="container">
        <div class="block-thongbao" style="display: flex; justify-content: center; background-color: antiquewhite; border-radius: 9px;">
            <div class="heading-gtcl">
            </div>
            <div class="owl-carousel">
                <asp:Repeater ID="rpGiaTriCotLoi" runat="server">
                    <ItemTemplate>
                        <div class="card-gtcl addClassColor">
                            <div class="title-qtcl">
                                <span><%#Eval("giatricotloi_title") %></span>
                            </div>
                            <div class="card-gtcl-body">
                                <p>
                                    <%#Eval("giatricotloi_content") %>
                                </p>
                                <img class="ribon" src="admin_images/ribon.png" />
                            </div>
                            <div class="card-icon coler-icon-1" style="display: none">
                                <i class="fa fa-eye"></i>
                                <i class="fa fa-edit"></i>
                                <i class="fa fa-trash"></i>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <%-- <div class="block-thongbao" style="display: flex;justify-content: center;">
            <div class="ma-panel-heading" style="font-size: 20px;font-family: system-ui;">GIÁ TRỊ CỐT LÕI</div>
        <div class="owl-carousel">
    <asp:Repeater ID="rpGiaTriCotLoi" runat="server">
        <ItemTemplate>
             <div class="main-view">
              <div class="d-card addClassColor">
                  <span>
                      <%#Eval("giatricotloi_title") %>
                  </span>
              <div class="card-body">
                  <p  style="-webkit-line-clamp: 5;">
                      <%#Eval("giatricotloi_content") %>
                  </p>
                </div>
                <div class="card-actions col-lg-3 col-md-3 col-sm-12 col-xs-12">
                  <i class="fa fa-eye"></i>
                  <i class="fa fa-edit"></i>
                  <i class="fa fa-trash"></i>
                </div>
              </div>
          </div>
        </ItemTemplate>
    </asp:Repeater>--%>

            <%--Dem du lieu co trong tbGiaTriCotLoi--%>
            <input type="text" runat="server" id="txtlength" style="display: none;" />

        </div>
        <%--   <asp:UpdatePanel runat="server">
            <ContentTemplate>--%>
        <div class="midmap" style="margin: 2%;">
            <span class="soldout">SƠ ĐỒ TỔ CHỨC HỆ THỐNG GIÁO DỤC VIỆT NHẬT</span>
            <%-- <asp:UpdatePanel runat="server">
                <ContentTemplate>--%>
            <div class="block-midmap">
                <img src="admin_images/so-do-he-thong.png" />
                <asp:Repeater ID="rpHeThong" runat="server">
                    <ItemTemplate>
                        <a href="#" onclick="myClickTiet(<%#Eval("phongban_id") %>)" class="<%#Eval("phongban_position") %>">
                            <span><%#Eval("phongban_name")%></span>
                        </a>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <%--</ContentTemplate>
            </asp:UpdatePanel>--%>
            <%--    <asp:UpdatePanel runat="server">
                <ContentTemplate>--%>
            <!-- The Modal popup chi tiết sơ đồ-->
            <div id="myModal" class="modal">
                <div class="modal-content">
                    <span class="close">&times;</span>
                    <asp:Repeater ID="rpHeThongChiTiet" runat="server" OnItemDataBound="rpHeThongChiTiet_ItemDataBound">
                        <ItemTemplate>
                            <div style="width: 100%; text-align: center; font-weight: 700; color: white; padding: 1%; font-size: 30px; margin-bottom: -39px">
                                <span><%#Eval("phongban_name")%></span>
                            </div>
                            <div class="infor">

                                <asp:Repeater ID="rpTruongPhong" runat="server">
                                    <ItemTemplate>
                                        <div class="box-admin-2">
                                            <span></span>
                                            <span></span>
                                            <span></span>
                                            <span></span>
                                            <img style="position: absolute; z-index: 10; width: 91%; margin-left: -9px; margin-top: -18%; height: auto;"
                                                src="<%#Eval("thanhvien_image") %>" />
                                        </div>
                                        <div class="title-infor">
                                            <span><%#Eval("thanhvien_name") %></span>
                                            <span style="color: #000f6f; font-weight: 700; font-size: 16px;"><%#Eval("chucvu_name") %> </span>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <div class="title-nhanthanhvien" id="div_ThanhVien">
                                    <asp:Repeater ID="rpThanhVien" runat="server">
                                        <ItemTemplate>
                                            <div class="title-nhanvien">
                                                <span><%#Eval("thanhvien_name") %> - <%#Eval("chucvu_name") %></span>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                            </div>
                            <div style="width: 100%; display: flex; justify-content: flex-end;">
                                <div class="table-infor">
                                    <p class="title-chucnang">CHỨC NĂNG NHIỆM VỤ</p>
                                    <span><%#Eval("phongban_chucnang_nhiemvu")%>
                                    </span>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
            <%--  </ContentTemplate>
            </asp:UpdatePanel>--%>
        </div>
        <%--   <asp:UpdatePanel runat="server">
            <ContentTemplate>--%>
        <div style="display: none;">
            <input type="text" id="txtIdPhongBan" runat="server" />
            <a href="#" id="btnChiTietPhongBan" runat="server" onserverclick="btnChiTietPhongBan_ServerClick">chi tiết</a>
        </div>
        <%-- </ContentTemplate>
        </asp:UpdatePanel>--%>
        <%--  </ContentTemplate>
        </asp:UpdatePanel>--%>
        <%--  <div id="myModal" class="modal">
            <div class="modal-content">
                <span class="close">&times;</span>
                <div style="width: 100%; text-align: center; font-weight: 700; color: #09395a; padding: 1%; font-size: 30px; margin-bottom: -39px">
                    <span>BAN KIỂM SOÁT</span>
                </div>
                <div class="infor">
                    <img src="admin_images/admin.png" />
                    <div class="title-infor">
                        <span>TRẦN THANH SƠN</span>
                        <span style="color: #6f0000; font-weight: 700; font-size: 16px; font-weight: 600;">Chủ tịch hội đồng quản trị </span>
                    </div>
                    <div class="title-nhanthanhvien">
                        <div class="title-nhanvien">
                            <span>Nguyễn Hoàng Lân</span>
                            <span style="font-size: 16px; font-weight: 400;">Nhân viên</span>
                        </div>
                        <div class="title-nhanvien">
                            <span>Nguyễn Hoàng Lân</span>
                            <span style="font-size: 16px; font-weight: 400;">Nhân viên</span>
                        </div>
                        <div class="title-nhanvien">
                            <span>Nguyễn Hoàng Lân</span>
                            <span style="font-size: 16px; font-weight: 400;">Nhân viên</span>
                        </div>
                    </div>
                </div>
                <div style="width: 100%; display: flex; justify-content: flex-end;">
                    <div class="table-infor">
                        <p class="title-chucnang">CHỨC NĂNG NHIỆM VỤ</p>
                        <span>- HĐQT là cơ quan quản lý cao nhất tại Hệ thống giáo dục Việt Nhật, có toàn quyền quyết định, thực hiện các quyền và nghĩa vụ của Hệ thống;
                        </span>
                        <span>- HĐQT là cơ quan quản lý cao nhất tại Hệ thống giáo dục Việt Nhật, có toàn quyền quyết định, thực hiện các quyền và nghĩa vụ của Hệ thống;
                        </span>
                        <span>- HĐQT là cơ quan quản lý cao nhất tại Hệ thống giáo dục Việt Nhật, có toàn quyền quyết định, thực hiện các quyền và nghĩa vụ của Hệ thống;
                        </span>
                        <span>- HĐQT là cơ quan quản lý cao nhất tại Hệ thống giáo dục Việt Nhật, có toàn quyền quyết định, thực hiện các quyền và nghĩa vụ của Hệ thống;
                        </span>
                        <span>- HĐQT là cơ quan quản lý cao nhất tại Hệ thống giáo dục Việt Nhật, có toàn quyền quyết định, thực hiện các quyền và nghĩa vụ của Hệ thống;
                        </span>
                    </div>
                </div>
            </div>
        </div>--%>
        <div class="block-content row">
            <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12" style="text-align: center">
                <div style="font-size: 20PX; font-weight: bold; text-align: center">LỊCH CÔNG TÁC</div>
                <hr />
                <div style="margin-bottom: 20px" class="col-lg-3 col-md-4 col-sm-6 col-12">
                    <%--tiểu học--%>
                    <a class="link__icon" href="../../admin-xem-lich-cong-tac-hang-tuan">
                        <asp:Repeater ID="rpLichCongTacTuanTieuHoc" runat="server">
                            <ItemTemplate>
                                <a class="link__icon" href="../../admin-xem-lich-cong-tac-hang-tuan-tieu-hoc" id="saveXemLichSuTuan">
                                    <div class="btn-grad" style="box-shadow: 0px 0px 7px #888892; background-image: linear-gradient(to right, #673ab7 0%, #0530ff 51%, #5700ff 100%);">
                                        LỊCH CÔNG TÁC TIỂU HỌC <%#Eval("lichcongtac_tuan").ToString().ToUpper()%>
                                        <p class="box-progress-header">Số người đã xem</p>
                                        <div class="box-progress-bar">
                                            <span class="box-progress percent_progress" id="percent_LCTTuan"></span>
                                        </div>
                                        <p class="box-progress-percentage">
                                            <%#Eval("soNguoiDaXem")%> / <%#Eval("tongGiaoVien")%>
                                        </p>
                                    </div>
                                </a>
                                <%--<img class="icon-new" src="../admin_images/icon-new2.png" style="<%#Eval("style")%>" />--%>
                            </ItemTemplate>
                        </asp:Repeater>
                    </a>
                    <%--trung học--%>
                    <a class="link__icon" href="../../admin-xem-lich-cong-tac-hang-tuan">
                        <asp:Repeater ID="rpLichCongTacTuanTrungHoc" runat="server">
                            <ItemTemplate>
                                <a class="link__icon" href="../../admin-xem-lich-cong-tac-hang-tuan-trung-hoc" id="saveXemLichSuTuan">
                                    <div class="btn-grad" style="box-shadow: 0px 0px 7px #888892; background-image: linear-gradient(to right, #673ab7 0%, #0530ff 51%, #5700ff 100%);">
                                        LỊCH CÔNG TÁC TRUNG HỌC <%#Eval("lichcongtac_tuan").ToString().ToUpper()%>
                                        <p class="box-progress-header">Số người đã xem</p>
                                        <div class="box-progress-bar">
                                            <span class="box-progress percent_progress" id="percent_LCTTuan"></span>
                                        </div>
                                        <p class="box-progress-percentage">
                                            <%#Eval("soNguoiDaXemTrungHoc")%> / <%#Eval("tongGiaoVien")%>
                                        </p>
                                    </div>
                                </a>
                                <%--<img class="icon-new" src="../admin_images/icon-new2.png" style="<%#Eval("style")%>" />--%>
                            </ItemTemplate>
                        </asp:Repeater>
                    </a>
                    <a class="link__icon" href="../../admin-xem-lich-cong-tac-thang">
                        <%-- <div class="new-item">New</div>--%>
                        <asp:Repeater ID="rpLichCongTacThang" runat="server">
                            <ItemTemplate>
                                <a class="link__icon" href="../../admin-xem-lich-cong-tac-thang">
                                    <div class="btn-grad" style="box-shadow: 0px 0px 7px #888892; background-image: linear-gradient(to right, #ff9b04 0%, #ff5605 51%, #ff9700 100%);">
                                        LỊCH CÔNG TÁC <%#Eval("lichcongtac_thang").ToString().ToUpper()%>
                                        <p class="box-progress-header">Số người đã xem</p>
                                        <div class="box-progress-bar">
                                            <span class="box-progress percent_progress" id="percent_LCTThang"></span>
                                        </div>
                                        <p class="box-progress-percentage">
                                            <%#Eval("soNguoiDaXem")%> / <%#Eval("tongGiaoVien")%>
                                        </p>
                                    </div>
                                </a>
                                <img class="icon-new" src="../admin_images/icon-new2.png" style="<%#Eval("style")%>" />
                                <%--<img class=" " style="width: 250px; height: 64px" src="<%#Eval("image_name") %>" alt="Lịch công tác tháng" />--%>
                            </ItemTemplate>
                        </asp:Repeater>
                        <%-- Lịch công tác tháng--%>
                    </a>

                    <%--input thang vs tuan--%>
                    <%--Tong giao vien--%>
                    <input type="text" style="display: none" runat="server" id="txtTongGiaoVien" />
                    <%--tuan--%>
                    <input type="text" style="display: none" runat="server" id="txtSoNguoiXemLichTuan" />
                    <input type="text" style="display: none" runat="server" id="txtSoNguoiXemLichTuanTrungHoc" />
                    <%--thang--%>
                    <input type="text" style="display: none" runat="server" id="txtSoNguoiXemLichThang" />
                    <%--<a class="link__icon" href="../../admin-xem-ke-hoach-day-hoc-giao-vien">--%>
                    <a class="link__icon" href="/admin-xem-nang-luc-va-pham-chat">
                        <div class="btn-grad" style="box-shadow: 0px 0px 7px #888892; background-image: linear-gradient(to right, #3fff00 0%, #33cb01 51%, #3bbd04 100%)">
                            NĂNG LỰC VÀ PHẨM CHẤT
                                            <p class="box-progress-header">&nbsp;</p>
                            <div class="box-progress-bar">
                                <span class="box-progress percent_progress"></span>
                            </div>
                            <input type="text" style="display: none" />
                            <input type="text" style="display: none" />
                            <p class="box-progress-percentage">&nbsp;</p>
                        </div>
                    </a>
                    <%--<img class=" " style="width: 250px; height: 58px" src="/admin_images/kehoachdayhoc.png" alt="kế hoạch dạy học" />--%>
                    <%-- Lịch công tác hàng tuần--%>
                    <%--  </a>--%>
                </div>
                <br />
            </div>
            <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12" style="text-align: center">
                <div style="font-size: 20PX; font-weight: bold; text-align: center">
                    THỜI KHÓA BIỂU<%-- CHÍNH KHÓA - LỊCH BÁO GIẢNG - TKB TIẾT 8--%>
                    <%--  <br />
                    (Lưu ý:  TKB tiết 8 đã cập nhật mới bắt đầu từ ngày 29/03/2021)--%>
                </div>
                <hr />
                <div style="margin-bottom: 20px;" class="col-lg-3 col-md-4 col-sm-6 col-12">
                    <a class="link__icon" href="/admin-thoi-khoa-bieu-chinh-khoa">
                        <div class="btn-grad" style="box-shadow: 0px 0px 7px #888892; background-image: linear-gradient(to right, #673ab7 0%, #0530ff 51%, #5700ff 100%);">
                            TKB CẤP TIỂU HỌC
                                            <p class="box-progress-header">Số người đã xem</p>
                            <div class="box-progress-bar">
                                <span class="box-progress percent_progress" id="percent_TKBChinhKhoa"></span>
                            </div>
                            <p class="box-progress-percentage"><%=soNguoiDaXemTKBChinhKhoa%>/<%=tongGiaoVien%></p>
                        </div>
                    </a>
                    <%--<a class="link__icon" href="../../admin-thoi-khoa-bieu-chinh-khoa">
                        <img class="" style="width: 250px; height: 60px;" src="/admin_images/tbk__images/ThoiKhoabieu.png" alt="Thời khóa biểu" />
                    </a>--%>
                    <a class="link__icon" href="../../admin-thoi-khoa-bieu-trung-hoc">
                        <div class="btn-grad" style="box-shadow: 0px 0px 7px #888892; background-image: linear-gradient(to right, #ff9b04 0%, #ff5605 51%, #ff9700 100%);">
                            TKB CẤP TRUNG HỌC
                             <p class="box-progress-header">Số người đã xem</p>
                            <div class="box-progress-bar">
                                <span class="box-progress percent_progress" id="percent_TKBTrungHoc"></span>
                            </div>
                            <p class="box-progress-percentage"><%=soNguoiDaXemTKBTrungHoc%>/<%=tongGiaoVien%></p>
                        </div>
                    </a>
                    <%--<a class="link__icon" href="../../admin-lich-bao-giang-tong">
                        <img class="" style="width: 250px; height: 64px;" src="/admin_images/tbk__images/lich-bao-giang.png" alt="Lịch báo giảng" />
                    </a>--%>
                    <a class="link__icon" href="/admin-thoi-khoa-bieu-tiet-8">
                        <div class="btn-grad" style="box-shadow: 0px 0px 7px #888892; background-image: linear-gradient(to right, #3fff00 0%, #33cb01 51%, #3bbd04 100%);">
                            THỜI KHÓA BIỂU TIẾT 8
                                            <p class="box-progress-header">Số người đã xem</p>
                            <div class="box-progress-bar">
                                <span class="box-progress percent_progress" id="percent_TKBTiet8"></span>
                            </div>
                            <p class="box-progress-percentage"><%=soNguoiDaXemTKBTiet8%>/<%=tongGiaoVien%></p>
                        </div>
                    </a>
                    <%--<a class="link__icon" href="../../admin-thoi-khoa-bieu-tiet-8">
                        <img class="" style="width: 250px; height: 58px;" src="/admin_images/tbk__images/TKB-Tiet8.png" />
                    </a>--%>
                    <a class="link__icon" href="/admin-lich-bao-giang-tong-theo-lop">
                        <div class="btn-grad" style="box-shadow: 0px 0px 7px #888892; background-image: linear-gradient(to right, #3fff00 0%, #33cb01 51%, #3bbd04 100%)">
                            XEM LỊCH BÁO GIẢNG
                                            <p class="box-progress-header">&nbsp;</p>
                            <div class="box-progress-bar">
                                <span class="box-progress percent_progress"></span>
                            </div>
                            <input type="text" style="display: none" />
                            <input type="text" style="display: none" />
                            <p class="box-progress-percentage">&nbsp;</p>
                        </div>
                    </a>
                </div>
                <br />
            </div>
            <div style="display: none">
                <input type="text" id="txtSoNguoiXemTKBChinhKhoa" runat="server" />
                <input type="text" id="txtSoNguoiXemTKBTrungHoc" runat="server" />
                <input type="text" id="txtSoNguoiXemTKBTiet8" runat="server" />
            </div>
            <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12" style="text-align: center">
                <div style="font-size: 20PX; font-weight: bold; text-align: center">KHO TƯ LIỆU</div>
                <hr />
                <div class="col-lg-4 col-md-4 col-sm-6 col-12">
                    <a class="link__icon" href="/kho-tu-lieu-chung">
                        <div class="btn-grad" style="box-shadow: 0px 0px 7px #888892; background-image: linear-gradient(to right, #673ab7 0%, #0530ff 51%, #5700ff 100%);">
                            KHO TƯ LIỆU CHUNG
                                            <p class="box-progress-header">&nbsp;</p>
                            <div class="box-progress-bar">
                                <span class="box-progress percent_progress"></span>
                            </div>
                            <input type="text" style="display: none" />
                            <input type="text" style="display: none" />
                            <p class="box-progress-percentage">
                                <label runat="server">&nbsp;</label>
                            </p>
                        </div>
                    </a>
                    <%--<a class="link__icon" href="../../kho-tu-lieu-chung">
                        <img class="" style="width: 250px; height: 60px;" src="admin_images/tu-lieu-chung.png" alt="" />
                    </a>--%>
                    <a class="link__icon" href="/kho-tu-lieu-tieu-hoc">
                        <div class="btn-grad" style="box-shadow: 0px 0px 7px #888892; background-image: linear-gradient(to right, #ff9b04 0%, #ff5605 51%, #ff9700 100%);">
                            KHO TƯ LIỆU TIỂU HỌC 
                                            <p class="box-progress-header">&nbsp;</p>
                            <div class="box-progress-bar">
                                <span class="box-progress percent_progress"></span>
                            </div>
                            <input type="text" style="display: none" />
                            <input type="text" style="display: none" />
                            <p class="box-progress-percentage">
                                <label runat="server">&nbsp;</label>
                            </p>
                        </div>
                    </a>
                    <%--<a class="link__icon" href="../../kho-tu-lieu-tieu-hoc">
                        <img class="" style="width: 250px; height: 64px;" src="admin_images/tu-lieu-th.png" alt="" />
                    </a>--%>
                    <a class="link__icon" href="/kho-tu-lieu-trung-hoc">
                        <div class="btn-grad" style="box-shadow: 0px 0px 7px #888892; background-image: linear-gradient(to right, #3fff00 0%, #33cb01 51%, #3bbd04 100%);">
                            KHO TƯ LIỆU TRUNG HỌC
                                            <p class="box-progress-header">&nbsp;</p>
                            <div class="box-progress-bar">
                                <span class="box-progress percent_progress"></span>
                            </div>
                            <input type="text" style="display: none" />
                            <input type="text" style="display: none" />
                            <p class="box-progress-percentage">
                                <label runat="server">&nbsp;</label>
                            </p>
                        </div>
                    </a>
                    <%--<a class="link__icon" href="../../kho-tu-lieu-trung-hoc">
                        <img class="" style="width: 250px; height: 58px;" src="admin_images/THCS_THPT.png" alt="" />
                    </a>--%>
                    <a class="link__icon" href="/kho-tai-lieu-lien-quan-cac-chuyen-de" style="display: none">
                        <div class="btn-grad" style="box-shadow: 0px 0px 7px #888892; background-image: linear-gradient(to right, #3fff00 0%, #33cb01 51%, #3bbd04 100%);">
                            KHO TÀI LIỆU LIÊN QUAN CÁC CHUYÊN ĐỀ
                                            <p class="box-progress-header">Tổng tài liệu</p>
                            <div class="box-progress-bar">
                                <span class="box-progress percent_progress"></span>
                            </div>
                            <input type="text" style="display: none" />
                            <input type="text" style="display: none" />
                            <p class="box-progress-percentage">
                                <label runat="server"><%=tongKhoTuLieuLienQuan%></label>
                            </p>
                        </div>
                        <%--<dx:ASPxFileManager ID="f" runat="server"></dx:ASPxFileManager>--%>
                    </a>
                    <%-- <a class="link__icon" href="../../kho-tai-lieu-lien-quan-cac-chuyen-de">
                        <img class="" style="width: 250px; height: 58px;" src="uploadimages/lich-cong-tac-tuan/tai-lieu-lien-quan-cac-chuyen-de.png" alt="" />
                    </a>--%>
                </div>
                <br />
            </div>
            <div class="col-12" style="display: none">
                <div style="font-size: 20PX; font-weight: bold; text-align: center">
                    Địa điểm dạy tiết 8 cho lễ hội thể thao:
                <asp:Label ID="lblTuan" runat="server"></asp:Label>
                </div>
                <hr />
                <div style="background: #fff">
                    <asp:UpdatePanel ID="upLoc" runat="server">
                        <ContentTemplate>
                            <div class="form-group row">
                            </div>
                            <table id="example" class="display nowrap table-hover table-bordered" style="width: 100%; text-align: center">
                                <thead>
                                    <tr style="text-align: center; height: 40px">
                                        <th style="text-align: center">Ngày\Địa điểm</th>
                                        <th style="text-align: center">Sân bóng đá</th>
                                        <th style="text-align: center">Sân bóng rổ</th>
                                        <th style="text-align: center">Sân cầu lông</th>
                                        <th style="text-align: center">Hội trường tầng 1</th>
                                        <th style="text-align: center">Hội trường tầng 6 bên ngoài</th>
                                        <th style="text-align: center">Hội trường tầng 6 bên trong</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater ID="rpBookRoom" runat="server" OnItemDataBound="rpBookRoom_ItemDataBound">
                                        <ItemTemplate>
                                            <tr>
                                                <td><%#Eval("lichbookphongthongminh_name") %></td>
                                                <asp:Repeater ID="rpChiTiet" runat="server">
                                                    <ItemTemplate>
                                                        <td><a href="#" class="btn btn-<%#Eval("lichbookphongchitiet_class") %>" data-toggle="modal"><%#Eval("giaovien") %></a></td>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </tbody>
                            </table>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <br />
            </div>
            <%--   Thông báo khẩn câp--%>
            <div style="font-size: 20PX; font-weight: bold; text-align: center; display: none">THÔNG BÁO TRONG TUẦN</div>
            <%-- <hr />--%>
            <%--<div class="col-lg-3 col-md-4 col-sm-6 col-12">
            <table class="table table-bordered table-hover" style="background-color: white">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Tiêu đề</th>
                        <th scope="col">Ngày thông báo</th>
                        <th scope="col">#</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="rpList" runat="server">
                        <ItemTemplate>
                            <th scope="row"><%=STT++ %></th>
                            <td><%#Eval("thongbao_name") %> </td>
                            <td style="text-align: center"><%#Convert.ToDateTime(Eval("thongbao_datecreate")).ToShortDateString()%></td>
                            <td style="text-align: center"><a class="btn btn-primary" style="color: white" id="btnDuyet" onclick="myDuyet(<%#Eval("thongbao_id") %>)">Xem</a></td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
        </div>--%>
            <div style="display: none">
                <input type="text" id="txtThongBao_id" runat="server" />
                <a href="#" id="btnXem" runat="server" onserverclick="btnXem_ServerClick"></a>
            </div>
            <br />
            <%-- Thời khóa biểu của từng giáo viên--%>
            <div id="dvThoiKhoaBieu" runat="server" style="">
                <div style="font-size: 20PX; font-weight: bold; text-align: center">Thời khóa biểu</div>
                <hr />
                <div class="col-lg-3 col-md-4 col-sm-6 col-12">
                    <table class="table table-bordered" style="background-color: white">
                        <thead>
                            <tr class="head_table">
                                <%-- <th class="table_header" scope="col">Buổi</th>--%>
                                <th scope="col">Tiết</th>
                                <th scope="col">Thứ 2</th>
                                <th scope="col">Thứ 3</th>
                                <th scope="col">Thứ 4</th>
                                <th scope="col">Thứ 5</th>
                                <th scope="col">Thứ 6</th>
                                <%--   <th scope="col">Thứ 7</th>--%>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="rpThoiKhoaBieu" runat="server">
                                <ItemTemplate>
                                    <%--<tr>
                                        <td class="tiet" style="text-align: center"><%#Eval("tkb_tiet") %></td>
                                        <td class="tiet" style="text-align: center"><%#Eval("tkb_thu2") %></td>
                                        <td class="tiet" style="text-align: center"><%#Eval("tkb_thu3") %></td>
                                        <td class="tiet" style="text-align: center"><%#Eval("tkb_thu4") %></td>
                                        <td class="tiet" style="text-align: center"><%#Eval("tkb_thu5") %></td>
                                        <td class="tiet" style="text-align: center"><%#Eval("tkb_thu6") %></td>
                                    </tr>--%>
                                </ItemTemplate>
                            </asp:Repeater>
                            <tr>
                                <td class="tiet" style="text-align: center">1</td>
                                <td class="tiet" style="text-align: center" runat="server"><%=t2_t1%></td>
                                <td class="tiet" style="text-align: center" runat="server"><%=t3_t1%></td>
                                <td class="tiet" style="text-align: center" runat="server"><%=t4_t1%></td>
                                <td class="tiet" style="text-align: center" runat="server"><%=t5_t1%></td>
                                <td class="tiet" style="text-align: center" runat="server"><%=t6_t1%></td>
                            </tr>
                            <tr>
                                <td class="tiet" style="text-align: center">2</td>
                                <td class="tiet" style="text-align: center" runat="server"><%=t2_t2%></td>
                                <td class="tiet" style="text-align: center" runat="server"><%=t3_t2%></td>
                                <td class="tiet" style="text-align: center" runat="server"><%=t4_t2%></td>
                                <td class="tiet" style="text-align: center" runat="server"><%=t5_t2%></td>
                                <td class="tiet" style="text-align: center" runat="server"><%=t6_t2%></td>
                            </tr>
                            <tr>
                                <td class="tiet" style="text-align: center">3</td>
                                <td class="tiet" style="text-align: center" runat="server"><%=t2_t3%></td>
                                <td class="tiet" style="text-align: center" runat="server"><%=t3_t3%></td>
                                <td class="tiet" style="text-align: center" runat="server"><%=t4_t3%></td>
                                <td class="tiet" style="text-align: center" runat="server"><%=t5_t3%></td>
                                <td class="tiet" style="text-align: center" runat="server"><%=t6_t3%></td>
                            </tr>
                            <tr>
                                <td class="tiet" style="text-align: center">4</td>
                                <td class="tiet" style="text-align: center" runat="server"><%=t2_t4%></td>
                                <td class="tiet" style="text-align: center" runat="server"><%=t3_t4%></td>
                                <td class="tiet" style="text-align: center" runat="server"><%=t4_t4%></td>
                                <td class="tiet" style="text-align: center" runat="server"><%=t5_t4%></td>
                                <td class="tiet" style="text-align: center" runat="server"><%=t6_t4%></td>
                            </tr>
                            <tr>
                                <td class="tiet" style="text-align: center">5</td>
                                <td class="tiet" style="text-align: center" runat="server"><%=t2_t5%></td>
                                <td class="tiet" style="text-align: center" runat="server"><%=t3_t5%></td>
                                <td class="tiet" style="text-align: center" runat="server"><%=t4_t5%></td>
                                <td class="tiet" style="text-align: center" runat="server"><%=t5_t5%></td>
                                <td class="tiet" style="text-align: center" runat="server"><%=t6_t5%></td>
                            </tr>
                            <tr>
                                <td class="tiet" style="text-align: center">6</td>
                                <td class="tiet" style="text-align: center" runat="server"><%=t2_t6%></td>
                                <td class="tiet" style="text-align: center" runat="server"><%=t3_t6%></td>
                                <td class="tiet" style="text-align: center" runat="server"><%=t4_t6%></td>
                                <td class="tiet" style="text-align: center" runat="server"><%=t5_t6%></td>
                                <td class="tiet" style="text-align: center" runat="server"><%=t6_t6%></td>
                            </tr>
                            <tr>
                                <td class="tiet" style="text-align: center">7</td>
                                <td class="tiet" style="text-align: center" runat="server"><%=t2_t7%></td>
                                <td class="tiet" style="text-align: center" runat="server"><%=t3_t7%></td>
                                <td class="tiet" style="text-align: center" runat="server"><%=t4_t7%></td>
                                <td class="tiet" style="text-align: center" runat="server"><%=t5_t7%></td>
                                <td class="tiet" style="text-align: center" runat="server"><%=t6_t7%></td>
                            </tr>
                            <tr>
                                <td class="tiet" style="text-align: center">8</td>
                                <td class="tiet" style="text-align: center" runat="server"><%=t2_t8%></td>
                                <td class="tiet" style="text-align: center" runat="server"><%=t3_t8%></td>
                                <td class="tiet" style="text-align: center" runat="server"><%=t4_t8%></td>
                                <td class="tiet" style="text-align: center" runat="server"><%=t5_t8%></td>
                                <td class="tiet" style="text-align: center" runat="server"><%=t6_t8%></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <br />
        </div>

        <%--orange,blue,green--%>
        <div class="block-thongbao" style="display: flex; justify-content: center; margin-top: 4%; border-radius: 9px;">
            <div class="ma-panel-heading">THÔNG BÁO</div>
            <div class="owl-carousel">
                <asp:Repeater ID="rpList" runat="server">
                    <ItemTemplate>
                        <div class="main-view">
                            <div class="d-card addClassBG" style="min-height: 120px;">
                                <span><%#Eval("thongbao_name") %></span>
                                <div class="card-body" style="display: flex; justify-content: flex-end;">
                                    <p style="margin-top: 8px;"><%#Convert.ToDateTime(Eval("thongbao_datecreate")).ToShortDateString()%></p>
                                </div>
                                <div class="card-actions col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                    <a id="btnDuyet" onclick="myDuyet(<%#Eval("thongbao_id") %>)"><i class="fa fa-eye"></i></a>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>

        <%--Dem du lieu co trong Thong bao--%>
        <input type="text" runat="server" id="txtThongBaoLeng" style="display: none;" />

        <div id="div_ThongKe" class="block-thongbao" style="display: block; margin-top: 4%; border-radius: 9px;">
            <div class="title" style="text-align: center; padding: 20px;">THỐNG KÊ GIÁO VIÊN XEM LỊCH CÔNG TÁC</div>
            <div class="chart">
                <canvas id="myChartthang"></canvas>
                <canvas id="myCharttuan"></canvas>
            </div>
        </div>

        <div style="display: none;">
            <input type="text" id="txtDSLichCongTacThang" runat="server" />
            <input type="text" id="txtDSSoNguoiXem_LCT_Thang" runat="server" />
            <input type="text" id="txtDSLichCongTacThang_ID" runat="server" />
            <input type="text" id="txtDSLichCongTacTuan" runat="server" />
            <input type="text" id="txtDSSoNguoiXem_LCT_Tuan" runat="server" />
            <input type="text" id="txtDSLichCongTacTuan_ID" runat="server" />
        </div>

        <div style="display: none">
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <%--Thong ke tuan start--%>
                    <input type="text" id="txtTuanDuocChon" runat="server" />
                    <a href="javascript:void(0)" id="btnXemChiTiet_LCT_Tuan" runat="server" onserverclick="btnXemChiTiet_LCT_Tuan_ServerClick">xem chi tiết</a>
                    <%--Thong ke tuan end--%>
                    <%--Thong ke thang start--%>
                    <input type="text" id="txtThangDuocChon" runat="server" />
                    <a href="javascript:void(0)" id="btnXemChiTiet_LCT_Thang" runat="server" onserverclick="btnXemChiTiet_LCT_Thang_ServerClick">xem chi tiết</a>
                    <%--Thong ke end--%>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>

        <%--modal hiện ds chi tiết người xem lịch tuần--%>
        <dx:ASPxPopupControl ID="popupXemLCT_Tuan" runat="server" Width="1000px" Height="600px" CloseAction="CloseButton" ShowCollapseButton="True" ShowMaximizeButton="True" ScrollBars="Auto" CloseOnEscape="true" Modal="True"
            PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ClientInstanceName="popupXemLCT_Tuan" ShowFooter="false"
            HeaderText="THỐNG KÊ CHI TIẾT XEM LỊCH CÔNG TÁC TUẦN" AllowDragging="True" PopupAnimationType="Fade" EnableViewState="False" AutoUpdatePosition="true" ClientSideEvents-CloseUp="function(s,e){}">
            <ContentCollection>
                <dx:PopupControlContentControl runat="server">
                    <asp:UpdatePanel ID="upPopup1" runat="server">
                        <ContentTemplate>
                            <div class="popup-main">
                                <div class="div_content col-12">
                                    <div class="col-12">
                                        <div class="col-5 mr-2">
                                            <div class="form-group table-responsive">
                                                <h3>Danh sách giáo viên đã xem</h3>
                                                <table class="table table-striped table-hover">
                                                    <tr style="text-align: center">
                                                        <th scope="col">#</th>
                                                        <th scope="col">Họ và tên</th>
                                                        <th scope="col">Bộ phận</th>
                                                        <th scope="col">Ngày xem</th>
                                                    </tr>
                                                    <asp:Repeater runat="server" ID="rpDSDaXem">
                                                        <ItemTemplate>
                                                            <tr>
                                                                <td class="text-sm-center"><%#Container.ItemIndex+1 %></td>
                                                                <td><%#Eval("username_fullname") %></td>
                                                                <td><%#Eval("bophan_name") %></td>
                                                                <td><%#Eval("xemcongtactuan_ngayxem","{0:dd/MM/yyyy}") %></td>
                                                            </tr>
                                                        </ItemTemplate>
                                                    </asp:Repeater>
                                                </table>
                                            </div>
                                        </div>
                                        <div class="col-5">
                                            <div class="form-group table-responsive">
                                                <h3>Danh sách giáo viên chưa xem</h3>
                                                <table class="table table-striped table-hover">
                                                    <tr style="text-align: center">
                                                        <th scope="col">#</th>
                                                        <th scope="col">Họ và tên</th>
                                                        <th scope="col">Bộ phận</th>
                                                    </tr>
                                                    <asp:Repeater runat="server" ID="rpDSChuaXem">
                                                        <ItemTemplate>
                                                            <tr>
                                                                <td><%#Container.ItemIndex+1 %></td>
                                                                <td><%#Eval("username_fullname") %></td>
                                                                <td><%#Eval("bophan_name") %></td>
                                                            </tr>
                                                        </ItemTemplate>
                                                    </asp:Repeater>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </dx:PopupControlContentControl>
            </ContentCollection>
            <FooterContentTemplate>
            </FooterContentTemplate>
            <ContentStyle>
                <Paddings PaddingBottom="0px" />
            </ContentStyle>
        </dx:ASPxPopupControl>

        <%--modal hiện ds chi tiết người xem lịch công tác tháng--%>
        <dx:ASPxPopupControl ID="popupXemChiTiet_LCT_Thang" runat="server" Width="1000px" Height="600px" CloseAction="CloseButton" ShowCollapseButton="True" ShowMaximizeButton="True" ScrollBars="Auto" CloseOnEscape="true" Modal="True"
            PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ClientInstanceName="popupXemChiTiet_LCT_Thang" ShowFooter="false"
            HeaderText="THỐNG KÊ CHI TIẾT XEM LỊCH CÔNG TÁC THÁNG" AllowDragging="True" PopupAnimationType="Fade" EnableViewState="False" AutoUpdatePosition="true" ClientSideEvents-CloseUp="function(s,e){}">
            <ContentCollection>
                <dx:PopupControlContentControl runat="server">
                    <asp:UpdatePanel ID="udPopup" runat="server">
                        <ContentTemplate>
                            <div class="popup-main">
                                <div class="div_content col-12">
                                    <div class="col-12">
                                        <div class="col-5 mr-2">
                                            <div class="form-group table-responsive">
                                                <h3>Danh sách giáo viên đã xem</h3>
                                                <table class="table table-striped table-hover">
                                                    <tr style="text-align: center">
                                                        <th scope="col">#</th>
                                                        <th scope="col">Họ và tên</th>
                                                        <th scope="col">Bộ phận</th>
                                                        <th scope="col">Ngày xem</th>
                                                    </tr>
                                                    <asp:Repeater runat="server" ID="rpDSXemDSThang">
                                                        <ItemTemplate>
                                                            <tr>
                                                                <td class="text-sm-center"><%#Container.ItemIndex+1 %></td>
                                                                <td><%#Eval("username_fullname") %></td>
                                                                <td><%#Eval("bophan_name") %></td>
                                                                <td><%#Eval("xemcongtacthang_ngayxem","{0:dd/MM/yyyy}") %></td>
                                                            </tr>
                                                        </ItemTemplate>
                                                    </asp:Repeater>
                                                </table>
                                            </div>
                                        </div>
                                        <div class="col-5">
                                            <div class="form-group table-responsive">
                                                <h3>Danh sách giáo viên chưa xem</h3>
                                                <table class="table table-striped table-hover">
                                                    <tr style="text-align: center">
                                                        <th scope="col">#</th>
                                                        <th scope="col">Họ và tên</th>
                                                        <th scope="col">Bộ phận</th>
                                                    </tr>
                                                    <asp:Repeater runat="server" ID="rpDSChuaXemDSThang">
                                                        <ItemTemplate>
                                                            <tr>
                                                                <td><%#Container.ItemIndex+1 %></td>
                                                                <td><%#Eval("username_fullname") %></td>
                                                                <td><%#Eval("bophan_name") %></td>
                                                            </tr>
                                                        </ItemTemplate>
                                                    </asp:Repeater>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </dx:PopupControlContentControl>
            </ContentCollection>
            <FooterContentTemplate>
            </FooterContentTemplate>
            <ContentStyle>
                <Paddings PaddingBottom="0px" />
            </ContentStyle>
        </dx:ASPxPopupControl>

        <%--     <a href="/hoc-chu-cai-tien-lop-mot" class="btn btn-primary">Học chữ cái</a>--%>
        <a href="/chon-pham-chat-nang-luc-tieu-hoc" class="btn btn-primary">Phẩm chất - năng lực cấp Tiểu học</a>
        <a href="/chon-pham-chat-nang-luc-chi-tiet" class="btn btn-primary">Nhập nội dung phẩm chất - năng lực Trung học</a>
        <a href="/chon-pham-chat-nang-luc-chi-tiet-tieu-hoc" class="btn btn-primary">Nhập nội dung phẩm chất - năng lực Tiểu học</a>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>


    <script>
        // Get the modal
        var modal = document.getElementById("myModal");

        // Get the button that opens the modal
        //var btn = document.getElementById("myBtn");

        // Get the <span> element that closes the modal
        var span = document.getElementsByClassName("close")[0];

        // When the user clicks on the button, open the modal
        //btn.onclick = function () {
        //    modal.style.display = "block";
        //}
        //// When the user clicks on <span> (x), close the modal
        span.onclick = function () {
            modal.style.display = "none";
        }
        // When the user clicks anywhere outside of the modal, close it
        //window.onclick = function (event) {
        //    if (event.target == modal) {
        //        modal.style.display = "none";
        //    }
        //}

        function myClickTiet(id) {
            //  myShowModal()
            document.getElementById("<%=txtIdPhongBan.ClientID%>").value = id
            document.getElementById("<%=btnChiTietPhongBan.ClientID%>").click();
        }
        function myShowModal() {
            modal.style.display = "block";
        }
    </script>
    <script>
        var soNguoiXemLCTTuan = document.getElementById("<%=txtSoNguoiXemLichTuan.ClientID%>").value;
        var soNguoiXemLCTThang = document.getElementById("<%=txtSoNguoiXemLichThang.ClientID%>").value;
        var tongSoGiaoVien = document.getElementById("<%=txtTongGiaoVien.ClientID%>").value;
        var soNguoiXemTKBChinhKhoa = document.getElementById("<%=txtSoNguoiXemTKBChinhKhoa.ClientID%>").value;
        var soNguoiXemTKBTrungHoc = document.getElementById("<%=txtSoNguoiXemTKBTrungHoc.ClientID%>").value;
        var soNguoiXemTKBTiet8 = document.getElementById("<%=txtSoNguoiXemTKBTiet8.ClientID%>").value;
        var percentTuan = document.getElementById("percent_LCTTuan")
        var percentThang = document.getElementById("percent_LCTThang")
        var percentTKBChinhKhoa = document.getElementById("percent_TKBChinhKhoa")
        var percentTKBTrungHoc = document.getElementById("percent_TKBTrungHoc")
        var percentTKBTiet8 = document.getElementById("percent_TKBTiet8")
        //Tinh tuan LCT
        var percentXemTuan = (soNguoiXemLCTTuan / tongSoGiaoVien) * 100
        percentTuan.style.width = percentXemTuan + "%"
        percentTuan.style.background = "#fff"
        //Tinh thang LCT
        var percentXemThang = (soNguoiXemLCTThang / tongSoGiaoVien) * 100
        percentThang.style.width = percentXemThang + "%"
        percentThang.style.background = "#fff"
        //Tinh % tkb chinhs khoas
        var pTKBChinhKhoa = (soNguoiXemTKBChinhKhoa / tongSoGiaoVien) * 100
        percentTKBChinhKhoa.style.width = pTKBChinhKhoa + "%"
        //Tinh % tkb trung hoc
        var pTKBTrungHoc = (soNguoiXemTKBTrungHoc / tongSoGiaoVien) * 100
        percentTKBTrungHoc.style.width = pTKBTrungHoc + "%"
        //Tinh % tkb tiet 8
        var pTKBTiet8 = (soNguoiXemTKBTiet8 / tongSoGiaoVien) * 100
        percentTKBTiet8.style.width = pTKBTiet8 + "%"
        //Gia tri cot loi add class
        var lengt = document.getElementById("<%=txtlength.ClientID%>").value;
        var classes = ["coler-01", "coler-02", "coler-03", "coler-04"];

        var objectAdd = $(".addClassColor");

        $(document).ready(function () {
            for (i = 0; i < lengt; i++) {
                objectAdd[i].className += ' ' + classes[i % classes.length];
            }
        });
        //Thong bao
        var classAdd = ["blue", "green", "orange"]
        var add = $('.addClassBG')
        var lengTB = document.getElementById("<%=txtThongBaoLeng.ClientID%>").value

        $(document).ready(function () {
            for (j = 0; j < lengTB; j++) {
                add[j].className += ' ' + classAdd[j % classAdd.length];
            }
        });

    </script>

    <script>
        //func vẽ biểu đồ lịch công tác tuần
        var arrTuan = document.getElementById("<%=txtDSLichCongTacTuan.ClientID%>").value.split(",");
        var arrTuan_ID = document.getElementById("<%=txtDSLichCongTacTuan_ID.ClientID%>").value.split(",");
        var arrSoNguoiXem_LCT_Tuan = document.getElementById("<%=txtDSSoNguoiXem_LCT_Tuan.ClientID%>").value.split(",");
        //console.log(arrTuan)
        //console.log(arrSoNguoiXem_LCT_Tuan)
        var myCharttuan = new Chart("myCharttuan", {
            type: "bar",
            data: {
                labels: arrTuan,
                datasets: [{
                    label: ["Đã xem"],
                    data: arrSoNguoiXem_LCT_Tuan,
                    //borderColor: "green",
                    //fill: false,
                    backgroundColor: [
                        'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)',
                        'rgba(255, 150, 113, 1)',
                        'rgba(255, 110, 110, 1)',
                        'rgba(240, 170, 100, 1)',
                        'rgba(255, 192, 112, 1)',
                        'rgba(13, 170, 104, 1)',
                        'rgba(46, 100, 130, 1)',
                        'rgba(199, 90, 86, 1)',
                        'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)',
                        'rgba(255, 150, 113, 1)',
                        'rgba(255, 110, 110, 1)',
                        'rgba(240, 170, 100, 1)',
                        'rgba(255, 192, 112, 1)',
                        'rgba(13, 170, 104, 1)',
                        'rgba(46, 100, 130, 1)',
                        'rgba(199, 90, 86, 1)',
                        'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)',
                        'rgba(255, 150, 113, 1)',
                        'rgba(255, 110, 110, 1)',
                        'rgba(240, 170, 100, 1)',
                        'rgba(255, 192, 112, 1)',
                        'rgba(13, 170, 104, 1)',
                        'rgba(46, 100, 130, 1)',
                        'rgba(199, 90, 86, 1)'
                    ],
                }]
            },
            options: {
                legend: { display: false },
                title: {
                    display: true,
                    text: "Lịch công tác tuần"
                },
                scales: {
                    yAxes: [{
                        ticks: {
                            min: 0, // minimum value
                            max: parseInt(document.getElementById('<%=txtTongGiaoVien.ClientID%>').value),
                        }
                    }]
                },
                onClick: function (e) {
                    var activePoints = myCharttuan.getElementsAtEvent(e);
                    var selectedIndex = activePoints[0]._index;
                    var tuan = arrTuan_ID[selectedIndex];
                    //console.log(tuan)
                    document.getElementById("<%=txtTuanDuocChon.ClientID%>").value = tuan;
                    document.getElementById("<%=btnXemChiTiet_LCT_Tuan.ClientID%>").click();
                }
            }
        });
        //func vẽ biểu đồ lịch công tác tháng
        <%--var arrThang = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"];
        var arrSoNguoi = ["", "", "", "", "", "", "", "", "", "", "", ""];
        var arrThang_Data = document.getElementById("<%=txtDSLichCongTacThang.ClientID%>").value.split(",");
        var arrThang_ID = document.getElementById("<%=txtDSLichCongTacThang_ID.ClientID%>").value.split(",");
        var arrSoNguoiXem_LCT_Thang = document.getElementById("<%=txtDSSoNguoiXem_LCT_Thang.ClientID%>").value.split(",");
        for (var i = 0; i < arrSoNguoiXem_LCT_Thang.length; i++) {
            var arr_value = arrSoNguoiXem_LCT_Thang[i].split("|");
            arrSoNguoi[arr_value[1] - 1] = arr_value[0];
        }--%>
        var arrThang = document.getElementById("<%=txtDSLichCongTacThang.ClientID%>").value.split(",");
        var arrSoNguoi = document.getElementById("<%=txtDSSoNguoiXem_LCT_Thang.ClientID%>").value.split(",");
        var arrThang_ID = document.getElementById("<%=txtDSLichCongTacThang_ID.ClientID%>").value.split(",");
        var myChartthang = new Chart("myChartthang", {
            type: "bar",
            data: {
                labels: arrThang,
                datasets: [{
                    label: ["Đã xem"],
                    data: arrSoNguoi,
                    backgroundColor: [
                        'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)',
                        'rgba(255, 150, 113, 1)',
                        'rgba(255, 110, 110, 1)',
                        'rgba(240, 170, 100, 1)',
                        'rgba(255, 192, 112, 1)',
                        'rgba(13, 170, 104, 1)',
                        'rgba(46, 100, 130, 1)',
                        'rgba(199, 90, 86, 1)'
                    ],
                }]
            },
            options: {
                legend: { display: false },
                title: {
                    display: true,
                    text: "Lịch công tác tháng"
                },
                scales: {
                    yAxes: [{
                        ticks: {
                            min: 0, // minimum value
                            max: parseInt(document.getElementById('<%=txtTongGiaoVien.ClientID%>').value),
                        }
                    }]
                },
                onClick: function (e) {
                    var activePoints = myChartthang.getElementsAtEvent(e);
                    var selectedIndex = activePoints[0]._index;
                    var thang = arrThang_ID[selectedIndex];
                    //console.log(thang)
                    document.getElementById("<%=txtThangDuocChon.ClientID%>").value = thang;
                    document.getElementById("<%=btnXemChiTiet_LCT_Thang.ClientID%>").click();
                }
            }
        });
    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="hibodybottom" runat="Server">
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="hifooter" runat="Server">
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="hifootersite" runat="Server">
</asp:Content>

