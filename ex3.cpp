/*
 * 姓名：邹鹏
 * 学号：2018218779
 * 班级：计算机18-2班
 */

#include <iostream>
#include <cmath>

using namespace std;

/*
 * 取f(x) = x * x * x - x - 1
 */
double f(double x)
{
    return pow(x, 3) - x - 1;
}

/*
 * 表示为f(x)的一阶导函数
 * df(x) = 3 * x * x - 1
 */
double df1(double x)
{
    return 3 * pow(x, 2) - 1;
}

int main()
{
    double x0, e;
    int iterMaxNum, downMaxNum;
    cout << "请输入初值：";
    cin >> x0;
    cout << "请输入误差限：";
    cin >> e;
    cout << "请输入最大迭代次数：";
    cin >> iterMaxNum;
    cout << "请输入下山最大次数：";
    cin >> downMaxNum;

    int downNum = 0; // 下山次数
    double x = x0, tempx;
    double lamda = 1;
    cout << "迭代次数\t近似根x\t\t下山因子\t下山次数" << endl;
    int i;
    for (i = 1; i <= iterMaxNum; ++i)
    {
        tempx = x - lamda * f(x) / df1(x);
        if (fabs(f(tempx)) < fabs(f(x))) // 满足下山条件
        {
            // 满足误差限以内，退出循环
            if (fabs(tempx - x) < e)
            {
                x = tempx;
                ++downNum;
                cout << i << "\t\t" << x << "\t\t" << lamda << "\t\t" << downNum << endl;
                break;
            }
            x = tempx;
            ++downNum;
            cout << i << "\t\t" << x << "\t\t" << lamda << "\t\t" << downNum << endl;
            lamda = 1;
        }
        else // 不满足下山条件
        {
            cout << i << "\t\t" << x << "\t\t" << lamda << "\t\t" << downNum << endl;
            lamda /= 2;
        }
    }
    if (i > iterMaxNum)
    {
        cout << "超过最大迭代次数" << endl;
        return 0;
    }
    if (downNum > downMaxNum)
    {
        cout << "超过最大下山次数" << endl;
        return 0;
    }
    cout << "下山次数为：" << downNum << endl;
    printf("近似根为：%.6lf", x);
}