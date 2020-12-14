
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
    double q_table [25][15];
    int episode, new_action, t;
    int new_action_new_state[2];
    double epsilon;

    int i, j;
    int state = 0;
    int new_state = 0;
    srand(time(0));
    for (i = 0; i < 25; i++)
    {
        for (j = 0; j < 15; j++)
        {
            //if (i == 19 || i == 20 || i == 21)
            if (i == 20)
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
    //display_routing(q_table);

    for (episode = 0; episode < 500; episode++)
    {
        state = 0;
        epsilon = (double)(1.00 - (double)(episode+1)/501.00);
        for (t = 0; t < 15; t++)
        {
            //if (new_state == 19 || new_state == 20 || new_state == 21)
            if (new_state == 20)
            {
                break;
            }
            get_action(state, q_table, epsilon, new_action_new_state);
            new_action = new_action_new_state[0];
            new_state = new_action_new_state[1];
            update_q_table(state, new_state, q_table, new_action, alphaVal, gammaVal, t);
            state = new_state;
        }
    }
    printf("Q-Table and route after learning\n");
    display_q_table(q_table);
    //display_routing(q_table);
    return 0;
}

