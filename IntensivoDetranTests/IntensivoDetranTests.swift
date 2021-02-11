//
//  IntensivoDetranTests.swift
//  IntensivoDetranTests
//
//  Created by Beatriz Carlos on 03/02/21.
//

import XCTest
@testable import IntensivoDetran

class IntensivoDetranTests: XCTestCase {
    // Category Model
    func testCategoryModel_canCreateInstance() {
        let instance = Categories(categoriesId: 1, name: "Test category")
        XCTAssertNotNil(instance, "Modelo falhou ao instacia-lo.")
    }
    
    // Result View
    func testResultView_init() {
        let instance = ResultView(frame: UIScreen.main.bounds)
        XCTAssertNotNil(instance, "Não conseguiu inicializar o view ResultView")
    }
    
    // Colors
    func testColors_testingThColorTitleGet() {
        let colorTitle = UIColor(red: 0.20, green: 0.21, blue: 0.43, alpha: 1.00)
        XCTAssertEqual(UIColor.colorTitle, colorTitle, "As cores não são iguais - color title.")
    }
    
    func testColors_testingThePrimaryColorGet() {
        let primaryColor = UIColor(red: 0.00, green: 0.62, blue: 0.59, alpha: 1.00)
        XCTAssertEqual(UIColor.colorPrimary, primaryColor, "As cores não são iguais - primary color.")
    }
    
    func testColors_testingThecolorCheckButtonrGet() {
        let colorCheckedButton = UIColor(red: 0.84, green: 0.95, blue: 0.93, alpha: 1.00)
        XCTAssertEqual(UIColor.colorCheckedButton, colorCheckedButton, "As cores não são iguais - color checked button.")
    }
    
    // SimulatedViewModel
    func testSimulatedViewModel_init() {
        let instance = SimulatedViewModel(baseUrl: "https://api-idetran.herokuapp.com/api/")
        XCTAssertNotNil(instance, "Não conseguiu inicializar o view SimulatedViewModel")
    }
    
    func testApi_getAllQuestions() {
        let instance = SimulatedViewModel(baseUrl: "https://api-idetran.herokuapp.com/api/")
//        var dataMock = [Question]()
        XCTAssertNotNil(instance, "Não conseguiu inicializar o view SimulatedViewModel")
    }
    
    // Ext+Border
    func testBorder_BorderSide() {
        let viewMocking = UIView()
        XCTAssertNotNil(viewMocking.addBorder(side: .bottom, color: .black, width: 1), "Não conseguiu inicializar o view Ext+Border com bordar em baixo")

    }
    
    // Menu view
    func testMenuView_init() {
        let instance = MenuView(frame: UIScreen.main.bounds)
        XCTAssertNotNil(instance, "Não conseguiu inicializar o view MenuView")
    }
    
    // Answer
    
    // Spiner
    func testSpiner() {
        let viewControllerT = UIViewController()
        XCTAssertNotNil(viewControllerT.showSpinner(), "Não conseguiu inicializar o view Ext+Border com bordar em baixo")
        
        XCTAssertNotNil(viewControllerT.removeSpinner(), "Não conseguiu inicializar o view Ext+Border com bordar em baixo")
    }
    
    // Simulated View
    func testSimulatedView_init() {
        let instance = SimulatedView(frame: UIScreen.main.bounds)
        XCTAssertNotNil(instance, "Não conseguiu inicializar o view MenuView")
    }
    
    func testSimulatedViewController_init() {
//        let questionMock =  [Question]()
//        XCTAssertEqual(questionMock, SimulatedViewController().questionsResult, "Não são iguais")
    }
}
