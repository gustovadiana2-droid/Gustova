#include <iostream>
#include <cmath>
using namespace std;
int main()
{
    double a, b, c, S, P, r; // описание переменных
    cout << "a=";            // вывод теста
    cin >> a; // ввод значений сторон треугольника
    cout << "b=";
    cin >> b;
    cout << "c=";
    cin >> c;
    r = (a + b + c) / 2;                       // расчет полупериметра
    S = sqrt(r * (r - a) * (r - b) * (r - c)); // вычисление площади
    P = a + b + c;                             // вычисление периметра
    cout << "S=" << S;                         // вывод на экран значения переменной S
    cout << "\n P=" << P << endl;              // перенос на новую строку и вывод на экран P
    system("pause");
    return 0;
}