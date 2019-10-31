//
//  SignUpViewController.swift
//  Groupie!
//
//  Created by 沈昊诚 on 2018/12/2.
//  Copyright © 2018年 myl142857. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    var nameLabel: UILabel!
    var email: UILabel!
    var nameTF: UITextField!
    var emailTF: UITextField!
    var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = "Your Name: "
        nameLabel.textColor = UIColor(displayP3Red: 74/255, green: 144/255, blue: 226/255, alpha: 1)
        nameLabel.font = .systemFont(ofSize: 20, weight: .medium)
        view.addSubview(nameLabel)
        
        email = UILabel()
        email.translatesAutoresizingMaskIntoConstraints = false
        email.text = "Email Address: "
        email.textColor = UIColor(displayP3Red: 74/255, green: 144/255, blue: 226/255, alpha: 1)
        email.font = .systemFont(ofSize: 20, weight: .medium)
        view.addSubview(email)
        
        nameTF = UITextField()
        nameTF.translatesAutoresizingMaskIntoConstraints = false
        nameTF.backgroundColor = .lightGray
        nameTF.text = ""
        nameTF.textAlignment = .center
        view.addSubview(nameTF)
        
        emailTF = UITextField()
        emailTF.translatesAutoresizingMaskIntoConstraints = false
        emailTF.backgroundColor = .lightGray
        emailTF.text = ""
        emailTF.textAlignment = .center
        view.addSubview(emailTF)
        
        saveButton = UIButton()
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.setTitle ("Create Account!", for: .normal)
        saveButton.setTitleColor(.black, for: .normal)
        saveButton.layer.borderWidth = 2.0
        saveButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
        saveButton.addTarget(self, action: #selector(createAccount), for: .touchUpInside)
        view.addSubview(saveButton)
        
        setupConstraints()
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 320),
            nameLabel.heightAnchor.constraint(equalToConstant: 40),
            nameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 55),
            nameLabel.widthAnchor.constraint(equalToConstant: 112)
            ])
        
        NSLayoutConstraint.activate([
            email.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 15),
            email.heightAnchor.constraint(equalToConstant: 40),
            email.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            email.widthAnchor.constraint(equalToConstant: 140)
            ])
        
        NSLayoutConstraint.activate([
            nameTF.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor),
            nameTF.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 5),
            nameTF.widthAnchor.constraint(equalToConstant: 200),
            nameTF.heightAnchor.constraint(equalToConstant: 30)
            ])
        
        NSLayoutConstraint.activate([
            emailTF.centerYAnchor.constraint(equalTo: email.centerYAnchor),
            emailTF.leadingAnchor.constraint(equalTo: email.trailingAnchor, constant: 5),
            emailTF.widthAnchor.constraint(equalToConstant: 200),
            emailTF.heightAnchor.constraint(equalToConstant: 30)
            ])
        
        NSLayoutConstraint.activate([
            saveButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 450),
            saveButton.heightAnchor.constraint(equalToConstant: 30),
            saveButton.widthAnchor.constraint(equalToConstant: 175),
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
    }
    
    @objc func createAccount() {
        dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
