
#include <stdio.h>
#include <stdlib.h>
#include "utility.h"

void get_action(int state, double q_table[25][15], double epsilon, int new_action_new_state[2])
{
    int action;

    double max_value_index[2];

    double random_value_1 = (double) rand() /(double) RAND_MAX;
        if (epsilon <= random_value_1)
        {
            max_value(state, q_table, max_value_index);
            action = (int) max_value_index[1];
        }
        else
        {
            double random_value_2 = (double) rand() /(double) RAND_MAX;
            if (random_value_2 <= 0.0667)
            {
                action = 0;
            }
            else if (random_value_2 <= 0.1333)
            {
                action = 1;
            }
            else if (random_value_2 <= 0.2)
            {
                action = 2;
            }
            else if (random_value_2 <= 0.2667)
            {
                action = 3;
            }
            else if (random_value_2 <= 0.3333)
            {
                action = 4;
            }
            else if (random_value_2 <= 0.4)
            {
                action = 5;
            }
            else if (random_value_2 <= 0.4667)
            {
                action = 6;
            }
            else if (random_value_2 <= 0.5333)
            {
                action = 7;
            }
            else if (random_value_2 <= 0.6)
            {
                action = 8;
            }
            else if (random_value_2 <= 0.6667)
            {
                action = 9;
            }
            else if (random_value_2 <= 0.7333)
            {
                action = 10;
            }
            else if (random_value_2 <= 0.8)
            {
                action = 11;
            }
            else if (random_value_2 <= 0.8667)
            {
                action = 12;
            }
            else if (random_value_2 <= 0.9333)
            {
                action = 13;
            }
            else
            {
                action = 14;
            }
        }


    new_action_new_state[0] = action;
    new_action_new_state[1] = get_state(get_result(action));
}


