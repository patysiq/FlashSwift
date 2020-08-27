//
//  RepositoryMidia.swift
//  FlashSwift
//
//  Created by PATRICIA S SIQUEIRA on 27/08/20.
//  Copyright © 2020 PATRICIA S SIQUEIRA. All rights reserved.
//
import Foundation

class RepositoryMidia {
    
    var fileURL: URL
    
    init(filename: String = "file_manager") {
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        var fileURL = url.appendingPathComponent(filename)
        fileURL = fileURL.appendingPathExtension("json")
        // Printa o local em que se encontra o arquivo json. É bom para você checar como ficou o arquivo. No terminal, utilize o comando open junto do caminho que você conseguiu pelo print ou pelo po do LLDB. Exemplo: open file:///.../file_manager.json
        print(fileURL)
        self.fileURL = fileURL
    }
        
        func save(_ videos: [Video]) {
            do {
                let jsonData = try JSONEncoder().encode(videos)
                try jsonData.write(to: fileURL)
            } catch {
                print("It was not possible to save the videos.")
            }
        }
        
     func load() -> [Video] {
            var videos: [Video] = []
            do {
                let jsonData = try Data(contentsOf: fileURL)
                videos = try JSONDecoder().decode([Video].self, from: jsonData)
                return videos
            } catch {
                print("It was not possible to load the videos.")
                return videos
            }
        }
    
}
