#include <stdio.h>

void display_q_table(double q_table[25][15])
{
    int i, j;
    for (i = 0; i < 25; i++)
    {
        printf("State %d | ", i);
        for (j = 0; j < 15; j++)
        {
            printf("%f | ", q_table[i][j]);
        }
        printf("\n");

    }

}
