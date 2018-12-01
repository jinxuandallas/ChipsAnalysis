using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace Core
{
    public class business:Database
    {
        public business()
        {

        }

        //public bool UpdateCPUPriceandPerformance(int id,double price,double costPerformance)
        //{
        //    ExecuteSql("update CPU set 价格=@价格,性价比=@性价比 where id=@id", new SqlParameter[] { new SqlParameter ("@价格",price),
        //        new SqlParameter("@性价比",costPerformance),
        //        new SqlParameter("@id",id)
        //    });
        //    return true;
        //}

        public bool UpdatePriceandPerformance(string tablename, int id, double price, double costPerformance)
        {
            ExecuteSql("update " + tablename + " set 价格=@价格,性价比=@性价比 where id=@id", new SqlParameter[] { new SqlParameter ("@价格",price),
                new SqlParameter("@性价比",costPerformance),
                new SqlParameter("@id",id)
            });
            return true;
        }
    }
}
