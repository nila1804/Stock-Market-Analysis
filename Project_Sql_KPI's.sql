Use synthetic_stock;

SELECT * FROM STOCK_DATA;
                                      -- KPI: 1 --
-- Average Daily Trading Volume

SELECT Ticker, AVG(Volume) AS Average_Daily_Trading_Volume
FROM stock_data
GROUP BY Ticker;

                                      -- KPI:2 --
--     Most Volatile Stocks
                                  

SELECT Ticker,MAX(Beta) as Most_Volatile_Stock FROM stock_data
GROUP BY Ticker;


                                        -- KPI: 3 --
 -- Stocks with Highest Dividend and Lowest Dividend
                                       
SELECT Ticker, 
       MAX(Dividend_Amount) AS Highest_Dividend, 
       MIN(CASE WHEN Dividend_Amount > 0 THEN Dividend_Amount ELSE NULL END) AS Lowest_Dividend
FROM stock_data
GROUP BY Ticker
ORDER BY Highest_Dividend DESC, Lowest_Dividend ASC;


									   -- KPI:4 --
--   Highest and Lowest P/E Ratios                                     
 
select ticker as Com_Name,max(pe_ratio) as High_PE_Ratio,min(pe_ratio) as Low_PE_Ratio 
from Stock_data
group by ticker
order by High_PE_Ratio desc,Low_pe_ratio desc;

  
                                          -- KPI:5 --
  -- Stocks with Highest Market Cap                                       
  
SELECT ticker AS Company_Name, MAX(market_cap) as highest_market_cap
FROM stock_data
GROUP BY ticker
ORDER BY highest_market_cap DESC;

                                        -- KPI:6 --
-- Stocks Near 52 Week High                                        
SELECT ticker as company_Name, Max(52_Week_High) as 52_week_high  
FROM Stock_data 
group by ticker
ORDER BY 52_week_high DESC ;


                                          -- KPI:7 --
                                          
-- Stocks Near 52 Week Low
SELECT ticker as company_Name, min(52_Week_low) as 52_week_low 
FROM Stock_data
group by ticker   
ORDER BY 52_week_low DESC ;


                                           -- KPI: 8--
 -- Stocks with Strong Buy Signals and stocks with Strong Selling Signal                                         

SELECT ticker, MAX(macd) as macd, MAX(rsi) as rsi
FROM stock_data
WHERE macd < 0 -- MACD below signal line (bearish trend)
AND rsi >= 69 -- RSI 69 or above (potential selling opportunity)
GROUP BY ticker
ORDER BY macd ASC;
  
  







