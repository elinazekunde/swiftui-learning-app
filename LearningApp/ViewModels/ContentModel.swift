//
//  ContentModel.swift
//  LearningApp
//
//  Created by Elīna Zekunde on 15/03/2021.
//

import Foundation

class ContentModel: ObservableObject {
    
    // List of modules
    @Published var modules = [Module]()
    
    // Current module
    @Published var currentModule: Module?
    var currentModuleIndex = 0
    
    var styleData: Data?
    
    init() {
        
        getLocalData()
    }
    
    // MARK: Data Methods
    
    func getLocalData() {
        
        //get a url to the json file
        let jsonUrl = Bundle.main.url(forResource: "data", withExtension: "json")
        
        do {
            //read the file into a data object
            let jsonData = try Data(contentsOf: jsonUrl!)
            
            //try to decode json into an array of modules
            let jsonDecoder = JSONDecoder()
            let modules = try jsonDecoder.decode([Module].self, from: jsonData)
            
            //assign parsed modules to modules property
            self.modules = modules
        } catch {
            print("Could not parse local data: \(error)")
        }
        
        //parse the style data
        let styleUrl = Bundle.main.url(forResource: "style", withExtension: "html")
        
        do {
            
            //read the file into a data object
            let styleData = try Data(contentsOf: styleUrl!)
            
            self.styleData = styleData
        } catch {
            print("Could not parse style data: \(error)")
        }
    }
    
    // MARK: Module Navigation Methods
    
    func beginModule(_ moduleid: Int) {
        
        // Find the index for this module id
        for index in 0..<modules.count {
            if modules[index].id == moduleid {
                // Found the matching module
                currentModuleIndex = index
                break
            }
        }
        
        // Set the current module
        currentModule = modules[currentModuleIndex]
        
    }
}
