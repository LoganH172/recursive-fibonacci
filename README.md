\# Project Overview and Outline

*Please note that all files have been pushed to GitHub. The repository is at https://github.com/LoganH172/recursive-fibonacci*

\# C# Solution

\# MASM Solution

**Included in repo is a copy of the Irvine libraries used for I/O. Please install them and ensure everything is linked by following the tutorial at https://stackoverflow.com/questions/78174941/how-to-install-and-setup-irvine-library-in-vs-code-2019-for-assembly-language**

**Another note, when analyzing code, you may need to manually change your entry point to the Main function. This is done by going to the solution properties then Linker > Advanced > Entry Point and setting it to "main".**



The MASM solution is broken down into three primary functions as follows:

1. main

&#x20;  \* Defines global variables, includes libraries, and defines other functions used throughout the program. main also serves to initialize values for use in other functions, such as the "fibArray" where the sequence is stored.

&#x20;  \* Main also generates some stack pushes/pops to accommodate function arguments such as ESI being treated as the index/offset to the array in memory.

&#x20;  \* Main serves as the entry point and final return address for all other non-library calls. As such, main also serves as the ExitProcess caller to terminate the program.

2\. Fibonacci

&#x20;  \* Fibonacci maintains the stack by creating its own prologue and epilogue and assigning arguments via relative addressing of EBP. It restores the registers of EAX, ECX and EDX since they are used for calculations/counting.

&#x20;  \* Fibonacci accepts 4 arguments: fibArg1, fibArg2, fibArrayLength, and ESI. fibArg1 and fibArg2 are numbers that will be eventually added together and then passed back into the function. fibArrayLength essentially acts as a counter, since x86 does not natively have an accessor like in C#, there must be an initialized way of tracking the length of the array, to ensure we do not surpass the length. This value is also restored for future use in PrintFibonacci. ESI is utilized as the index/array "reference". This is due to initializing ESI to the offset of the array, and then incrementing ESI by the size of memory each value uses (4 bytes), which allows indexing of values. These arguments are pushed before each recursive call, and then the stack is cleaned by adding to ESP, or in the case of ESI and fibArrayLength stepped back by popping.

&#x20;  \* Fibonacci calculates the sequence by first establishing a base case, ensuring that ECX is not 0, or in other words the array is not full. Then it determines whether ESI is still at the initial offset. This in turn means that we have not started putting values in our array, and we jump to the logic that handles that by moving initialized values of fibArg1 and fibArg2 to the correct positions and then jumping to the rest of the sequence.

&#x20;  \* The rest of the sequence is calculated as follows: adding fibArg1 and fibArg2, storing the new value in the array, storing the previous element (n-1) into EDX, storing EDX into fibArg1 and then finally storing the current element from EAX into fibArg2.

3\. PrintFibonacci

&#x20;  \* PrintFibonacci accepts one argument of fibArrayLength to act as a counter for the main printing loop.

&#x20;  \* PrintFibonacci primarily uses Irvine32 function calls to generate console output.

