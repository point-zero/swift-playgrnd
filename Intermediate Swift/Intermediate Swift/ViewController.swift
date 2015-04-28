//
//  ViewController.swift
//  Intermediate Swift
//
//  Created by Denis on 4/2/15.
//  Copyright (c) 2015 Denis. All rights reserved.
//

import UIKit

class CreditCard
{
	unowned let holder: StrongPerson
	init (holder: StrongPerson)
	{
		self.holder = holder
		println("Credit card initialized")
	}
	deinit { println("Credit card deinitialized") }
}

class StrongPerson
{
	let name: String
	var appartment: Appartment?
	var creditCard: CreditCard?
	init (name: String) {
		self.name = name
		println("\(self.name) instance is initialized")
	}
	
	deinit { println("\(self.name) instance is deinitialized") }
}

class Appartment
{
	let number: Int
	var tenant: StrongPerson?
	init (number: Int)
	{
		self.number = number
		println("Created appartment \(self.number)")
	}
	deinit { println("Appartment instance is deinitialized") }
}

class Country
{
	let name: String
	let capital: City!
	
	init (name: String, capitalName: String)
	{
		self.name = name
		self.capital = City(name: capitalName, country: self)
		println("Country \(self.name) initialized")
	}
	
	deinit{println("Country \(self.name) deinitialized")}
}

class City
{
	let name: String
	unowned let country: Country
	init (name: String, country: Country)
	{
		self.name = name
		self.country = country
		println("City \(self.name) initialized")
	}
	deinit {println("City \(self.name) deinitialized")}
}


class classWithClosure
{
	let name: String
	// The following closure captures self and strong references cycle occured
	lazy var someClosure: () -> String =
	{
		println("Closure called")
		return "The class instance has \(self.name) name"
	}
	
	init(name: String)
	{
		self.name = name
		println("The class instance with \(self.name) is initialized")
	}
	deinit
	{
		println("Instance \(name) of classWithClosure is deallocated")
	}
}

class properClassWithClosure
{
	let name: String
	lazy var someClosure: () -> String =
	{
		// it is a capture list below
		[unowned self] in
		println("Closure called")
		return "The class instance has \(self.name) name"
	}
	
	init(name: String)
	{
		self.name = name
		println("The class instance with \(self.name) is initialized")
	}
	deinit
	{
		println("Instance \(name) of classWithClosure is deallocated")
	}
}


// Memberwise initialization exists only for structures
struct Color
{
	let red, green, blue: Float
}

struct ExplicitInitialization
{
	var someProperty: String
	
	// Explicit external parameter names may be ommited by underscore symbol "_"
	// And during instance initialization parameter name may be ommited
	init (_ value: String)
	{
		self.someProperty = value
	}
}

