//
//  ViewController.swift
//  Codable
//
//  Created by Mazegeek Mac Mini 2018 on 2/14/20.
//  Copyright © 2020 Mac Mini 2018. All rights reserved.
//

import UIKit

struct Course: Decodable {
    let id: Int?
    let name: String?
    let link: String?
    let imageUrl: String?
}

struct WebsiteDescription: Decodable {
    let name: String
    let description: String
    let courses: [Course]
}

struct NewCourse: Decodable {
    let id: Int
    let name: String
    let link: String
    let imageUrl: String
    let numberOfLessons: Int
    
    //swift 4.0
//    private enum CodingKeys: String, CodingKey {
//        case imageUrl = "image_url"
//        case numberOfLessons = "number_of_lessons"
//        case id, name, link
//    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        getSingleCourse()
//        getCourses()
//        getWebsiteDescription()
//        getCoursesWithMissingData()
        getCoursesWithSnakeCase()
    }
    
    func getSingleCourse() {
        
        let jsonUrlString = "https://api.letsbuildthatapp.com/jsondecodable/course"
        guard let url = URL(string: jsonUrlString) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {return}
            
            let dataString = String(data: data, encoding: .utf8)
//            print(dataString)
            
            do {
                let courses = try JSONDecoder().decode(Course.self, from: data)
                print(courses)
            }
            catch let jsonErr {
                
            }
            
        }.resume()
    }
    
    func getCourses() {
            
        let jsonUrlString = "https://api.letsbuildthatapp.com/jsondecodable/courses"
        guard let url = URL(string: jsonUrlString) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {return}
            
            do {
                let courses = try JSONDecoder().decode([Course].self, from: data)
                print(courses)
            }
            catch let jsonErr {
                
            }
            
        }.resume()
    }
    
    func getWebsiteDescription() {
            
        let jsonUrlString = "https://api.letsbuildthatapp.com/jsondecodable/website_description"
        guard let url = URL(string: jsonUrlString) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {return}
            
            do {
                let websiteDescription = try JSONDecoder().decode(WebsiteDescription.self, from: data)
                print(websiteDescription)
            }
            catch let jsonErr {
                
            }
            
        }.resume()
    }
    
    func getCoursesWithMissingData() {
            
        let jsonUrlString = "https://api.letsbuildthatapp.com/jsondecodable/courses_missing_fields"
        guard let url = URL(string: jsonUrlString) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {return}
            
            do {
                let courses = try JSONDecoder().decode([Course].self, from: data)
                print(courses)
            }
            catch let jsonErr {
                
            }
            
        }.resume()
    }
    
    func getCoursesWithSnakeCase() {
            
        let jsonUrlString = "https://api.letsbuildthatapp.com/jsondecodable/courses_snake_case"
        guard let url = URL(string: jsonUrlString) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {return}
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let courses = try decoder.decode([NewCourse].self, from: data)
                print(courses)
            }
            catch let jsonErr {
                
            }
            
        }.resume()
    }

}

