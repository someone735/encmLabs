// string-funcs.c
// ENCM 369 Winter 2024 Lab 4 Exercise C

#include <stdio.h>

void copycat(char *dest, const char *src1, const char *src2)
{
  int di, s2i;
  char c;
  for(di = 0; src1[di] != '\0'; di++)
    dest[di] = src1[di];
  s2i = 0;
  do {
    c = src2[s2i];
    dest[di] = c;
    s2i++;
    di++;
  } while (c != '\0');
}

void lab4reverse(char *str)
{
  // Reverses the order of characters in a C string.
  char *left, *right;
  char temp;
  right = left = str;
  while (*right != '\0')
    right++;
  right--;
  while (left < right) {
    temp = *left;
    *left = *right;
    *right = temp;
    left++;
    right--;
  }
}

void print_in_quotes(const char *str)
{
  fputc('"', stdout);
  fputs(str, stdout);
  fputc('"', stdout);
  fputc('\n', stdout);
}

char array1[32] = {
  '\0', '*', '*', '*', '*', '*', '*', '*', 
  '*', '*', '*', '*', '*', '*', '*', '*', 
  '*', '*', '*', '*', '*', '*', '*', '*', 
  '*', '*', '*', '*', '*', '*', '*', '*', 
};

char array2[ ] = "X";
char array3[ ] = "YZ";
char array4[ ] = "123456";
char array5[ ] = "789abcdef";

int main(void)
{
  copycat(array1, "", "");  
  fputs("After 1st call to copycat, array1 has ", stdout);
  print_in_quotes(array1);

  copycat(array1, "good", "");  
  fputs("After 2nd call to copycat, array1 has ", stdout);
  print_in_quotes(array1);

  copycat(array1, "", "bye");  
  fputs("After 3rd call to copycat, array1 has ", stdout);
  print_in_quotes(array1);

  copycat(array1, "good", "bye");  
  fputs("After 4th call to copycat, array1 has ", stdout);
  print_in_quotes(array1);

  lab4reverse(array2);
  fputs("After use of lab4reverse, array2 has ", stdout);
  print_in_quotes(array2);

  lab4reverse(array3);
  fputs("After use of lab4reverse, array3 has ", stdout);
  print_in_quotes(array3);

  lab4reverse(array4);
  fputs("After use of lab4reverse, array4 has ", stdout);
  print_in_quotes(array4);

  lab4reverse(array5);
  fputs("After of use of lab4reverse, array5 has ", stdout);
  print_in_quotes(array5);

  return 0;
}
