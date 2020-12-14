#include <stdio.h>
#include <stdlib.h>
//#include <time.h>
#include "utility.h"
void get_action(int state, double q_table[25][4], double epsilon, int new_action_new_state[2])
{
    int out = 0;
    int i, state_i, state_j, action;
    double max_value;
    state_i = 0;
    state_j = 0;
    while (out == 0)
    {

        state_i = (state / 5);
        state_j = (state % 5);
        //srand(time(0));
        //printf("State: %d | State_i: %d | State_j: %d\n", state, state_i, state_j);
        double random_value_1 = (double) rand() /(double) RAND_MAX;
        //printf("State %d | Epsilon %f | Random %f\n", state, epsilon, random_value_1);
        if (epsilon <= random_value_1)
        {
            //printf("Greedy\n");
            max_value = max(max(q_table[state][0],q_table[state][1]),max(q_table[state][2], q_table[state][3]));
            for (i = 0; i < 4; i++)
            {
               if (max_value == q_table[state][i])
               {
                    action = i;
               }
            }
        }
        else
        {
            //printf("Random\n");
            //srand(time(0));
            double random_value_2 = (double) rand() /(double) RAND_MAX;
            if (random_value_2 <= 0.25)
            {
                action = 0;
            }
            else if (random_value_2 <= 0.5)
            {
                action = 1;
            }
            else if (random_value_2 <= 0.75)
            {
                action = 2;
            }
            else
            {
                action = 3;
            }
        }

        switch(action)
        {
            case 0:
                state_j += 1;
                break;
            case 1:
                state_i -= 1;
                break;
            case 2:
                state_j -= 1;
                break;
            case 3:
                state_i += 1;
                break;
        }

        if (state_i < 0)
        {
            out = 0;
        }
        else if (state_j < 0)
        {
            out = 0;
        }
        else if (state_i > 4)
        {
            out = 0;
        }
        else if (state_j > 4)
        {
            out = 0;
        }
        else
        {
            out += 1;
        }
    }
    new_action_new_state[0] = action;
    new_action_new_state[1] = state_i * 5 + state_j;
    //printf("New State: %d\n", new_action_new_state[1]);
}

