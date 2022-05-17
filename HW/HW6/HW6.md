19307130195 陈乐偲



## Problem 1



在区间 $[-1,1]$ 上，根据三角公式，


$$
\begin{align*}
T_{n+1}(x)  &= \cos ((n+1) \arccos x) \\
&= \cos (n \arccos x) \cos(\arccos x) - \sin (n \arccos x) \sin(\arccos x) \\
&= 2 \cos (n \arccos x) \cos(\arccos x)- \cos (n \arccos x) \cos(\arccos x) - \sin (n \arccos x) \sin(\arccos x) \\
&=  \cos (n \arccos x) \cos(\arccos x) - \cos((n-1)\arccos x) \\
&=2xT_n(x) - T_{n-1}(x)
\end{align*}
$$


而递推边界为，


$$
\begin{align*}
T_0(x) = 1, T_1(x) =x
\end{align*}
$$



得到了Chebyshev多项式的递归定义，而在区间 $(-\infty, 1) \cup  (1, +\infty)$ 上可以证明该递归定义等价于显式表达式，


$$
\begin{align*}
T_n(x) = \frac{1}{2} \left((x - \sqrt{x^2-1} )^n +(x + \sqrt{x^2-1} )^n \right)
\end{align*}
$$


$n=0,1$ 的时候显然，下面对 $n \ge 2$ 的情况验证递归式，


$$
\begin{align*}
2x T_{n}(x) - T_{n-1}(x) &= \frac{1}{2} \left(2x(x - \sqrt{x^2-1} )^n +2x(x + \sqrt{x^2-1} )^n \right) - \frac{1}{2} \left((x - \sqrt{x^2-1} )^{n-1} +(x + \sqrt{x^2-1} )^{n-1} \right) \\
&= \frac{1}{2} \left(\frac{2x}{x - \sqrt{x^2-1}} (x - \sqrt{x^2-1} )^{n+1} +\frac{2x}{x+ \sqrt{x^2-1}}(x + \sqrt{x^2-1} )^{n+1} \right) \\
&\quad - \frac{1}{2} \left( \frac{1}{(x- \sqrt{x^2-1})^2}(x - \sqrt{x^2-1} )^{n+1} +\frac{1}{(x+ \sqrt{x^2-1})^2}(x + \sqrt{x^2-1} )^{n+1} \right) \\
&= \frac{1}{2} \left((x - \sqrt{x^2-1} )^{n+1} +(x + \sqrt{x^2-1} )^{n+1} \right) \\
&= T_{n+1}(x)
\end{align*}
$$


## Problem 2



求解如下的最佳平方逼近问题，


$$
\begin{align*}
\min_{a,b,c} \int_0^{\pi/2} \vert \sin x -ax^2  -b x -c \vert^2 \text{d}x
\end{align*}
$$


多项式基为 $\{ 1,x,x^2 \}$,  根据残差正交化原则，


$$
\begin{align*}
\int_0^{\pi/2} (\sin x - ax^2 - bx -c ) x^2  \text{d} x = 0 \\
\int_0^{\pi/2} (\sin x - ax^2 - bx -c ) x  \text{d} x = 0 \\
\int_0^{\pi/2} (\sin x - ax^2 - bx -c )   \text{d} x = 0 \\
\end{align*}
$$


下面逐次求解上式中的积分项，对于多项式有


$$
\begin{align*}
\int_0^{\pi/2} x^{n-1} = \frac{1}{n} \left( \frac{\pi}{2} \right)^{n}  
\end{align*}
$$
对于正弦函数，


$$
\begin{align*}
\int_0^{\pi/2} \sin x \text{d}x  = 1
\end{align*}
$$


对于正弦函数和多项式的交叉项，使用分部积分公式，

$$
\begin{align*}
\int_0^{\pi/2} x \sin x  \text{d} x&= -x \cos x \Big{\vert}_0^{\pi/2} + \int_0^{\pi/2} \cos x \text{d}x  = 1 
\end{align*}
$$


以及，


