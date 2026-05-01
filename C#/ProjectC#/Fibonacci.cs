/*
 * The Fibonacci class file holds the static FibonacciMethod method. It accepts 4 arguments: fibArg1, fibArg2, fibIndex and fibArray.
 * All arguments are reference arguments to modify the original values, to reflect the operations in MASM
 * fibArg1 & fibArg2 are the values that will be added and stored recursively
 * fibIndex is a helper variable that will keep track of individual positions within the array
 * fibArray is an initialized array that you would like to fill with Fibonacci numbers.
 * 
 * Within the method fibStore acts as a helper variable to correctly reassign fibArg1 and fibArg2
 * 
 * Unlike the MASM code, C# natively has a property of any array called Length, meaning we do not need to pass a value to compare.
 */
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjectC_
{
    internal class Fibonacci
    {
        public static void FibonacciMethod(ref uint fibArg1, ref uint fibArg2, ref int fibIndex, ref uint[] fibArray)
        {
            uint fibStore;  // Helper variable

            if (fibIndex > fibArray.Length-1)   //Compares current position to one below the length of array to ensure index does not go OOB. (Length starts from 1, Index starts from 0)
                return;                         //Returns if index is OOB

            if (fibArg1 == 0)               //Checks base case. Since fibArg1 is initialized to 0, if it is true execute code block to assign 0, 1 to array.
            {
                fibArray[fibIndex] = fibArg1;       //Put 0 into array F(0)
                fibIndex++;                         //Next position
                fibArray[fibIndex] = fibArg2;       //Put 1 into array F(1)
                fibIndex++;                         //Next position
                fibStore = fibArg1 + fibArg2;       //fibStore = 0 + 1 = 1 --> Calculate next position F(n-1)+F(n-2)=F(n), n=2
                fibArray[fibIndex] = fibStore;      //Store 
                fibIndex++;                         //Move index to next position
                fibArg1 = fibArg2;                  //Assign fibArg2 (n-1) to fibArg1 (n-2) ---> Due to moving position this becomes (n-2)
                fibArg2 = fibStore;                 //Assign fibStore (n) to fibArg2 (n-1) ---> Due to moving position this becomes (n-1)
                FibonacciMethod(ref fibArg1, ref fibArg2, ref fibIndex, ref fibArray);      //Recursive call
            }
            if (fibArg1 > 0 && fibIndex <= fibArray.Length-1)       //Check for recursive calls to ensure fibArg1 is not 0 and index is not OOB
            {
                fibStore = fibArg1 + fibArg2;       //fibStore = 1 + 1 = 2 --> Calculate next position F(n-1)+F(n-2)=F(n), n=3  (For first recursive call)
                fibArray[fibIndex] = fibStore;      //Store 
                fibIndex++;                         //Move index to next position
                fibArg1 = fibArg2;                  //Assign fibArg1 (n-2) to fibArg2 (n-1) ---> Due to moving position this becomes (n-2)
                fibArg2 = fibStore;                 //Assign fibArg2 (n-1) to fibStore (n) ---> Due to moving position this becomes (n-1)
                FibonacciMethod(ref fibArg1, ref fibArg2, ref fibIndex, ref fibArray);    //Recursive call
            }



            

        }
    }
}
