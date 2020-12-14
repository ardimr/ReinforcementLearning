#include <stdio.h>
#include "utility.h"

void display_routing (double q_table[25][4])
{
    int state = 0;
    int i;
    double max_value;
    printf("Routing\n");
    for (i = 0; i < 25; i++)
    {
        if (state == 4 || state == 6 || state == 7 || state == 13 || state == 16 || state == 18 || state == 19 || state == 21)
        {
            printf("Error Obstacle\n");
            break;
        }
        if (state == 24)
        {
            printf("State %d Goal!\n", state);
            break;
        }
        printf("State %d \n", state);
        max_value = max(max(q_table[state][0], q_table[state][1]),max(q_table[state][2], q_table[state][3]));
        if (q_table[state][0] == max_value)
        {
            if (state % 5 < 4)
            {
                state += 1;
                //printf("Routing %d | State %d\n", i, state);
            }
            else
            {
                printf("Error Illegal Move Action 1\n");
                break;
            }
        }
        else if (q_table[state][1] == max_value)
        {
            if (state > 4)
            {
                state -= 5;
                //printf("Routing %d | State %d\n", i, state);
            }
            else
            {
                printf("Error Illegal Move Action 2\n");
                break;
            }
        }
        else if (q_table[state][2] == max_value)
        {
            if (state > 0)
            {
                state -= 1;
                //printf("Routing %d | State %d\n", i, state);
            }
            else
            {
                printf("Error Illegal Move Action 3\n");
                break;
            }
        }
        else if (q_table[state][3] == max_value)
        {
            if (state < 20)
            {
                state += 5;
                //printf("Routing %d | State %d\n", i, state);
            }
            else
            {
                printf("Error Illegal Move Action 4\n");
                break;
            }
        }
    }
    if (i == 24)
    {
        printf("Error Iteration Ended\n");
    }
    printf(" \n");
    printf(" \n");
}
