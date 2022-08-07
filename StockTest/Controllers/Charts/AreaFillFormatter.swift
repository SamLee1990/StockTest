//
//  AreaFillFormatter.swift
//  StockTest
//
//  Created by 李世文 on 2022/8/7.
//

import Foundation
import Charts

class AreaFillFormatter: IFillFormatter {
    var fillLineDataSet: LineChartDataSet?
        
    init(fillLineDataSet: LineChartDataSet) {
        self.fillLineDataSet = fillLineDataSet
    }
    
    public func getFillLinePosition(dataSet: ILineChartDataSet, dataProvider: LineChartDataProvider) -> CGFloat {
        return 0.0
    }
    
    public func getFillLineDataSet() -> LineChartDataSet {
        return fillLineDataSet ?? LineChartDataSet()
    }
}
