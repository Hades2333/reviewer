//
//  ViewController.swift
//  SocialAppVK
//
//  Created by Hellizar on 9/26/20.
//

import UIKit

class LoginFormController: UIViewController {
    
    @IBOutlet weak var loginInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    
   
    
    
    @objc func keyboardWasShown(notification: Notification){
        //получаем размер клавиатуры
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        //добавляем отступ внизу UIScrollView, равный размеру клавиатуры
        self.scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    
    //когда клавиатура исчезает
    @objc func keyboardWillBeHidden(notification: Notification){
        //устанавливаем отступ внизу UIScrollView равный нулю
        let contentInsets = UIEdgeInsets.zero
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    
    //подписываемся на сообщения из центра уведомлений, которые рассылает клавиатура
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //убираем navigationController
        self.navigationController?.setNavigationBarHidden(true, animated: false)
       
        
        
        
        //подписываемя на 2 уведомления, первое приходит при появлении клавиатуры
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        //второе , когда она пропадает
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    //метод отпискипри исчезновении контроллера с экрана
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    //исчезновение клавиатуры по клику на view (в альбомной ориентации)
    @objc func hideKeyboard(){
        self.scrollView?.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //жест нажатия
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        // присваиваем его UIScrollView
        scrollView?.addGestureRecognizer(hideKeyboardGesture)
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        
        func checkUserData() -> Bool{
            guard let login = loginInput.text,
                  let password = passwordInput.text else {
                return false
            }
            if login == "admin" && password == "123" {
                return true
            } else {
                return false
            }
        }
        
        func showLoginError(){
            //создаем контроллер
            let alert = UIAlertController(title: "Ошибка", message: "Логин или пароль введен не правильно", preferredStyle: .alert)
            // создаем кнопку для UIAlertController
            let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            // добавляем эту кнопку на UIAlertController
            alert.addAction(action)
            //что-то делаем с этой кнопкой
            present(alert, animated: true, completion: nil)
        }
        
        // проверяем данные
        let checkResult = checkUserData()
        if !checkResult {
            showLoginError()
        } else {
            //Делаем переход на таббар
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            guard let secondViewController = storyboard.instantiateViewController(identifier: K.Controller.idTabBarController) as? UITabBarController else {return}
            show(secondViewController, sender: nil)
        }
    }
}


