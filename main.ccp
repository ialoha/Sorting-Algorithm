#include <stdio.h>
#include <math.h>
#include <cmath>
#include <windows.h>
#include <time.h>
#include <assert.h>

int main()
  {
  float array[100], swap;
  int c, d, n;
  LARGE_INTEGER frequency; // ticks per second
  LARGE_INTEGER t1, t2; // ticks
  double elapsedTime;
  time_t start, stop;
  clock_t ticks;
  long count;
  
  QueryPerformanceFrequency(&frequency);
  time(&start);
  
  printf("Enter number of elements\n");
  scanf("%d", &n);

  printf("Enter %d numbers\n", n);

  for (c = 0; c < n; c++)

    scanf("%f", &array[c]);
  QueryPerformanceCounter(&t1);
  for (c = 0; c < (n - 1); c++)
  {
    for (d = 0; d < n - c - 1; d++)
      {
        if (array[d] > array[d + 1]) /* For decreasing order use < */
        {
            swap = array[d];
            array[d] = array[d + 1];
            array[d + 1] = swap;
        }
      }
  }

printf("Sorted list in ascending order:\n");

for (c = 0; c < n; c++)

  printf("%f\n", array[c]);
 
time(&stop);
QueryPerformanceCounter(&t2);
elapsedTime = (t2.QuadPart - t1.QuadPart) * 1000.0 / frequency.QuadPart;

printf("Elapsed Time--program time %f\n", difftime(stop, start));
printf("Elapsed Time--real time %f\n", elapsedTime);
scanf("%d", &n);
return 0;
}