//////////////////// Failable initializer
// Initializer may return nil value if something gone wrong
struct classWithFailableInitializer
{
	let someString: String
	init?(someString: String)	// Failable initializer is marked by "?"
	{
		if (someString.isEmpty)
		{
			return nil
		}
		self.someString = someString
	}
}

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		
		/////////////////////////////////////////// Strong references
		var strongPerson1 :StrongPerson? = nil
		var strongPerson2 :StrongPerson? = nil
		var strongPerson3 :StrongPerson? = nil

		// StrongPerson instance will be created in the next line:
		strongPerson1 = StrongPerson(name: "Denis")
		strongPerson2 = strongPerson1
		strongPerson3 = strongPerson2

		strongPerson1 = nil
		strongPerson2 = nil

		// Strong person will be deallocated in the next line:
		strongPerson3 = nil
		
		
		//////////////////////////////////////////// Strong reference cycles

		var john: StrongPerson? = StrongPerson(name: "John")
		var apartment: Appartment? = Appartment(number: 123)
		
		apartment?.tenant = john
		john?.appartment = apartment
		
		// there may be retain cycle, so one of property should be a weak reference
		apartment = nil
		john = nil
		
		////////////////////////////////////////////Unowned property
		var Steve: StrongPerson? = StrongPerson(name: "Steve")
		
		Steve?.creditCard = CreditCard(holder: Steve!)
		
		Steve = nil
		
		var country: Country? = Country(name: "Ukraine", capitalName: "Kiev")
		
		country = nil
		
		
		////////////////////// Capture list
		
		var someClassWithClosure: classWithClosure? = nil
		someClassWithClosure = classWithClosure(name: "Some class")
		
		println(someClassWithClosure?.someClosure())
		
		// class instance won't be deinitialized, since there is strong reference cycle
		someClassWithClosure = nil
		
		
		
		var someProperClassWithClosure: properClassWithClosure? = nil
		
		someProperClassWithClosure = properClassWithClosure(name: "proper class")

		println(someProperClassWithClosure?.someClosure())
		
		someProperClassWithClosure = nil
		
		
		
		///////////////////// Memberwise initialization
		// Color class doesn't have defined initializer
		let someColor = Color(red: 1, green: 25, blue: 100)
		
		
		///////////////////// Initializer Parameters Without External Names
		var explicitInitialization = ExplicitInitialization("value")
		
		//////////////////// Failable initializer
		
		var theFailableInstance = classWithFailableInitializer(someString: "")
		
		if var unvrappedInstance = theFailableInstance?
		{
			println("Class created")
		}
		
		var someVariable: String
		if (true)
		{
			someVariable = "Hello world"
		}
		else
		{
			someVariable = "dfdfdf"
		}
		
		println("\(someVariable)")
		
		/////////////////////////////// Closures
		
		var someArray = ["zxc", "bcd", "abc", "aabc"]
		
		
		// full closure definition
		someArray.sort({(a: String, b: String) -> Bool in
			return a < b
		})
		
		println("\(someArray)")
		
		someArray.sort({(a, b) in
			return b < a
		})
		
		println("\(someArray)")
		
		someArray.sort({a, b in
			return a < b
		})
		
		println("\(someArray)")
		
		someArray.sort({a, b in
			return b < a
		})
		
		println("\(someArray)")
		
		someArray.sort({a, b in a < b})
		
		println("\(someArray)")
		
		someArray.sort({$1 < $0})   //Implicite argument names
		
		println("\(someArray)")
		
		someArray.sort{$0 < $1}   //Trailing closures
		
		println("\(someArray)")
		
		/// Functioanal programming
		
		var someStrArray = ["Aadwark", "Woodwerk", "Woodwork", "SomeString", "A"]
		
		println(someStrArray.filter{$0.hasSuffix("rk")}.map{$0.uppercaseString}.reduce("HULK"){"\($0), \($1)"})
		
		
		// Switches
		
		var someString = "One"
		
		switch someString
		{
			case "One", "Two":
				println("One")
			case "Two":
				println("Two")
			case "Three":
				println("Tree")
			default:
				println("Default")
		}
		
		enum TrainStatus
		{
			case onTime
			case delayed(Int)
		}
		
		var trainInstance: TrainStatus = .delayed(20)
		
		switch trainInstance
		{
			case .onTime:
				println("Train arrives in time")
			case .delayed(let minutes):
				println("Train delayed by \(minutes) minutes")
		}
		
		switch trainInstance
		{
		case .onTime:
			println("Train arrives in time")
		case .delayed(1):
			println("Train arrives almost in time")
		case .delayed(2...10):
			println("Train delayed for a little")
		case .delayed(_):  // _ wildcard pattern
			println("It's rude")
		}
		
		enum VacationStatus
		{
			case travelling(TrainStatus)
			case relaxing(daysLeft: Int)
		}
		
		var myVacation: VacationStatus = .travelling(.delayed(15))
		
		switch myVacation
		{
			case .travelling(.onTime):
				println("It's cool. Get out of there")
			case .travelling(.delayed(1...5)):
				println("Get ready!")
			case .travelling(.delayed(_)):
				println("Borring")
		}
		
		// Type patterns
		
		// Tuple patterns
		
		let color = (1.0, 1.0, 1.0, 1.0)

		switch color
		{
			case (0, 0.9...1.0, let green, _):
				println("First case: \(green) green")
			case let (r, g, b, 1.0) where r == g && g == b:
				println("Second case")
			default:
				println("Default case")
		}
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

