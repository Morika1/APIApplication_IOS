//
//  DetailView.swift
//  APIApplication
//
//  Created by Mac on 05/12/2023.
//

import SwiftUI

struct DetailView: View {
    
    let character: SWCharacter
    
    var body: some View {
        VStack(alignment: .leading){
            Text(character.name)
                .font(.largeTitle)
                .bold()
            
            Rectangle()
                .frame(height: 2)
                .frame(maxWidth: .infinity)
            
            Group{
                
                HStack(alignment: .top){
                    Text("Height: ")
                        .bold()
                    
                    Text(character.height)
                    
                }
                
                HStack(alignment: .top){
                    Text("Mass: ")
                        .bold()
                    
                    Text(character.mass)
                    
                }
                
                HStack(alignment: .top){
                    Text("Birth Year: ")
                        .bold()
                    
                    Text(character.birth_year)
                    
                }
                
            }
            .font(.title2)
            
            Spacer()
            
            
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(character: SWCharacter(name: "name", height: "0.0", mass: "0.0", birth_year: "0"))
    }
}
