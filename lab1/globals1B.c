// globals1B.c
// ENCM 369 Winter 2024 Exercise B

void copy(int *to, const int *from, int n)
{
  int i;
  for (i = 0; i < n; i++)
    to[i] = from[i];

  // point one (which is AFTER the loop is finished)

  return;
}


void reverse(int *dest, const int *src, int n)
{
  const int *guard;
  int k = n - 1;
  guard = src + n;
  while (src != guard) {
    dest[k] = *src;
    src++;

    // point two

    k--;
  }

  // point three
}

int aa[4];
int bb[] = {765, 654, 543, 432};
int cc = 800;

void update_cc(int z)
{
  cc += z;
}

int main(void)
{
  int dd[6];
  int ee[4] = {2002, 3003, 4004, 1001};

  update_cc(40);
  copy(dd, bb, 4);
  update_cc(100);
  reverse(aa, ee, 4);
  update_cc(7);
  return 0;
}
