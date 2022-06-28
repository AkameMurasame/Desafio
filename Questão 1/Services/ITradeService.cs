using Models;
using System.Collections.Generic;

namespace Services
{
    public interface ITradeService
    {
        public IList<string> procesarTrades(IList<ITrade> trades);
    }
}
