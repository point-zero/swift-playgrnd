// Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"
println("Hello World")

for character in str
{
	println(character)
}

var dLetter: Character = "D"
var cLetter: Character = "C"

//var dPlusC = dLetter + cLetter // Why this doesn't work
let dPlusC = "\(dLetter)\(cLetter)"

let a = 3, b = 5
var resultString = "\(a) times \(b) is \(a * b)"

resultString += "!"

for var counter = 0; counter < b; ++counter
{
	println("\(counter)")
}

var counter = 0
while counter < b
{
	println("\(counter)")
	counter++
}

var simpleArray: [String] = ["One", "Two", "Three"]


//////////////Dictionary///////////////////

var theDictionary: Dictionary<String, String>

let theNumberOfLegs = ["Ant" : 6, "Snake" : 0, "Dog" : 4]

for (theAnimal, theLegsCount) in theNumberOfLegs
{
	println("The \(theAnimal) has \(theLegsCount) legs!")
}


var theProbableCatLegsCount: Int? = theNumberOfLegs["Cat"]

if nil == theProbableCatLegsCount
{
	println("No legs found")
}
else
{
	var theCatLegsCount: Int = theProbableCatLegsCount!
	println("Cat has \(theCatLegsCount)")
}

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






