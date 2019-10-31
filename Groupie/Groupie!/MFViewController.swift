//
//  MultipleFunctionsViewController.swift
//  Groupie!
//
//  Created by 沈昊诚 on 2018/12/1.
//  Copyright © 2018年 myl142857. All rights reserved.
//

import UIKit
import EzPopup

class MultipleFunctionsViewController: UIViewController {
    
    
    var addTask: UIButton!
    var member: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        addTask = UIButton()
        addTask.translatesAutoresizingMaskIntoConstraints = false
        addTask.setTitle ("Add A New Task", for: .normal)
        addTask.setTitleColor(.black, for: .normal)
        addTask.layer.borderWidth = 2.0
        addTask.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        addTask.addTarget(self, action: #selector(addATask), for: .touchUpInside)
        view.addSubview(addTask)
        
        member = UIButton()
        member.translatesAutoresizingMaskIntoConstraints = false
        member.setTitle ("See Current Members", for: .normal)
        member.setTitleColor(.black, for: .normal)
        member.layer.borderWidth = 2.0
        member.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        member.addTarget(self, action: #selector(seeCurrentMember), for: .touchUpInside)
        view.addSubview(member)
        
        setupConstraints()
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            addTask.topAnchor.constraint(equalTo: view.topAnchor),
            addTask.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            addTask.heightAnchor.constraint(equalToConstant: 40),
            addTask.widthAnchor.constraint(equalToConstant: 200),
            ])
        NSLayoutConstraint.activate([
            member.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            member.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            member.heightAnchor.constraint(equalToConstant: 40),
            member.widthAnchor.constraint(equalToConstant: 200),
            ])
        
    }
    
    @objc func addATask(){
        
        var contentVC: MFContentViewController!
        var popUpVC: PopupViewController!
        
        contentVC = MFContentViewController()
        
        popUpVC = PopupViewController(contentController: contentVC, popupWidth: 400, popupHeight: 600)
        
        present(popUpVC, animated: true)
        
        popUpVC.backgroundAlpha = 0.3
        popUpVC.backgroundColor = .black
        popUpVC.canTapOutsideToDismiss = true
        popUpVC.cornerRadius = 10
        popUpVC.shadowEnabled = true
    }
    
    @objc func seeCurrentMember(){
        
        var contentVC: MFCMContentViewController!
        var popUpVC: PopupViewController!
        
        contentVC = MFCMContentViewController()
        
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
