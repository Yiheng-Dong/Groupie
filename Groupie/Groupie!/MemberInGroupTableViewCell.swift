//
//  MemberInGroupTableViewCell.swift
//  Groupie!
//
//  Created by 沈昊诚 on 2018/12/2.
//  Copyright © 2018年 myl142857. All rights reserved.
//

import UIKit

class MemberInGroupTableViewCell: UITableViewCell {

    var nameLabel: UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        contentView.addSubview(nameLabel)
        
    }
    
    override func updateConstraints() {
        
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            nameLabel.widthAnchor.constraint(equalToConstant: 200),
            nameLabel.heightAnchor.constraint(equalToConstant: 20)
            ])
        
        super.updateConstraints()
    }
    
    func configure(for member: Member) {
        nameLabel.text = member.name
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
