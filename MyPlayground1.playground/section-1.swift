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

var stringFromCharacters = cLetter + fLetter
stringFromCharacters += dLetter

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

let theNumberOfLegs = ["Ant" : 6, "Snake" : 0, "Dog" : 4]

// Modifying arrays
var shoppingList = ["Milk", "Eggs"]
println("The first you should buy \(shoppingList[0])")

shoppingList += "Flour" // Add object
shoppingList += ["Butter", "Cheese", "Chocolate"] // Concatenate array

shoppingList[0] = "Six Eggs" // Change first value

shoppingList[3...5] = ["Apples", "Bannanas"] // Exchange Butter, Cheese, Chocolate with Appleas, Bannanas

// Why the following doesn't work????
//theNumberOfLegs["spider"] = 273 // Add 'spider' entry into legs dictionary
//theNumberOfLegs["spider"] = 8   // Correct value

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

//2. In swift you may use any objects for matching in switch statement. Not only integers

switch shoppingList
{
	case "Milk", "Eggs":
		println("Full protein meals");
	case "Bannanas", "Appleas":
		println("Simple food")
	default:
		println("Unknown food type")
}

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

func repeate (count: Int, closure: () -> ())
{
	for i in 0...(count - 1)
	{
		closure()
	}
}

repeate(3, {println("Hello World")})

repeate(2)
{
	println("Hello World 2")
}


/////////////Classes////////////////

class Vehicle
{
	var wheelsCount = 0
	var description: String
	{
		get
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
		
	}
}

var myParentsCar = parentsCar()
myParentsCar.speed = 65


struct Point
{
	var x, y: Double
	mutating func moveToTheRightBy(dx: Double)
	{
		self.x +=
					dx
	}
}

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

///////////////////Generic////////////////////

class Stack<T>
{
	var elementsStore = [T]()
	func Push(InputValue: T)
	{
		elementsStore.append(InputValue)
	}
	func Pop() -> T
	{
		return elementsStore.removeLast()
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

//Non-optional variables couldn't be nil
var someVariable: Int?
someVariable = nil

func indexOfString(inStringArray: [String], inStringToFind: String) -> Int?
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

var theNeighbors = ["Allan", "Olaf", "Elisabeth", "Ron"]
var theIndex = indexOfString(theNeighbors, "Ron")

if theIndex != nil
{
	println("Hello \(theNeighbors[theIndex!])")
}
else
{
	println("Not found")
}

if let theIndexValue = theIndex
{
	println("Hello \(theNeighbors[theIndexValue])")
}
else
{
	println("Not found")
}

////////////////Optionals Chains////////////////

class Address
{
	var street: String?
	var building: String?
}

class Appartment
{
	var address: Address?
}

class Person
{
	var appartment: Appartment?
}

var theAddress = Address()
var theAppartment = Appartment()
var thePerson = Person()

theAppartment.address = theAddress
thePerson.appartment = theAppartment


thePerson.appartment?.address?.building = "123"

if let theBuilding = thePerson.appartment?.address?.building?
{
	println("The bulding number is \(theBuilding)")
}






