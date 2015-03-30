// Playground - noun: a place where people can play

import Cocoa

/////////////////////////Constatnts and Varaibles

let languageName: String = "Swift"
var languageVersion: Double = 1.0
let introductionYear: Int = 2014
var isAwesomeLanguage: Bool = true

// We may ommit variable and constant type if there is obvious from right hand side
var variableWithExplicitType = "Hello, playground" //inferred to be of type String
var integerVariable = 2014									//inferred to be of type Int

// We may use any Unicode character for var or let naming:
let π = 3.14
let українськаМова = "Ukrainian language"

///////////////////////Strings

// Any String has all variety of objective-C's NSString capabilities and may be used instead of NSString
let components = "~/Documents/Swift/Tutorial.pdf".pathComponents // Returns Array not NSArray
// ["~", "Documents", "Swift", "Tutorial.pdf"]

// All string is a collection of characters.
// We may iterate through this collection in for-each loop:
for character in variableWithExplicitType
{
	println(character)
}

// Character type
var cLetter: Character = "C"
var dLetter: Character = "D"
var eLetter = "E"
var fLetter = "f"

var stringFromCharacters = "\(cLetter)" + "\(fLetter)"
stringFromCharacters += "\(dLetter)"

// Strings interpolation:
let a = 3, b = 5
var resultString = "\(a) times \(b) is \(a * b)"

resultString += "!"

for var counter = 0; counter < b; ++counter
{
	println("\(counter)")
}

//////////////////////////Arrays and Dictionaries

//Array has all benefits of NSArray
//Dictionary has all benefits of NSDictionary

//Two differents between collections (NSArray, NSDictionary) in Objective-C and in Swift:
// 1. Collection can hold any type (not only objects);
// 2. Collections in Swift is Type Collections.
//		Collection in Swift may hold only one object type. Thet was declared

var simpleArray: Array<String> = ["One", "Two", "Three"]
var simpleArray2 = ["Four", "Five", "Six"]

//var simpleArray3: String[] = ["Seven", "Eight", 9] //! Wrong -- array of string should always consist of strings

var theDictionary: Dictionary<String, String>

var theNumberOfLegs = ["Ant" : 6, "Snake" : 0, "Dog" : 4]

// Modifying arrays
var shoppingList = ["Milk", "Eggs"]
println("The first you should buy \(shoppingList[0])")

shoppingList.append("Flour") // Add object
shoppingList += ["Butter", "Cheese", "Chocolate"] // Concatenate array

shoppingList[0] = "Six Eggs" // Change first value

shoppingList[3...5] = ["Apples", "Bannanas"] // Exchange Butter, Cheese, Chocolate with Appleas, Bannanas

// Why the following doesn't work????
theNumberOfLegs.updateValue(273, forKey : "spider")

theNumberOfLegs.updateValue(10, forKey : "spider")   // Correct value

theNumberOfLegs["spider"] = 8

////////////////////////////// Optionals

let possibleLegs: Int? = theNumberOfLegs["aardvark"]

if nil == possibleLegs
{
	println("The aadvark isn't found")
}
else
{
	let legCount = possibleLegs! //unwrap operator -> !
	println("The aadvark has \(legCount) legs")
}

// Some 'synthetic shugar':

if let legCount2 = possibleLegs // if possibleLegs has value unwrap it and assign to legCount2
{
	println("The aarvark has \(legCount2) legs")
}

///////////////////////////// if statement

if var legCount = possibleLegs
{
	if 0 == legCount
	{
		println("It slithers and slides around")
	}
	else if (1 == legCount) // Braces is alowed, but not necessary
	{
		println("It hops")
	}
	else
	{
		println("It walks")
	}
}

///////////////////////////// Switch statement
//1. Switch statement in Swift doesn't have 'breaks'

if var legCount = possibleLegs
{
	switch legCount
	{
		case 0:
			println("It slithers and slides around")
		case 1, 3: // <- complex matching. May be range (1...3)
			println("It hops")
		default:
			println("It walks")
	}
}

//2. In swift you may use any objects for matching in switch statement. Not only integers????
//??? Doesn't work. Why?:

//switch shoppingList
//{
//	case "Milk":
//		println("Full protein meals");
//	case "Bannanas":
//		println("Simple food")
//	default:			// default case is mandatory in Swift
//		println("Unknown food type")
//}

