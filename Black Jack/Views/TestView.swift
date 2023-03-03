//
//  TestView.swift
//  Black Jack
//
//  Created by Timo Laspe on 03.03.23.
//

import SwiftUI

struct TestView: View {
    
    @StateObject var viewModel = GameViewModel()
    
    var body: some View {
        ZStack{
            HStack(spacing: -60){
            
                for i in 0 ... viewModel.playerCardStack.count {
                
                    AsyncImage(url: URL(string: card[i].image)) { image in
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
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
