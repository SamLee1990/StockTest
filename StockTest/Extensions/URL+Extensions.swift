//
//  URL+Extension.swift
//  StockTest
//
//  Created by ζδΈζ on 2022/8/5.
//

import Foundation

extension URL {
    
    static var base: String {
        return "https://api.nstock.tw/v2/per-river/interview?"
    }
    
    static func stockAPI(stockID: String) -> URL? {
        return URL(string: base + "stock_id=\(stockID)")
    }
    
}
