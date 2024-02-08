//
//  InfoModelTest.swift
//  FindMyIPTests
//
//  Created by himanshu.goyal@telusinternational.com on 08/02/24.
//

import XCTest
@testable import FindMyIP

final class InfoModelTest: XCTestCase {

    var stub: InfoModel!
    
    override func setUpWithError() throws {
        let data = try getData(fromJSON: "ipJSON")
        stub = try JSONDecoder().decode(InfoModel.self, from: data)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        stub = nil
    }

    func test_JSON_Mapping_Success(){
        XCTAssertEqual(stub.country, "IN")
    }
    
    func test_JSON_Mapping_Fail(){
        XCTAssertNotEqual(stub.country, "India")
    }
    
    func test_Country_Population_Type_Success(){
        XCTAssertTrue((stub.country_population as Any) is Int)
    }
    
    func test_Country_Population_Type_Fail(){
        XCTAssertFalse((stub.country_population as Any) is String)
    }
}

extension XCTestCase{
    enum TestError: Error{
        case fileNotFound
    }
    
    //This function is used to get the json file from bundle
    func getData(fromJSON fileName: String) throws -> Data{
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: fileName, withExtension: ".json") else{
            XCTFail("Missing File")
            throw TestError.fileNotFound
        }
        
        do{
            let data = try Data(contentsOf: url)
            return data
        }catch{
            throw error
        }
    }
}
