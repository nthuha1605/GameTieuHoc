using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DanhMucTieuHoc : System.Web.UI.Page
{
    dbcsdlgameDataContext dbgame = new dbcsdlgameDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        int hocSinhID = 1;
        var selectChiTiet = from ct in dbgame.tbChiTietBaiTaps
                            orderby ct.baitap_id, ct.chitietbaitap_vitribaitap
                            select new
                            {
                               ct.baitap_id,
                               ct.chitietbaitap_id,
                               ct.chitietbaitap_vitribaitap,
                               ct.chitietbaitap_position,
                               ct.chitietbaitap_linkbaitap,
                                sao = (from ls in dbgame.tbLichSuLamBaiHocSinhs
                                       where ls.baitap_id == ct.baitap_id && ls.lichsulambai_vitribaitap == ct.chitietbaitap_vitribaitap && ls.hocsinh_id == hocSinhID 
                                       select ls.lichsulambai_sao).FirstOrDefault() ?? 0,
                                status = (from ls1 in dbgame.tbLichSuLamBaiHocSinhs
                                          where ls1.baitap_id == ct.baitap_id && ls1.lichsulambai_vitribaitap == ct.chitietbaitap_vitribaitap && ls1.hocsinh_id == hocSinhID
                                          select ls1.lichsulambai_status).FirstOrDefault() ?? "disable",
                            };
        rpBaiHoc.DataSource = selectChiTiet;
        rpBaiHoc.DataBind();
        var totalSao = (from ls2 in dbgame.tbLichSuLamBaiHocSinhs where ls2.hocsinh_id == hocSinhID select ls2.lichsulambai_sao).Sum();
        lblSao.Text = totalSao.ToString();
    }
}