//
//  AreaFillFormatter.swift
//  StockTest
//
//  Created by ζδΈζ on 2022/8/7.
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
