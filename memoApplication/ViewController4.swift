//
//  ViewController4.swift
//  memoApplication
//
//  Created by 이진하 on 2020/07/31.
//  Copyright © 2020 이진하. All rights reserved.
//

import UIKit

class ViewController4: UIViewController {

    @IBOutlet weak var textField: UITextField!
    override func viewWillAppear(_ animated: Bool) {
        print("view will appear in VC4")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("view completely appeared in VC4")
        // Do any additional setup after loading the view.
    }
    

    override func viewWillDisappear(_ animated: Bool) {
        print("view will disappear in VC4")
    }
    override func viewDidDisappear(_ animated: Bool) {
        print("view completely disappeared in VC4")
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
