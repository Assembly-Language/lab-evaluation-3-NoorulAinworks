#include <stdio.h>
#include <conio.h>

// Function prototype for the assembly function
#ifdef __cplusplus
extern "C" {
#endif

void __stdcall asmfunc(int *array, int size); // Updated prototype to include size

#ifdef __cplusplus
}
#endif

int main() {
    system("cls");
    
    // Declare and initialize the array
    int array[] = {0, -3, 5, 0, -7, 0, 2, -8, 0, 1};
    int size = sizeof(array) / sizeof(array[0]); // Calculate the size of the array
    
    printf("Calling assembly function to count non-zero values...\n");
    getch();

    // Call the assembly function with the array and its size
    asmfunc(array, size); 

    getch();
    printf("Back to C!\n");

    return 0;
}