//
//  PastTasksTableViewCell.swift
//  Groupie!
//
//  Created by 沈昊诚 on 2018/11/30.
//  Copyright © 2018年 myl142857. All rights reserved.
//

import UIKit

class PastTasksTableViewCell: UITableViewCell {

    var checkImage: UIImageView!
    var nameLabel: UILabel!
    var courseMemberLabel: UILabel!
    var deadlineLabel: UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        checkImage = UIImageView(frame: .zero)
        checkImage.translatesAutoresizingMaskIntoConstraints = false
        checkImage.contentMode = .scaleAspectFit
        contentView.addSubview(checkImage)
        
        nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        contentView.addSubview(nameLabel)
        
        courseMemberLabel = UILabel()
        courseMemberLabel.translatesAutoresizingMaskIntoConstraints = false
        courseMemberLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
        contentView.addSubview(courseMemberLabel)
        
        deadlineLabel = UILabel()
        deadlineLabel.translatesAutoresizingMaskIntoConstraints = false
        deadlineLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        deadlineLabel.textAlignment = .right
        contentView.addSubview(deadlineLabel)
    }
    
    override func updateConstraints() {
        NSLayoutConstraint.activate([
            checkImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            checkImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            checkImage.widthAnchor.constraint(equalToConstant: 35)
            ])
        
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: checkImage.trailingAnchor, constant: 5),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            nameLabel.widthAnchor.constraint(equalToConstant: 200),
            nameLabel.heightAnchor.constraint(equalToConstant: 20)
            ])
        
        NSLayoutConstraint.activate([
            courseMemberLabel.leadingAnchor.constraint(equalTo: checkImage.trailingAnchor, constant: 5),
            courseMemberLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            courseMemberLabel.widthAnchor.constraint(equalToConstant: 200),
            courseMemberLabel.heightAnchor.constraint(equalToConstant: 15)
            ])
        
        NSLayoutConstraint.activate([
            deadlineLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            deadlineLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            deadlineLabel.widthAnchor.constraint(equalToConstant: 100)
            ])
        
        super.updateConstraints()
    }
    
    func configure(for task: Task) {
        nameLabel.text = task.name
        courseMemberLabel.text = task.course + " - " + task.member
        deadlineLabel.text = task.deadline
        if task.isCompleted {
            checkImage.image = UIImage(named: "checked")
        }
        else {
            checkImage.image = UIImage(named: "unchecked")
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
