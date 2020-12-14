#ifndef UTILITY_H_INCLUDED
#define UTILITY_H_INCLUDED

void max_value(int state, double q_table[25][15], double max_value_index[2]);
int get_state(double result);
double get_result(int action);

#endif // UTILITY_H_INCLUDED
