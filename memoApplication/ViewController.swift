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

   

class ViewController: UIViewController, SaveDataDelegate, EditDataDelegate{
    
    @IBOutlet weak var memoTable: UITableView!
    //nav바 버튼
    var memoList: [memo] = [
       memo(Title: "메모1",Content: "1111111111111")
       ]
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "add"{
        let destination = segue.destination as! ViewController2
            destination.delegate = self
        }
        if segue.identifier == "detail"{
            (segue.destination as! ViewController3).detailData = memoList[(self.memoTable.indexPathForSelectedRow)!.row]
            let destination = segue.destination as! ViewController3
            destination.delegate = self
        }
    }
    func saveData(data saveData:memo){
        memoList.append(saveData)
        memoTable.reloadData()
    }
    func editData(data editData:memo){
        memoList[(self.memoTable.indexPathForSelectedRow)!.row] = editData
        memoTable.reloadData()
    }

}

extension ViewController: UITableViewDelegate,UITableViewDataSource{
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "detail", sender: nil)
    }
}

