#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include "action.h"
#include "display.h"
#include "routing.h"
#include "updater.h"
#define alphaVal 0.5
#define gammaVal 0.9

int main()
{
    double q_table [25][4];
    int episode, new_action, t;
    int new_action_new_state[2];
    double epsilon;

    int i, j;
    int state = 0;
    int new_state = 0;
    srand(time(0));
    for (i = 0; i < 24; i++)
    {
        for (j = 0; j < 4; j++)
        {
            q_table[i][j] = (double) rand() / (double) RAND_MAX;
        }
    }
    q_table[24][0] = 0;
    q_table[24][1] = 0;
    q_table[24][2] = 0;
    q_table[24][3] = 0;

    printf("Q-table and route before learning\n");
    display_q_table(q_table);
    display_routing(q_table);

    for (episode = 0; episode < 500; episode++)
    {
        state = 0;
        epsilon = (double)(1.00 - (double)(episode+1)/501.00);
        //printf("%f",epsilon);
        for (t = 0; t < 15; t++)
        {
            if (state == 24)
            {
                break;
            }
            //printf("Current State: %d\n", state);
            get_action(state, q_table, epsilon, new_action_new_state);
            new_action = new_action_new_state[0];
            new_state = new_action_new_state[1];
            update_q_table(state, new_state, q_table, new_action, alphaVal, gammaVal, t);
            state = new_state;
        }
    }
    printf("Q-Table and route after learning\n");
    display_q_table(q_table);
    display_routing(q_table);
    return 0;
}