///////////////////////////// Loops

var counter = 3
while counter > 0
{
	println("\(counter)")
	counter--
}

for counter = 0; counter < 5; counter++
{
	println("\(counter)")
}

do
{
	println("\(counter)")
	counter--
} while counter > 0

for (theAnimal, theLegsCount) in theNumberOfLegs
{
	println("The \(theAnimal) has \(theLegsCount) legs!")
}

////////////////////// Functions

func sayHello()
{
	println("Hello Swift")
}

sayHello()

func sayHello2(name: String = "World")
{
	println("Hello \(name)!")
}

sayHello2()
sayHello2(name: "Joe")

func buildGreetings(name: String) -> String
{
	return "Hello " + name
}

println(buildGreetings("World"))

// We may return tuple value from the function

func refreshWebPage() -> (Int, String)
{
	//..do thmthng
	return (200, "Success")
}

let (code, message) = refreshWebPage()

println("Received \(code): \(message)")

//named values in tuple
func refreshWebPage2() -> (code: Int, message: String)
{
	//...do thmthng
	return (200, "Success")
}

let status = refreshWebPage2()

println("Received \(status.code): \(status.message)")

//////////////////////////// Tuples

// Tuples decomposition for enumeration:

for (animal, legs) in theNumberOfLegs
{
	println("\(animal) has \(legs) legs")
}

/////////////////////////// Closures

let someClosure =
{
	println("Hello World")
}

let greetingPrinter: () -> () =
{
	println("Hello World")
}

greetingPrinter()

func repeate(count: Int, closure: () -> ())
{
	for i in 0...(count - 1)
	{
		closure()
	}
}

repeate(3, {println("Hello World")})


// Trailing Closure:
repeate(2)
{
	println("Hello World 2")
}


//////////////////////////////// Classes

class Vehicle
{
	var wheelsCount = 0			// Stored property. Has backing store.
	var description: String		// Computed Property. Doesn't have backing store
	{
		get		// "get" keyword may be ommited in case if there is only getter
		{
			return "The vehicle has \(wheelsCount) wheels"
		}
	}
}

let someVehicle = Vehicle()
println(someVehicle.description)

someVehicle.wheelsCount = 2
println(someVehicle.description)


class Bicycle: Vehicle
{
	override init ()
	{
		super.init()
		wheelsCount = 2
	}
}

let someBicycle = Bicycle()
println(someBicycle.wheelsCount)


class Car : Vehicle
{
	var speed = 0.0;
	override init()
	{
		super.init()
		wheelsCount = 4
	}
	override var description: String
	{
		return super.description + ". Speed \(self.speed) kmh"
	}
}

var myCar = Car()
println(myCar.description)

myCar.speed = 50
println(myCar.description)

/////////////////////////////////// Property observers

class parentsCar : Car
{
	override var speed : Double
	{
		willSet
		{
			if newValue > 60.0
			{
				println("Please, be careful")
			}
		}
		
		didSet
		{
			println("Previous value was \(oldValue)")
		}
	}
}

var myParentsCar = parentsCar()
myParentsCar.speed = 65

////////////////////////////////////// Class Methods

class Counter
{
	var count = 0
	func increment()
	{
		count++
	}
	
	func incrementBy(amount: Int)
	{
		count += amount
	}
	
	func resetToCount(count: Int) // Input func param has name equal to property name...
	{
		self.count = count // ...so use "self." syntax
	}
}

///////////////////////////////////// Structures

struct Point
{
	var x, y: Double
	mutating func moveToTheRightBy(dx: Double)
	{
		self.x += dx
	}
}

var point1 = Point(x: 0.0, y: 0.0)
point1.moveToTheRightBy(10.0)

let point2 = Point(x: 0.0, y: 0.0)
//point2.moveToTheRightBy(15.0) // Error: point2 is constant, but moveToTheRightBy changes the instance

struct Size
{
	var width, height: Double
}

struct Rect
{
	var origin: Point
	var size: Size
	
	var area: Double
	{
		return self.size.width * self.size.height
	}
}

// Two diffs between classes and structures:
//1. Structures don't support inheritance
//2. Classes are passed through reference. Structures are pass by value.

///////////////////////////////// Enums

