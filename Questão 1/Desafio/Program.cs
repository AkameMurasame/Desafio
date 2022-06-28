using Models;
using Services;
using System;
using System.Collections.Generic;

namespace Desafio
{
    internal class Program
    {
        static void Main(string[] args)
        {
            var trade1 = new Trade() { Value = 2000000, ClientSector = "Private" };
            var trade2 = new Trade() { Value = 400000, ClientSector = "Public" };
            var trade3 = new Trade() { Value = 500000, ClientSector = "Public" };
            var trade4 = new Trade() { Value = 3000000, ClientSector = "Public" };
            var portfolio = new List<ITrade>() { trade1, trade2, trade3, trade4 };

            var service = new TradeService();
            var result = service.procesarTrades(portfolio);

            foreach (var s in result)
            {
                Console.WriteLine(s);
            }
        }
    }
}
