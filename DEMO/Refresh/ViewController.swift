//
//  ViewController.swift
//  Refresh
//
//  Created by Mekor on 2016/11/24.
//  Copyright © 2016年 Mekor. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //刷新控件
    var myrefreshControl:MKRefreshControl?
    
    @IBOutlet weak var tableView: UITableView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        //添加刷新控件
        myrefreshControl = MKRefreshControl()
        
        tableView.addSubview(myrefreshControl!)
        //添加监听方法
        myrefreshControl?.addTarget(self, action: #selector(loadData), for: .valueChanged)
        
//        myrefreshControl?.beginRefreshing()
    }
    
    
    //加载数据 具体由子类负责
    func loadData() {
        //如果子类不实现 默认关闭刷新
        let when = DispatchTime.now() + 3.0
        DispatchQueue.main.asyncAfter(deadline: when, execute: {
            self.myrefreshControl?.endRefreshing()

        })
    }


}

