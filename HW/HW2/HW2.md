

## Problem 1



使用Newton方法对函数 $\arctan(x)$ 求根，迭代形式为，参见函数 `Netwon`



$$
\begin{align*}
x_{k+1} = x_k - (x_k^2 +1) \arctan(x_k)
\end{align*}
$$


当初始点 $x_0$ 满足，


$$
\begin{align*}
-x_0 = x_0 - (x_0^2 +1) \arctan(x_0)
\end{align*}
$$


的时候，Newton方法产生的根在 $x_0 , -x_0$ 之间反复横跳，结合 $\arctan(x)$ 的函数图像知， $\alpha < \vert  x_0 \vert $ 时Newton方法收敛，而 $\alpha \ge \vert x_0 \vert $ 时不收敛，使用MATLAB编写程序可以发现，当 $\alpha< \vert x_0 \vert$ 时输出的根接近于 $0$ ,但当$ \alpha \ge \vert x_0 \vert$的时候输出为 $\text{NaN}$. 使用MATLAB绘制对应的函数图像可以找到对应的临界点，



![p1-intersect](code/img/p1-intersect.png)]



## Problem 2 



使用MATLAB程序编写实二分法与反差值法求解方程 $x^{64} = 0.1$ 的根，详见函数 `bisection` ,使用 `bisection_x64(f,regula_falsi = 0) `调用时为二分法求函数 $f$ 的根，使用 `bisection(f, regular_falsi = 1) `调用时为反插值法，收敛图像如下，从图中可以看出在该例子中二分法优于反插值法，



![](code/img/p2-bisection.png)



## Problem 3



调用Problem 2中撰写的函数，使用二分法求 $x = y \exp(y)$,

当 $x \in (-\exp(-1),0)$ 时，反函数的根在 $y= (-1,0)$ 之间，

当 $x \in (0,+\infty)$ 时，反函数的根在 $ y = (0,x)$ 之间，

在实际编程中发现，为了获得更好的数值解，选取的二分法的初始范围应该稍微大于上述理论给出的范围，求得结果如下图



![](code/img/p3-lambertW.png)



## Problem 4



使用函数 `Newton` 对方程 $f(x) = 1 + \cos x =0$ 进行求解，函数 `Newton` 的参数 `m` 表示重根的数目，令 $m=1$ 退化为普通的Newton方法，在该例子中，对于 $x_{\ast} = \pi$, 满足 $f(x)  = f'(x) = 0$, 因此使用参数 $m=2$ 为改进后的Newton方法，其收敛率对比如下，



![](code/img/p4-cosx.png)



可以见到普通的Newton方法呈现出线性收敛的特征，而改进后的方法在进入某一个区域后收敛速度明显加快，可能是二次收敛的特征，下面对该例子进行理论分析，利用不动点方法的分析 $x_{k+1} = g(x_k) ,g(x) = x - f(x) / f'(x)$, 利用Taylor展开，对于未加改进的Newton方法，


$$
\begin{align*}
f(x) &= f(x_{\ast}) + f(x_{\ast})' (x- x_{\ast}) + \frac{f(x_{\ast})''}{2} (x-x_{\ast})^2 + ... + \frac{f(\xi_1)^{(m+1)}}{(m+1)!} (x- {x_{\ast}}^2) \\
&= \frac{f(\xi_0)^{(m+1)}}{(m+1)!} (x- {x_{\ast}})^{m+1} ,\exists \xi_0 \in \mathcal{B}(x_{\ast}, \Vert x - x_{\ast} \Vert) \\
f(x)' &=  \frac{f(\xi_1)^{(m+1)}}{m!} (x- {x_{\ast}})^{m} ,\exists \xi_1 \in \mathcal{B}(x_{\ast}, \Vert x - x_{\ast} \Vert) \\ 
f(x)'' &= \frac{f(\xi_2)^{(m+1)}}{(m-1)!} (x- {x_{\ast}})^{m-1} ,\exists \xi_2 \in \mathcal{B}(x_{\ast}, \Vert x - x_{\ast} \Vert) \\ 
\end{align*}
$$


因此，


$$
\begin{align*}
g'(x) &= \frac{f(x) f(x)''}{[f(x)']^2} = \frac{m}{m+1} \frac{f(\xi_0)^{(m+1)} f(\xi_2)^{(m+1)}}{[f(\xi_1)^{(m+1)}]^2} 
\end{align*}
$$



假设函数的 $m+1$ 阶导数满足Lipschitz性质，也即


$$
\begin{align*}
\Vert f^{(m+1)}(x) - f^{(m+1)} (y) \Vert &\le L \Vert x - y\Vert 
\end{align*}
$$


考虑算法的局部收敛性，假设


$$
\begin{align*}
\Vert x_0 - x_{\ast} \Vert \le R 
\end{align*}
$$


不妨假设 $f^{(m+1)}(x_{\ast}) > 0 $, 在半径为 $R$ 的邻域内，恒有 $f^{(m+1)}(x_{\ast}) \ge M, \exists M >0 $


$$
\begin{align*}
\Vert x_{k+1} - x_{\ast} \Vert &= \Vert g(x_k) - g(x_{\ast}) \Vert \\
&= \Vert g'(\eta) (x_k-x_{\ast}) \Vert, \exists \eta \in \mathcal{B}(x_{\ast}, R) \\
&= \frac{m}{m+1 }\Vert  \frac{f(\xi_0)^{(m+1)} f(\xi_2)^{(m+1)}}{[f(\xi_1)^{(m+1)}]^2}  \Vert  \vert x_k - x_{\ast} \Vert,\exists \xi_0,\xi_1,\xi_2 \in \mathcal{B}(x_{\ast} ,R)\\ 
&\le \frac{m}{m+1} (1 + \frac{L^2 R^2}{M} + \frac{L^4 R^4}{M^2}) \Vert x_k - x_{\ast} \Vert
\end{align*}
$$


当 $R^2 \le M / 4m L^2 $ 时，成立,


$$
\begin{align*}
\Vert x_{k+1} - x_{\ast} \Vert \le \frac{2m+1}{2m+2} \Vert x_k - x_{\ast} \Vert
\end{align*}
$$



此时算法满足局部线性收敛，而修正后的Newton方法正好满足，


$$
\begin{align*}
g'(x) = m(1- \frac{f(\xi_0)^{(m+1)} f(\xi_2)^{(m+1)}}{[f(\xi_1)^{(m+1)}]^2} )
\end{align*}
$$


也即其修正了一阶量








