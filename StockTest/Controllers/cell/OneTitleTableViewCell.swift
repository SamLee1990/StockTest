//
//  OneTitleTableViewCell.swift
//  StockTest
//
//  Created by 李世文 on 2022/8/4.
//

import UIKit

class OneTitleTableViewCell: UITableViewCell {
    
    let titleLabel: UILabel = UILabel()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
    }
    
    func setupUI() {
        backgroundColor = UIColor.label
        
        titleLabel.font = UIFont.systemFont(ofSize: CGFloat(20))
        titleLabel.textColor = UIColor.red
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupData(title: String) {
        titleLabel.text = title
    }
    
}
