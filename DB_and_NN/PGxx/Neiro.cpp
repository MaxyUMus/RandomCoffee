#include <iostream>
#include <vector>
#include <ctime>
#include <cmath> // ��� ������� exp()
using namespace std;

class MultiLayerPerceptron {
private:
    vector<vector<vector<double>>> weights;  // ���� ��������
    vector<vector<double>> neurons; // ������ ��������
    double learningRate;  // �������� ��������

public:
    MultiLayerPerceptron(const vector<int>& layerSizes, double lr) : learningRate(lr) {
        int numLayers = layerSizes.size();
        weights.resize(numLayers - 1);
        neurons.resize(numLayers);

        for (int i = 0; i < numLayers; ++i) {
            neurons[i].resize(layerSizes[i] + 1, 0.0);  // +1 ��� �������� (bias)
            if (i < numLayers - 1) {
                int inputLayerSize = layerSizes[i] + 1; // ������ �������� ����
                int hiddenLayerSize = layerSizes[i + 1]; // ������ �������� ����
                weights[i].resize(hiddenLayerSize);
                for (int j = 0; j < hiddenLayerSize; ++j) {
                    weights[i][j].resize(inputLayerSize, 0.0);  // +1 ��� �������� (bias)
                }
            }
        }

        // ������������� ����� ���������� ����������
        for (int i = 0; i < weights.size(); ++i) {
            for (int j = 0; j < weights[i].size(); ++j) {
                for (int k = 0; k < weights[i][j].size(); ++k) {
                    weights[i][j][k] = ((double)(rand()) / RAND_MAX) * 2.0 - 1.0 * sqrt(6) / sqrt(layerSizes[i] + layerSizes[i + 1]);
                    //weights[i][j][k] = (double)rand() / RAND_MAX;
                }
            }
        }
    }

    double sigmoid(double x) {
        return 1.0 / (1.0 + exp(-x));
    }

    void train(const vector<double>& input, double target) {
        // ������ ������ (feedforward)
        neurons[0] = input;
        int numLayers = weights.size() + 1;
        for (int i = 0; i < numLayers - 1; ++i) {
            int neuronSize = neurons[i].size();
            for (int j = 0; j < weights[i].size(); ++j) {
                double sum = weights[i][j].back();  // bias
                for (int k = 0; k < neuronSize; ++k) {
                    sum += weights[i][j][k] * neurons[i][k];
                }
                neurons[i + 1][j] = sigmoid(sum);
            }
        }

        // �������� ��������������� (backpropagation)
        vector<vector<double>> deltas(weights.size());
        deltas.back().resize(weights.back().size(), 0.0);
        for (int i = weights.size() - 2; i >= 0; --i) {
            deltas[i].resize(weights[i].size(), 0.0);
        }

        // ������ ������ ��� ��������� ����
        int lastLayerIndex = numLayers - 1;
        for (int i = 0; i < deltas.back().size(); ++i) {
            double error = (i == 0) ? target - neurons.back()[0] : 0.0;
            deltas.back()[i] = neurons.back()[i] * (1 - neurons.back()[i]) * error;
        }

        // ������ ������ ��� ������� �����
        for (int i = weights.size() - 2; i >= 0; --i) {
            for (int j = 0; j < weights[i].size(); ++j) {
                double error = 0.0;
                for (int k = 0; k < weights[i + 1].size(); ++k) {
                    error += weights[i + 1][k][j] * deltas[i + 1][k];
                }
                deltas[i][j] = neurons[i + 1][j] * (1 - neurons[i + 1][j]) * error;
            }
        }

        // ���������� �����
        for (int i = 0; i < weights.size(); ++i) {
            for (int j = 0; j < weights[i].size(); ++j) {
                int neuronSize = neurons[i].size();
                for (int k = 0; k < neuronSize; ++k) {
                    weights[i][j][k] += learningRate * deltas[i][j] * neurons[i][k];
                }
                // ���������� �������� (bias)
                weights[i][j].back() += learningRate * deltas[i][j];
                //std::cout << weights[i][j][1] << std::endl;
            }
        }
    }


    double predict(const vector<double>& input) {
        neurons[0] = input;
        int numLayers = weights.size() + 1;
        for (int i = 0; i < numLayers - 1; ++i) {
            int neuronSize = neurons[i].size();
            for (int j = 0; j < weights[i].size(); ++j) {
                double sum = weights[i][j].back();  // bias
                for (int k = 0; k < neuronSize; ++k) {
                    sum += weights[i][j][k] * neurons[i][k];
                }
                neurons[i + 1][j] = sigmoid(sum);
            }
        }
        return neurons.back()[0];
    }
};
