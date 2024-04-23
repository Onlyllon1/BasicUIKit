//
//  PeopleViewModel.swift
//  BasicUIKit
//
//  Created by Francesco on 22/04/24.
//

import Foundation

protocol PeopleViewModelDelegate : AnyObject {
    func didFinish()
    
    func didFail(error: Error)
}

class PeopleViewModel {
    
    private(set) var people = [PersoneResponse]()
    
    weak var delegate: PeopleViewModelDelegate?
    
    @MainActor 
    func  getUsers() {
        
        Task { [weak self] in

            do {
                
                let url = URL(string: "https://reqres.in/api/users")!
                let (data, _) = try await URLSession.shared.data(from: url)
                
                let jsondecoder = JSONDecoder()
                jsondecoder.keyDecodingStrategy = .convertFromSnakeCase
                
                self?.people = try jsondecoder.decode(UserResponse.self, from: data ).data
                self?.delegate?.didFinish()
            } catch {
                
                self?.delegate?.didFail(error: error)
                
            }
        }
        
    }
}
