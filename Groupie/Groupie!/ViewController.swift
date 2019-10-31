//
//  ViewController.swift
//  Groupie!
//
//  Created by myl142857 on 11/24/18.
//  Copyright © 2018 myl142857. All rights reserved.
//

import UIKit


//protocol TasksGroupsViewControllerDelegate: class {
    //func GroupsViewControllerDelegate()
//}

class ViewController: UIViewController {

    var appName: UILabel!
    var userNameTF: UITextField!
    var emailTF: UITextField!
    var userName: UILabel!
    var email: UILabel!
    var signInButton: UIButton!
    var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = .white
        
        appName = UILabel()
        appName.translatesAutoresizingMaskIntoConstraints = false
        appName.text = "Groupie!"
        appName.textColor = UIColor(displayP3Red: 74/255, green: 144/255, blue: 226/255, alpha: 1)
        appName.font = UIFont(name: "MarkerFelt-Thin", size: 50)
        view.addSubview(appName)
        
        //        for family in UIFont.familyNames.sorted() {
        //            let names = UIFont.fontNames(forFamilyName: family)
        //            print("Family: \(family) Font names: \(names)")
        //        }
        
        userName = UILabel()
        userName.translatesAutoresizingMaskIntoConstraints = false
        userName.text = "User Name: "
        userName.font = .systemFont(ofSize: 20, weight: .medium)
        userName.textColor = UIColor(displayP3Red: 74/255, green: 144/255, blue: 226/255, alpha: 1)
        view.addSubview(userName)
        
        email = UILabel()
        email.translatesAutoresizingMaskIntoConstraints = false
        email.text = "Email Address: "
        email.font = .systemFont(ofSize: 20, weight: .medium)
        email.textColor = UIColor(displayP3Red: 74/255, green: 144/255, blue: 226/255, alpha: 1)
        view.addSubview(email)
        
        userNameTF = UITextField()
        userNameTF.translatesAutoresizingMaskIntoConstraints = false
        userNameTF.backgroundColor = .lightGray
        userNameTF.text = "User Name"
        userNameTF.textAlignment = .center
        view.addSubview(userNameTF)
        
        emailTF = UITextField()
        emailTF.translatesAutoresizingMaskIntoConstraints = false
        emailTF.backgroundColor = .lightGray
        emailTF.text = "Email Address"
        emailTF.textAlignment = .center
        view.addSubview(emailTF)
        
        signInButton = UIButton()
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.setTitle ("Sign in!", for: .normal)
        signInButton.setTitleColor(.black, for: .normal)
        signInButton.layer.borderWidth = 2.0
        signInButton.titleLabel?.font = .systemFont(ofSize: 18, weight: .medium)
        signInButton.addTarget(self, action: #selector(pushTaskViewController), for: .touchUpInside)
        view.addSubview(signInButton)
        
        signUpButton = UIButton()
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.setTitle ("Sign Up Now!", for: .normal)
        signUpButton.setTitleColor(.black, for: .normal)
        signUpButton.layer.borderWidth = 2.0
        signUpButton.titleLabel?.font = .systemFont(ofSize: 18, weight: .medium)
        signUpButton.addTarget(self, action: #selector(presentSignUpViewController), for: .touchUpInside)
        view.addSubview(signUpButton)
        
        setupConstraints()
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            appName.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            appName.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 180),
            appName.widthAnchor.constraint(equalToConstant: 170),
            appName.heightAnchor.constraint(equalToConstant: 50)
            ])
        
        NSLayoutConstraint.activate([
            userName.topAnchor.constraint(equalTo: appName.bottomAnchor, constant: 50),
            userName.heightAnchor.constraint(equalToConstant: 40),
            userName.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 55),
            userName.widthAnchor.constraint(equalToConstant: 112)
            ])
        
        NSLayoutConstraint.activate([
            email.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 15),
            email.heightAnchor.constraint(equalToConstant: 40),
            email.trailingAnchor.constraint(equalTo: userName.trailingAnchor),
            email.widthAnchor.constraint(equalToConstant: 140)
            ])
        
        NSLayoutConstraint.activate([
            userNameTF.centerYAnchor.constraint(equalTo: userName.centerYAnchor),
            userNameTF.leadingAnchor.constraint(equalTo: userName.trailingAnchor, constant: 5),
            userNameTF.widthAnchor.constraint(equalToConstant: 200),
            userNameTF.heightAnchor.constraint(equalToConstant: 35)
            ])
        
        NSLayoutConstraint.activate([
            emailTF.centerYAnchor.constraint(equalTo: email.centerYAnchor),
            emailTF.leadingAnchor.constraint(equalTo: email.trailingAnchor, constant: 5),
            emailTF.widthAnchor.constraint(equalToConstant: 200),
            emailTF.heightAnchor.constraint(equalToConstant: 35)
            ])
        
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalTo: email.bottomAnchor, constant: 35),
            signInButton.heightAnchor.constraint(equalToConstant: 35),
            signInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signInButton.widthAnchor.constraint(equalToConstant: 150),
            ])
        
        NSLayoutConstraint.activate([
            signUpButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 35),
            signUpButton.heightAnchor.constraint(equalToConstant: 35),
            signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signUpButton.widthAnchor.constraint(equalToConstant: 150),
            ])
    }
    
    @objc func pushTaskViewController(){
        let taskViewController = TaskViewController()
        navigationController?.pushViewController(taskViewController, animated: true)
    }
    
    @objc func presentSignUpViewController(){
        let signUpViewController = SignUpViewController()
        present(signUpViewController, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

