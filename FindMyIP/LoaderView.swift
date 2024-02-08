//
//  LoaderView.swift
//  FindMyIP
//
//  Created by himanshu.goyal@telusinternational.com on 08/02/24.
//

import SwiftUI

struct LoaderView: View {
    var body: some View {
        ProgressView().progressViewStyle(CircularProgressViewStyle(tint: .red))
            .scaleEffect(CGSize(width: 1.0, height: 1.0), anchor: .center)
    }
}

extension View{
    @ViewBuilder func hidden(_ hide: Bool) -> some View{
        switch hide{
        case true: self.hidden()
        case false: self
        }
    }
}

#Preview {
    LoaderView()
}
