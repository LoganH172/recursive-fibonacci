/* The Program class file holds the Main method. 
 * 
 * Main holds initial variables for the recursive Fibonacci method such as fibArg1, fibArg2, fibIndex and the initial fibArray.
 * Main handles the first call to the recursive function, as well as the printing logic. 
 * It also creates an infoText to print to screen for transparency and visual clarity of printed sequence.
 *
 */
using System;

namespace ProjectC_
{
    internal class Program
    {
        static void Main(string[] args)
        {
            string infoText = "This function presents each Fibonacci number starting from 0 to the highest number a 32-bit unsigned integer can hold. \nPress any key to continue after each value.\n";
            string infoText2 = "INDEX | FIBONACCI";
            uint[] fibArray = new uint[48]; //Adjust to print arrays of different lengths. CANNOT EXCEED 48 AS THAT WILL OVERFLOW 32 BIT INTEGERS.
            uint fibArg1 = 0;               //Initial value
            uint fibArg2 = 1;               //Initial value
            int fibIndex = 0;               //Initial value
            Fibonacci.FibonacciMethod(ref fibArg1, ref fibArg2, ref fibIndex, ref fibArray);
            int counter = fibArray.Length;      //Helper variable for clean visuals
            Console.WriteLine(infoText);        //Info Text
            Console.ReadKey();                  //Wait for response
            Console.WriteLine(infoText2);       //Info text
            Console.ReadKey();                  //Wait for response 
            foreach (uint fib in fibArray)    //Printing loop  
            {
                
                Console.WriteLine(fibIndex-counter + " | " + fib); //Since fibIndex is a reference,we start with its maximum and then decrement for each time we loop starting with the length of array.
                                                                   //This shows the index of each number.
                Console.ReadKey();              //Wait for response
                counter--;                  //Decrement helper variable each loop
            }
           
            
        }
    }
}