enum Planet: Int
{
	case Mercury = 1,
	Venus,
	Earth,
	Mars,
	Jupiter,
	Saturn
}

let earthNumber = Planet.Earth.rawValue

// Enums can be of various type:

enum StringsEnum: String
{
	case String1 = "String1"
	case String2 = "String2"
	case String3 = "String3"
}

// Enum could be even without a type:

enum Compass
{
	case North, East, South, West
}

var directionToHead = Compass.West // directionToHead is of type Compass
directionToHead = .East

// Enumerations: Assosiated values:

enum TrainStatus
{
	case OnTime
	case Delayed(Int)
}

var tStatus = TrainStatus.OnTime
tStatus = .Delayed(10)

enum ExtendedTrainStatus
{
	case OnTime, Delayed(Int)
	init()
	{
		self = .OnTime
	}
	var Description: String
	{
		switch self
		{
			case OnTime:
				return "On time"
			case Delayed(let Minutes):
				return "Train delayed on \(Minutes) minutes"
		}
	}
}

var etStatus = ExtendedTrainStatus()
println(etStatus.Description)

etStatus = .Delayed(10)
println(etStatus.Description)

////////////////////////////////// Extensions
// All named type may be extended in Swift

extension Size // extension of Size structure
{
	mutating func increaseByFactor(factor: Double)
	{
		self.width *= factor
		self.height *= factor
	}
}

extension Int
{
	func repetitions(task: ()->())
	{
		for(var i = 0; i < self; ++i)
		{
			task()
		}
	}
}

4.repetitions{println("Hello!")}


////////////////////////////////// Generics
// Like templates in C++

struct Stack<T>
{
	var internalStorage = [T]()
	mutating func Push(element: T)
	{
		internalStorage.append(element)
	}
	mutating func Pop() -> T
	{
		return internalStorage.removeLast()
	}
}

var theStringStack = Stack<String>()

theStringStack.Push("One")
theStringStack.Push("Two")
theStringStack.Push("Three")
theStringStack.Push("Four")

println(theStringStack.Pop())
println(theStringStack.Pop())
println(theStringStack.Pop())


////////////////Optionals////////////////
// Optional types represent possibly missing values.
// Optional has two descreet states:
// 1. Default initialized to nil. Represents absents of any value
var optionalIntVariable: Int?

// 2. When optional wraps some value
optionalIntVariable = 6

//Non-optional types can't be nil
var someVariable: Int?
someVariable = nil

// Optional return type
func indexOfString(inStringArray: [String], inStringToFind: String) -> Int? // optional return type
{
	for (index, value) in enumerate(inStringArray)
	{
		if value == inStringToFind
		{
			return index
		}
	}
	return nil
}

// Unwraping optionals:

var theNeighbors = ["Allan", "Olaf", "Elisabeth", "Ron"]
let theIndex = indexOfString(theNeighbors, "Ron")

if theIndex != nil
{
	println("Hello \(theNeighbors[theIndex!])")
}
else
{
	println("Not found")
}

// Optional bindings:
if let theIndexValue = theIndex // Optional binding uses "if-let" syntax
{
	println("Hello \(theNeighbors[theIndexValue])")
}
else
{
	println("Not found")
}

////////////////Optionals Chaining
class Address
{
	var street: String?
	var building: String?
	var roomNumber: String?
}

class Residence
{
	var address: Address?
}

class Person
{
	var residence: Residence?
}

var theAddress = Address()
theAddress.street = "Kvitnevyy lane"
theAddress.building = "1-V"
var theAppartment = Residence()
var thePerson = Person()

theAppartment.address = theAddress
thePerson.residence = theAppartment

// If we want to check room numder we should:
if let home = thePerson.residence
{
	if let address = home.address
	{
		if let room = address.roomNumber
		{
			if let convertedNumber = room.toInt()
			{
				// do thmthng
			}
		}
	}
}

// Instead we may use optional chaining:
let convertedNumber = thePerson.residence?.address?.roomNumber?.toInt()

thePerson.residence?.address?.building = "123"

//Optional chaining may be combined with optional bindings
if let theBuilding = thePerson.residence?.address?.building?
{
	println("The bulding number is \(theBuilding)")
}

// Optionals are simply generics:
enum Optional<T>
{
	case None
	case Some(T)
}






