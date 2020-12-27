#include <stdio.h>
#include "utility.h"

void display_routing (double q_table[25][15])
{
    int state = 0;
    int i;
    double max_value_index[2];

    printf("Routing\n");
    for (i = 0; i < 25; i++)
    {
        if (state == 19 || state == 20 || state == 21)
        {
            printf("Normal Zone\n");
            break;
        }
        else
        {
            if (state < 16)
            {
                printf("Warning! Diverged Zone\n");
            }
            else
            {
                printf("Caution! Violation Zone\n");
            }
        }
        printf("Old State %d \n", state);
        max_value(state, q_table, max_value_index);
        state = get_state(get_result((int) max_value_index[1]));
        printf("New State %d | Action Taken %d\n", state, (int) max_value_index[1]);
        print_description((int) max_value_index[1]);
    }
    if (i == 24)
    {
        printf("Error Iteration Ended\n");
    }
    printf(" \n");
    printf(" \n");
}


