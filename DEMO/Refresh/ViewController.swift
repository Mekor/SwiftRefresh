//
//  ViewController.swift
//  Refresh
//
//  Created by Mekor on 2016/11/24.
//  Copyright © 2016年 Mekor. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    //刷新控件
//    var myrefreshControl:MKRefreshControl?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        tableView.addRefreshHeader(target: self, action: #selector(loadData))
    }
    
    
    //加载数据 具体由子类负责
    @objc private func loadData() {
        //如果子类不实现 默认关闭刷新
        let when = DispatchTime.now() + 3.0
        DispatchQueue.main.asyncAfter(deadline: when, execute: {
            print("加载数据...")
            self.tableView.endRefreshing()
        })
    }
}
