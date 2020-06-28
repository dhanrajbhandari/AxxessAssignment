//
//  InfoDetailViewController.swift
//  AxxessAssignment
//
//  Created by Dhanraj Subhash Bhandari on 28/06/20.
//  Copyright © 2020 Dhanraj Subhash Bhandari. All rights reserved.
//

import UIKit

class InfoDetailViewController: UIViewController {

    lazy var infoView = InfoUIView(type: .ViewController)

    private var infoData: InfoListDataModel?
    
    //MARK: - Default Methods
    // Initilization with data model . Dependency injection
    init(infoData: InfoListDataModel) {
        super.init(nibName: nil, bundle: nil)
        self.infoData = infoData
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Info Details"
        configureView()
        self.view.backgroundColor = .white
    }
    
    //MARK: - Private Method
    private func configureView(){
        
        self.view.addSubview(infoView)
       infoView.snp.makeConstraints { (make) in
        make.left.equalToSuperview()
        make.right.equalToSuperview()
        make.top.equalToSuperview()
       }
        if let data = self.infoData{
            infoView.updateView(infoData: data)
        }
    }

}
