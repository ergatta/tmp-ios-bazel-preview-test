//
//  KeyView.swift
//  Swordle
//
//  Created by Prasanna Swaminathan on 1/17/22.
//

import SwiftUI

struct KeyView: View {
    var letter: Character
    var body: some View {
        Text("\(letter.uppercased())")
            .frame(width: 15, height: nil, alignment: Alignment.center)
            .padding(.all, 7)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray, lineWidth: 2)
            )
    }
}

struct KeyView_Previews: PreviewProvider {
    static var previews: some View {
        KeyView(letter: "A")
    }
}
