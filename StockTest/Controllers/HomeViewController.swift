//
//  HomeViewController.swift
//  StockTest
//
//  Created by 李世文 on 2022/8/4.
//

import UIKit

class HomeViewController: UIViewController {
    
    let tableView: UITableView = UITableView()
    
    let stocks: Array<(String, String)> = [("2330", "台積電")]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupUI()
    }
    
    func setupUI() {
        title = "股票"
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "OneTitleTableViewCell", bundle: nil), forCellReuseIdentifier: "OneTitleTableViewCell")
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

}

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        stocks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "OneTitleTableViewCell", for: indexPath) as? OneTitleTableViewCell else {
           return UITableViewCell()
        }
        
        let row = indexPath.row
        cell.setupData(title: stocks[row].1 + stocks[row].0)
        
        return cell
    }
    
    
}

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let controller = storyboard?.instantiateViewController(withIdentifier: "LineChartsViewController") as? LineChartsViewController else {
            return
        }
        let row = indexPath.row
        controller.title = stocks[row].1 + stocks[row].0 + "(河流圖)"
        controller.stockID = stocks[row].0
        navigationController?.pushViewController(controller, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}


