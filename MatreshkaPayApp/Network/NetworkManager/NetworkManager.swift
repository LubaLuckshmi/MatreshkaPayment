//
//  NetworkManager.swift
//  MatreshkaPayApp
//
//  Created by Admin on 27.02.2024.
//

import Foundation

class NetworkManager {
    private var currentTask: URLSessionTask?

    func fetchData<T: Decodable>(from url: URL, shouldCancelCurrentTask: Bool = false) async throws -> T {
        if shouldCancelCurrentTask {
            cancelCurrentTask()
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }

    private func cancelCurrentTask() {
        currentTask?.cancel()
        currentTask = nil
    }
}
