//
//  CharactersViewModel.swift
//  APIApplication
//
//  Created by Mac on 04/12/2023.
//

import Foundation

@MainActor
class CharactersViewModel: ObservableObject{
    struct Returned: Codable{
        var results : [SWCharacter]
    }
    
    
    @Published var charactersList: [SWCharacter] = []
    var urlString = "https://swapi.dev/api/people/" //TODO put the api url
    
    func sortList(){
        charactersList = charactersList.sorted(by: {$0.name < $1.name})
    }
    
    func getData() async{
        
        guard let url = URL(string: urlString)else { return}
        do{
            let (data,_) = try await URLSession.shared.data(from: url)
            
            do{
                let returned = try JSONDecoder().decode(Returned.self, from: data)
                
                charactersList += returned.results
                
            }catch{
                //Handle Json error
            }
            
        }catch {
            //handle getting data error
        }
        
    }
}
