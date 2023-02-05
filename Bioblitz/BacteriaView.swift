//
//  BacteriaView.swift
//  Bioblitz
//
//  Created by Samuel Dalafiari on 03/02/2023.
//

import SwiftUI

struct BacteriaView: View {
    
    var bacteria: Bacteria
    var rotationAction: () -> Void
    
    var image: String {
        switch bacteria.color {
            
        case .red : return "arrow.up.square.fill"
        case .green : return "arrow.up.circle.fill"
        default: return "arrow.up.circle"
        }
    }
    
    var body: some View {
        ZStack {
            
            Button (action: rotationAction){
                Image(systemName: image)
                    .resizable()
                    .foregroundColor(bacteria.color)
            }
            .buttonStyle(.plain)
            .frame(width: 32, height: 32)
            
            Rectangle()
                .fill(bacteria.color)
                .frame(width: 3, height: 8)
                .offset(y: -20)
        }
        .rotationEffect(.degrees(bacteria.direction.rotation))
    }
}

struct BacteriaView_Previews: PreviewProvider {
    static var previews: some View {
        BacteriaView(bacteria: Bacteria(row: 0, col: 0)) {
            
        }
        
    }
}
