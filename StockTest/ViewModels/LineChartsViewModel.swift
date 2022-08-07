//
//  LineChartsViewModel.swift
//  StockTest
//
//  Created by 李世文 on 2022/8/5.
//

import Foundation

struct LineChartViewModel {
    let stockData: StockData
    var highlightX: Double = 11
}

extension LineChartViewModel {
    
    // 股價
    var stockPriceArray: Array<String> {
        return stride(from: 11, through: 0, by: -1).map { (i) -> String in
            stockData.河流圖資料[i].月平均收盤價
        }
    }
    
    var 本益比股價基準Array: Array<Array<String>> {
        return (0..<6).map { (i) -> [String] in
            return stride(from: 11, through: 0, by: -1).map { (j) -> String in
                stockData.河流圖資料[j].本益比股價基準[i]
            }
        }
    }
    
    // 本益比
    var perArray: Array<Array<String>> {
        return (0..<6).map { (i) -> [String] in
            return stride(from: 11, through: 0, by: -1).map { (j) -> String in
                let 本益比股價基準 = Double(stockData.河流圖資料[j].本益比股價基準[i])
                let eps = Double(stockData.河流圖資料[j].近四季EPS)
                var 本益比: String = ""
                if let 本益比股價基準 = 本益比股價基準, let eps = eps {
                    本益比 = String(format: "%.2f", 本益比股價基準 / eps)
                }
                return 本益比
            }
        }
    }
    
    // 所有月份
    var monthArray: Array<String> {
        return stride(from: 11, through: 0, by: -1).map {
            yearMonthFormatter(yearmonth: stockData.河流圖資料[$0].年月)
        }
    }
    
    func yearMonthFormatter(yearmonth: String) -> String {
        var monthStr = yearmonth
        let index = monthStr.index(monthStr.endIndex, offsetBy: -2)
        monthStr.insert("/", at: index)
        return monthStr
    }
}