$$
\begin{align*}
\int_0^{\pi/2} x^2 \sin x \text{d} x &= -x^2 \cos x \Big{\vert}_0^{\pi/2} + 2\int_0^{\pi/2} x\cos x \text{d}x \\
&= 2\int_0^{\pi/2} x\cos x \text{d}x \\ 
&= 2x \sin x \Big{\vert}_{0}^{\pi/2} - 2 \int_0^{\pi/2} \sin x\text{d}x \\
&= \pi -2 \\
\end{align*}
$$


还有，


$$
\begin{align*}
\int_0^{\pi/2} (\sin x)^2 \text{d} x &= \frac{1}{2} \int_0^{\pi/2} (1- \cos 2x) \text{d}x = \frac{\pi}{4}
\end{align*}
$$




代入残差正交性方程，


$$
\begin{align*}
\frac{a}{5} \left  ( \frac{\pi}{2} \right )^5 +   \frac{b}{4} \left  ( \frac{\pi}{2} \right )^4 + \frac{c}{3} \left  ( \frac{\pi}{2} \right )^3 &= \pi- 2 \\
\frac{a}{4} \left  ( \frac{\pi}{2} \right )^4 +   \frac{b}{3} \left  ( \frac{\pi}{2} \right )^3 + \frac{c}{2} \left  ( \frac{\pi}{2} \right )^2 &= 1 \\
\frac{a}{3} \left  ( \frac{\pi}{2} \right )^3 +   \frac{b}{2} \left  ( \frac{\pi}{2} \right )^2 + c \left  ( \frac{\pi}{2} \right ) &= 1 \\
\end{align*}
$$


定义矩阵,


$$
\begin{align*}
A = 
\begin{pmatrix}
\frac{1}{5} \left( \frac{\pi}{2}\right )^5 & \frac{1}{4} \left( \frac{\pi}{2}\right )^4 & \frac{1}{3} \left( \frac{\pi}{2}\right )^3 \\
\frac{1}{4} \left( \frac{\pi}{2}\right )^4 & \frac{1}{3} \left( \frac{\pi}{2}\right )^3 & \frac{1}{2} \left( \frac{\pi}{2}\right )^2 \\
\frac{1}{3} \left( \frac{\pi}{2}\right )^3 & \frac{1}{2} \left( \frac{\pi}{2}\right )^2  & \left( \frac{\pi}{2}\right )
\end{pmatrix}
\end{align*}
$$


则上述方程组等价于，
$$
\begin{align*}
A [a,b,c]^\top = [\pi-2,1,1]^\top
\end{align*}
$$


求解上述线性方程组可以得到，


$$
\begin{align*}
[a,b,c]^\top = [  -0.3382,1.1957, -0.0243]^\top
\end{align*}
$$


代入得到该最佳平方逼近问题的最优解为，


$$
\begin{align*}
\min_{a,b,c} \int_0^{\pi/2} \vert \sin x -ax^2  -b x -c \vert^2 \text{d}x &= \int_0^{\pi/2} (\sin x -ax^2  -b x -c ) \sin x \text{d}x \\
&= \int_0^{\pi/2} (\sin x)^2 \text{d}x -  \int_0^{\pi/2}(ax^2 + bx+c)\sin x \text{d}x\\ 
&= \frac{\pi}{4}  - [a,b,c]  [\pi-2,1,1  ]^\top \\
&= 0.7854 - 0.7853 \\
&= 0.0001
\end{align*}
$$



## Problem 3



求解如下的一致逼近问题，


$$
\begin{align*}
\min_{a,b} \max_{-1 \le x \le2} f(x \vert a,b)  \triangleq \vert x^3 + ax + b  \vert
\end{align*}
$$


对于该线性函数类的一致逼近问题，根据Chebyshev最佳一致逼近定理，只需要寻找到大小为 $3$ 的Chebyshev交错点组即可，该点组中的点要么为区间端点，要么在区间内部，此时满足导数为0，也即


$$
\begin{align*}
f'(x) = 3x^2 +a = 0
\end{align*}
$$


上述方程在给定区间内仅有至多两个根，因此至少有一个交错点位与区间端点，下面分情况讨论。

