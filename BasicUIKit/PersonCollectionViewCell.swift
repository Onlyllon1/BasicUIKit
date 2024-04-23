//
//  PersonCollectionViewCell.swift
//  BasicUIKit
//
//  Created by Francesco on 22/04/24.
//

import UIKit

protocol PeopleCollectionViewCellDelegate : AnyObject {
    func didTapSubscribe ()
    }

class PersonCollectionViewCell: UICollectionViewCell {
    
    private var vw : PersonView?
    
    weak var delegate : PeopleCollectionViewCellDelegate?
    
    var item : PersoneResponse? {
        didSet{
            guard let firstName = item?.firstName,
                  let lastName = item?.lastName,
                  let email = item?.email else { return }
            
            vw?.set(name: "\(firstName) \(lastName)", email: email)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension PersonCollectionViewCell {
    
    func setup() {
        guard vw == nil else { return }
        
        vw = PersonView { [weak self] in
            self?.delegate?.didTapSubscribe()
        }
        
        self.contentView.addSubview(vw!)
        
        NSLayoutConstraint.activate([
            vw!.topAnchor.constraint(equalTo: topAnchor),
            vw!.bottomAnchor.constraint(equalTo: bottomAnchor),
            vw!.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            vw!.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)

            
        ])
    }
}
