using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace Core
{
    public class WebCrawler:Database
    {
        public WebCrawler()
        {

        }

        public bool AddGraphics(int ranking,string graphics,string chart,int score)
        {
            ExecuteSql("insert into Graphics (排名,显卡,图形,分数) values(@排名,@显卡,@图形,@分数)", new SqlParameter[] { new SqlParameter("@排名", ranking),
                new SqlParameter("@显卡", graphics),
                new SqlParameter("@图形", chart),
                new SqlParameter("@分数", score),
            });
            return true;
        }
    }
}
