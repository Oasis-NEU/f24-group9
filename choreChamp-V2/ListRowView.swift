//
//  ListRowView.swift
//  choreChamp-V2
//
//  Created by Jayden Ngo on 10/20/24.
//

import Foundation
import SwiftUI

struct ListRowView: View {
    
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
          
          Text(title)
            .font(.headline)
          
          Spacer()
          
          Text(who)
              .font(.system(.caption, design: .monospaced, weight: .regular))
              .foregroundColor(.secondary)
            
          Text(when)
          
          Text(due)
            
            
        }
        .padding()
    }
}
