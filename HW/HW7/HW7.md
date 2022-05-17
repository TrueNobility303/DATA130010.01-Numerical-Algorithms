19307130195 陈乐偲



## Problem 1



使用插值型积分，


$$
\begin{align*}
f(x) &\approx \frac{x(x+a)}{2a^2} f(-a) + \frac{(x-a)(x+a)}{a^2} f(0) + \frac{x(x-a)}{2a^2} f(a) \\
\int_{-2a}^{2a} f(x) ~\text{d}x &\approx \frac{8a}{3} f(-a) - \frac{4a}{3} f(0) + \frac{8a}{3} f(a)
\end{align*}a
$$




可以验证上述积分公式可以精确地计算 $f(x) = 1,x,x^2,x^3$ 的积分，而不能精确计算 $x^4$ 的积分，其代数精度为 $3$

下面说明对于该问题为什么选取插值型积分是最优的。如果存在一种积分公式满足代数精度为 $4$ 或以上，其至少要能够精确计算 $f(x) = 1,x,x^2,x^3$ 的积分，因此需要满足如下方程，


$$
\begin{align*}
2c_1 +c_2 &= 4a \\
c_1 - c_2 &= 0 \\
c_1 &= \frac{8a}{3}
\end{align*}
$$
得到的解也即上面给出的插值型积分公式，而其代数精度为 $3$.



## Problem 2



### 2.1



当 $f(x) = 1$, 


$$
\begin{align*}
\int_a^b f(x) ~\text{d}x =b-a = \frac{b-a}{2} \left(  f\left( \frac{2a+b}{3}\right)+f\left( \frac{a+2b}{3}\right)\right)
\end{align*}
$$


当 $f(x) = x$,


$$
\begin{align*}
 \int_a^b f(x) ~\text{d}x =\frac{b^2 - a^2}{2} = \frac{b-a}{2} \left(  f\left( \frac{2a+b}{3}\right)+f\left( \frac{a+2b}{3}\right)\right)
\end{align*}
$$


但是当 $f(x) = x^2$ 时，


$$
\begin{align*}
\int_a^b f(x)~\text{d}x = \frac{(b-a) (a^2 +ab +b^2)}{2}  \ne \frac{(b-a) (5a^2 +8ab +5b^2)}{18} = \frac{b-a}{2} \left(  f\left( \frac{2a+b}{3}\right)+f\left( \frac{a+2b}{3}\right)\right)
\end{align*}
$$


因此该求积公式的代数精度为 $1$.



### 2.2



当 $n \rightarrow \infty$ 的时候，在每个区间 $[t,t+h]$ 内考虑上述求积公式的误差，


$$
\begin{align*}
\int_{t}^{t+h} f(x) ~\text{d}x - \frac{h}{2} \left( f\left ( t + \frac{h}{3}\right ) + f\left ( t + \frac{2h}{3}\right ) \right )
&= \int_{t}^{t+h} \sin(x) ~\text{d}x - \frac{h}{2} \left( \sin\left ( t + \frac{h}{3}\right ) + \sin\left ( t + \frac{2h}{3}\right ) \right ) \\
&= \cos(t) -\cos(t+h) - \frac{h}{2} \left( \sin\left ( t + \frac{h}{3}\right ) + \sin\left ( t + \frac{2h}{3}\right ) \right ) \\
&= 2  \sin \left( t+ \frac{h}{2} \right ) \sin\left( \frac{h}{2}\right ) - h\left( \sin\left(t+ \frac{h}{2}\right) \cos\left( \frac{h}{6}\right)\right ) \\
&=\sin \left( t+ \frac{h}{2} \right ) \left( h- \frac{h^3}{24}  - h\left(1 - \frac{h^3}{72}\right ) + o(h^4)\right ) \\
&= - \sin \left( t+ \frac{h}{2} \right ) \left( \frac{h^3}{36} + o(h^4)\right ) \\
\end{align*}
$$


将所有区间求和，


