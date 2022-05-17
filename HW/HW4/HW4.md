19307130195 陈乐偲



## Problem 1



分别使用等距结点和Chebyshev结点对绝对值函数 $\vert x \vert , x \in [-1,1]$ 进行插值，各取 $20$ 个结点，



![](code/img/Chebyshev.png)

 



可以看见采用Chebyshev结点明显改善了Runge现象，唯一美中不足的是在 $0$ 附近处函数值本应该呈现一个尖峰，但此处采用Chebyshev结点插值也未能在 $0$ 附近有很好的结果，由于使用多项式插值在 $0$ 附近的导数一定是连续的，如果想要改善该现象可能需要采用分段插值的方式。



## Problem 2



使用Newton插值公式，令 $n$ 个插值结点为 $x_1,x_2,\cdots,x_n $ ,插值产生的多项式为，


$$
\begin{align*}
p_{n-1}(x) 
&= f(x_1) +f (x_1,x_2) (x-x_1) + \cdots + f(x_1,x_2,\cdots,x_n) \prod_{i=1}^{n-1} (x-x_i) 
\end{align*}
$$


其中 $f(x_1,x_2,\cdots,x_n)$ 表示 $n$ 阶差商，对于误差 $R(x ) = f(x) - p_{n-1}(x)$,  假设 $x_i \in [ a,b], \forall 1\le i\le n$,  则在区间 $[a,b]$ 上函数 $R(x)$ 存在 $x_1,\cdots,x_n$ 共 $n$ 个零点，根据中值定理，可以找到


$$
\begin{align*}
\exists \xi \in [a,b], R^{(n-1)}(\xi) =  f^{(n-1)}(\xi) -(n-1)!f(x_1,x_2,\cdots,x_n) =0 
\end{align*}
$$


令 $(x_1,x_2,\cdots,x_n) \rightarrow (x^{\ast},x^{\ast}, \cdots,x^{\ast})$ 则可以得到结论，


$$
\begin{align*}
f(x_1,x_2,\cdots,x_n) \rightarrow \frac{f^{(n-1)}(x^{\ast})}{(n-1)!}
\end{align*}
$$




## Problem 3



对于间距为 $h$ 的等距结点，定义差分的符号 $\Delta^n f(\cdot)$，可以验证


$$
\begin{align*}
f(x_1,x_2, \cdots, x_{n+1}) = \frac{\Delta^n f(x_1)}{h^n n!  }
\end{align*}
$$


记 $x = x_1 + ph  $, 则有


$$
\begin{align*}
f(x_1,x_2,\cdots,x_{n+1}) \prod_{i=1}^{n} (x-x_i) &=   \frac{\Delta^n f(x_1)}{n! } \times p(p-1) \cdots (p - n+1)  = \binom{p}{n} \Delta^nf(x_1)
\end{align*}
$$


将其代入Newton插值的公式可以得到在 $x_1,x_2,\cdots,x_{n+1}$ 处的插值多项式满足，


$$
\begin{align*}
f(x_1 + ph) = \sum_{i=0}^{n} \binom {p}{i} \Delta^{i } f(x_1)
\end{align*}
$$


## Problem 4



对于Hermite插值，可以使用Lagrange方法或者Newton方法解出在每一个区间 $[x_i,x_{i+1} ]$上的插值公式


$$
\begin{align*}
f_i(x) &= f(x_i) \phi(\frac{x_{i+1}-x}{x_{i+1} - x_i}) + f(x_{i+1}) \phi( \frac{x-x_i}{x_{i+1} -x_i}) -f'(x_i) (x_{i+1}-x_i)\psi (\frac{x_{i+1}-x}{x_{i+1}-x_i}) + f'(x_{i+1}) (x_{i+1}-x_i) \psi(\frac{x-x_i}{x_{i+1}-x_i}) \\
\text{With } \phi(x) &=  - 2x^3 + 3x^2, \psi(x) = x^3 - x^2 
\end{align*}
$$


对于正弦函数，有 $f(x) = \sin(x), f'(x) = \cos(x)$, 代入上述公式可以绘制出如下的插值曲线，$n$ 表示采样点的数目

![](code/img/sine.png)

