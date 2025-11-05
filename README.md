README for Cars Script
Author Information

Name: Jude Barry
Course: CPSC298
Assignment: Cars.sh
Date: 11/04

Program Description

This Bash script, cars.sh, helps the user maintain an inventory of old cars stored in a file named my_old_cars. Each record in the inventory contains the car’s year, make, and model, separated by colons. The program allows the user to add new cars, view the full inventory sorted by year, or quit the program. It demonstrates how to use a while loop, read statements, and a case statement in Bash to handle user input and file operations.

Car Inventory Rules

This script manages the car inventory according to the following logic:
Typing 1 will add a new car (prompts for Year, Make, and Model)
Typing 2 will display the list of cars in the inventory file sorted by year
Typing 3 will quit the program and display a “Goodbye” message

Each car entry is stored in the format:
YEAR:MAKE:MODEL

Usage

To run the script interactively:
./cars.sh

To test with an input file (for example, cars-input):
./cars.sh < cars-input

Make sure the script is executable before running:
chmod +x cars.sh

How the Script Works
The script begins with a while loop that continuously displays a menu of options until the user chooses to quit. Inside the loop, the program uses read -r to capture user input and a case statement to determine what to do based on the selected option.
When the user selects 1, the script prompts for a car’s Year, Make, and Model, combines them into a single line separated by colons, and appends that line to the my_old_cars file.
When the user selects 2, the script uses the sort command with the -t: and -k1,1n options to display the inventory sorted by year.
When the user selects 3, a “Goodbye” message is printed, and the break statement exits the loop, ending the program.

Testing Results

Valid inputs tested:
Menu choices: 1, 2, and 3
Added entries: 1965 Pontiac GTO, 1987 Buick Grand National — both appended correctly to my_old_cars.
Listing cars (option 2) displayed all records sorted by year.

Invalid inputs tested:
Entering a non-numeric year (e.g., abcd) triggered the “Invalid year” message and did not add a new record.
Entering a menu option other than 1–3 (e.g., 5) displayed “Invalid choice. Please enter 1, 2, or 3.”

Automated testing:
A test file named cars-input was created to simulate user input. Running the command
./cars.sh < cars-input
added two new cars, listed the inventory, and then exited successfully. The output matched the expected behavior.

Challenges and Solutions

Resources
Lecture slides

License
This project is part of coursework for Chapman University and is intended solely for educational purposes.