$$
\begin{align*}
\int_a^b f(x) ~\text{d}x - T_n &=  - \sum_{t=a}^{b-h}  \sin \left( t+ \frac{h}{2} \right ) \left( \frac{h^2}{36} + o(h^4)\right ) \\
&= - \left( \frac{1}{36}h^3 + o(h^4)\right ) \sum_{t=a}^{b-h}  \sin \left( t+ \frac{h}{2} \right )  \\
&=- \frac{\frac{1}{36} h^3 + o(h^4)}{2\sin\left( \frac{h}{2}\right )} \sum_{t=a}^{b-h} 2\sin\left( \frac{h}{2}\right ) \sin \left( t+ \frac{h}{2} \right ) \\
&= - \frac{\frac{1}{36} h^3 + o(h^4)}{2\sin\left( \frac{h}{2}\right )}  \sum_{t=a}^{b-h} \cos(t) - \cos(t+h) \\
&= - \frac{\frac{1}{36} h^3 + o(h^4)}{2\sin\left( \frac{h}{2}\right )} (\cos(0) - \cos(\pi)) \\
&= - \frac{\frac{1}{36} h^3 + o(h^4)}{\sin\left( \frac{h}{2}\right )} \\
&= - \frac{\frac{1}{36}h^3 + o(h^4)}{ \frac{h}{2} + o (h^2)} \\
&= - \frac{\frac{1}{18} h^2 + o(h^3)}{1 +o (h)} \\
&=  - \frac{1}{18} h^2
\end{align*}
$$




因此对于该问题，上述求积公式的误差为 $o(h^2)$. 



编程计算，详见 `quadrature_sin.m`文件，积分残差随着 $n$ 的变化如下，



![](code/img/sin.png)



图中可以看见误差大体呈现平方衰减的趋势，并且残量均为正值，也与理论结果相符合。



## Problem 3



### 3.1



先考虑不作复化的情况，
$$
\begin{align*}
\int_a^b f(x) ~\text{d}x - (b-a) f\left(\frac{a+b}{2}\right)  &= \int_a^b f(x) -f\left(\frac{a+b}{2}\right)~\text{d}x \\
&= \int_a^b f\left(\frac{a+b}{2} ,x\right) \left(x- \frac{a+b}{2}\right ) \text{d}x \\
&= \int_a^b f\left(\frac{a+b}{2} ,x\right) \text{d} \left( \frac{x^2}{2} - \frac{(a+b)x}{2}  + ab \right ) \\
&= \int_a^b \left( \frac{x^2}{2} - \frac{(a+b)x}{2}  + ab \right )  f\left(\frac{a+b}{2} ,x,x\right) \text{d}x \\
&= \frac{f''(\xi)}{2} \int_a^b \left( \frac{x^2}{2} - \frac{(a+b)x}{2}  + ab \right )   \text{d}x \\
&= \frac{(b-a)^3 f''(\xi)}{24}
\end{align*}
$$


据此可以得到使用复化中点公式的误差为，


$$
\int_a^b f(x)~\text{d}x - T_n  = \frac{(b-a)^3}{24 n^2} f''(\xi)
$$




### 3.2





想要精度达到小数点后 $6$ 位，只需要，


$$
\begin{align*}
\frac{(b-a)^3}{24 n^2} f''(\xi) = \frac{1}{24 n^2} \exp(\xi) < 10^{-6}
\end{align*}
$$


因为 $\xi \in (0,1)$, 因此只需要满足，


$$
\begin{align*}
\frac{1}{24 n^2} \exp(1) &< 10^{-6} \\
n & > \sqrt{\frac{10^6 \exp(1)}{24}}
\end{align*}
$$


因此只需要取 $n = 337$. 



## Problem 4



使用Romberg算法分别计算函数 $\exp(x), x^{3/2}$ 在区间 $[0,1]$ 上的积分，详见文件 `Romberg.m`

只需要生成对应的递推表即可，其误差曲线如下，可以看见算法收敛很快，但后一个函数收敛稍慢于前一个函数



![](code/img/Romberg.png)

对数坐标系下误差如下图，



![](code/img/Romberg_log.png)



这也与算法整体上是线性收敛的相符合。