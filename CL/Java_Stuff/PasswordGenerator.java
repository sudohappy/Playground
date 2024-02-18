public class PasswordGenerator {
	static final String upperCase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
	static final String lowerCase = "abcdefghijklmnopqrstuvwxyz";
	static final String numbers = "0123456789";
	static final String specialCharacters = "!@#$%^&*()`~-_=+,<.>/?[{]}|\"";

	public static void main(String[] args) {
		generatePassword();
	} // Closing for main(String[] args) block

	public static void generatePassword() {
		String allCharacters = upperCase + lowerCase + numbers + specialCharacters;
		java.io.BufferedReader br = new java.io.BufferedReader(new java.io.InputStreamReader(System.in));

		try {
			System.out.println("Enter password length (min 8, max 16): ");
			int passwordLength = Integer.parseInt(br.readLine());

			if (passwordLength >= 8 && passwordLength <= 16) {
				java.util.Random random = new java.util.Random();
				StringBuilder passwordBuilder = new StringBuilder();

				for (int i = 0; i < passwordLength; i++) {
					int randomIndex = random.nextInt(allCharacters.length());
					char randomChar = allCharacters.charAt(randomIndex);
					passwordBuilder.append(randomChar);
				} // Closing for for block

				String password = passwordBuilder.toString();
				System.out.println("Generated Password: " + password);
			} else { // Closing for if block
				System.out.println("Invalid password length. Please enter a value between 8 and 16.");
			} // Closing for else
		} catch (Exception e) { // Closing for try block
			System.out.println("Error: " + e.getMessage());
		} // Closing for catch
	} // Closing for public static void generatePassword()
} // Closing for public class PasswordGenerator
