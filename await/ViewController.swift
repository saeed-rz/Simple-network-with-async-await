//
//  ViewController.swift
//  await
//
//  Created by Saeed on 5/4/22.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet private var textView: UITextView!

    private var api: ComputerAPIProtocol = ComputerAPI()
    
    override func viewWillAppear(_ animated: Bool) {
        getRandomComputer()
    }

    func getRandomComputer() {
        Task {
            do {
                let computer = try await api.fetchRandomComputer()
                textView.text = computer?.description
            } catch {
                textView.text = "\(error)"
            }
        }
    }
}

