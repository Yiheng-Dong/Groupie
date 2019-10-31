//
//  MFContentViewController.swift
//  Groupie!
//
//  Created by 沈昊诚 on 2018/12/1.
//  Copyright © 2018年 myl142857. All rights reserved.
//

import UIKit
import EzPopup

class MFContentViewController: UIViewController {
    
    var taskName: UILabel!
    var taskNameTF: UITextField!
    var deadLine: UILabel!
    var deadLineTF: UITextField!
    var inviteMemberButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        taskName = UILabel()
        taskName.translatesAutoresizingMaskIntoConstraints = false
        taskName.text = "Task name: "
        taskName.textColor = UIColor(displayP3Red: 74/255, green: 144/255, blue: 226/255, alpha: 1)
        taskName.font = .systemFont(ofSize: 20, weight: .medium)
        view.addSubview(taskName)
        
        taskNameTF = UITextField()
        taskNameTF.translatesAutoresizingMaskIntoConstraints = false
        taskNameTF.backgroundColor = .lightGray
        taskNameTF.text = ""
        taskNameTF.textAlignment = .center
        view.addSubview(taskNameTF)
        
        deadLine = UILabel()
        deadLine.translatesAutoresizingMaskIntoConstraints = false
        deadLine.text = "DeadLine: "
        deadLine.textColor = UIColor(displayP3Red: 74/255, green: 144/255, blue: 226/255, alpha: 1)
        deadLine.font = .systemFont(ofSize: 20, weight: .medium)
        view.addSubview(deadLine)
        
        deadLineTF = UITextField()
        deadLineTF.translatesAutoresizingMaskIntoConstraints = false
        deadLineTF.backgroundColor = .lightGray
        deadLineTF.text = ""
        deadLineTF.textAlignment = .center
        view.addSubview(deadLineTF)
        
        inviteMemberButton = UIButton()
        inviteMemberButton.translatesAutoresizingMaskIntoConstraints = false
        inviteMemberButton.setTitle ("Next!", for: .normal)
        inviteMemberButton.setTitleColor(.black, for: .normal)
        inviteMemberButton.layer.borderWidth = 2.0
        inviteMemberButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
        inviteMemberButton.addTarget(self, action: #selector(inviteMember), for: .touchUpInside)
        view.addSubview(inviteMemberButton)
        
        setupConstraints()
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            taskName.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200),
            taskName.heightAnchor.constraint(equalToConstant: 30),
            taskName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            taskName.widthAnchor.constraint(equalToConstant: 120)
            ])
        
        NSLayoutConstraint.activate([
            taskNameTF.topAnchor.constraint(equalTo: taskName.topAnchor),
            taskNameTF.leadingAnchor.constraint(equalTo: taskName.trailingAnchor),
            taskNameTF.widthAnchor.constraint(equalToConstant: 200),
            taskNameTF.heightAnchor.constraint(equalToConstant: 30)
            ])
        
        NSLayoutConstraint.activate([
            deadLine.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 240),
            deadLine.heightAnchor.constraint(equalToConstant: 30),
            deadLine.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            deadLine.widthAnchor.constraint(equalToConstant: 120)
            ])
        
        NSLayoutConstraint.activate([
            deadLineTF.topAnchor.constraint(equalTo: deadLine.topAnchor),
            deadLineTF.leadingAnchor.constraint(equalTo: deadLine.trailingAnchor),
            deadLineTF.widthAnchor.constraint(equalToConstant: 200),
            deadLineTF.heightAnchor.constraint(equalToConstant: 30)
            ])
        
        NSLayoutConstraint.activate([
            inviteMemberButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            inviteMemberButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 320),
            inviteMemberButton.widthAnchor.constraint(equalToConstant: 150),
            inviteMemberButton.heightAnchor.constraint(equalToConstant: 30)
            ])
    }
    
    @objc func inviteMember(){
        
        var contentVC: NextContentViewController!
        var popUpVC: PopupViewController!
        
        contentVC = NextContentViewController()
        
        popUpVC = PopupViewController(contentController: contentVC, popupWidth: 400, popupHeight: 600)
        
        present(popUpVC, animated: true)
        
        popUpVC.backgroundAlpha = 0.3
        popUpVC.backgroundColor = .black
        popUpVC.canTapOutsideToDismiss = true
        popUpVC.cornerRadius = 10
        popUpVC.shadowEnabled = true
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
