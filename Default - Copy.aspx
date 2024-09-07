<%@ Page Title="" Language="C#" MasterPageFile="~/Website_MasterPage.master" AutoEventWireup="true" CodeFile="Default - Copy.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" />
    <div class="navabar">
        <span>HỆ THỐNG GIÁO DỤC VIỆT NHẬT
        </span>
      <i class="fa fa-bell" style="padding: 2% 0 2% 5%;color: white" aria-hidden="true"></i>
    </div>
    <link href="web_VietNhatKids_css/rebon.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style>
        a:hover {
            text-decoration-line: none;
            color: #B51A1A;
        }

        .TrangChu_ThongBao {
            padding: 14% 4% 24% 4%;
        }

        .TrangChu_tb_box {
            background-color: #fff8f8d9;
            display: flex;
            width: 90%;
            margin: 3% auto;
            border-radius: 10px;
            height: 53px;
            justify-content: flex-start;
            align-items: center;
            box-shadow: 3px 4px 1px -1px #9d9b9b8c;
        }

            .TrangChu_tb_box span {
                color: black;
                margin-left: 2%;
                font-size: 81%;
                width: 68%;
                overflow: hidden;
                display: -webkit-box;
                -webkit-line-clamp: 1;
                -webkit-box-orient: vertical;
            }

        .TrangChu_tb {
            display: flex;
            height: 4%;
            position: absolute;
            margin-top: -9%;
            margin-left: 0.5%;
            width: 20%;
            background: #B51A1A;
            font-weight: 500;
            color: #ffffff;
            /* display: block; */
            box-shadow: 4px 5px 15px 0px #e78888;
            justify-content: center;
            align-items: center;
        }

            .TrangChu_tb span {
                font-size: 60%;
                padding: 2%;
            }

        .TrangChu_tb_class {
            margin: 2%;
            color: saddlebrown;
            text-transform: uppercase;
            font-size: 90%;
            /* padding: 0%; */
            display: flex;
            width: 17%;
            height: 69%;
            background: #B8F879;
            border: 1px solid #418300;
            box-sizing: border-box;
            box-shadow: 0px 4px 4px rgb(0 0 0 / 25%);
            border-radius: 11px;
            font-weight: bold;
            text-align: center;
            justify-content: center;
            align-items: center;
        }

        .Vien {
            border-top: none;
            margin-bottom: 5%;
        }

        .TrangChu_tb_tn {
            margin-top: 2%;
            margin-bottom: 2%;
            width: 100%;
            height: 28px;
            background: #44AE1E;
            color: #FFF8F8;
            font-size: 80%;
            text-align: center;
        }

        .TrangChu_ld {
            display: flex;
            background-image: linear-gradient(to right, #0679bb 51%, #1d00c9 100%);
            color: #721c24;
        }

        .TrangChu_ld_hdd {
            width: 28%;
            height: auto;
        }

            .TrangChu_ld_hdd img {
                margin: 7% auto;
                height: 121px;
                border-radius: 8px;
                border: 4px dashed #b51a1a;
                margin-left: 1%;
                width: 100%;
            }

        .TrangChu_chung {
            display: flex;
        }

        .TrangChu_hd {
            box-shadow: beige;
            border-radius: 42px;
            text-align: center;
            height: 131px;
            display: flex;
            width: 34%;
            font-weight: 900;
            color: #fff8f8d9 !important;
            background: #EB4848;
            border: 2px solid #FFFFFF;
            box-sizing: border-box;
            border-radius: 10px;
            padding: 1%;
            align-items: center;
        }

        .hinh_hs {
            /*z-index: -5;*/
            height: auto;
            width: 47%;
            margin: 1%;
            background: #FFD7D7;
            box-sizing: border-box;
            border-radius: 4px;
        }

        .TrangChu_hinh {
            background-color: antiquewhite;
            justify-content: center;
            margin-bottom: 2%;
            padding-bottom: 3%;
            display: flex;
        }

        .hinh_next {
            display: flex;
            text-align: center;
            background: #ffdf00;
            align-items: center;
            font-size: 65%;
            font-weight: 700;
            margin: 1%;
            padding: 1%;
            justify-content: center;
        }

        .Trangchu_dm {
            display: flex;
        }

        .Trangchu_dm_nh {
            display: flex;
            align-items: center;
            flex-direction: column;
            font-size: 16px;
            font-weight: 700;
            text-align: center;
            border-radius: 10px;
            width: 35%;
            box-shadow: 0px 1px 4px 1px #9e9e9e;
            height: 8rem;
            margin: 1%;
        }

        .dm_sk {
            background-image: linear-gradient(to right, #e7452c 0%, #ec2e34 51%, #b80702 100%);
            display: flex;
            align-items: center;
            flex-direction: column;
            margin-left: 1%;
        }

        .dm_sngh {
            background-image: linear-gradient(to right, #548591 0%, #264485 51%, #001fbc 100%);
            display: flex;
            align-items: center;
            flex-direction: column;
            margin-left: 1%;
            /*border: 2px solid #140080;*/
            color: #140080;
        }

        .Trangchu_dm_nh img {
            background-color: white;
            margin: 15%;
            border-radius: 25px;
            width: 40%;
            padding: 2%;
        }

        .Trangchu_dm_nh span {
            color: white;
            font-size: 73%;
        }

        .dm_dth {
            background-image: linear-gradient(to right, #e1004c 0%, #bf0343 51%, #b11247 100%);
            /*border: 2px solid #050dff;*/
            color: #050dff;
        }

        .dm_dp {
            background-image: linear-gradient(to right, #00a30e 0%, #06832e 51%, #006c4c 100%);
            margin-left: 1%;
            /*border: 2px solid #a18500;*/
            color: #a18500;
        }

        .dm_xe {
            background-image: linear-gradient(to right, #9f027b 0%, #81009d 51%, #630076 100%);
            margin-left: 1%;
            /*border: 2px solid #ff5e00;*/
            color: #ff5e00;
        }

        .dm_ngk {
            background-image: linear-gradient(to right, #e7452c 0%, #ec2e34 51%, #b80702 100%);
            /*border: 2px solid #ff00f7;*/
            color: #ff00f7;
        }

        .hinh_hs img {
            width: 101%;
            height: 107px;
        }

        .khung_ThongBao {
            height: 143px;
            margin: 0 1% 1% 1%;
            background-size: cover;
            padding: 1%;
        }

        .khung_ThongBao {
            background-image: url('/image_SoLienLacDienTu/thong-bao.jpg');
            /*background-image: url(https://cdn0.vox-cdn.com/uploads/chorus_asset/file/3493392/firewatch_150305_01.0.png);*/
        }

        .notification {
            width: 40px;
            margin: 1%;
            height: 24px;
            background-color: red;
            font-weight: 600;
            border-radius: 59px;
            color: white;
            display: flex;
            justify-content: center;
        }

        .ma-panel-heading-2 {
            margin-bottom: -11px;
            width: 44%;
            background-color: #ee353a;
            color: #fff;
            padding: 10px 20px 10px 35px;
            margin-left: -6px;
            margin-top: -14px;
            font-size: 11px;
            /* z-index: 1000; */
            font-weight: 800;
            display: flex;
            position: relative;
            padding: 2%;
            align-items: center;
            justify-content: center;
            box-shadow: 1px 2px 4px 1px #1b1e2194;
        }

            .ma-panel-heading-2:before {
                content: '';
                position: absolute;
                bottom: -10px;
                left: -15px;
                border-top-width: 10px;
                border-bottom-width: 10px;
                border-left-width: 15px;
                border-right-width: 15px;
                border-color: transparent;
                border-style: solid;
                border-right-color: #b52221;
                z-index: -14;
            }

        .ma-panel-heading {
            margin-bottom: -11px;
            width: 26%;
            background-color: #86d729;
            color: #fff;
            padding: 10px 20px 10px 35px;
            margin-left: -12px;
            margin-top: -14px;
            font-size: 11px;
            /* z-index: 1000; */
            font-weight: 800;
            display: flex;
            position: relative;
            padding: 2%;
            align-items: center;
            justify-content: center;
            box-shadow: 1px 2px 4px 1px #1b1e2194;
        }

            .ma-panel-heading:before {
                content: '';
                position: absolute;
                bottom: -10px;
                left: -15px;
                border-top-width: 10px;
                border-bottom-width: 10px;
                border-left-width: 15px;
                border-right-width: 15px;
                border-color: transparent;
                border-style: solid;
                border-right-color: #4caf50;
                z-index: -14;
            }

        .half-circle-ribbon {
            background: #86d729;
            color: #FFF;
            height: 29px;
            width: 45px;
            text-align: right;
            position: absolute;
            top: -1px;
            padding: 3%;
            right: -1px;
            font-size: 13px;
            flex-direction: row;
            border-radius: 0 0 0 100%;
            /* border: 1px dashed #FFF; */
            box-shadow: 0 0 0 3px #4caf50;
        }
    </style>
    <div class="TrangChu">
        <div class="container" style="padding: 0">
            <div class="TrangChu_ThongBao">
                <div class="ma-panel-heading">THÔNG BÁO</div>
                <%--<div class="TrangChu_tb"><span>THÔNG BÁO</span></div>--%>
                <asp:Repeater ID="rpThongBaoTruong" runat="server">
                    <ItemTemplate>
                        <div class="khung_ThongBao">
                        <a class="TrangChu_tb_box" href="thong-bao-nha-truong-<%#Eval("thongbaotruong_id") %>">
                            <div class="TrangChu_tb_class"><%#Eval("khoi_name") %></div>
                            <span><%#Eval("thongbaotruong_tieude") %></span>
                            <div class="notification" style="<%#Eval("thongbaotruong_moi") %>">Mới</div>
                        </a>
                   </ItemTemplate>
                </asp:Repeater>
                <asp:Repeater ID="rpThongBaoLop" runat="server">
                    <ItemTemplate>
                        <a class="TrangChu_tb_box Vien" href="thong-bao-lop-<%#Eval("thongbaolog_id") %>">
                            <div class="TrangChu_tb_class" style="background-color: #8EE4FF; border: 1px solid #00C2FF;"><%#Eval("lop_name") %></div>
                            <span><%#Eval("thongbaolop_tieude") %></span>
                            <div class="notification" style="<%#Eval("thongbaolop_moi") %>">Mới</div>
                        </a>
                        </div>
                  </ItemTemplate>
                </asp:Repeater>
                <%-- <div class="TrangChu_tb_tn">
                <span>Bạn chưa có tin nhấn nào !</span>
            </div>--%>
                <div class="TrangChu_chung">
                    <a class="pure-material-button-contained Trangchu_dm_nh TrangChu_ld" id="suckhoaLichSu" href="suc-khoe">
                    <div class="half-circle-ribbon">Mới</div>
                        <img src="image_SoLienLacDienTu/icon/suc-khoe.png" />
                        <span>SỨC KHỎE</span>
                    </a>
                    <%--<div class="TrangChu_ld mr-1">
                        <img src="image_SoLienLacDienTu/icon/suc-khoe.png" />
                    </div>--%>
                    <%--repeater avatar của bé--%>
                    <asp:Repeater runat="server" ID="rpAvatar_Image">
                        <ItemTemplate>
                            <div class="TrangChu_ld_hdd mr-1">
                                <a href="thong-tin-hoc-sinh">
                                    <img src="<%#Eval("avatar_path") %>"" />
                                    <%--<img src="admin_images/admin.png" />--%>
                                </a>
                            </div>
                       </ItemTemplate>
                    </asp:Repeater>
                    <a style="display: flex;justify-content: center;" class="pure-material-button-contained TrangChu_hd " href="lich-hoc">
                        <span>Hoạt động trong ngày của bé
                            <asp:Label ID="lblHoTenBe" runat="server"></asp:Label>
                        </span>
                    </a>
                </div>
                <div class="Trangchu_dm">
                    <a class="pure-material-button-contained Trangchu_dm_nh dm_sk" href="xin-nghi">
                        <img src="image_SoLienLacDienTu/icon/Dangky-Xin-nghi.png" />
                        <span>XIN NGHỈ</span>
                    </a>
                    <a class="pure-material-button-contained Trangchu_dm_nh dm_sngh" href="thong-ke-diem">
                        <img src="image_SoLienLacDienTu/icon/Dangky-Thuoc.png" />
                        <span>BẢNG ĐIỂM</span>
                    </a>
                    <a class="pure-material-button-contained Trangchu_dm_nh dm_dth" href="ablum-anh">
                        <img src="image_SoLienLacDienTu/icon/album.png" />
                        <span>ALBUM ẢNH</span>
                    </a>
                </div>
                <div class="Trangchu_dm">
                    <a class="pure-material-button-contained Trangchu_dm_nh dm_dp" href="dang-ky-dong-phuc">
                        <img src="image_SoLienLacDienTu/icon/Dangky-Dong-phuc.png" />
                        <span>ĐĂNG KÝ ĐỒNG PHỤC</span>
                    </a>
                    <a class="pure-material-button-contained Trangchu_dm_nh dm_xe" href="hoc-tap">
                        <img src="image_SoLienLacDienTu/icon/Dangky-Hoc-tap.png" />
                        <span>HỌC TẬP</span>
                    </a>
                    <a class="pure-material-button-contained Trangchu_dm_nh dm_ngk" href="dang-ky-ngoai-khoa">
                        <img src="image_SoLienLacDienTu/icon/Dangky-ngoai-khoa.png" />
                        <span>ĐĂNG KÝ NGOẠI KHÓA</span>
                    </a>
                </div>
            </div>
        </div>
    </div>

    <script>

</script>

</asp:Content>

