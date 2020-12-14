#include <stdio.h>
#include <stdlib.h>
const double vg = 1.0;
const double zl = 1.0;
const double zb = 1.0;
const double t1 = 2.0;
const double t2 = 3.0;

void max_value(int state, double q_table[25][15], double max_value_index[2])
{
    int i;
    max_value_index[0] = q_table[state][0];
    max_value_index[1] = 0;
    for (i = 1; i < 15; i++)
    {
        if (q_table[state][i] > max_value_index[0])
        {
            max_value_index[0] = q_table[state][i];
            max_value_index[1] = i;
        }
    }

}

int get_state(double result)
{
    double state_array[] = {0, 0.05, 0.1, 0.15, 0.2, 0.25, 0.3, 0.35, 0.4, 0.45, 0.5, 0.55, 0.6, 0.65, 0.7, 0.75, 0.8, 0.85, 0.9, 0.95, 1, 1.05, 1.1, 1.15, 1.2};
    double temp = abs(result - state_array[0]);
    int i, state = 0;
    for (i = 1; i < 24; i++)
    {
        if (abs(result - state_array[i]) < temp)
        {
            temp = abs(result - state_array[i]);
            state = i;
        }
    }
    return state;
}

double get_result(int action)
{
    double vg_n, t1_n, t2_n;
    switch(action / 3)
    {
        case 0:
            t1_n = 0.95 * t1;
            t2_n = 0.95 * t2;
            break;
        case 1:
            t1_n = 0.975 * t1;
            t2_n = 0.975 * t2;
            break;
        case 2:
            t1_n = t1;
            t2_n = t2;
            break;
        case 3:
            t1_n = 1.025 * t1;
            t2_n = 1.025 * t2;
            break;
        case 4:
            t1_n = 1.5 * t1;
            t2_n = 1.5 * t2;
            break;
    }
    switch(action % 3)
    {
        case 0:
            vg_n = 0.9 * vg;
            break;
        case 1:
            vg_n = vg;
            break;
        case 2:
            vg_n = 1.1 * vg;
            break;
    }
    return (vg_n / (t1_n * t2_n + t2_n / t1_n * zl/zb));
}
