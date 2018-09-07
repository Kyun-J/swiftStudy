//
//  ViewController.swift
//  test
//
//  Created by 황견주 on 2018. 8. 28..
//  Copyright © 2018년 Kyun Joo, Hwang. All rights reserved.
//

import UIKit

class first_book: UIViewController {
    
    let myBookManager = BookManager()
    
    @IBOutlet weak var outputTextView : UITextView!
    @IBOutlet weak var titleTextField : UITextField!
    @IBOutlet weak var authorTextField : UITextField!
    @IBOutlet weak var genreTextField : UITextField!
    @IBOutlet weak var countLable : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let book1 = Book(name: "햄릿",genre: "비극", author:"셰익스피어")
        let book2 = Book(name: "누구를 위하여 종을 울리나",genre: "전쟁소설", author:"헤밍웨이")
        let book3 = Book(name: "죄와벌",genre: "사실주의", author:"톨스토이")
        
        myBookManager.registerBook(bookObject: book1)
        myBookManager.registerBook(bookObject: book2)
        myBookManager.registerBook(bookObject: book3)
        
        countLable.text = "\(myBookManager.countBooks())"
    }
    
    @IBAction func showAllBookAction(_ sender: Any) {
        print("showAllBookAction")
        outputTextView.text = myBookManager.showAllBooks()
    }
    
    @IBAction func registerAction(_ sender : Any) {
        var bookTemp = Book()
        bookTemp.name = titleTextField.text!
        bookTemp.author = authorTextField.text!
        bookTemp.genre = authorTextField.text!
        if bookTemp.name == "" || bookTemp.author == "" || bookTemp.genre == "" {
            outputTextView.text = "Please fill contents"
        } else {
            myBookManager.registerBook(bookObject: bookTemp)
            outputTextView.text = "\(titleTextField.text!) has been registered."
            countLable.text = "\(myBookManager.countBooks())"
        }
    }
    
    @IBAction func searchAction(_ sender:Any) {
        let resultBook = myBookManager.searchBook(name: titleTextField.text!)
        if resultBook != nil {
            outputTextView.text = resultBook
        } else {
            outputTextView.text = "search failed"
        }
    }
    
    @IBAction func removeAction(_ sender:Any) {
        let result = myBookManager.removeBook(name: titleTextField.text!)!
        if result {
            outputTextView.text = "remove success"
            countLable.text = "\(myBookManager.countBooks())"
        } else {
            outputTextView.text = "remove fail"
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
}
