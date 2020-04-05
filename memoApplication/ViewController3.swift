//
//  ViewController3.swift
//  memoApplication
//
//  Created by 이진하 on 2020/04/03.
//  Copyright © 2020 이진하. All rights reserved.
//

import UIKit

protocol EditDataDelegate {
    func editData(data editData:memo)
}

class ViewController3: UIViewController {

    var delegate:EditDataDelegate?
    
   
    @IBOutlet weak var tit: UITextField!
    @IBOutlet weak var content: UITextView!
    var detailData: memo = memo(Title: "", Content: "")
    @IBAction func BackToVC1(_ sender: UIButton) {
           detailData.Title = self.tit.text
           detailData.Content = self.content.text
           delegate?.editData(data: detailData)
           _ = navigationController?.popViewController(animated: true)
       }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        tit.text = detailData.Title
        content.text = detailData.Content
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
