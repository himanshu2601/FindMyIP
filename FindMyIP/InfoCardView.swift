//
//  InfoCardView.swift
//  FindMyIP
//
//  Created by himanshu.goyal@telusinternational.com on 08/02/24.
//

import SwiftUI

struct InfoCardView: View {
    
    @State var title: String = ""
    @State var desc: String = ""
    
    var body: some View {
        VStack{
            HStack{
                Text(self.title)
                Spacer()
                Text(self.desc)
            }//:HStack
        }//:VStack
        .padding(.all, 10)
        .background(Color.white.edgesIgnoringSafeArea(.all))
        .clipShape(.rect(cornerSize: CGSize(width: 10, height: 10)))
    }
}

#Preview {
    InfoCardView(title: "Test", desc: "Sample")
        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
}
