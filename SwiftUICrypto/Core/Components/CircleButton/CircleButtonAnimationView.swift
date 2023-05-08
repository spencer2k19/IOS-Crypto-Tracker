//
//  CircleButtonAnimationView.swift
//  SwiftUICrypto
//
//  Created by Loic HACHEME on 08/05/2023.
//

import SwiftUI

struct CircleButtonAnimationView: View {
    

    @Binding var animate:Bool
    var body: some View {
        Circle()
            .stroke(lineWidth: 5.0)
            .scale(animate ? 1.0 : 0.0 )
            .opacity(animate ? 0.0: 1.0)
            .animation(animate ? Animation.easeOut(duration: 1.0) : .none)
            .onAppear {
                animate.toggle()
            }
    }
}

struct CircleButtonAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        CircleButtonAnimationView(animate: .constant(false))
    }
}
