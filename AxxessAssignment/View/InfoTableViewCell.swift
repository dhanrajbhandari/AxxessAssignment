//
//  InfoTableViewCell.swift
//  AxxessAssignment
//
//  Created by Dhanraj Subhash Bhandari on 28/06/20.
//  Copyright © 2020 Dhanraj Subhash Bhandari. All rights reserved.
//

import UIKit

class InfoTableViewCell: UITableViewCell {

    static let infoTableViewCellIdentifier = "infoTableViewCellIdentifier"
    
    
    lazy var infoView = InfoUIView(type: .TableViewCell)
      
    
    //MARK: - Default Method
    //For Programatically Cell created then need override init method
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
       
        configureView()

    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) method not implemented.")
    }
    
   
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    //MARK: - Private Method

    private func configureView(){
        
        self.addSubview(infoView)
       infoView.snp.makeConstraints { (make) in
           make.edges.equalToSuperview()
       }
    }
    
    //MARK: - Public Methods

    func updateView(infoData: InfoListDataModel)  {
        
        infoView.updateView(infoData: infoData)
  
    }
}
