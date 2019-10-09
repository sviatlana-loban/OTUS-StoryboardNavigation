//
//  FileService.swift
//  Week1StoryboardNavigation
//
//  Created by Admin on 10/7/19.
//  Copyright © 2019 SLoban. All rights reserved.
//

import Foundation

class FileService {
    
    enum Directory {
        case documents
        case caches
    }

    static func store<T: Encodable>(_ object: T, to directory: Directory, as fileName: String) {
        let url = getURL(for: directory).appendingPathComponent(fileName, isDirectory: false)

        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(object)
            if FileManager.default.fileExists(atPath: url.path) {
                try FileManager.default.removeItem(at: url)
            }
            FileManager.default.createFile(atPath: url.path, contents: data, attributes: nil)
        } catch {
            fatalError("Cannot store file")
        }
    }

    static func retrieve<T: Decodable>(_ fileName: String, from directory: Directory, as type: T.Type) -> T? {
        let url = getURL(for: directory).appendingPathComponent(fileName, isDirectory: false)

        guard FileManager.default.fileExists(atPath: url.path) else {
            return nil
        }

        if let data = FileManager.default.contents(atPath: url.path) {
            let decoder = JSONDecoder()
            do {
                let model = try decoder.decode(type, from: data)
                return model
            } catch {
                fatalError(error.localizedDescription)
            }
        } else {
            return nil
        }
    }


    static private func getURL(for directory: Directory) -> URL {
        var searchDirectory: FileManager.SearchPathDirectory

        switch directory {
        case .documents:
            searchDirectory = .documentDirectory
        case .caches:
            searchDirectory = .cachesDirectory
        }

        guard let url = FileManager.default.urls(for: searchDirectory, in: .userDomainMask).first else {
            fatalError("Could not create documents folder")
        }
        return url
    }
}