若两个区间端点都为交错点，也即交错点组为 $ -1,x_0,2$. 并且我们知道这两个交错点的函数值同号，而中间的交错点的函数值与两个端点异号，存在常数 $\eta$ 使得


$$
\begin{align*}
f(-1) &= -1 - a +b  = \eta \\
f(2) &= 8 + 2a +b  = \eta \\
f(x_0) &=  x_0^3 + a x_0 + b =  -\eta \\
f'(x_0) &= 3x_0^2 + a = 0\\ 
\end{align*}
$$


此时解得，


$$
\begin{align*}
a =  -3, b = 0,x_0 = 1,\eta = 2 
\end{align*}
$$


若仅有一个区间端点为交错点，根据对称性另外两个交错点为 $-x_0,+x_0$ , 此时求解对应的方程可以发现与上面一种情况相同，实际上由于上面一种情况中已经找到了Chebyshev交错点组，也即已经找到了一致逼近函数，其他情况即使存在解，也不可能有更好的逼近效果。

代入得到该一致逼近问题的最优解为，


$$
\begin{align*}
\min_{a,b} \max_{-1 \le x \le2}   \vert x^3 + ax + b  \vert  =2 
\end{align*}
$$




## Problem 4



采用Remez算法在区间 $[0,1]$ 之间使用 $n$ 阶多项式逼近对数函数 $\log (1+ x)$， 该问题中 $n=2$.


$$
\begin{align*}
\min_{a,b,c} \max_{0 \le x \le 1} \vert \log (1+x) - ax^2-bx -c \vert 
\end{align*}
$$


初始交错点组选择区间 $[0,1]$ 上的Chebyshev多项式，其可经过标准的 $[-1,1]$ 区间上的Chebyshev多项式 $T_{n+1}(x)$ 经过伸缩变化后得到，此时 $[0,1]$ 区间上的最佳一致逼近多项式为 $ 2^{-(n+1)} T_{n+1}(2x-1) $， 初始的交错点组选取其偏差集，


$$
\begin{align*}
x_i = \frac{1}{2}\left( \cos \frac{(i-1) \pi}{n+1} +1 \right), i = 1 ,2, \cdots n+2
\end{align*}
$$


给定交错点组，Remez算法中迭代地求解线性方程组得到多项式的系数，对该方程组的解的唯一性分析详见 Problem 5，


$$
\begin{align*}
\begin{pmatrix}
1 & x_1 & x_1^2 & -1 \\ 
1 & x_2 & x_2^2 & 1 \\
1 & x_3 & x_3^2 &-1 \\
1 & x_4 & x_4^2 & 1 \\
\end{pmatrix}
\begin{pmatrix}
c \\
b \\
a \\
\eta \\
\end{pmatrix}
= 
\begin{pmatrix}
\log(1+ x_1) \\
\log(1+x_2) \\
\log(1+x_3) \\
\log(1+x_4) \\
\end{pmatrix}
\end{align*}
$$


利用求解得到的系数构造多项式，求解其偏差集，偏差集可以为区间的端点或者极值点，极值点根据一阶条件由如下方程的解给出，


$$
\begin{align*}
\frac{1}{1+x}  - 2ax - b &= 0 \\
2ax^2 +(2a+b)x +b-1 &=0 
\end{align*}
$$


在该问题中，选取的偏差集为 $x = [0,0.25,0.75,1]^\top$, 其正好包含了两个区间端点，而上述方程在区间 $[0,1]$ 之内也最多只有两个根，因此区间端点将一直在偏差集内，Remez算法中只需要解上述两个根并将其替换掉相邻的并且保持交错性质的偏差集即可。



选取上述初值算法收敛很快，仅仅需要 $4$  步迭代，解得系数为，


$$
\begin{align*}
a = -0.2390, b = 0.9253, c = 0.0034;
\end{align*}
$$


绘制出逼近的结果如下图所示，可以发现逼近效果的确很好，



![](code/img/p4-res.png)



迭代过程中的误差图如下，可以明显地看到Chebyshev交错点组的特征，



![](code/img/p4-plot.png)



由于算法收敛过快，上述图像不仔细端详很难看出每次迭代的区别，但实际上对比可以发现曲线的斜率有所改变，使用对数坐标系绘制如下图，在某几个位置可以看出区别，但误差图像仍然区别很小。



