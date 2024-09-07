﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_MasterPage : System.Web.UI.MasterPage
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    public string adminName, count, ThongBao_SoLieu, count_congvannoibo, count_congvanmoi;
    public int UserID;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["UserName"] != null)
        {
            // admin_User getusername = Session["AdminLogined"] as admin_User;
            adminName = Request.Cookies["UserName"].Value;
            loadMenu();
            // Hiển thị số liệu thông báo trên menu trái
            if(adminName=="bld01")
            {
                bl_congvannoibo.Visible = true;
                count_congvannoibo = (from cvnb in db.tbQuanLyCongVanDis where cvnb.loaicongvan_id == 2 && cvnb.congvan_tinhtrang_dachuyen=="Đã chuyển chờ duyệt" select cvnb).Count() + "";
                bl_congvanmoi.Visible = true;
                count_congvanmoi = (from cvnb in db.tbQuanLyCongVanDis where cvnb.loaicongvan_id == 1 && cvnb.congvan_tinhtrang_dachuyen=="Đã chuyển"  select cvnb).Count() + "";
                bl_dugio.Visible = false;
            }
            else
            {
                bl_congvannoibo.Visible = false;
                bl_congvanmoi.Visible = false;
                bl_dugio.Visible = true;
            }
            //get thông báo dự giờ 
            //var getMS = from ms in db.tbThuVien_BookSaches
            //            where ms.active == false && ms.hidden == null
            //            select ms;
            //count = getMS.Count() + "";
            //if (count == "0")
            //    txtNotification.Visible = false;
            //else
            //    txtNotification.Visible = true;
            var dugio = from a in db.tbHocTap_DuGios
                        join ct in db.tbLichBaoGiangChiTiets on a.lichbaogiangchitiet_id equals ct.lichbaogiangchitiet_id
                        join t in db.tbLichBaoGiangTheoTuans on ct.lichbaogiangtheotuan_id equals t.lichbaogiangtheotuan_id
                        join u in db.admin_Users on a.nguoibidugio_id equals u.username_id
                        where a.hidden == false
                        && u.username_username == Request.Cookies["UserName"].Value
                        && t.lichbaogiangtheotuan_ngayhoc >= DateTime.Now
                        select a;
            count = dugio.Count() + "";
            if (count == "0")
                txtNotification.Visible = false;
            else
                txtNotification.Visible = true;
            //chuyển sang trang profile nếu click vào item profile
            var getUser = (from u in db.admin_Users
                          where u.username_username == Request.Cookies["UserName"].Value
                          select u).FirstOrDefault();
            UserID = Convert.ToInt32(getUser.username_id);

        }
        else
        {
            Response.Redirect("/admin-login");
        }
    }
    protected void btnLogout_ServerClick(object sender, EventArgs e)
    {
        HttpCookie ck = new HttpCookie("UserName");
        string s = ck.Value;
        ck.Value = "";  //set a blank value to the cookie 
        ck.Expires = DateTime.Now.AddDays(-1);
        Response.Cookies.Add(ck);
        Response.Redirect("/admin-login");
    }
    protected void rpModule_Init(object sender, EventArgs e)
    {
        if (Request.Cookies["UserName"] != null)
        {
            admin_User logedMember = (from tk in db.admin_Users where tk.username_username == Request.Cookies["UserName"].Value select tk).SingleOrDefault();
            var getMenu = from tb in db.admin_Modules
                          orderby tb.module_position
                          where (from f in db.admin_Forms
                                 join gu in db.admin_GroupUsers on logedMember.groupuser_id equals gu.groupuser_id
                                 join guf in db.admin_AccessGroupUserForms on f.form_id equals guf.form_id
                                 join uf in db.admin_AccessUserForms on f.form_id equals uf.form_id
                                 where f.module_id == tb.module_id
                                 && guf.groupuser_id == gu.groupuser_id
                                 select f).ToList().Count >= 1
                              && (from agm in db.admin_AccessGroupUserModules
                                  join gu in db.admin_GroupUsers on logedMember.groupuser_id equals gu.groupuser_id
                                  where tb.module_id == agm.module_id
                                  && logedMember.groupuser_id == agm.groupuser_id
                                  select agm).Single().module_id == tb.module_id
                          select new
                          {
                              tb.module_id,
                              tb.module_name,
                              open0 = db.admin_Forms.Where(x => "/" + x.form_link == HttpContext.Current.Request.Url.AbsolutePath && x.module_id == tb.module_id).Count() > 0 ? "open" : "",
                              open = db.admin_Forms.Where(x => "/" + x.form_link == HttpContext.Current.Request.Url.AbsolutePath && x.module_id == tb.module_id).Count() > 0 ? "collapse in" : ""
                          };
            //db.Admin_Forms.FirstOrDefault(x=>x.module_id == tb.module_id).form_link
            //ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Test", "alert(" + getMenu.FirstOrDefault().open0 + ")", true);
            rpModule.DataSource = getMenu;
            rpModule.DataBind();


        }
    }
    private void loadMenu()
    {
        admin_User logedMember = (from tk in db.admin_Users where tk.username_username == Request.Cookies["UserName"].Value select tk).SingleOrDefault();
        int _idUser = Convert.ToInt32(logedMember.username_id);
        int _idGUer = Convert.ToInt32(logedMember.groupuser_id);

        var getMenu = from gum in db.admin_AccessGroupUserModules
                      join m in db.admin_Modules on gum.module_id equals m.module_id
                      orderby m.module_position
                      where gum.groupuser_id == _idGUer
                      && gum.gum_active == true
                      && (from f in db.admin_Forms
                          join guf in db.admin_AccessGroupUserForms on f.form_id equals guf.form_id
                          join uf in db.admin_AccessUserForms on guf.form_id equals uf.form_id
                          where f.module_id == m.module_id
                          && guf.groupuser_id == _idGUer
                          && guf.guf_active == true
                          && uf.uf_active == true
                          && uf.username_id == _idUser
                          select f).Count() > 0
                      select new
                      {
                          gum.module_id,
                          m.module_name,
                          open0 = db.admin_Forms.Where(x => "/" + x.form_link == HttpContext.Current.Request.Url.AbsolutePath && x.module_id == m.module_id).Count() > 0 ? "open" : "",
                          open = db.admin_Forms.Where(x => "/" + x.form_link == HttpContext.Current.Request.Url.AbsolutePath && x.module_id == m.module_id).Count() > 0 ? "collapse in" : ""
                      };

        rpModule.DataSource = getMenu;
        rpModule.DataBind();
    }
    protected void rpModule_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        admin_User logedMember = (from tk in db.admin_Users where tk.username_username == Request.Cookies["UserName"].Value select tk).SingleOrDefault();
        int _idGUser = Convert.ToInt32(logedMember.groupuser_id);
        int _idUser = Convert.ToInt32(logedMember.username_id);
        Repeater rpForm = e.Item.FindControl("rpForm") as Repeater;
        int _idForm = Convert.ToInt32(DataBinder.Eval(e.Item.DataItem, "module_id").ToString());
       
        var getForm = from tb in db.admin_Forms
                      join gu in db.admin_GroupUsers on _idGUser equals gu.groupuser_id
                      join guf in db.admin_AccessGroupUserForms on tb.form_id equals guf.form_id
                      join uf in db.admin_AccessUserForms on tb.form_id equals uf.form_id
                      where tb.module_id == _idForm
                      && tb.form_active == true
                      && guf.groupuser_id == gu.groupuser_id
                      && guf.guf_active == true
                      && uf.username_id == _idUser
                      && uf.uf_active == true
                      orderby tb.form_position
                      select new
                      {
                          tb.form_id,
                          tb.form_name,
                          tb.form_link,
                          active = "/" + tb.form_link == HttpContext.Current.Request.Url.AbsolutePath ? "active_1" : "",
                         
                      };

        rpForm.DataSource = getForm;
        rpForm.DataBind();
    }

}
