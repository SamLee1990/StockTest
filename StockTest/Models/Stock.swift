//
//  Stock.swift
//  StockTest
//
//  Created by 李世文 on 2022/8/5.
//

import Foundation

struct Stock: Codable {
    let data: Array<StockData>
}

struct StockData: Codable {
    let 股票代號: String
    let 股票名稱: String
    let 河流圖資料: Array<RiverData>
}

struct RiverData: Codable {
    let 年月: String
    let 月平均收盤價: String
    let 近四季EPS: String
    let 月近四季本益比: String
    let 本益比股價基準: Array<String>
    let 近一季BPS: String
    let 月近一季本淨比: String
    let 本淨比股價基準: Array<String>
    let 平均本益比: String?
    let 平均本淨比: String?
    let 近3年年複合成長: String?
}

extension Stock {
    
    static func oneStock(stockID: String) -> Resource<Stock> {
        guard let url = URL.stockAPI(stockID: stockID) else {
            fatalError("URL is not defined!")
        }
        
        return Resource<Stock>(url: url)
    }

}
