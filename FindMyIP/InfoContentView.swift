//
//  ContentView.swift
//  FindMyIP
//
//  Created by himanshu.goyal@telusinternational.com on 08/02/24.
//

import SwiftUI

public struct InfoContentView: View {
    
    @ObservedObject var viewModel = ViewModel()
    @State private var showAlert: Bool = false
    
    public init(){}
    
    public var body: some View {
        NavigationView{
            ScrollView{
                Spacer()
                VStack{
                    switch viewModel.state {
                    case .loading:
                        LoaderView().hidden(false)
                    case .failed:
                        LoaderView().hidden(true)
                    case .loaded(let infoModel):
                        InfoCardView(title: "IP:", desc: infoModel?.ip ?? "")
                        InfoCardView(title: "Network:", desc: infoModel?.network ?? "")
                        InfoCardView(title: "Version:", desc: infoModel?.version ?? "")
                        InfoCardView(title: "City:", desc: infoModel?.city ?? "")
                        InfoCardView(title: "Country:", desc: infoModel?.country ?? "")
                        InfoCardView(title: "Country Capital:", desc: infoModel?.country_capital ?? "")
                        InfoCardView(title: "Postal:", desc: infoModel?.postal ?? "")
                        InfoCardView(title: "Latitude,Longitude:", desc: "\(infoModel?.latitude ?? 0), \(infoModel?.longitude ?? 0)")
                        InfoCardView(title: "Country Population:", desc: "\(infoModel?.country_population ?? 0)")

                    }
                }//:VStack
                .onAppear(){
                    showAlert = viewModel.showAlert
                }
                .alert(isPresented: $showAlert, content: {
                    Alert(title: Text(viewModel.alertMessage))
                })
                .padding()
            }//:ScrollView
            .navigationTitle("Informations")
            .background(Color.blue.edgesIgnoringSafeArea(.all))
        }//:NavigationView
    }
}

#Preview {
    InfoContentView()
}
