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
            uint fibStore;

            if (fibIndex > fibArray.Length-1)
                return;

            if (fibArg1 == 0)
            {
                fibArray[fibIndex] = fibArg1;
                fibIndex++;
                fibArray[fibIndex] = fibArg2;
                fibIndex++;
                fibStore = fibArg1 + fibArg2;
                fibArray[fibIndex] = fibStore;
                fibIndex++;
                fibArg1 = fibArg2;
                fibArg2 = fibStore;
                FibonacciMethod(ref fibArg1, ref fibArg2, ref fibIndex, ref fibArray);
            }
            if (fibArg1 > 0 && fibIndex <= fibArray.Length-1)
            {
                fibStore = fibArg1 + fibArg2;
                fibArray[fibIndex] = fibStore;
                fibIndex++;
                fibArg1 = fibArg2;
                fibArg2 = fibStore;
                FibonacciMethod(ref fibArg1, ref fibArg2, ref fibIndex, ref fibArray);
            }



            

        }
    }
}
