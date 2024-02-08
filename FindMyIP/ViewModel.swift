//
//  ViewModel.swift
//  FindMyIP
//
//  Created by himanshu.goyal@telusinternational.com on 08/02/24.
//

import Foundation
import Combine

class ViewModel: ObservableObject{
    //Properties
    @Published var state: State = State.loading
    @Published var showAlert: Bool = false
    @Published var alertMessage: String = ""
    
    enum State{
        case loading
        case failed
        case loaded(InfoModel?)
    }
    
    var dataManager: ServiceProtocol
    private var cancellableSet: Set<AnyCancellable> = []
    //end
    
    init(dataManager: ServiceProtocol = Service.shared){
        self.dataManager = dataManager
        self.callFetchIPDataAPI()
    }
    
    func callFetchIPDataAPI(){
        //call api
        self.dataManager.fetchIPData().sink { [weak self] completion in
            switch completion{
            case .failure(let error):
                self?.state = .failed
                self?.alertMessage = error.localizedDescription
                self?.showAlert = true
            case .finished:
                break
            }
        } receiveValue: { [weak self] model in
            self?.state = .loaded(model)
            self?.showAlert = false
        }.store(in: &cancellableSet)

    }
}
