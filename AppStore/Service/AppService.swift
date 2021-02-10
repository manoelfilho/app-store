//
//  AppService.swift
//  AppStore
//
//  Created by Manoel Filho on 29/01/21.
//

import Foundation

class AppService {
    
    static let shared = AppService()
    
    let apiAdress = "https://api.euprogramador.app/app-store/v1"
    
    func returnFeatured( completion: @escaping ([FeaturedApp]?, Error?) -> () ) {
        
        guard let url = URL(string: "\(apiAdress)/apps/apps-em-destaque") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            
            if let err = err {
                completion(nil, err)
                return
            }
        
            do {
                guard let data = data else { return }
                //print(String(data: data, encoding: .utf8))
                let apps = try JSONDecoder().decode([FeaturedApp].self, from: data)
                completion(apps, nil)
            }catch let err{
                completion(nil, err)
                return
            }
            
        }.resume()
        
    }
    
    func searchApps( text: String, completion: @escaping ([App]?, Error?) -> () ) {
        
        guard let url = URL(string: "\(apiAdress)/apps?search=\(text)") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            if let err = err {
                completion(nil, err)
                return
            }
        
            do {
                
                guard let data = data else { return }
                //print(String(data: data, encoding: .utf8))
                let apps = try JSONDecoder().decode([App].self, from: data)
                completion(apps, nil)
                
            }catch let err{
                completion(nil, err)
                return
            }
            
        }.resume()
        
    }
    
    func returnGroupOfApps(type: String, completion: @escaping (AppGroup?, Error?) -> () ) {
        
        guard let url = URL(string: "\(apiAdress)/apps/\(type)") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            
            if let err = err {
                completion(nil, err)
                return
            }
        
            do {
                guard let data = data else { return }
                //print(String(data: data, encoding: .utf8))
                let apps = try JSONDecoder().decode(AppGroup.self, from: data)
                completion(apps, nil)
            }catch let err{
                completion(nil, err)
                return
            }
            
        }.resume()
        
    }
    
    func returnApp(appId: Int, completion: @escaping (App?, Error?) -> () ) {
        
        guard let url = URL(string: "\(apiAdress)/apps/\(appId)") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            
            if let err = err {
                completion(nil, err)
                return
            }
        
            do {
                guard let data = data else { return }
                //print(String(data: data, encoding: .utf8))
                let app = try JSONDecoder().decode(App.self, from: data)
                completion(app, nil)
            }catch let err{
                completion(nil, err)
                return
            }
            
        }.resume()
    }
    
    //metodo retorna dados estáticos
    func returnTodayFeatured (completion: @escaping ([TodayApp]?, Error?) -> ()){
        
        let todayApps: Array<TodayApp> = [
            TodayApp(id: 1,
                     categoria: "VIAGEM",
                     titulo: "Explore o mundo sem medo",
                     imagemUrl: "destaque-1",
                     descricao: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi commodo volutpat urna vel varius. Donec efficitur dignissim eros ac ullamcorper. Nulla facilisi. Aenean vel rhoncus augue.",
                     backgroundColor: "#FFFFFF"
            ),
            TodayApp(id: 2,
                     categoria: "VIAGEM",
                     titulo: "Explore o mundo sem medo",
                     imagemUrl: "destaque-2",
                     descricao: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi commodo volutpat urna vel varius. Donec efficitur dignissim eros ac ullamcorper. Nulla facilisi. Aenean vel rhoncus augue.",
                     backgroundColor: "#69CCE0"
            )
        ]
        
        completion(todayApps, nil)
        
    }
    
}
