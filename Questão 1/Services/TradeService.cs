using Models;
using System;
using System.Collections.Generic;

namespace Services
{
    public class TradeService : ITradeService
    {
        public IList<string> procesarTrades(IList<ITrade> trades)
        {
            var tradeCategories = new List<string>();
            foreach (ITrade trade in trades)
            {
                switch (trade.ClientSector)
                {
                    case "Private":
                        tradeCategories.Add(tratarPrivateSector(trade));
                        break;
                    case "Public":
                        tradeCategories.Add(tratarPublicSector(trade));
                        break;
                    default:
                        throw new NotImplementedException();
                }
            }

            return tradeCategories;
        }

        private string tratarPublicSector(ITrade trade)
        {
            if (trade.Value > 1000000)
            {
                return "LOWRISK";
            }
            else if (trade.Value < 1000000)
            {
                return "MEDIUMRISK";
            }
            throw new NotImplementedException();
        }

        private string tratarPrivateSector(ITrade trade)
        {
            if (trade.Value > 1000000)
            {
                return "HIGHRISK";
            }
            throw new NotImplementedException();
        }
    }
}
