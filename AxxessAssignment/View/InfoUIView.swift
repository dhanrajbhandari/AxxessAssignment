//
//  InfoUIView.swift
//  AxxessAssignment
//
//  Created by Dhanraj Subhash Bhandari on 28/06/20.
//  Copyright © 2020 Dhanraj Subhash Bhandari. All rights reserved.
//

import UIKit

enum InfoViewFor {
    case TableViewCell
    case ViewController
}
class InfoUIView: UIView {

    // MARK: - Variable Declaration
    
    var viewFor: InfoViewFor = .TableViewCell

    lazy var idLabel : UILabel = {
        let label = UILabel(frame: .zero)
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.text = ""
        return label
    }()
    lazy var typeLabel : UILabel = {
        let label = UILabel(frame: .zero)
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.text = ""
        return label
    }()
    
    lazy var dateLabel : UILabel = {
        let label = UILabel(frame: .zero)
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.text = ""
        return label
    }()
    lazy var dataLabel : UILabel = {
        let label = UILabel(frame: .zero)
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.text = ""
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        
        return label
    }()
    // MARK: - Default Method
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(type: InfoViewFor) {
        super.init(frame: .zero)
        self.viewFor = type
        configureView()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private Method

    private func configureView(){
        self.backgroundColor = .clear
        //Used stackview for vertically align labels
        let stackView = UIStackView(arrangedSubviews: [idLabel,typeLabel,dateLabel,dataLabel])
        stackView.axis = .vertical
        stackView.spacing = 5.0
        stackView.distribution = .fillProportionally
        self.addSubview(stackView)
        stackView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.top.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-10)
        }
    }
    //MARK: - Public Methods

    func updateView(infoData: InfoListDataModel)  {
        
        self.idLabel.text = "ID: \(infoData.id)"
        self.typeLabel.text = "Type: \(infoData.type)"
        self.dateLabel.text = "Date: \(infoData.date ?? "")"
        self.dataLabel.text = "Info: \(infoData.data ?? "")"
        
    }
    
}
