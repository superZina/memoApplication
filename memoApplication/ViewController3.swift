//
//  ViewController3.swift
//  memoApplication
//
//  Created by 이진하 on 2020/04/03.
//  Copyright © 2020 이진하. All rights reserved.
//

import UIKit

class ViewController3: UIViewController {

    @IBAction func BackToVC1(_ sender: UIButton) {
        _ = navigationController?.popViewController(animated: true)
    }
    @IBOutlet weak var tit: UITextField!
    @IBOutlet weak var content: UITextView!
    var detailData: memo = memo(Title: "", Content: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tit.text = detailData.Title
        content.text = detailData.Content
        // Do any additional setup after loading the view.
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
