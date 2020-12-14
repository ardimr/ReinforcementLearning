#include "utility.h"

void update_q_table(int state, int new_state, double q_table[25][4], int action, double alpha, double gamma, int t)
{
    int reward, i, a;
    double max_value;
    if (new_state == 24)
    {
        reward = 100;
    }
    else if (t == 14)
    {
        reward = -15;
    }
    else if (new_state == 4)
    {
        reward = -100;
    }
    else if (new_state == 6)
    {
        reward = -100;
    }
    else if (new_state == 7)
    {
        reward = -100;
    }
     else if (new_state == 13)
    {
        reward = -100;
    }
    else if (new_state == 16)
    {
        reward = -100;
    }
    else if (new_state == 18)
    {
        reward = -100;
    }
    else if (new_state == 19)
    {
        reward = -100;
    }
    else if (new_state == 21)
    {
        reward = -100;
    }
    else
    {
        reward = 0;
    }
    max_value = max(max(q_table[new_state][0], q_table[new_state][1]), max(q_table[new_state][2], q_table[new_state][3]));
    for (i = 0; i < 4; i++)
    {
        if (max_value == q_table[state][i])
        {
            a = i;
        }
    }
    //printf("Action %d | Max_value %f\n", a, max_value);
    q_table[state][action] = (1 - alpha) * q_table[state][action] + alpha * (reward + gamma * max_value);
}
