//
//  ViewController.swift
//  memoApplication
//
//  Created by 이진하 on 2020/04/01.
//  Copyright © 2020 이진하. All rights reserved.
//

import UIKit

struct memo{
    var Title: String?
    var Content: String?
    
    init(Title: String?, Content: String?){
        self.Title = Title
        self.Content = Content
    }
}

    var memoList: [memo] = [
    memo(Title: "메모1",Content: "1111111111111")
    ]

class ViewController: UITableViewController{
    

    @IBOutlet weak var memoTable: UITableView!
    //nav바 버튼
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let memoCellNib = UINib(nibName: "memoCell", bundle: nil)
        self.memoTable.register(memoCellNib, forCellReuseIdentifier: "memoCell")
        self.memoTable.delegate = self
        self.memoTable.dataSource = self
        self.memoTable.rowHeight = UITableView.automaticDimension
        self.memoTable.estimatedRowHeight = 550.0
    }
    override func viewWillAppear(_ animated: Bool) {
        self.memoTable.reloadData()
    }

}

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "memoCell", for: indexPath) as? memoCell else { return UITableViewCell() }
        cell.title.text = memoList[indexPath.row].Title
        cell.title.font = UIFont.boldSystemFont(ofSize: 16.0)
        cell.content.text = memoList[indexPath.row].Content
        cell.content.preferredMaxLayoutWidth = 240
        return cell
    }
