// lab1exH.c
// ENCM 369 Winter 2024 Lab 1 Exercise H

#include <stdio.h>

void print_array(const char *str, const int *a, int n);
// Prints the string given by str on stdout, then
// prints a[0], a[1], ..., a[n - 1] on stdout on a single line.

void sort_array(int *x, int n);
// Sorts x[0], x[1], ..., x[n - 1] from smallest to largest.

int main(void)
{
  int test_array[] = { 4000, 5000, 7000, 1000, 3000, 4000, 2000, 6000 };

  print_array("before sorting ...", test_array, 8);
  sort_array(test_array, 8);
  print_array("after sorting ...", test_array, 8);
  return 0;
}

void print_array(const char *str, const int *a, int n)
{
  int i;
  puts(str);
  i = 0;
  goto onlyForLoop;
  onlyForLoop:
    printf("    %d", a[i]);
    i++;
    if (i<n) goto onlyForLoop;
  printf("\n");
}

void sort_array(int *x, int n)
{
  // This is an implementation of an algorithm called selection sort.

  int outer, inner, max, i_of_max;
  //

  outer = n;
  goto outerForLoop;
  outerForLoop:
    i_of_max = outer;
    max = x[outer];
    inner = 0;
    goto innerForLoop;
    innerForLoop:
      if (x[inner] > max) {
        i_of_max = inner;
        max = x[inner];
      }
      inner++;
      if (inner < outer) goto innerForLoop;
    outer--;
    if (outer > 0) goto outerForLoop;
    
    x[i_of_max] = x[outer];
    x[outer] = max;
  //
}
