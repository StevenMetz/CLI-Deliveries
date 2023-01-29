### PsuedoCode

This CLI should be able to take as arguments two files one with the input the the names for the drivers and the next argument the file containing the addresses. Then we need to sort each of the arrays into easier to work with data. These names will be moved into arrays of vowels and consonants checking which name has more vowels or consonants and putting them into their perspective place and sorting them by greatest to least. In doing this to the names we can now easily make use of our SS for the addresses to be delivered to. Now its time to sort through the addresses and move them into seperate arrays by the length of the addresses one array being odd the other even. We now have the data sorted in a way that makes doing the math for the SS easy for us. Next the methods for calculating our ss
need to be created working with vowels for even streets and working with consonants for odd streets. Even streets have the greatest chance of giving us the highest SS score so we will itterate through those first. Since we are working with evens and odds the bonus SS will be added to each one if the the name is also even or odd. Even streets with even names should give the highest SS. Until even addresses array is empty we will use that array first since odd addresses with odd names are the same as even addresses. Then odd names with odd addresses will be will done next after odd names are finished the program will finish off assigning the names to addresses in order they come.

### Steps Taken

1. Write methods to do the math for SS
2. Test method work with printing to terminal
3. Write methods to split names and addresses to evens and odds
4. Test methods work with printing to terminal
5. Write methods to sort even names by vowels and odd names by consonants
6. Test methods work with printing to terminal
7. Write methods for taking in two seperate files as arguments
8. Print statements to the terminal asking for names and addresses
9. Write logic for getting the users input for both names and addresses
10. Test that the input works by printing to the terminal the data entered
11. Split up the names and addresses into even and odd arrays to maximize ss
12. Test that it works as intended with printing to terminal
13. Write a loop that iterates through the even names and pairing them with even addresses and gives SS
14. Test functionality of loop
15. Write loop that iterates through odd names and odd addresses and gives SS
16. Make Variable called names_left
17. Write logic that checks to see if even names are empty if not move them to names left
18. Test that the logic acts as intended
19. Repeat #17 for odd name
20. Write the logic for checking if even_addresses are empty if not loop through even addresses pairing remaing names
21. Test #20 works with printing to terminal
22. Do same as 20 but for odd addresses instead
23. Test 22 works with printing to terminal
24. Put ss keys together with names and addresses with variable
25. Test 24 works with printing to terminal
26. Sum up ss keys array
27. Test 26 works with printing to terminal
28. Print variable from 24 to terminal
29. Print variable from 26 to terminal
30. Make a Read Me
