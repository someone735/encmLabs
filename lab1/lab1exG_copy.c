// lab1exG_copy.c
// ENCM 369 Winter 2024 Lab 1 Exercise G

#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#define MAX_ABS_F (5.0e-9)
#define POLY_DEGREE 4

double polyval(const double *a, int n, double x);
/* Return a[0] + a[1] * x + ... + a[n] * pow(x, n). */

int main(void)
{
    double f[] = {1.47, 0.73, -2.97, -1.15, 1.00};
    double dfdx[POLY_DEGREE];

    double guess;
    int max_updates;
    int update_count;
    int n_scanned;
    int i;
    int flag;

    double current_x, current_f, current_dfdx;

    printf("This program demonstrates use of Newton's Method to find\n"
           "approximate roots of the polynomial\nf(x) = ");
    printf("%.2f", f[0]);
    i = 1;
    goto forLoop1;
    forLoop1:
        if (f[i] < 0) goto antiCaseL35;
        printf(" + %.2f*pow(x,%d)", f[i], i);
        goto endIfL37;
        antiCaseL35:
            printf(" - %.2f*pow(x,%d)", -f[i], i);
        endIfL37:
        i++;
        if (i <= POLY_DEGREE) goto forLoop1; 
    
    printf("\nPlease enter a guess at a root, and a maximum number of\n"
           "updates to do, separated by a space.\n");
    n_scanned = scanf("%lf%d", &guess, &max_updates);
    if (n_scanned != 2) {
        printf("Sorry, I couldn't understand the input.\n");
        exit(1);
    }

    if (max_updates < 1)  {
        printf("Sorry, I must be allowed do at least one update.\n");
        exit(1);
    }
    printf("Running with initial guess %f.\n", guess);

    i = POLY_DEGREE-1;
    goto forLoop2;
    forLoop2:
        dfdx[i] = (i + 1) * f[i + 1];   // Calculus!
        i--;
        if (i>=0) goto forLoop2;
        
    current_x = guess;
    update_count = 0;
    flag = 0;
    whileLoop1:
        current_f = polyval(f, POLY_DEGREE, current_x);
        printf("%d update(s) done; x is %.15f; f(x) is %.15e\n",
               update_count, current_x, current_f);
        if (fabs(current_f) >= MAX_ABS_F) goto checkUpdate;
            flag = 1;
            goto endIfL89;
        checkUpdate:
            if (update_count == max_updates) {flag = 2;}
        endIfL89:;
        if (!flag) {
          current_dfdx = polyval(dfdx, POLY_DEGREE - 1, current_x);
          current_x -= current_f / current_dfdx;
          update_count++;
        }
        if (flag == 0) goto whileLoop1;

    if (flag != 2) goto anticaseL101;
    printf("%d updates performed, |f(x)| still >= %g.\n", 
               update_count, MAX_ABS_F);
    goto endIfL105;    
    anticaseL101:
        printf("Stopped with approximate solution of %.10f.\n", 
               current_x);
    endIfL105:
    return 0;
}

double polyval(const double *a, int n, double x)
{
    double result = a[n];
    int i;
    i = n-1;
    goto forLoop3;
    forLoop3:
        result *= x;
        result += a[i];
        i--;
        if (i >= 0) goto forLoop3;
    return result;
}
