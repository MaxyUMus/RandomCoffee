#include <iostream>
#include <libpq-fe.h>
#include <io.h>
#include <fcntl.h>
#include "PQmod.cpp"
#include <vector>
#include "Neiro.cpp"

//НЕ ТРОГАТЬ

#define EPOCHS 10000
#define PICSIZE 400

std::vector<std::vector<double>> trainingData = {
		{4, 23}, {5, 14}, {6, 21}, {7, 10}, {8, 13}, {9, 20}, {11, 22}, {12, 19},
		{13, 18}, {14, 19}, {15, 16}, {16, 17}, {17, 18}, {18, 19}, {19, 20},
		{20, 21}, {21, 22}, {22, 23}, {4, 14}, {5, 13}, {6, 20}, {7, 11}, {8, 22},
		{9, 18}, {10, 19}, {11, 23}, {12, 20}, {13, 21}, {14, 22}, {15, 19},
		{16, 20}, {17, 21}, {18, 22}, {19, 23}, {4, 15}, {5, 16}, {6, 17}, {7, 18},
		{8, 19}, {9, 21}
};
std::vector<double> targets = {
	0.3, 0.55, 0.375, 0.35, 0.25, 0.55, 0.55, 0.5, 0.25, 0.25, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05,
	0.05, 0.05, 0.45, 0.45, 0.45, 0.45, 0.7, 0.45, 0.45, 0.65, 0.45, 0.45, 0.45, 0.45, 0.45, 0.45,
	0.45, 0.45, 0.45, 0.45, 0.25, 0.25, 0.25, 0.25, 0.25, 0.55
};
vector<int> layerSizes = { 10, 10, 1 };
double learningRate = 0.5;
MultiLayerPerceptron mlp(layerSizes, learningRate);

//НЕ ТРОГАТЬ




const char* conninfo = "dbname=randomcoffeedb user=postgres password=4825 host=127.0.0.1 port=5432";
DatabaseConnector db(conninfo);
PGresult* res;



double getRatio(vector<double>user1, vector<double>user2)
{
	double ratio = 0;
	int elementsSum = user1.size() + user2.size();
	for (int i = 0; i < user1.size(); i++)
	{
		for (int j = 0; j < user2.size(); j++)
		{
			ratio += mlp.predict({ user1[i],user2[j] });
		}
	}
	return (ratio / elementsSum);
}
void defTrain()
{
	for (int epoch = 0; epoch < EPOCHS; ++epoch) {
		for (int i = 0; i < trainingData.size(); ++i) {
			mlp.train(trainingData[i], targets[i]);
		}
	}
}
void regist(int id) 
{
	res = db.executeQuery(DatabaseConnector::getRequestedUserInfo(id).c_str());
	std::vector<std::vector<std::string>> deleteRequestedUsers = db.getQueryResults(res);
	
	res = db.executeQuery(DatabaseConnector::deleteRequestedUsers(id).c_str());
	res = db.executeQuery(DatabaseConnector::regUser
	(	deleteRequestedUsers[0][1], 
		deleteRequestedUsers[0][2], 
		deleteRequestedUsers[0][3], 
		std::stoi(deleteRequestedUsers[0][4]),
		std::stoi(deleteRequestedUsers[0][5]),
		std::stoi(deleteRequestedUsers[0][6]),
		"lolkek@gmail.com","pidorasMAX").c_str());
	PQclear(res);
}
int main() {
	//const char* conninfo = "dbname=randomcoffeedb user=postgres password=4825 host=5.tcp.eu.ngrok.io port=11980";
	

	try {
		/*defTrain();
		vector<double>u1 = { 4,21,11,15 };
		vector<double>u2 = { 23,6,13,9 };
		cout << "Result = " << getRatio(u1, u2)<<std::endl;*/
		
		// Проверка успешности выполнения запроса INSERT
		/*if (PQresultStatus(res) != PGRES_COMMAND_OK) {
			std::cerr << "Insert operation failed: " << PQresultErrorMessage(res) << std::endl;
		}*/
		regist(3);
		
		
		
		/*
		std::cout << DatabaseConnector::deleteRequestedUsers(id).c_str() << std::endl;
		for (const auto& row : getUserIDsByCompany) {
			for (const auto& value : row) {
				std::cout << value << "\t";
			}
			std::cout << std::endl;
		}*/
		PQclear(res);
		
		
	}
	catch (const std::exception& e) {
		std::cerr << "An error occurred: " << e.what() << std::endl;
		return 1;
	}

	return 0;
}