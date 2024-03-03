// My understanding of the Data types in Java

// Primitive Data Type
int num = 25; // Integer Number
double dec = 17.38; // Decimal Value
boolean BigTrue = true; // True or False Value
char letter = 'C'; // Character Value

// Reference Data Type
String Pokemon = "Pikachu"; // Sequence of characters
int[] floor = {1, 2, 3, 4}; // Collection of Values of the same data type
class PokemonCard { // Class definition
	String name; //Blueprint Structure
	String type;
	String rarity;
	boolean holo;
	int id;
}

PokemonCard myCard = new Card(); // myCard is an instance of PokemonCard class
myCard.name = "Charizard"; //Referred to the Blueprint Structure by name
myCard.type = "Fire";
myCard.rarity = "Star";
myCard.holo = true;
myCard.id = 0006;

// Wrapper Class, encapsulate primitive data types allowing them to be teated as objects

Integer integerObject = new Integer(2); // Wrapper class for int
Double doubleObject = new Double(5.10); // Wrapper class for double
Boolean booleanObject = new Boolean(true); // Wrapper class for boolean
Character characterObject = new Character('R'); // Wrapper class for character

// Enumerations are special data types, not sure if Ill actually use this in the future
// Its similar to dictionaries in Python if I'm not mistaken
public enum Pokedex {
	Bulbasaur,
	Ivysaur,
	Venusaur,
	Charmander,
	Charmeleon,
	Charizard,
	Squirtle,
	Wartortle,
	Blastoise
}

// accessing the enum
public class main {
	public static void main(String[] args) {
		// Enum
		Pokedex bulbasaur = Pokedex.Bulbasaur;
		Pokedex charmander = Pokedex.Charmander;
		Pokedex squirtle = Pokedex.Squirtle;

		// Displaying enum
		System.out.println("First Pokemon: " + bulbasuar);
		System.out.println("Second Pokemon: " + charmander);
		System.out.println("Third Pokemon: " + Squirtle);
	}
}
