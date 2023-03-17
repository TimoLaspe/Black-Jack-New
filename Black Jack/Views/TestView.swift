//
//  TestView.swift
//  Black Jack
//
//  Created by Timo Laspe on 16.03.23.
//

import SwiftUI

struct TestView: View {
    
    @StateObject var viewModel : GameViewModel = GameViewModel()
    
    var body: some View {
        if (viewModel.dataLoaded && viewModel.gameIsSet){
            ZStack{
                HStack(spacing: -70){
                    ForEach(viewModel.playerCardStack){ card in
                        AsyncImage(url: URL(string: card.image)) { image in
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            
                                    } placeholder: {
                                        Color.gray
                                    }
                                    .frame(width: 100, height: 150)
                    }
                }
            }
        } else {
            ZStack{
                
            }
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
