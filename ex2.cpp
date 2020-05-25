/*
 * 姓名：邹鹏
 * 班级：计算机18-2班
 * 学号：2018218779
 */
#include <iostream>
#include <vector>
#include <cmath>

using namespace std;

#define N 16

double f(double x)
{
    return x == 0 ? 1 : (sin(x) / x);
}

// (1) 设计复化梯形公式求积算法，编制并调试相应的函数子程序
double Trapezoidal(double a, double b, int n)
{
    double h = (b - a) / n;
    double s = 0;

    for (int k = 1; k < n; ++k)
    {
        double x = a + k * h;
        s += 2 * f(x);
    }
    return h / 2 * (f(a) + s + f(b));
}

// (2)设计复化辛卜生求积算法，编制并调试相应的函数子程序
double Simpson(double a, double b, int n)
{
    double h = (b - a) / n;
    double s = 0;
    for (int k = 0; k < n; ++k)
    {
        double x = a + (k + 0.5) * h;
        s += 4 * f(x);
    }
    for (int k = 1; k < n; ++k)
    {
        double x = a + k * h;
        s += 2 * f(x);
    }
    return h / 6 * (f(a) + s + f(b));
}

// (3)用龙贝格算法计算
vector<double> Tn(log2(N) + 1, 0);
vector<double> Sn(log2(N) + 1, 0);
vector<double> Cn(log2(N) + 1, 0);
vector<double> Rn(log2(N) + 1, 0);
void Romberg(double a, double b, int n)
{
    // 这题算法根据东北大学数值分析课程进行编写
    // 个人认为用此方法编写具有很强的可读性
    // 且代码量较少
    Tn[0] = (b - a) / 2 * (f(a) + f(b));
    for (int k = 1; pow(2, k) <= N; ++k)
    {
        double s = 0;
        for (int i = 1; i <= pow(2, k - 1); ++i)
            s += f(a + (i - 1.0 / 2) * (b - a) / pow(2, k - 1));
        Tn[k] = Tn[k - 1] / 2 + (b - a) / pow(2, k) * s;
        Sn[k] = (4 * Tn[k] - Tn[k - 1]) / 3;
        if (k >= 2)
            Cn[k] = (16 * Sn[k] - Sn[k - 1]) / 15;
        if (k >= 3)
            Rn[k] = (64 * Cn[k] - Cn[k - 1]) / 63;
    }
}

int main()
{
    cout << "(1)Trapezoidal result:" << endl;
    cout << "n\tresult" << endl;
    for (int i = 2; i <= N; i *= 2)
        printf("%d\t%.7lf\n", i, Trapezoidal(0, 1, i));
    cout << endl;

    cout << "(2)Simpson result:" << endl;
    cout << "n\tresult" << endl;
    for (int i = 2; i <= N; i *= 2)
    {
        printf("%d\t%.7lf\n", i, Simpson(0, 1, i));
    }
    cout << endl;

    Romberg(0, 1, N);
    cout << "(3)Romberg result: " << endl;
    cout << "k\t\tn\t\tTn\t\tSn\t\tCn\t\tRn" << endl;
    for (int k = 0; k < Tn.size(); ++k)
    {
        cout << k << "\t\t" << pow(2, k) << "\t\t" << Tn[k];
        if (k >= 1)
            printf("\t%.7lf", Sn[k]);
        if (k >= 2)
            printf("\t%.7lf", Cn[k]);
        if (k >= 3)
            printf("\t%.7lf", Rn[k]);
        cout << endl;
    }
    printf("the 4 result is: %.7lf", Rn[4]);
}