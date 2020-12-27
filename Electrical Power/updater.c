#include "utility.h"
#include <stdio.h>

#define NEXT_REWARD_BASE 0x601072

void update_q_table(int state, int new_state, double q_table[25][15], int action, double alpha, double gamma, int t)
{
    double max_value_index[2];
    int *reward_p;

    reward_p = (int *)NEXT_REWARD_BASE;

    if (new_state == 19 || new_state == 20 || new_state == 21)
    {
        *(reward_p) = 100;
    }
    else if (t == 14)
    {
        *(reward_p) = -15;
    }
    else if (new_state < 16)
    {
        *(reward_p) = -100;
    }
    else
    {
        *(reward_p) = -50;
    }
    max_value(new_state, q_table, max_value_index);
    q_table[state][action] = (1 - alpha) * q_table[state][action] + alpha * (*(reward_p) + gamma * max_value_index[0]);
}

