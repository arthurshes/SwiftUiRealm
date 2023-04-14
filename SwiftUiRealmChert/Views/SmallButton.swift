//
//  SmallButton.swift
//  SwiftUiRealmChert
//
//  Created by Артур Шестаков on 13.04.2023.
//

import SwiftUI

struct SmallButton: View {
    var body: some View {
        ZStack{
            Circle()
                .frame(width: 50)
                .foregroundColor(.red)
            Text("+")
                .font(.title)
                .bold()
                .foregroundColor(.white)
        }
        .frame(height: 50)
    }
}

struct SmallButton_Previews: PreviewProvider {
    static var previews: some View {
        SmallButton()
    }
}