![](code/img/p4-semilogy.png)

## Problem 5



证明Remez算法中的线性方程有唯一解，设交错点组为 $x_1,x_2, \cdots x_{n+2}$, 多项式的系数 $a_1, a_2, \cdots ,a_{n+1}$ 为 $n+1$ 个未知量，表示偏差量的$\eta$ 也为未知量，满足方程，注意此处从 $0$ 开始编号为了和MATLAB程序下标保持一致。



$$
\begin{align*}
\begin{pmatrix}
1 & x_1  &x_1^2  &\cdots & x_1^n & -1 \\
1 &x_2 & x_2^2  & \cdots & x_2^n & 1 \\
1 &x_3 & x_3^2  & \cdots & x_3^n & -1 \\
\vdots & \vdots & \vdots & \ddots &\vdots & \vdots \\
1 &x_{n+2} & x_{n+2}^2  & \cdots & x_{n+2}^n & (-1)^{n+2} 
\end{pmatrix}
\begin{pmatrix}
a_1 \\
a_2 \\
a_3 \\
\vdots \\
\eta \\
\end{pmatrix}
= 
\begin{pmatrix}
f(x_1) \\
f(x_2) \\
f(x_3) \\
\vdots \\
f(x_{n+2}) \\
\end{pmatrix}
\end{align*}
$$




计算系数矩阵 $A$ 的行列式，按最后一列展开并且根据Vandermonde行列式，可以知道，


$$
\begin{align*}
\det A = (-1)^n \sum_{k=1}^{n+2} \prod_{1 \le i \le j \le n+2, i,j\ne k} (x_j - x_i) \ne 0 
\end{align*}
$$


因此系数矩阵非奇异，该线性方程有唯一解



## Problem 6



对于Chebyshev多项式 $T_n(x)$ 虽然在 $[-1,1]$ 上零偏差很小，但是在该区间外部偏差却很大，任意满足 


$$
\begin{align*}
\max_{-1 \le x \le1}\vert  p(x) \vert \le 1
\end{align*}
$$
的 $n$ 阶多项式都满足，


$$
\begin{align*}
\vert p(t)  \vert \le \vert T_n(t) \vert, t \in (-\infty, -1) \cup (1, +\infty)
\end{align*}
$$


证明使用反证法，假设存在 $t$ 使得 $\vert p(t) \vert > \vert T_n(t) \vert$, 由于对称性，不妨假设 $t>1$, 根据Chebyshev多项式的性质，其在区间 $[-1,1]$ 中存在$n+1$个交错点组，其零偏差正好为 $1$，且该点组正好包含两个端点，下面符号分类讨论。

若 $T_n(t)  p(t) > 0$,  假设可化简为 $p(t)  = \alpha  T_n(t), \exist \alpha >1$,   因此 $ \alpha T_n(t) -  p(t) =0  $,  由于 $p(x)$ 在区间 $[-1,1]$ 上无法改变 $T_n(x)$ 的交错点组的符号，因此函数 $\alpha T_n(x) - p(x)$ 在区间 $[-1,1]$ 中存在 $n+1$ 个交错点组，因此在区间 $[-1,1]$内存在 $n$ 个零点, 此时函数 $\alpha T_n(x) - p(x)$ 作为 $n$ 阶多项式却存在 $n+1$ 个零点，矛盾。

若 $T_n(t) p(t)<0$, 假设可化简为 $- p(t) = \alpha T_n(t), \exists \alpha >1$, 因此 $ \alpha T_n(t) + p(t) =0  $,  由于 $p(x)$ 在区间 $[-1,1]$ 上无法改变 $T_n(x)$ 的交错点组的符号，因此函数 $\alpha T_n(x) + p(x)$ 在区间 $[-1,1]$ 中存在 $n+1$ 个交错点组，因此在区间 $[-1,1]$内存在 $n$ 个零点, 此时函数 $\alpha T_n(x) + p(x)$ 作为 $n$ 阶多项式却存在 $n+1$ 个零点，矛盾。



