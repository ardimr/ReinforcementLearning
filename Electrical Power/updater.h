#ifndef UPDATER_H_INCLUDED
#define UPDATER_H_INCLUDED

void update_q_table(int state, int new_state, double q_table[25][15], int action, double alpha, double gamma, int t);

#endif // UPDATER_H_INCLUDED
