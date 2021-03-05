#include <fstream>
#include <iostream>
#include <string>
#include <vector>
#include "script.h"

using namespace std;

int main(int cvd, char** cve) {

	if (cvd < 2) {
		cout << "\nPlease input file name after command\n\n";
		return 0;
	}
	ifstream file(cve[1]);
	vector<DATA> d1;
	waste_line(file, 14);
	for (int i = 0; file.good(); i++) {

		getline(file, d1[i].time, ',');
		getline(file, d1[i].value_string, '\n');
		d1[i].value = stof(d1[i].value_string);

	}

	cout << "\nTime: " << d1[0].time << " Value: " << d1[0].value << endl;

	file.close();
	return 0;
}