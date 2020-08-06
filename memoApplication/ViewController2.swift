//
//  ViewController2.swift
//  memoApplication
//
//  Created by 이진하 on 2020/04/01.
//  Copyright © 2020 이진하. All rights reserved.
//

import UIKit

protocol SaveDataDelegate:class {
    func saveData(data saveData:memo)
}

class ViewController2: UIViewController, UITextFieldDelegate, UITextViewDelegate {

    var delegate:SaveDataDelegate?
    
    @IBOutlet weak var tit: UITextField!
    @IBOutlet weak var Content: UITextView!
    
    @IBAction func BackToVC1(_ sender: UIButton) {
        var data: memo = memo(Title: self.tit.text!, Content: self.Content.text)
        delegate?.saveData(data: data)
        self.navigationController?.popViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.Content.delegate = self
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        self.tit.becomeFirstResponder() // 제목 텍스트 필드에 포커스
    }
    
//텍스트 필드에서 return을 누르면 content영역으로 키보드 포커스가 넘어감
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        if(textField.isEqual(self.tit)){
//            self.Content.becomeFirstResponder()
//        }
//        return true
//    }
//
    //textView의 placeholder 지정
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "내용을 입력해주세요"{
            textView.text = ""
            textView.textColor = UIColor.black
        }
    }
    //아무런 내용을 적지 않았을 때의 textView의 placeholder 지정
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text == "" {
            textView.text = "내용을 입력해주세요"
            textView.textColor = UIColor.systemGray3
        }
    }
    
    //done을 누르면 키보드 사라짐 : textField
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if(string == "\n"){
            textField.resignFirstResponder()
        }
        return true
    }
    //done을 누르면 키보드 사라짐 : textView
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n"){
            textView.resignFirstResponder()
        }else{}
        return true
    }
    
}
