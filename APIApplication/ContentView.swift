//
//  ContentView.swift
//  APIApplication
//
//  Created by Mac on 01/12/2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var charactersVM = CharactersViewModel()
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack{
            VStack{
                List(charactersVM.charactersList){ character in
                    NavigationLink {
                        DetailView(character: character)
                    } label: {
                        Text(character.name)
                    }
                }.font(.title)
                    .listStyle(.plain)
                    .navigationTitle("Characters")
                    .searchable(text: $searchText) { ForEach(searchResults, id: \.self){ result in NavigationLink(destination: DetailView(character: result), label: { Text(result.name)}).searchCompletion(result.name)
                    }
                    }
                
                
                Button {
                    charactersVM.sortList()
                } label: {
                    Text("Sort")
                        .bold()
                }
                
                
            }
            
        }
        .task {
            await charactersVM.getData()
        }
    }
    
    var searchResults: [SWCharacter]{
        if searchText.isEmpty{
            return charactersVM.charactersList
        }
        else{
            return charactersVM.charactersList.filter({$0.name.contains(searchText)})
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
