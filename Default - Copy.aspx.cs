using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    private static int id_Lop;
    public string thongbaomoi;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["UserName"] != null)
        {
            //loadata();
            Response.Redirect("/admin-home");
        }
        else
        {
            Response.Redirect("/admin-login");
        }
        //if (Request.Cookies["HocSinh"] != null)
        //{
        //    loadata();
        //    //Response.Redirect("/admin-home");
        //}
        //else
        //{
        //    Response.Redirect("/login.html");
        //}
    }
    protected void loadata()
    {
        id_Lop = (from hs in db.tbHocSinhs
                  join hstl in db.tbHocSinhTrongLops on hs.hocsinh_id equals hstl.hocsinh_id
                  join l in db.tbLops on hstl.lop_id equals l.lop_id
                  where hs.hocsinh_email == Request.Cookies["HocSinh"].Value
                  orderby hstl.hstl_id descending
                  select l).FirstOrDefault().lop_id;

        var getUser = (from hs in db.tbHocSinhs where hs.hocsinh_email == Request.Cookies["HocSinh"].Value select hs).FirstOrDefault();

        var getAvatar = (from av in db.tb_TieuHoc_AnhDaiDiens
                         where av.hocsinh_id == getUser.hocsinh_id
                         select new
                         {
                             avatar_path = db.tb_TieuHoc_AnhDaiDiens.Any(x => x.hocsinh_id == getUser.hocsinh_id) ? (from img in db.tb_TieuHoc_AnhDaiDiens
                                                                                                                     where img.hocsinh_id == getUser.hocsinh_id
                                                                                                                     select img.avartar_path).FirstOrDefault() : "/admin_images/avatar.jpg",
                         });

        lblHoTenBe.Text = getUser.hocsinh_name;

        rpAvatar_Image.DataSource = getAvatar;
        rpAvatar_Image.DataBind();

        rpThongBaoTruong.DataSource = (from tbl in db.tb_TieuHoc_ThongBaoTruongs
                                       join k in db.tbKhois on tbl.khoi_id equals k.khoi_id
                                       join l in db.tbLops on k.khoi_id equals l.khoi_id
                                       where l.lop_id == id_Lop
                                       orderby tbl.thongbaotruong_ngaytao descending
                                       select new
                                       {
                                           tbl.thongbaotruong_id,
                                           k.khoi_name,
                                           tbl.thongbaotruong_tieude,
                                           thongbaotruong_moi = tbl.thongbaotruong_ngayketthuc < DateTime.Now ? "display:none" : "display:block"
                                       }).Take(1);
        rpThongBaoTruong.DataBind();
        rpThongBaoLop.DataSource = (from tbl in db.tb_TieuHoc_ThongBaoLops
                                    join l in db.tbLops on tbl.lop_id equals l.lop_id
                                    where l.lop_id == id_Lop /*&& tbl.thongbaoLop_hidden == true*/
                                    orderby tbl.thongbaolop_ngaytao descending
                                    select new
                                    {
                                        tbl.thongbaolog_id,
                                        l.lop_name,
                                        tbl.thongbaolop_tieude,
                                        thongbaolop_moi = tbl.thongbaolop_ngayketthuc < DateTime.Now ? "display:none" : "display:block"
                                    }).Take(1);
        rpThongBaoLop.DataBind();

    }

}