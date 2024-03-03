// My understanding of method declaration

// Access Modifier

/*
public: Can be accessed from any other class
private: Can only be accessed within the same class
protected: Can be accessed within the same package and by subclasses
*/

// Return Type

/*
Return type specifies the type of value that the method will return after execution.
Can use any valid data type in java
'void', the method must end with a 'return' statement that returns a value of the specified type
*/

// Method Name

/*
naming conventions, example (grapeDrink, residentEvil, counterStrike)
*/

// Parameter List

/*
( ) parameters are optional, and a metod can have zero or more parameters
you can have multiple data types in the parameters separated by commas
*/

// Method Body

/*
{ } contains the code that defines the task performed by the method
*/

// Example 1
// Method with Void Return Type and Parameters

public class Text {
	// prints message to console
	public void textMessage(String message) {
		System.out.println("Text Message: " + message);
	}

	public static void main(String[] args) {
		Text text = new Text();
		text.textMessage("No soup for you");
	}
}


// Example 2
// Method to Calculate and Print the Sum of Two Numbers

public class Pikachu {
	public void raichu(int pichu1, int pichu2) {
		int plusle = pichu1 + pichu2;
		System.out.println("Sum of " + pichu1 + " and " + pichu2 + " is " + plusle);
	}

	public static void main (String[] args) {
		Pikachu pikachu = new Pikachu();
		pikachu.raichu(25, 26);
	}
}
