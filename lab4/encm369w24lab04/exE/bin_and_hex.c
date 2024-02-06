// bin_and_hex.c
// ENCM 369 Winter 2024 Lab 4 Exercise E

#include <stdio.h>

// NOTE: The functions write_in_hex and write_in_binary assume that
// unsigned int is a 32-bit type.

 
void write_in_hex(char *str, unsigned int word);
// REQUIRES: str points to the beginning of an array of at least 12 elements.
// PROMISES: str[0] == '0' and str[1] == 'x'.  str[2] to str[10] contain
//   the hex digits of word with a single-quote character separating two
//   groups of 4 digits.  str[11] == '\0';
// REMARK: The string created by this function can be copy-pasted as a
//   hex literal into C++ source code.

void write_in_binary(char *str, unsigned int word);
// REQUIRES: str points to the beginning of an array of at least 42 elements.
// PROMISES: str[0] == '0' and str[1] == 'b'.  str[2] to str[40] contain
//   the bits of word with a single-quote characters separating eight
//   groups of bits.  str[41] == '\0';
// REMARK: The string created by this function can be copy-pasted as a
//   binary literal into C++ source code.

 
void test(unsigned int test_value);
// Function to test write_in_binary and write_in_hex.

int main(void)
{
  test(0x76543210);
  test(0x89abcdef);
  test(0);
  test(0xffffffff);
  return 0;
}

void test(unsigned int test_value)
{
  char str[43];
  write_in_hex(str, test_value);
  printf("%s\n", str);
  write_in_binary(str, test_value);
  printf("%s\n\n", str);
}


void write_in_hex(char *str, unsigned int word)
{
  char *digit_list;

  str[0] = '0';
  str[1] = 'x';
  str[6] = '\'';
  str[11] = '\0';

  digit_list = "0123456789abcdef";

  str[2] = digit_list[(word >> 28) & 0xf];
  str[3] = digit_list[(word >> 24) & 0xf];
  str[4] = digit_list[(word >> 20) & 0xf];
  str[5] = digit_list[(word >> 16) & 0xf];

  str[7] = digit_list[(word >> 12) & 0xf];
  str[8] = digit_list[(word >> 8) & 0xf];
  str[9] = digit_list[(word >> 4) & 0xf];
  str[10] = digit_list[word & 0xf];
}


void write_in_binary(char *str, unsigned int word)
{
  int bit_index;                // bit number within word
  int char_index;               // index into str
  int digit0, digit1, squote;

  digit0 = '0';
  digit1 = '1';
  squote = '\'';

  str[0] = '0';
  str[1] = 'b';
  str[41] = '\0';
  char_index = 40;
  bit_index = 0;
  while (1) {
    if ((word & 1) != 0)
      str[char_index] = digit1;
    else
      str[char_index] = digit0;
    if (bit_index == 31)
      break;
    if ((bit_index & 3) == 3) {  // if bit_index % 4 == 3
      char_index--;
      str[char_index] = squote;
    }
    bit_index++;
    char_index--;
    word = word >> 1;
  }
}
