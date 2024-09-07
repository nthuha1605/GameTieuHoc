using LinqToExcel;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Common;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class Admin_Default : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    dbcsdlhtDataContext dbht = new dbcsdlhtDataContext();
    //dbcsdl_testDataContext dbtest = new dbcsdl_testDataContext();
    public int STT;
    public int thang;//lich cong tac thang

    public int tongKhoTuLieuChung, tongKhoTuLieuTrungHoc, tongKhoTuLieuTieuHoc, tongKhoTuLieuLienQuan;
    public int soNguoiDaXemTKBChinhKhoa, soNguoiDaXemTKBTrungHoc, soNguoiDaXemTKBTiet8, tongGiaoVien;

    cls_Alert alert = new cls_Alert();

    private static int _idUser;

    public string t2_t1, t3_t1, t4_t1, t5_t1, t6_t1;
    public string t2_t2, t3_t2, t4_t2, t5_t2, t6_t2;
    public string t2_t3, t3_t3, t4_t3, t5_t3, t6_t3;
    public string t2_t4, t3_t4, t4_t4, t5_t4, t6_t4;
    public string t2_t5, t3_t5, t4_t5, t5_t5, t6_t5;
    public string t2_t6, t3_t6, t4_t6, t5_t6, t6_t6;
    public string t2_t7, t3_t7, t4_t7, t5_t7, t6_t7;
    public string t2_t8, t3_t8, t4_t8, t5_t8, t6_t8;

    string trungLichDay = "Bị trùng lịch dạy mời kiểm tra lại nhé";
    string hidden = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        //Lay thang hien tai hien len lich cong tac thang
        thang = DateTime.Now.Month;
        STT = 1;
        if (Request.Cookies["UserName"] != null)
        {
            var checkuserid = (from u in db.admin_Users where u.username_username == Request.Cookies["UserName"].Value select u).First();
            _idUser = checkuserid.username_id;
            var checkThoiKhoaBieu = from tkb in db.tbThoiKhoaBieuTungGiaoViens
                                    where tkb.giaovien_id == checkuserid.username_id
                                    orderby tkb.tkb_tiet ascending
                                    select tkb;
            getThu2(1); getThu2(2); getThu2(3); getThu2(4); getThu2(5); getThu2(6); getThu2(7); getThu2(8);
            getThu3(1); getThu3(2); getThu3(3); getThu3(4); getThu3(5); getThu3(6); getThu3(7); getThu3(8);
            getThu4(1); getThu4(2); getThu4(3); getThu4(4); getThu4(5); getThu4(6); getThu4(7); getThu4(8);
            getThu5(1); getThu5(2); getThu5(3); getThu5(4); getThu5(5); getThu5(6); getThu5(7); getThu5(8);
            getThu6(1); getThu6(2); getThu6(3); getThu6(4); getThu6(5); getThu6(6); getThu6(7); getThu6(8);

            if (checkThoiKhoaBieu.Count() > 0)
            {
                rpThoiKhoaBieu.DataSource = checkThoiKhoaBieu;
                rpThoiKhoaBieu.DataBind();
            }
            else
            {
                dvThoiKhoaBieu.Visible = false;
            }
        }
        //Thong bao
        var getThongBao = from l in db.tbThongBaos orderby l.thongbao_id descending select l;
        rpList.DataSource = getThongBao;
        rpList.DataBind();

        //Do dai thong bao
        txtThongBaoLeng.Value = Convert.ToString(getThongBao.Count());

        var getLichCongTacThang = (from lct in db.tbLichCongTac_Thangs
                                   join t in db.tbImage_Liches on lct.image_id equals t.image_lich
                                   orderby lct.lichcongtac_thang_id descending
                                   select new
                                   {
                                       lichcongtac_thang = t.image_link,
                                       soNguoiDaXem = (from ls in db.tbQuanTri_LichSuXemLichCongTacThangs
                                                       where ls.lichcongtac_thang_id == lct.lichcongtac_thang_id
                                                       group ls by new
                                                       {
                                                           ls.username_id,
                                                           ls.lichcongtac_thang_id
                                                       } into k
                                                       select k).Count(),
                                       tongGiaoVien = (from tgv in db.admin_Users
                                                       where tgv.groupuser_id > 2 && tgv.groupuser_id != 7
                                                       && tgv.bophan_id != 100 && tgv.bophan_id != 27
                                                       select tgv).Count(),
                                       style = db.tbQuanTri_XemCongTacThangs.Any(x => x.lichcongtac_thang_id == lct.lichcongtac_thang_id && x.username_id == _idUser) ? "display:none" : "display:block;top:130px;"
                                   }).Take(1);
        rpLichCongTacThang.DataSource = getLichCongTacThang;
        rpLichCongTacThang.DataBind();

        var getLichCongTacTuanTieuHoc = (from lct in db.tbLichCongTacs
                                         where lct.lichcongtac_cap == "Tiểu học"
                                  orderby lct.lichcongtac_id descending
                                  select new
                                  {
                                      lct.lichcongtac_tuan,
                                      soNguoiDaXem = (from ls in db.tbQuanTri_LichSuXemLichCongTacTuans
                                                      where ls.lichcongtac_id == lct.lichcongtac_id
                                                      group ls by new
                                                      {
                                                          ls.username_id,
                                                          ls.lichcongtac_id,
                                                      } into k
                                                      select k).Count(),
                                      tongGiaoVien = (from tgv in db.admin_Users
                                                      where tgv.groupuser_id > 2 && tgv.groupuser_id != 7
                                                       && tgv.bophan_id != 100 && tgv.bophan_id != 27
                                                      select tgv).Count(),
                                      style = db.tbQuanTri_XemLichCongTacTuans.Any(x => x.lichcongtac_id == lct.lichcongtac_id && x.username_id == _idUser) ? "display:none" : "display:block"
                                  }).Take(1);
        rpLichCongTacTuanTieuHoc.DataSource = getLichCongTacTuanTieuHoc;
        rpLichCongTacTuanTieuHoc.DataBind();
        var getLichCongTacTuanTrungHoc = (from lct in db.tbLichCongTacs
                                          where lct.lichcongtac_cap == "Trung học"
                                  orderby lct.lichcongtac_id descending
                                  select new
                                  {
                                      lct.lichcongtac_tuan,
                                      soNguoiDaXemTrungHoc = (from ls in db.tbQuanTri_LichSuXemLichCongTacTuans
                                                      where ls.lichcongtac_id == lct.lichcongtac_id
                                                      group ls by new
                                                      {
                                                          ls.username_id,
                                                          ls.lichcongtac_id,
                                                      } into k
                                                      select k).Count(),
                                      tongGiaoVien = (from tgv in db.admin_Users
                                                      where tgv.groupuser_id > 2 && tgv.groupuser_id != 7
                                                       && tgv.bophan_id != 100 && tgv.bophan_id != 27
                                                      select tgv).Count(),
                                      style = db.tbQuanTri_XemLichCongTacTuans.Any(x => x.lichcongtac_id == lct.lichcongtac_id && x.username_id == _idUser) ? "display:none" : "display:block"
                                  }).Take(1);
        rpLichCongTacTuanTrungHoc.DataSource = getLichCongTacTuanTrungHoc;
        rpLichCongTacTuanTrungHoc.DataBind();
        //input cong tac tuan va thang start

        txtTongGiaoVien.Value = Convert.ToString((from gv in db.admin_Users
                                                  where gv.groupuser_id > 2 && gv.groupuser_id != 7
                                                   && gv.bophan_id != 100 && gv.bophan_id != 27
                                                  select gv).Count());
        txtSoNguoiXemLichTuan.Value = string.Join("", getLichCongTacTuanTieuHoc.Select(x => x.soNguoiDaXem).ToArray());
        txtSoNguoiXemLichTuanTrungHoc.Value = string.Join("", getLichCongTacTuanTrungHoc.Select(x => x.soNguoiDaXemTrungHoc).ToArray());
        txtSoNguoiXemLichThang.Value = string.Join("", getLichCongTacThang.Select(x => x.soNguoiDaXem).ToArray());

        //input cong tac tuan va thang end

        int tuan_id = Convert.ToInt32((from t in db.tbLichBookPhongThongMinhs orderby t.lichbookphongthongminh_id descending select t).First().tuan_id);
        lblTuan.Text = (from t in db.tbHocTap_Tuans where t.tuan_id == tuan_id select t).SingleOrDefault().tuan_name + "";
        rpBookRoom.DataSource = from nb in db.tbLichBookPhongThongMinhs
                                where nb.tuan_id == tuan_id
                                select nb;
        rpBookRoom.DataBind();
        //Tong kho tu lieu
        tongKhoTuLieuChung = Convert.ToInt32((from ktlc in db.tbQuanTri_FormMaus where ktlc.formau_loai == "file chung" select ktlc).Count());
        tongKhoTuLieuTieuHoc = Convert.ToInt32((from ktlc in db.tbQuanTri_FormMaus where ktlc.formau_loai == "file tieu hoc" select ktlc).Count());
        tongKhoTuLieuTrungHoc = Convert.ToInt32((from ktlc in db.tbQuanTri_FormMaus where ktlc.formau_loai == "file trung hoc" select ktlc).Count());
        tongKhoTuLieuLienQuan = Convert.ToInt32((from ktlc in db.tbQuanTri_FormMaus where ktlc.formau_loai == "file tai lieu lien quan" select ktlc).Count());
        //get số người đã xem thời khóa biểu
        tongGiaoVien = Convert.ToInt32(txtTongGiaoVien.Value);
        soNguoiDaXemTKBChinhKhoa = (from tkbck in db.tbQuanTri_LichSuXemThoiKhoaBieuChinhKhoas
                                    group tkbck by tkbck.username_id into g
                                    select g.Key).Count();
        txtSoNguoiXemTKBChinhKhoa.Value = soNguoiDaXemTKBChinhKhoa + "";
        soNguoiDaXemTKBTrungHoc = (from tkbck in db.tbQuanTri_LichSuXemThoiKhoaBieuTrungHocs
                                   group tkbck by tkbck.username_id into g
                                   select g.Key).Count();
        txtSoNguoiXemTKBTrungHoc.Value = soNguoiDaXemTKBTrungHoc + "";
        soNguoiDaXemTKBTiet8 = (from tkbck in db.tbQuanTri_LichSuXemThoiKhoaBieuTiet8s
                                group tkbck by tkbck.username_id into g
                                select g.Key).Count();
        txtSoNguoiXemTKBTiet8.Value = soNguoiDaXemTKBTiet8 + "";
        //Gia tri cot loi (xem)
        var getGTCL = (from gtcl in db.tbGiaTriCotLois select gtcl);
        rpGiaTriCotLoi.DataSource = getGTCL;
        rpGiaTriCotLoi.DataBind();

        //Do dai GTCL
        txtlength.Value = Convert.ToString(getGTCL.Count());

        //Thong ke doi voi giao vien
        //Thong ke lich cong tac tuan
        var getTuan = (from lct in db.tbLichCongTacs
                       join lt in db.tbImage_Liches on lct.image_lich equals lt.image_lich
                       where lct.lichcongtac_hidden == null && lt.image_group == 3 && lct.lichcongtac_tungay.Value.Year == DateTime.Now.Year
                       select new
                       {
                           lct.lichcongtac_id,
                           lt.image_link,
                           songuoixem = (from ls in db.tbQuanTri_LichSuXemLichCongTacTuans
                                         where ls.lichcongtac_id == lct.lichcongtac_id
                                         group ls by new
                                         {
                                             ls.username_id,
                                             ls.lichcongtac_id,
                                         } into k
                                         select k).Count(),
                       });
        //var getLich = (from i in db.tbImage_Liches
        //               join lct in db.tbLichCongTacs on i.image_lich equals lct.image_lich
        //               where i.image_group == 3 && lct.lichcongtac_tungay.Value.Year == DateTime.Now.Year && lct.lichcongtac_hidden == null
        //               group i by new
        //               {
        //                   i.image_lich,
        //                   i.image_link,
        //               } into k
        //               select new
        //               {
        //                   k.Key.image_link,
        //               });
        //string dsTuan = string.Join(",", getTuan.Select(x => x.image_link).ToArray());
        string dsTuan = string.Join(",", getTuan.Select(x => x.image_link).ToArray());
        string dsGVDaXem = string.Join(",", getTuan.Select(x => x.songuoixem).ToArray());
        txtDSLichCongTacTuan.Value = dsTuan;
        txtDSSoNguoiXem_LCT_Tuan.Value = dsGVDaXem;
        txtDSLichCongTacTuan_ID.Value = string.Join(",", getTuan.Select(x => x.lichcongtac_id).ToArray());
        //Thong ke lich cong tac thang
        var getThang = (from lctt in db.tbLichCongTac_Thangs
                        join i in db.tbImage_Liches on lctt.image_id equals i.image_lich
                        where lctt.lichcongtac_thang_hidden == null
                        select new
                        {
                            lctt.lichcongtac_thang_id,
                            i.image_link,
                            songuoixem = (from ls in db.tbQuanTri_LichSuXemLichCongTacThangs
                                          where ls.lichcongtac_thang_id == lctt.lichcongtac_thang_id
                                          group ls by new
                                          {
                                              ls.username_id,
                                          } into k
                                          select k).Count(),
                        });
        string dsThang = string.Join(",", getThang.Select(x => x.image_link).ToArray());

        string dsSoNguoiXem = string.Join(",", getThang.Select(x => x.songuoixem + "|" + x.image_link.Substring(x.image_link.Length - 1, 1)).ToArray());

        txtDSLichCongTacThang.Value = dsThang;
        txtDSSoNguoiXem_LCT_Thang.Value = string.Join(",", getThang.Select(x => x.songuoixem).ToArray()); ;
        txtDSLichCongTacThang_ID.Value = string.Join(",", getThang.Select(x => x.lichcongtac_thang_id).ToArray()); ;

        var getHeThong = from ht in dbht.tbHeThong_PhongBans
                         orderby ht.phongban_position ascending
                         select new
                         {
                             ht.phongban_name,
                             ht.phongban_position,
                             ht.phongban_id,
                         };
        rpHeThong.DataSource = getHeThong;
        rpHeThong.DataBind();

        //int number;
        //Int32.TryParse(txtIdPhongBan.Value, out number);
        //var getHeThongChiTiet = from ht in dbht.tbHeThong_PhongBans
        //                        join pb in dbht.tbHeThong_ThanhVien_PhongBans on ht.phongban_id equals pb.phongban_id
        //                        join cv in dbht.tbHeThong_ChucVus on pb.chucvu_id equals cv.chucvu_id
        //                        where ht.phongban_id == number
        //                        select new
        //                        {
        //                            ht.phongban_name,
        //                            pb.thanhvien_name,
        //                            cv.chucvu_name,
        //                            ht.phongban_chucnang_nhiemvu,
        //                            ht.phongban_id,
        //                        };
        //rpHeThongChiTiet.DataSource = getHeThongChiTiet;
        //rpHeThongChiTiet.DataBind();
    }

    //protected void myBtn_ServerClick(object sender, EventArgs e, string id)
    //{
    //    //tạo 1 biến tạm để tránh lỗi int string format

    //}
    protected void btnXem_ServerClick(object sender, EventArgs e)
    {
        //alert.alert_Success(Page,"get_id" + txtThongBao_id.Value,"");
        Response.Redirect("admin-file-huong-dan-danh-gia-" + txtThongBao_id.Value);
    }
    protected void rpBookRoom_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        Repeater rpChiTiet = e.Item.FindControl("rpChiTiet") as Repeater;
        int lichbookphongthongminh_id = int.Parse(DataBinder.Eval(e.Item.DataItem, "lichbookphongthongminh_id").ToString());
        rpChiTiet.DataSource = from ct in db.tblichbookphongchitiets
                               where ct.lichbookphongthongminh_id == lichbookphongthongminh_id
                               select new
                               {
                                   ct.lichbookphongchitiet_class,
                                   ct.lichbookphongchitiet_id,
                                   giaovien = ct.lichbookphongchitiet_giaovien == null ? "Chưa book" : ct.lichbookphongchitiet_giaovien,
                               };
        rpChiTiet.DataBind();
    }

    protected void saveXemLichSuTuan_ServerClick(object sender, EventArgs e)
    {
        //tbQuanTri_XemLichCongTacTuan insert = new tbQuanTri_XemLichCongTacTuan();

        //var _idUser = (from u in db.admin_Users where u.username_username == Request.Cookies["UserName"].Value select u).FirstOrDefault();

        //var getTuan = (from tuan in db.tbLichCongTacs orderby tuan.lichcongtac_id descending select tuan.lichcongtac_tuan).FirstOrDefault();

        //var _idLichTuan = (from lct in db.tbLichCongTacs
        //                   orderby lct.lichcongtac_id descending
        //                   select new
        //                   {
        //                       lct.lichcongtac_id,
        //                   }).FirstOrDefault();

        //insert.lichcongtac_tuan = Convert.ToInt32(getTuan);
        //insert.lichcongtac_id = _idLichTuan.lichcongtac_id;
        //insert.username_id = _idUser.username_id;
        //insert.xemcongtactuan_ngayxem = DateTime.Now;
        //db.tbQuanTri_XemLichCongTacTuans.InsertOnSubmit(insert);
        //db.SubmitChanges();

        //Response.Redirect("/admin-xem-lich-cong-tac-hang-tuan");
    }

    protected void saveXemLichSuCTThang_ServerClick(object sender, EventArgs e)
    {
        //tbQuanTri_XemCongTacThang insert = new tbQuanTri_XemCongTacThang();

        //var _idUser = (from u in db.admin_Users where u.username_username == Request.Cookies["UserName"].Value select u).FirstOrDefault();
        //var _idLichThang = (from lct in db.tbLichCongTac_Thangs
        //                    orderby lct.lichcongtac_thang_id descending
        //                    select new
        //                    {
        //                        lct.lichcongtac_thang_id,
        //                    }).FirstOrDefault();


        //insert.xemcongtacthang_ngayxem = DateTime.Now;
        //insert.lichcongtac_thang_id = _idLichThang.lichcongtac_thang_id;
        //insert.username_id = _idUser.username_id;

        //db.tbQuanTri_XemCongTacThangs.InsertOnSubmit(insert);
        //db.SubmitChanges();
    }

    protected void btnXemChiTiet_LCT_Tuan_ServerClick(object sender, EventArgs e)
    {
        //get id lịch công tác tuần
        int id_Lich = Convert.ToInt32(txtTuanDuocChon.Value);
        var listDaNhap = from u in db.admin_Users
                         join bp in db.tbBoPhans on u.bophan_id equals bp.bophan_id
                         join ls in db.tbQuanTri_LichSuXemLichCongTacTuans on u.username_id equals ls.username_id
                         join lct in db.tbLichCongTacs on ls.lichcongtac_id equals lct.lichcongtac_id
                         where lct.lichcongtac_id == id_Lich &&
                         u.groupuser_id > 2 && u.groupuser_id != 7 && u.bophan_id != 100 && u.bophan_id != 27
                         group ls by new
                         {
                             ls.username_id,
                             //ls.lichsu_lichcongtac_tuan_ngayxem.Value.Date,
                             //ls.lichsu_lichcongtac_tuan_ngayxem.Value.Month,
                             //ls.lichsu_lichcongtac_tuan_ngayxem.Value.Year,
                         } into k
                         orderby k.First().lichsu_lichcongtac_tuan_ngayxem ascending
                         select new
                         {
                             username_fullname = (from user in db.admin_Users
                                                  where user.username_id == k.First().username_id
                                                  select user.username_fullname).FirstOrDefault(),
                             bophan_name = (from bophan in db.tbBoPhans
                                            join bp_u in db.admin_Users on bophan.bophan_id equals bp_u.bophan_id
                                            where bp_u.username_id == k.First().username_id
                                            select bophan.bophan_name).FirstOrDefault(),
                             xemcongtactuan_ngayxem = k.First().lichsu_lichcongtac_tuan_ngayxem,
                             solanxem = k.Count(),
                         };

        var _idTong = (from u in db.admin_Users
                       join bp in db.tbBoPhans on u.bophan_id equals bp.bophan_id
                       where u.groupuser_id > 2 && u.groupuser_id != 7
                       && u.bophan_id != 100 && u.bophan_id != 27
                       select new
                       {
                           u.username_id,
                           u.username_fullname,
                           bp.bophan_name,
                       });

        var _idChuaXem = from u in db.admin_Users
                         join bp in db.tbBoPhans on u.bophan_id equals bp.bophan_id
                         join ls in db.tbQuanTri_LichSuXemLichCongTacTuans on u.username_id equals ls.username_id
                         join lct in db.tbLichCongTacs on ls.lichcongtac_id equals lct.lichcongtac_id
                         where lct.lichcongtac_id == id_Lich &&
                         u.groupuser_id > 2 && u.groupuser_id != 7 && u.bophan_id != 100 && u.bophan_id != 27
                         group ls by new
                         {
                             ls.username_id,
                             //ls.lichsu_lichcongtac_tuan_ngayxem.Value.Date,
                             //ls.lichsu_lichcongtac_tuan_ngayxem.Value.Month,
                             //ls.lichsu_lichcongtac_tuan_ngayxem.Value.Year,
                         } into k
                         orderby k.First().lichsu_lichcongtac_tuan_ngayxem ascending
                         select new
                         {
                             username_id = Convert.ToInt32(k.First().username_id),
                             username_fullname = (from user in db.admin_Users
                                                  where user.username_id == k.First().username_id
                                                  select user.username_fullname).FirstOrDefault(),
                             bophan_name = (from bophan in db.tbBoPhans
                                            join bp_u in db.admin_Users on bophan.bophan_id equals bp_u.bophan_id
                                            where bp_u.username_id == k.First().username_id
                                            select bophan.bophan_name).FirstOrDefault(),
                             //xemcongtactuan_ngayxem = k.First().lichsu_lichcongtac_tuan_ngayxem,
                             //solanxem = k.Count(),
                         };


        rpDSDaXem.DataSource = listDaNhap;
        rpDSDaXem.DataBind();

        rpDSChuaXem.DataSource = _idTong.Except(_idChuaXem);
        rpDSChuaXem.DataBind();
        ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Detail", "popupXemLCT_Tuan.Show();", true);
    }

    protected void btnXemChiTiet_LCT_Thang_ServerClick(object sender, EventArgs e)
    {
        //get id lịch công tác tháng
        int id_Lich = Convert.ToInt32(txtThangDuocChon.Value);
        var lisDaXem = (from u in db.admin_Users
                        join ls in db.tbQuanTri_LichSuXemLichCongTacThangs on u.username_id equals ls.username_id
                        join bp in db.tbBoPhans on u.bophan_id equals bp.bophan_id
                        join lct in db.tbLichCongTac_Thangs on ls.lichcongtac_thang_id equals lct.lichcongtac_thang_id
                        where lct.lichcongtac_thang_id == id_Lich &&
                        u.groupuser_id > 2 && u.groupuser_id != 7 && u.bophan_id != 100 && u.bophan_id != 27
                        group ls by new
                        {
                            ls.username_id,
                            //ls.lichsu_lichcongtac_thang_ngayxem.Value.Date,
                            //ls.lichsu_lichcongtac_thang_ngayxem.Value.Month,
                            //ls.lichsu_lichcongtac_thang_ngayxem.Value.Year,
                        } into k
                        orderby k.First().lichsu_lichcongtac_thang_ngayxem ascending
                        select new
                        {
                            username_fullname = (from user in db.admin_Users
                                                 where user.username_id == k.First().username_id
                                                 select user.username_fullname).FirstOrDefault(),
                            bophan_name = (from bophan in db.tbBoPhans
                                           join bp_u in db.admin_Users on bophan.bophan_id equals bp_u.bophan_id
                                           where bp_u.username_id == k.First().username_id
                                           select bophan.bophan_name).FirstOrDefault(),
                            xemcongtacthang_ngayxem = k.First().lichsu_lichcongtac_thang_ngayxem,
                            solanxem = k.Count(),
                        });
        rpDSXemDSThang.DataSource = lisDaXem;
        rpDSXemDSThang.DataBind();

        var _idTong = (from u in db.admin_Users
                       join bp in db.tbBoPhans on u.bophan_id equals bp.bophan_id
                       where u.groupuser_id > 2 && u.groupuser_id != 7
                       && u.bophan_id != 100 && u.bophan_id != 27
                       select new
                       {
                           u.username_id,
                           u.username_fullname,
                           bp.bophan_name,
                       });

        var _idChuaXem = (from ls in db.tbQuanTri_LichSuXemLichCongTacThangs
                          join u in db.admin_Users on ls.username_id equals u.username_id
                          join bp in db.tbBoPhans on u.bophan_id equals bp.bophan_id
                          where ls.lichcongtac_thang_id == id_Lich &&
                         u.groupuser_id > 2 && u.groupuser_id != 7 && u.bophan_id != 100 && u.bophan_id != 27
                          group ls by ls.username_id into k
                          select new
                          {
                              username_id = Convert.ToInt32(k.Key),
                              username_fullname = (from user in db.admin_Users
                                                   where user.username_id == k.Key
                                                   select user.username_fullname).FirstOrDefault(),
                              bophan_name = (from bophan in db.tbBoPhans
                                             join bp_u in db.admin_Users on bophan.bophan_id equals bp_u.bophan_id
                                             where bp_u.username_id == k.Key
                                             select bophan.bophan_name).FirstOrDefault(),
                          });

        rpDSChuaXemDSThang.DataSource = _idTong.Except(_idChuaXem);
        rpDSChuaXemDSThang.DataBind();

        ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Detail", "popupXemChiTiet_LCT_Thang.Show();", true);
    }

    protected void btnChiTietPhongBan_ServerClick(object sender, EventArgs e)
    {
        //alert.alert_Error(Page, txtIdPhongBan.Value, "");
        int idPhongBan = Convert.ToInt32(txtIdPhongBan.Value);
        var getChiTiet = from pb in dbht.tbHeThong_PhongBans
                         where pb.phongban_id == idPhongBan
                         select new
                         {
                             pb.phongban_id,
                             pb.phongban_name,
                             phongban_chucnang_nhiemvu = pb.phongban_chucnang_nhiemvu.ToString().Replace("-", "</br> -"),
                         };
        rpHeThongChiTiet.DataSource = getChiTiet;
        rpHeThongChiTiet.DataBind();
        if (hidden == "hidden")
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "text", "myShowModal();hiddenThanhVien()", true);
        else
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "text", "myShowModal()", true);
    }

    protected void rpHeThongChiTiet_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        Repeater rpTruongPhong = e.Item.FindControl("rpTruongPhong") as Repeater;
        Repeater rpThanhVien = e.Item.FindControl("rpThanhVien") as Repeater;
        int idphongban = int.Parse(DataBinder.Eval(e.Item.DataItem, "phongban_id").ToString());

        var getTruongPhong = (from tv in dbht.tbHeThong_ThanhVien_PhongBans
                              join cv in dbht.tbHeThong_ChucVus on tv.chucvu_id equals cv.chucvu_id
                              where tv.phongban_id == idphongban && tv.chucvu_id != 5
                              select new
                              {
                                  tv.thanhvienphongban_id,
                                  thanhvien_name = CultureInfo.CurrentCulture.TextInfo.ToTitleCase(tv.thanhvien_name.ToLower()),
                                  cv.chucvu_name,
                                  tv.thanhvien_image,
                              });
        rpTruongPhong.DataSource = getTruongPhong;
        rpTruongPhong.DataBind();

        var getThanhVien = (from tv in dbht.tbHeThong_ThanhVien_PhongBans
                            join cv in dbht.tbHeThong_ChucVus on tv.chucvu_id equals cv.chucvu_id
                            where tv.phongban_id == idphongban && tv.chucvu_id == 5
                            select new
                            {
                                tv.thanhvienphongban_id,
                                thanhvien_name = CultureInfo.CurrentCulture.TextInfo.ToTitleCase(tv.thanhvien_name.ToLower()),

                                cv.chucvu_name,
                            });

        rpThanhVien.DataSource = getThanhVien;
        rpThanhVien.DataBind();
        if (getThanhVien.Count() <= 0)
        {
            hidden = "hidden";
        }

    }
    protected void getThu2(int tiet)
    {
        var checkuserid = (from u in db.admin_Users where u.username_username == Request.Cookies["UserName"].Value select u).First();
        var getTKB = from tkb in db.tbThoiKhoaBieuTungGiaoViens
                     where tkb.giaovien_id == checkuserid.username_id && tkb.tkb_tiet == tiet && tkb.thu_id == 1
                     select new
                     {
                         tkb.tkb_thu2,
                     };

        string lich = string.Join(",", getTKB.Select(x => x.tkb_thu2));
        string[] show = lich.Split(',');

        var arr = "";

        if (tiet == 1)
        {
            for (int i = 0; i < show.Length; i++)
            {
                if (getTKB.Count() > 1)
                {
                    arr = show[i];
                    t2_t1 += " - " + arr;
                }
                else
                {
                    t2_t1 = show[i];
                }
            }
        }
        else if (tiet == 2)
        {
            for (int i = 0; i < show.Length; i++)
            {
                if (getTKB.Count() > 1)
                {
                    arr = show[i];
                    t2_t2 += " - " + arr;
                }
                else
                {
                    t2_t2 = show[i];
                }
            }
        }
        else if (tiet == 3)
        {
            for (int i = 0; i < show.Length; i++)
            {
                if (getTKB.Count() > 1)
                {
                    arr = show[i];
                    t2_t3 += " - " + arr;
                }
                else
                {
                    t2_t3 = show[i];
                }
            }
        }
        else if (tiet == 4)
        {
            for (int i = 0; i < show.Length; i++)
            {
                if (getTKB.Count() > 1)
                {
                    arr = show[i];
                    t2_t4 += " - " + arr;
                }
                else
                {
                    t2_t4 = show[i];
                }
            }
        }
        else if (tiet == 5)
        {
            for (int i = 0; i < show.Length; i++)
            {
                if (getTKB.Count() > 1)
                {
                    arr = show[i];
                    t2_t5 += " - " + arr;
                }
                else
                {
                    t2_t5 = show[i];
                }
            }
        }
        else if (tiet == 6)
        {
            for (int i = 0; i < show.Length; i++)
            {
                if (getTKB.Count() > 1)
                {
                    arr = show[i];
                    t2_t6 += " - " + arr;
                }
                else
                {
                    t2_t6 = show[i];
                }
            }
        }
        else if (tiet == 7)
        {
            for (int i = 0; i < show.Length; i++)
            {
                if (getTKB.Count() > 1)
                {
                    arr = show[i];
                    t2_t7 += " - " + arr;
                }
                else
                {
                    t2_t7 = show[i];
                }
            }
        }
        else if (tiet == 8)
        {
            for (int i = 0; i < show.Length; i++)
            {
                if (getTKB.Count() > 1)
                {
                    arr = show[i];
                    t2_t8 += " - " + arr;
                }
                else
                {
                    t2_t8 = show[i];
                }
            }
        }
    }
    protected void getThu3(int tiet)
    {
        var checkuserid = (from u in db.admin_Users where u.username_username == Request.Cookies["UserName"].Value select u).First();
        var getTKBT3 = from tkb in db.tbThoiKhoaBieuTungGiaoViens
                       where tkb.giaovien_id == checkuserid.username_id && tkb.tkb_tiet == tiet && tkb.thu_id == 2
                       select new
                       {
                           tkb.tkb_thu3,
                       };

        string lich = string.Join(",", getTKBT3.Select(x => x.tkb_thu3));
        string[] show = lich.Split(',');

        var arr = "";

        if (tiet == 1)
        {
            for (int i = 0; i < show.Length; i++)
            {
                if (getTKBT3.Count() > 1)
                {
                    arr = show[i];
                    t3_t1 += " - " + arr;
                }
                else
                {
                    t3_t1 = show[i];
                }
            }
        }
        else if (tiet == 2)
        {
            for (int i = 0; i < show.Length; i++)
            {
                if (getTKBT3.Count() > 1)
                {
                    arr = show[i];
                    t3_t2 += " - " + arr;
                }
                else
                {
                    t3_t2 = show[i];
                }
            }
        }
        else if (tiet == 3)
        {
            for (int i = 0; i < show.Length; i++)
            {
                if (getTKBT3.Count() > 1)
                {
                    arr = show[i];
                    t3_t3 += " - " + arr;
                }
                else
                {
                    t3_t3 = show[i];
                }
            }
        }
        else if (tiet == 4)
        {
            for (int i = 0; i < show.Length; i++)
            {
                if (getTKBT3.Count() > 1)
                {
                    arr = show[i];
                    t3_t4 += " - " + arr;
                }
                else
                {
                    t3_t4 = show[i];
                }
            }
        }
        else if (tiet == 5)
        {
            for (int i = 0; i < show.Length; i++)
            {
                if (getTKBT3.Count() > 1)
                {
                    arr = show[i];
                    t3_t5 += " - " + arr;
                }
                else
                {
                    t3_t5 = show[i];
                }
            }
        }
        else if (tiet == 6)
        {
            for (int i = 0; i < show.Length; i++)
            {
                if (getTKBT3.Count() > 1)
                {
                    arr = show[i];
                    t3_t6 += " - " + arr;
                }
                else
                {
                    t3_t6 = show[i];
                }
            }
        }
        else if (tiet == 7)
        {
            for (int i = 0; i < show.Length; i++)
            {
                if (getTKBT3.Count() > 1)
                {
                    arr = show[i];
                    t3_t7 += " - " + arr;
                }
                else
                {
                    t3_t7 = show[i];
                }
            }
        }
        else if (tiet == 8)
        {
            for (int i = 0; i < show.Length; i++)
            {
                if (getTKBT3.Count() > 1)
                {
                    arr = show[i];
                    t3_t8 += " - " + arr;
                }
                else
                {
                    t3_t8 = show[i];
                }
            }
        }
    }
    protected void getThu4(int tiet)
    {
        var checkuserid = (from u in db.admin_Users where u.username_username == Request.Cookies["UserName"].Value select u).First();
        var getTKB = from tkb in db.tbThoiKhoaBieuTungGiaoViens
                     where tkb.giaovien_id == checkuserid.username_id && tkb.tkb_tiet == tiet && tkb.thu_id == 3
                     select new
                     {
                         tkb.tkb_thu4,
                     };

        string lich = string.Join(",", getTKB.Select(x => x.tkb_thu4));
        string[] show = lich.Split(',');

        var arr = "";

        if (tiet == 1)
        {
            for (int i = 0; i < show.Length; i++)
            {
                if (getTKB.Count() > 1)
                {
                    arr = show[i];
                    t4_t1 += " - " + arr;
                }
                else
                {
                    t4_t1 = show[i];
                }
            }
        }
        else if (tiet == 2)
        {
            for (int i = 0; i < show.Length; i++)
            {
                if (getTKB.Count() > 1)
                {
                    arr = show[i];
                    t4_t2 += " - " + arr;
                }
                else
                {
                    t4_t2 = show[i];
                }
            }
        }
        else if (tiet == 3)
        {
            for (int i = 0; i < show.Length; i++)
            {
                if (getTKB.Count() > 1)
                {
                    arr = show[i];
                    t4_t3 += " - " + arr;
                }
                else
                {
                    t4_t3 = show[i];
                }
            }
        }
        else if (tiet == 4)
        {
            for (int i = 0; i < show.Length; i++)
            {
                if (getTKB.Count() > 1)
                {
                    arr = show[i];
                    t4_t4 += " - " + arr;
                }
                else
                {
                    t4_t4 = show[i];
                }
            }
        }
        else if (tiet == 5)
        {
            for (int i = 0; i < show.Length; i++)
            {
                if (getTKB.Count() > 1)
                {
                    arr = show[i];
                    t4_t5 += " - " + arr;
                }
                else
                {
                    t4_t5 = show[i];
                }
            }
        }
        else if (tiet == 6)
        {
            for (int i = 0; i < show.Length; i++)
            {
                if (getTKB.Count() > 1)
                {
                    arr = show[i];
                    t4_t6 += " - " + arr;
                }
                else
                {
                    t4_t6 = show[i];
                }
            }
        }
        else if (tiet == 7)
        {
            for (int i = 0; i < show.Length; i++)
            {
                if (getTKB.Count() > 1)
                {
                    arr = show[i];
                    t4_t7 += " - " + arr;
                }
                else
                {
                    t4_t7 = show[i];
                }
            }
        }
        else if (tiet == 8)
        {
            for (int i = 0; i < show.Length; i++)
            {
                if (getTKB.Count() > 1)
                {
                    arr = show[i];
                    t4_t8 += " - " + arr;
                }
                else
                {
                    t4_t8 = show[i];
                }
            }
        }
    }
    protected void getThu5(int tiet)
    {
        var checkuserid = (from u in db.admin_Users where u.username_username == Request.Cookies["UserName"].Value select u).First();
        var getTKB = from tkb in db.tbThoiKhoaBieuTungGiaoViens
                     where tkb.giaovien_id == checkuserid.username_id && tkb.tkb_tiet == tiet && tkb.thu_id == 4
                     select new
                     {
                         tkb.tkb_thu5,
                     };

        string lich = string.Join(",", getTKB.Select(x => x.tkb_thu5));
        string[] show = lich.Split(',');

        var arr = "";

        if (tiet == 1)
        {
            for (int i = 0; i < show.Length; i++)
            {
                if (getTKB.Count() > 1)
                {
                    arr = show[i];
                    t5_t1 += " - " + arr;
                }
                else
                {
                    t5_t1 = show[i];
                }
            }
        }
        else if (tiet == 2)
        {
            for (int i = 0; i < show.Length; i++)
            {
                if (getTKB.Count() > 1)
                {
                    arr = show[i];
                    t5_t2 += " - " + arr;
                }
                else
                {
                    t5_t2 = show[i];
                }
            }
        }
        else if (tiet == 3)
        {
            for (int i = 0; i < show.Length; i++)
            {
                if (getTKB.Count() > 1)
                {
                    arr = show[i];
                    t5_t3 += " - " + arr;
                }
                else
                {
                    t5_t3 = show[i];
                }
            }
        }
        else if (tiet == 4)
        {
            for (int i = 0; i < show.Length; i++)
            {
                if (getTKB.Count() > 1)
                {
                    arr = show[i];
                    t5_t4 += " - " + arr;
                }
                else
                {
                    t5_t4 = show[i];
                }
            }
        }
        else if (tiet == 5)
        {
            for (int i = 0; i < show.Length; i++)
            {
                if (getTKB.Count() > 1)
                {
                    arr = show[i];
                    t5_t5 += " - " + arr;
                }
                else
                {
                    t5_t5 = show[i];
                }
            }
        }
        else if (tiet == 6)
        {
            for (int i = 0; i < show.Length; i++)
            {
                if (getTKB.Count() > 1)
                {
                    arr = show[i];
                    t5_t6 += " - " + arr;
                }
                else
                {
                    t5_t6 = show[i];
                }
            }
        }
        else if (tiet == 7)
        {
            for (int i = 0; i < show.Length; i++)
            {
                if (getTKB.Count() > 1)
                {
                    arr = show[i];
                    t5_t7 += " - " + arr;
                }
                else
                {
                    t5_t7 = show[i];
                }
            }
        }
        else if (tiet == 8)
        {
            for (int i = 0; i < show.Length; i++)
            {
                if (getTKB.Count() > 1)
                {
                    arr = show[i];
                    t5_t8 += " - " + arr;
                }
                else
                {
                    t5_t8 = show[i];
                }
            }
        }
    }
    protected void getThu6(int tiet)
    {
        var checkuserid = (from u in db.admin_Users where u.username_username == Request.Cookies["UserName"].Value select u).First();
        var getTKB = from tkb in db.tbThoiKhoaBieuTungGiaoViens
                     where tkb.giaovien_id == checkuserid.username_id && tkb.tkb_tiet == tiet && tkb.thu_id == 5
                     select new
                     {
                         tkb.tkb_thu6,
                     };

        string lich = string.Join(",", getTKB.Select(x => x.tkb_thu6));
        string[] show = lich.Split(',');

        var arr = "";

        if (tiet == 1)
        {
            for (int i = 0; i < show.Length; i++)
            {
                if (getTKB.Count() > 1)
                {
                    arr = show[i];
                    t6_t1 += " - " + arr;
                }
                else
                {
                    t6_t1 = show[i];
                }
            }
        }
        else if (tiet == 2)
        {
            for (int i = 0; i < show.Length; i++)
            {
                if (getTKB.Count() > 1)
                {
                    arr = show[i];
                    t6_t2 += " - " + arr;
                }
                else
                {
                    t6_t2 = show[i];
                }
            }
        }
        else if (tiet == 3)
        {
            for (int i = 0; i < show.Length; i++)
            {
                if (getTKB.Count() > 1)
                {
                    arr = show[i];
                    t6_t3 += " - " + arr;
                }
                else
                {
                    t6_t3 = show[i];
                }
            }
        }
        else if (tiet == 4)
        {
            for (int i = 0; i < show.Length; i++)
            {
                if (getTKB.Count() > 1)
                {
                    arr = show[i];
                    t6_t4 += " - " + arr;
                }
                else
                {
                    t6_t4 = show[i];
                }
            }
        }
        else if (tiet == 5)
        {
            for (int i = 0; i < show.Length; i++)
            {
                if (getTKB.Count() > 1)
                {
                    arr = show[i];
                    t6_t5 += " - " + arr;
                }
                else
                {
                    t6_t5 = show[i];
                }
            }
        }
        else if (tiet == 6)
        {
            for (int i = 0; i < show.Length; i++)
            {
                if (getTKB.Count() > 1)
                {
                    arr = show[i];
                    t6_t6 += " - " + arr;
                }
                else
                {
                    t6_t6 = show[i];
                }
            }
        }
        else if (tiet == 7)
        {
            for (int i = 0; i < show.Length; i++)
            {
                if (getTKB.Count() > 1)
                {
                    arr = show[i];
                    t6_t7 += " - " + arr;
                }
                else
                {
                    t6_t7 = show[i];
                }
            }
        }
        else if (tiet == 8)
        {
            for (int i = 0; i < show.Length; i++)
            {
                if (getTKB.Count() > 1)
                {
                    arr = show[i];
                    t6_t8 += " - " + arr;
                }
                else
                {
                    t6_t8 = show[i];
                }
            }
        }
    }

    //protected void btnImport_ServerClick(object sender, EventArgs e)
    //{
    //    //string path = @"D:\Company\vietnhatschool\quantri_vietnhatschool\Excel Files\QUYNH-Danh sách học sinh NH 2022-2023.xlsx";
    //    //string connect = "Provide=Microsoft.ACE.OLEDB.12.0;Data Source =" + path + ";Extended Properties=Excel 12.0;";

    //    //DataSet ds = new DataSet();

    //    //OleDbConnection oleDbConnection = new OleDbConnection(connect);
    //    //OleDbCommand cmd = new OleDbCommand("select N'Họ và tên học sinh',N'Ngày sinh',N'Giới tính',Ba,SDT ba,N'Mẹ',N'SDT mẹ','Ghi chú', " +
    //    //    "Unit From [1-1]", oleDbConnection);
    //    //OleDbDataAdapter oleDbDataAdapter = new OleDbDataAdapter(cmd);
    //    //oleDbDataAdapter.Fill(ds);
    //    //oleDbConnection.Open();

    //    //DbDataReader dbDataReader = cmd.ExecuteReader();

    //    //string connectString = ConfigurationManager.ConnectionStrings["db_vietnhatschoolConnectionString"].ConnectionString;
    //    ////string connectString = @"Data Source=103.90.233.59,1433;Initial Catalog=db_vietnhatschool;User ID=admin_website_vietnhat;Password=***********";

    //    //SqlBulkCopy bulkCopy = new SqlBulkCopy(connectString);
    //    //bulkCopy.DestinationTableName = "tbHocSinh";
    //    //bulkCopy.WriteToServer(dbDataReader);

    //    //oleDbConnection.Close();
    //}
}