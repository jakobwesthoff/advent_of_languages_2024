/*
        /\
       /  \
       /  \
      /  o \
      /    \
     / u    \
     --------
        ||
        ||
*/


#include <stdlib.h>
#include <time.h>
#include <stdio.h>

void draw_ornaments(int len) {
  int i;
  for (i=0;i<len; i++) {
    if ((double)rand()/RAND_MAX < 0.1) {
      putchar('o');
    } else {
      putchar(' ');
    }
  }
}

void draw_group(int n, int len) {
  printf("%*c", len - n + 1, '/');
  draw_ornaments(n*2);
  printf("%c\n", '\\');

  printf("%*c", len - n, '/');
  draw_ornaments((n + 1) * 2);
  printf("%c\n", '\\');
}

void draw_trunk(int spacing) {
  printf("%*c|\n", spacing + 1, '|');
  printf("%*c|\n", spacing +1, '|');
}

void draw_tree(int groups) {
  int i;

  for(i=0; i<groups; i++) {
    draw_group(i, groups);
  } 

  printf("%.*s\n", groups * 2 + 2, "-----------------------------------------------------------------");

  draw_trunk(groups);
}

int main(void) {
  const int groups = 8;
  
  srand(time(NULL));

  draw_tree(groups);

  return 0;
}


