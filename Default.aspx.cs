﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["hocsinhvietnhat"] != null)
        {
           
        }
        else
        {
            Response.Redirect("/login.html");
        }
        //var getSach = from s in db.tbSaches select s;
        //rpSach.DataSource = getSach;
        //rpSach.DataBind();

    }
}