//
//  PersonView.swift
//  BasicUIKit
//
//  Created by Francesco on 21/04/24.
//

import UIKit

class PersonView: UIView {

    private lazy var subscribeBtn: UIButton = {
       
        var config = UIButton.Configuration.filled()
        config.title = "Subscribe"
        config.baseBackgroundColor = .red
        config.baseForegroundColor = .white
        config.buttonSize = .large
        config.cornerStyle = .medium
        
        let btn = UIButton(configuration: config)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(didTapSubscribe), for: .touchUpInside)
        return btn
    }()
    
    private lazy var nameLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Oliver"
        lbl.font = .systemFont(ofSize: 24, weight: .bold)
        return lbl
    }()
    
    private lazy var emailLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "olivermail@gmail.com"
        lbl.font = .systemFont(ofSize: 15, weight: .regular)
        return lbl
    }()
    
    private lazy var personStakVw: UIStackView = {
        let vw = UIStackView()
        vw.translatesAutoresizingMaskIntoConstraints = false
        vw.axis = .vertical
        vw.spacing = 8
        return vw
    }()
    
    private var action: () -> ()
    
    init(action: @escaping () -> ()) {
        self.action = action
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
    func set (name : String, email: String) {
        nameLbl.text = name
        emailLbl.text = email
    }
}


private extension PersonView {
    func setup() {
        self.layer.cornerRadius = 10
        self.backgroundColor = UIColor.gray.withAlphaComponent(0.1)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(personStakVw)
        
        personStakVw.addArrangedSubview(nameLbl)
        personStakVw.addArrangedSubview(emailLbl)
        personStakVw.addArrangedSubview(subscribeBtn)
        
        NSLayoutConstraint.activate([

            personStakVw.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            personStakVw.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
            personStakVw.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 8),
            personStakVw.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -8)

        ])
    }
    

    
    @objc func didTapSubscribe(sender: UIButton) {
        action()
    }
}

