#include <stdio.h>
void display_q_table(double q_table[25][4])
{
    int i;
    for (i = 0; i < 25; i++)
    {
        printf("State %d | %f | %f | %f | %f\n", i, q_table[i][0], q_table[i][1], q_table[i][2], q_table[i][3]);
    }

}
