//
//  ListViewController.swift
//  AxxessAssignment
//
//  Created by Dhanraj Subhash Bhandari on 27/06/20.
//  Copyright © 2020 Dhanraj Subhash Bhandari. All rights reserved.
//

import UIKit
import SnapKit

class ListViewController: UIViewController {

    lazy var listTableView: UITableView = {
        
        let tableview = UITableView()
        tableview.backgroundColor = .white
        self.view.addSubview(tableview)
        tableview.snp.makeConstraints { (make) in
            
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        tableview.register(InfoTableViewCell.self, forCellReuseIdentifier: InfoTableViewCell.infoTableViewCellIdentifier)
        tableview.delegate = self
        tableview.dataSource = self
       // tableview.separatorStyle = .none
        tableview.rowHeight = UITableView.automaticDimension
        tableview.estimatedRowHeight = 100
        return tableview
    }()
    
    lazy var activityIndicator : UIActivityIndicatorView = {
        let indicatorView = UIActivityIndicatorView.init(style: .large)
        indicatorView.color = .black
        self.listTableView.addSubview(indicatorView)
        indicatorView.hidesWhenStopped = true
        
        indicatorView.snp.makeConstraints { (make) in
            make.width.equalTo(100)
            make.height.equalTo(100)
            make.centerX.equalTo(view)
            make.centerY.equalTo(view)
        }
        return indicatorView
    }()
    var infoList:[InfoListDataModel] = []
    
   //MARK:- Default Method

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.title = "Information List"

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        loadInfloList()
        
    }
    //MARK: - Private method
    private func loadInfloList(){
        
        self.activityIndicator.startAnimating()
        
        NetworkManager.shared.get(urlString: APIURL.getInfoList) { [weak self] result in
            
            DispatchQueue.main.async {
                self?.activityIndicator.stopAnimating()

            }
            switch result {
                
            case .failure(let err):
                self?.showAlert(title: "Warning", message: err.localizedDescription)
            case .success(let data):
                let jsondecoder = JSONDecoder()
                do {
                     var list = try jsondecoder.decode([InfoListDataModel].self, from: data)
                    
                   list = list.sorted { (data1, data2) -> Bool in
                        data1.type.rawValue < data2.type.rawValue
                    }
                    self?.infoList = list
                    DispatchQueue.main.async {
                        self?.listTableView.reloadData()
                    }
                    
                }catch {
                    self?.showAlert(title: "Warning", message: "Error in data parsing")

                }
                
            }
        }
    }
    
    private func showAlert(title: String, message: String){
        let alertVCObj = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        alertVCObj.addAction(UIAlertAction.init(title: "OK", style: .default, handler: { (action) in
            
        }))
        
        present(alertVCObj, animated: true) {
                
        }
    }
}
//MARK:- UITableView Datasource
extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.infoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: InfoTableViewCell.infoTableViewCellIdentifier) as? InfoTableViewCell {
            
            cell.updateView(infoData: self.infoList[indexPath.row])
            return cell
        }
        
        return UITableViewCell()
    }
    
    
}
//MARK:- UITableView Delegate

extension ListViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
         let detailVCObj = InfoDetailViewController(infoData: self.infoList[indexPath.row])
        self.navigationController?.pushViewController(detailVCObj, animated: true)
        
    }
    
}
