
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include "action.h"
#include "display.h"
#include "routing.h"
#include "updater.h"

#define alphaVal 0.5
#define gammaVal 0.9

#define NEXT_STATE_BASE 0x601060
#define NEXT_ACTION_BASE 0x601064
#define EPSILON_BASE 0x601068

double *epsilon_p;
int *new_state_p, *new_action_p;

int main()
{
    double q_table [25][15];
    int i, j, state, episode, t;

    epsilon_p = (double *)EPSILON_BASE;
    new_state_p = (int *)NEXT_STATE_BASE;
    new_action_p = (int *)NEXT_ACTION_BASE;

    int new_action_new_state[2];
    srand(time(0));

    for (i = 0; i < 25; i++)
    {
        for (j = 0; j < 15; j++)
        {
            if (i == 19 || i == 20 || i == 21)
            {
                q_table[i][j] = 0;
            }
            else
            {
                q_table[i][j] = (double) rand() / (double) RAND_MAX;
            }

        }
    }

    printf("Q-table and route before learning\n");
    display_q_table(q_table);
    display_routing(q_table);

    for (episode = 0; episode < 5000; episode++)
    {
        state = 0;
        *(new_state_p) = 0;
        *(epsilon_p) = (double)(1.00 - (double)(episode+1)/5001.00);
        for (t = 0; t < 15; t++)
        {
            if (*(new_state_p) == 19 || *(new_state_p) == 20 || *(new_state_p) == 21)
            {
                break;
            }
            get_action(state, q_table, *(epsilon_p), new_action_new_state);
            *(new_action_p) = new_action_new_state[0];
            *(new_state_p) = new_action_new_state[1];
            update_q_table(state, *(new_state_p), q_table, *(new_action_p), alphaVal, gammaVal, t);
            state = *(new_state_p);
        }
    }
    printf("Q-Table and route after learning\n");
    display_q_table(q_table);
    display_routing(q_table);

    return 0;
}

