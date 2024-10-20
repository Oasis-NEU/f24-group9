//
//  TradingTableView.swift
//  choreChamp_frontEnd
//
//  Created by Jayden Ngo on 10/14/24.
//
import Foundation
import SwiftUI

struct TradingTableView: View {
    
    let imageName: String
    let title: String
    let who: String
    let when: String
    let due: String
    
    //body of the screen
    var body: some View {
        
        //todolist-personal
        HStack {
          Image(systemName: imageName)
            .foregroundColor(.pink)
            
          Text(who)
            .font(.headline)
          
          
          Spacer()
           
          Text(when)
                .font(.system(.caption, design: .monospaced, weight: .regular))
                .foregroundColor(.secondary)
            
          Text(title)
                .font(.headline)
          
          Text(due)
            
            
        }
        .padding()
    }
}
