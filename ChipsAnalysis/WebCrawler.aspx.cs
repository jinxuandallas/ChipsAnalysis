using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HtmlAgilityPack;
using System.IO;
using Core;

namespace ChipsAnalysis
{
    public partial class WebCrawler : System.Web.UI.Page
    {
        protected Core.WebCrawler wc;
        protected void Page_Load(object sender, EventArgs e)
        {
            wc = new Core.WebCrawler();
        }

        protected void Button_Graphics_Click(object sender, EventArgs e)
        {
            string[] data = new string[4];
            string cpuData = File.ReadAllText("e:\\gpu.txt");
            HtmlDocument htmlDoc = new HtmlDocument();
            htmlDoc.LoadHtml(cpuData);
            HtmlNodeCollection hnc = htmlDoc.DocumentNode.SelectSingleNode("//tbody").SelectNodes("tr");

            foreach (HtmlNode hn in hnc)
            {
                int i = 0;
                HtmlNodeCollection hncT = hn.SelectNodes("td");
                foreach (HtmlNode hn2 in hncT)
                {
                    if (hn2.SelectSingleNode("img") != null)
                        data[i] = hn2.SelectSingleNode("img").GetAttributeValue("width", "");
                    //Response.Write(hn2.SelectSingleNode("img").GetAttributeValue("width", "") + "\t\t");
                    else
                        data[i] = hn2.InnerText;
                    i++;
                }


            
                wc.AddGraphics(int.Parse(data[0]), data[1], data[2], int.Parse(data[3]));
                /*
                com = new SqlCommand("insert into CPU (排名,处理器,图形,分数) values(@排名,@处理器,@图形,@分数)", cn);
                //SqlParameterCollection sqlParameterCollection = new SqlParameterCollection();
                com.Parameters.Add("@排名", SqlDbType.Int);
                com.Parameters.Add("@处理器", SqlDbType.NVarChar);
                com.Parameters.Add("@图形", SqlDbType.NVarChar);
                com.Parameters.Add("@分数", SqlDbType.Int);

                com.Parameters["@排名"].Value = int.Parse(data[0]);
                com.Parameters["@处理器"].Value = data[1];
                com.Parameters["@图形"].Value = data[2];
                com.Parameters["@分数"].Value = int.Parse(data[3]);

                //cn.Open();
                com.ExecuteNonQuery();
                //cn.Close();
                */
                //Response.Write(hn2.InnerText + "\t\t");
                //Response.Write("<br>");
                //Response.Write(hn1.InnerText + "<br>");
            }

            //cn.Close();

            Response.Write("Finished.<br>");

        }
    }
}