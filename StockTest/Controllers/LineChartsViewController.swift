//
//  LineChartsViewController.swift
//  StockTest
//
//  Created by 李世文 on 2022/8/4.
//

import UIKit
import Charts

class LineChartsViewController: UIViewController {
    
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var stockPiceLabel: UILabel!
    @IBOutlet var perDataLabelCollection: [UILabel]!
    
    @IBOutlet weak var chartView: LineChartView!
    
    var stockID: String!
    
    var lineChartViewModel: LineChartViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupChartView()
        populateStockData()
    }
    
    /*
    func setupUI() {
        view.backgroundColor = UIColor.systemBackground
        
        chartView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(chartView)
        chartView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        chartView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        chartView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        chartView.heightAnchor.constraint(equalToConstant: 350).isActive = true
    }
     */
    
    func setupChartView() {
        chartView.delegate = self
        
        chartView.noDataText = "目前無資資料供顯示"
        chartView.scaleYEnabled = false
        chartView.doubleTapToZoomEnabled = false
        
        chartView.legend.enabled = false
        chartView.leftAxis.enabled = false
        chartView.rightAxis.drawAxisLineEnabled = false
        
        chartView.drawBordersEnabled = false
        
        let xAxis = chartView.xAxis
        xAxis.labelFont = .systemFont(ofSize: 10)
        xAxis.labelTextColor = .label
        xAxis.labelPosition = .bottom
        xAxis.drawAxisLineEnabled = false
        xAxis.spaceMin = 0.35
        xAxis.spaceMax = 0.35
        xAxis.granularity = 1
        xAxis.granularityEnabled = true
        
        chartView.animate(xAxisDuration: 1)
    }
    
    private func populateStockData() {
        
        Webservice().load(resource: Stock.oneStock(stockID: stockID)) {[weak self] result in
            switch result {
            case .success(let stock):
                self?.lineChartViewModel = LineChartViewModel(stockData: stock.data[0])
                self?.setChartViewData()
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
    func setChartViewData() {
        
        guard let lineChartViewModel = lineChartViewModel else { return }
        
        chartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: lineChartViewModel.monthArray)
        
        /*
        print("本益比股價基準Array count = \(lineChartViewModel.本益比股價基準Array.count)")
        for item in lineChartViewModel.本益比股價基準Array {
            print("本益比股價基準ArrayArray count = \(item.count)")
        }
        print("本益比股價基準Array = \(lineChartViewModel.本益比股價基準Array)")
        */
        
        let dataEntries0 = lineChartViewModel.本益比股價基準Array[0].enumerated().map {
            ChartDataEntry(x: Double($0), y: Double($1) ?? 0)
        }

        let set0 = LineChartDataSet(entries: dataEntries0, label: "DataSet 0")
        set0.setColor(.systemGreen)
        set0.fillColor = .systemGreen
        set0.drawFilledEnabled = true
//        set0.lineWidth = 5

        let dataEntries1 = lineChartViewModel.本益比股價基準Array[1].enumerated().map {
            ChartDataEntry(x: Double($0), y: Double($1) ?? 0)
        }

        let set1 = LineChartDataSet(entries: dataEntries1, label: "DataSet 1")
        set1.setColor(.systemCyan)
        set1.fillColor = .systemCyan
        set1.drawFilledEnabled = true

        let dataEntries2 = lineChartViewModel.本益比股價基準Array[2].enumerated().map {
            ChartDataEntry(x: Double($0), y: Double($1) ?? 0)
        }

        let set2 = LineChartDataSet(entries: dataEntries2, label: "DataSet 2")
        set2.setColor(.systemOrange)
        set2.fillColor = .systemOrange
        set2.drawFilledEnabled = true

        let dataEntries3 = lineChartViewModel.本益比股價基準Array[3].enumerated().map {
            ChartDataEntry(x: Double($0), y: Double($1) ?? 0)
        }

        let set3 = LineChartDataSet(entries: dataEntries3, label: "DataSet 3")
        set3.setColor(.systemPurple)
        set3.fillColor = .systemPurple
        set3.drawFilledEnabled = true

        let dataEntries4 = lineChartViewModel.本益比股價基準Array[4].enumerated().map {
            ChartDataEntry(x: Double($0), y: Double($1) ?? 0)
        }

        let set4 = LineChartDataSet(entries: dataEntries4, label: "DataSet 4")
        set4.setColor(NSUIColor(cgColor: CGColor(red: 115/255, green: 83/255, blue: 15/255, alpha: 1)))
        set4.fillColor = NSUIColor(cgColor: CGColor(red: 115/255, green: 83/255, blue: 15/255, alpha: 1))
        set4.drawFilledEnabled = true

        let dataEntries5 = lineChartViewModel.本益比股價基準Array[5].enumerated().map {
            ChartDataEntry(x: Double($0), y: Double($1) ?? 0)
        }

        let set5 = LineChartDataSet(entries: dataEntries5, label: "DataSet 5")
        set5.setColor(.systemIndigo)
        set5.fillColor = .systemIndigo
        set5.drawFilledEnabled = true
        
        let dataEntries6 = lineChartViewModel.stockPriceArray.enumerated().map {
            ChartDataEntry(x: Double($0), y: Double($1) ?? 0)
        }
        
        let setStockPrice = LineChartDataSet(entries: dataEntries6, label: "StockPrice")
        setStockPrice.setColor(.red)
        setStockPrice.lineWidth = 2
        
        let sets = [set5, set4, set3, set2, set1, set0, setStockPrice]
        for _set in sets {
            _set.axisDependency = .right
            _set.drawValuesEnabled = false
            _set.drawCirclesEnabled = false
            _set.fillAlpha = 1
            _set.drawCircleHoleEnabled = false
            _set.drawHorizontalHighlightIndicatorEnabled = false
            _set.highlightColor = .systemGray
            _set.highlightLineWidth = 1
        }
        
        let data = LineChartData(dataSets: sets)
        chartView.data = data
        chartView.highlightValue(x: lineChartViewModel.highlightX, dataSetIndex: 0, callDelegate: true)
    }
    

}

extension LineChartsViewController: ChartViewDelegate {
    
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        let index = Int(entry.x)
        
        monthLabel.text = lineChartViewModel?.monthArray[index]
        
        stockPiceLabel.text = "股價\(lineChartViewModel?.stockPriceArray[index] ?? "-")"
        
        for (i, perDataLabel) in perDataLabelCollection.enumerated() {
            let per = lineChartViewModel?.perArray[i][index]
            let base = lineChartViewModel?.本益比股價基準Array[i][index]
            perDataLabel.text = "\(per ?? "-")倍\(base ?? "-")"
        }
        
        lineChartViewModel?.highlightX = Double(index)
    }
    
    func chartValueNothingSelected(_ chartView: ChartViewBase) {
        
        if let highlightX = lineChartViewModel?.highlightX {
            chartView.highlightValue(x: highlightX, dataSetIndex: 0)
        }
        
    }
    
}
