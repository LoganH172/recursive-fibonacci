using System;

namespace ProjectC_
{
    internal class Program
    {
        static void Main(string[] args)
        {
            uint[] fibArray = new uint[48];
            uint fibArg1 = 0;
            uint fibArg2 = 1;
            int fibIndex = 0;
            Fibonacci.FibonacciMethod(ref fibArg1, ref fibArg2, ref fibIndex, ref fibArray);
            int counter = fibArray.Length;
            foreach (uint fib in fibArray)
            {
                
                Console.WriteLine(fibIndex-counter + " | " + fib);
                Console.ReadKey();
                counter--;
            }
           
            
        }
    }
}
