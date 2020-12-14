#include "utility.h"
#include <stdio.h>
void update_q_table(int state, int new_state, double q_table[25][15], int action, double alpha, double gamma, int t)
{
    double max_value_index[2];
    int reward;

    //if (new_state == 19 || new_state == 20 || new_state == 21)
    if (new_state == 20)
    {
        reward = 100;
    }
    else if (new_state == 19 || new_state == 21)
    {
        reward = 0;
    }
    else if (t == 14)
    {
        reward = -15;
    }
    else if (new_state < 16)
    {
        reward = -100;
    }
    else
    {
        reward = -50;
    }
    max_value(new_state, q_table, max_value_index);
    q_table[state][action] = (1 - alpha) * q_table[state][action] + alpha * (reward + gamma * max_value_index[0]);
}

