//
//  ViewController.swift
//  test
//
//  Created by 황견주 on 2018. 8. 28..
//  Copyright © 2018년 Kyun Joo, Hwang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let myBookManager = BookManager()
    
    @IBOutlet weak var outputTextView : UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let book1 = Book(name: "햄릿",genre: "비극", author:"셰익스피어")
        let book2 = Book(name: "누구를 위하여 종을 울리나",genre: "전쟁소설", author:"헤밍웨이")
        let book3 = Book(name: "죄와벌",genre: "사실주의", author:"톨스토이")
        
        myBookManager.registerBook(bookObject: book1)
        myBookManager.registerBook(bookObject: book2)
        myBookManager.registerBook(bookObject: book3)
    }
    
    @IBAction func showAllBookAction(_ sender: Any) {
        print("showAllBookAction")
        outputTextView.text = outputTextView.text + myBookManager.showAllBooks()
    }
    
    @IBAction func registerAction(_ sender : Any) {
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
}
