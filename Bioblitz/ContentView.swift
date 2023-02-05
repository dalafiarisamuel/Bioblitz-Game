//
//  ContentView.swift
//  Bioblitz
//
//  Created by Samuel Dalafiari on 03/02/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var board = GameBoard()

    var body: some View {
        VStack {
            HStack {
                Text("GREEN : \(board.greenScore)")
                    .padding(.horizontal)
                    .background(Capsule().fill(.green).opacity(board.currentPlayer == .green ? 1 : 0))

                Spacer()

                Text("BIOBLITZ")

                Spacer()

                Text("RED: \(board.redScore)")
                    .padding(.horizontal)
                    .background(Capsule().fill(.red).opacity(board.currentPlayer == .red ? 1 : 0))
                
            }
            .font(.system(size: 36).weight(.black))

            ZStack {
                VStack {
                    ForEach(0 ..< board.rowCount, id: \.self) { row in

                        HStack {
                            ForEach(0 ..< board.columnCount, id: \.self) { col in

                                let bacteria = board.grid[row][col]

                                BacteriaView(bacteria: bacteria) {
                                    board.rotate(bacteria: bacteria)
                                }
                            }
                        }
                    }
                }

                if let winner = board.winner {
                    VStack {
                        Text("\(winner) wins!")
                            .font(.largeTitle)

                        Button { board.reset() } label: {
                            Text("Play Again")
                                .padding()
                                .background(.blue)
                                .clipShape(Capsule())
                        }.buttonStyle(.plain)
                    }
                    .padding(40)
                    .background(.black.opacity(0.85))
                    .cornerRadius(25)
                    .transition(.scale)
                }
            }
        }
        .padding()
        .fixedSize()
        .background(content: {
            Image("game_board_dark_background")
                .resizable()
        })
        .preferredColorScheme(.dark)
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
