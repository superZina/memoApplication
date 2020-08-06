//
//  ViewController.swift
//  memoApplication
//
//  Created by 이진하 on 2020/04/01.
//  Copyright © 2020 이진하. All rights reserved.
//

import UIKit


struct memo {
    var Title: String
    var Content: String?
    
    init(Title: String, Content: String){
        self.Title = Title
        self.Content = Content
    }
}



class ViewController: UIViewController, SaveDataDelegate, EditDataDelegate{
    
    @IBAction func presentModally(_ sender: Any) {
    }
    @IBOutlet weak var memoTable: UITableView!
    
    @IBOutlet weak var editBtn: UIBarButtonItem!
    //nav바 버튼
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(true,  animated: true)
        if(editing && !memoTable.isEditing){
            memoTable.setEditing(true, animated: true)
        }else{
            memoTable.setEditing(false, animated: true)
        }
        
    }
    @IBAction  func deleteMemo(_ sender: Any) {
        guard !memoList.isEmpty else {
            return
        }
        memoTable.setEditing(true, animated: true)
        
        self.navigationItem.leftBarButtonItem = doneBtn
    }
    let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneBtnTap))
//    let EditBtn = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(deleteMemo))
    
    @objc func doneBtnTap(){
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        memoTable.setEditing(false, animated: true)
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationItem.leftBarButtonItem = self.editButtonItem;
        // Do any additional setup after loading the view.
        self.navigationItem.leftBarButtonItem = editButtonItem
        editButtonItem.action = #selector(deleteMemo)
        
        let memoCellNib = UINib(nibName: "memoCell", bundle: nil)
        self.memoTable.register(memoCellNib, forCellReuseIdentifier: "memoCell")
        self.memoTable.delegate = self
        self.memoTable.dataSource = self
        self.memoTable.rowHeight = UITableView.automaticDimension
        self.memoTable.estimatedRowHeight = 550.0
        
        doneBtn.style = .plain
        doneBtn.target = self
    }
    var memoList: [memo] = [
          memo(Title: "메모1",Content: "1111111111111")
      ]
      
      override func viewWillDisappear(_ animated: Bool) {
          print("view will disappear in VC1")
      }
    //view가 나타날때 마다 tableView를 reload
    override func viewWillAppear(_ animated: Bool) {
        self.memoTable.reloadData()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //addView로 이동할 떄 delegate,segue 지정
        if segue.identifier == "add"{
            let destination = segue.destination as! ViewController2
            destination.delegate = self
        }
        //editView로 이동할 떄 delegate,segue 지정
        if segue.identifier == "detail"{
            (segue.destination as! ViewController3).detailData = memoList[(self.memoTable.indexPathForSelectedRow)!.row]
            let destination = segue.destination as! ViewController3
            destination.delegate = self
        }
    }
    //add delegate
    func saveData(data saveData:memo){
        memoList.append(saveData)
    }
    //edit delegate
    func editData(data editData:memo){
        memoList[(self.memoTable.indexPathForSelectedRow)!.row] = editData
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
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.memoList.remove(at: indexPath.row)
            self.memoTable.deleteRows(at: [indexPath], with: .fade)
        }
        //        else if editingStyle == .insert{
        //        }
        
    }
//    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
//        return "삭제"
//    }
}

