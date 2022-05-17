19307130195 陈乐偲



## Problem 1



提供一种求积公式对下式进行积分，


$$
\begin{align*}
\int_a^b \cos(mx) f(x) ~\text{d}x.
\end{align*}
$$

将含义余弦函数的部分作为正交多项式的权函数，利用Gauss积分公式，根据插值型积分的误差估计，只需要取插值结点为关于上述权函数的 $n$ 次正交多项式的两个根即可。为了求解上述正交多项式，首先推导正交多项式的性质，设 $\omega_k$ 为 $k$ 次首一正交多项式， 
$$
\begin{align*}
x \omega_k(x) &= \omega_{k+1}(x) + \sum_{j=0}^k c_j \omega_j(x). 
\end{align*}
$$
根据正交性质，对两边同时积分可以简单推出，
$$
\begin{align*}
c_0 = c_1 = \cdots c_{k-2} = 0.
\end{align*}
$$
因此，
$$
\begin{align*}
x\omega_k(x)  = \omega_{k+1}(x) + c_k \omega_{k}(x) + c_{k-1} \omega_{k-1}(x).
\end{align*}
$$
积分可以得到，
$$
\begin{align*}
\int_a^b \rho(x) \omega_k^2(x) \text{d}x &= \int_a^b \rho(x) \omega_k(x) (\omega_k(x) + \sum_{j=0}^{k-1} b_j \omega_j(x)) \text{d}x\\
&=\int_a^b \rho(x) x \omega_k(x) \omega_{k-1}(x) \text{d}x\\
&=\int_a^b \rho(x) \left(\omega_{k+1}(x) + \sum_{j=0}^k c_j \omega_j(x) \right) \omega_{k-1}(x) \text{d}x \\
&= c_{k-1} \int_a^b \rho(x) \omega_{k-1}^2(x) \text{d}x, \\
\int_a^b \rho(x) x \omega_k^2(x) \text{d}x&= c_k \int_a^b \rho(x)  \omega_k^2(x).
\end{align*}
$$
如此可以解得系数 $c_k,c_{k-1}$, 因此，
$$
\begin{align*}
x\omega_k(x)  &= \omega_{k+1}(x) + \beta_k \omega_{k}(x) + \gamma_{k} \omega_{k-1}(x), \\
\beta_{k} &= \int_a^b x \rho(x) \omega_k^2(x)\text{d}x \Big/  \int_a^b \rho(x) \omega_k^2(x)\text{d}x,\\
\gamma_{k} &= \int_a^b \rho(x) \omega_k^2(x)\text{d}x \Big/  \int_a^b \rho(x) \omega_{k-1}^2(x)\text{d}x,.
\end{align*}
$$
根据系数 $\beta_k,\gamma_k$ 生成对应的三对角矩阵后求解对应的特征值就可以得到正交多项式的根 $x_1, x_2\cdots, x_n$，上面给出了关于计算上述问题的一般算法，但是该问题中 $n=2$, 实际采用待定系数法可能更为方便求解，首先用分部积分公式可以计算出如下的量，
$$
\begin{align*}
k_0 &= \int_a^b  \cos(mx) \text{d}x, \\
k_1 &= \int_a^b x \cos(mx) \text{d}x, \\
k_2 &= \int_a^b x^2 \cos(mx) \text{d}x,\\
k_3 &= \int_a^b x^3 \cos(mx) \text{d}x.
\end{align*}
$$
令 $\omega_0(x) = 1, \omega_1(x) = x+ b , \omega_2(x)  = x^2 +cx+d$, 则根据正交性条件，
$$
\begin{align*}
\int_a^b \cos(mx) (x+b) \text{d}x &= 0, \\
\int_a^b \cos(mx) (x^2+cx+d) \text{d}x &= 0, \\
\int_a^b \cos(mx) (x+b)(x^2+cx+d) \text{d}x &= 0
\end{align*}
$$
也即，
$$
\begin{align*}
k_1 + k_0 b &= 0,\\ 
k_2 + k_1c + k_0d &=0, \\
k_3 + k_2(b+c) +k_1(bc+d) +k_0 bd &=0.
\end{align*}
$$
解得，
$$
\begin{align*}
b &=  - \frac{k_1}{k_0}, \\
\end{align*}
$$
以及，
$$
\begin{align*}
\begin{pmatrix}
c \\
d 
\end{pmatrix}
= 
-
\begin{pmatrix}
k_1  & k_0 \\
k_2 + k_1b & k_1 + k_0b 
\end{pmatrix}^{-1}
\begin{pmatrix}
k_2 \\
k_3 + k_2b 
\end{pmatrix}.
\end{align*}
$$
利用求根公式得到 $\omega_2(x)$ 的两个根也即插值结点为，
$$
\begin{align*}
x_1 &=  -\frac{c}{2} -\frac{\sqrt{c^2 - 4d}}{2},x_2 = -\frac{c}{2} +\frac{\sqrt{c^2 - 4d}}{2}.\\
\end{align*}
$$
Gauss 积分公式给出的结果为，
$$
\begin{align*}
\int_a^b \cos(mx) f(x) ~\text{d}x \approx  A_1 f(x_1) + A_2 f(x_2).
\end{align*}
$$


上述积分公式代数精度为 $3$, 因此可以精确求解 $f(x) = 1, f(x) = x$ 的情况,
$$
\begin{align*}
A_1 + A_2 &=  k_0 , \\
A_1 x_1 +A_2 x_2 &= k_1.
\end{align*}
$$
求解出积分公式中的系数为，
$$
\begin{align*}
\begin{pmatrix}
A_1 \\
A_2 
\end{pmatrix}
= 
\begin{pmatrix}
1  & 1 \\
x_1 & x_2
\end{pmatrix}^{-1}
\begin{pmatrix}
k_0 \\
k_1  
\end{pmatrix}.
\end{align*}
$$
利用上述积分公式编写函数 `cos_quatrature.m` 计算上述积分，选取 $m=1 ,a = 0,b=1$, $f(x) = 1,x,x^2,x^3$ 得到结果如下表，

|                                  | 计算值   | 理论值                            |
| -------------------------------- | -------- | --------------------------------- |
| $\int_a^b \cos(mx) \text{d}x$    | $0.8415$ | $\sin(1) = 0.8451$                |
| $\int_a^b \cos(mx) x\text{d}x$   | $0.3818$ | $\cos(1) + \sin(1) - 1=0.3818$    |
| $\int_a^b \cos(mx) x^2\text{d}x$ | $0.2391$ | $2 \cos(1) - \sin(1)=0.2391$      |
| $\int_a^b \cos(mx) x^3\text{d}x$ | $0.1717$ | $6 - 5\sin(1) - 3\cos(1) =0.1717$ |



计算值与理论值完全吻合，说明该求积公式的确具有三次代数精度。



## Problem 2



比较下列两个积分公式的代数精度，
$$
\begin{align*}
T_1 &= \frac{1}{6} f\left( \frac{1}{2},0\right) + \frac{1}{6} f\left( 0,\frac{1}{2}\right) + \frac{1}{6} f\left( \frac{1}{2},\frac{1}{2}\right) , \\
T_2 &= \frac{1}{6} f\left( \frac{2}{3},\frac{1}{6}\right) + \frac{1}{6} f\left( \frac{1}{6},\frac{2}{3}\right) + \frac{1}{6} f\left( \frac{1}{6},\frac{1}{6}\right) , \\
\end{align*}
$$


理论值为，


$$
\begin{align*}
S = \int_0^1 \int_0^{1-y} f(x,y) ~\text{d}x ~\text{d}y.
\end{align*}
$$


进行如下检查，



| $f(x,y)$ | $S$    | $T_1$  | $T_2$    |
| -------- | ------ | ------ | -------- |
| $1$      | $1/2$  | $1/2$  | $1/2$    |
| $x$      | $1/6$  | $1/6$  | $1/6$    |
| $y$      | $1/6$  | $1/6$  | $1/6$    |
| $x^2$    | $1/12$ | $1/12$ | $1/12$   |
| $xy$     | $1/24$ | $1/24$ | $1/24$   |
| $y^2$    | $1/12$ | $1/12$ | $1/12$   |
| $y^3$    | $1/20$ | $1/24$ | $11/216$ |



因此可以看到上述两个求积公式都具有二次代数精度。



## Problem 3



使用复化三角积分公式计算如下积分，
$$
\begin{align*}
\int_0^1\int_0^{1-y} \exp(x) \sin(y) ~\text{d} x ~\text{d}y.
\end{align*}
$$
首先计算下列积分的精确值，
$$
\begin{align*}
\int_0^1 \int_0^{1-y} \exp(x) \exp(i y) ~\text{d}x ~\text{d}y &= \int_0^1 \exp(1+(i-1)y) ~\text{d}y - \int_0^1 \exp(iy) ~\text{d}y \\
&= \frac{\exp(1) + \sin(1) - \cos(1)}{2} + i \frac{\exp(1) -\sin(1) - \cos(1) }{2} - \sin(1) + i(\cos(1) -1).
\end{align*}
$$
取虚部可以得到所求积分的理论值为，
$$
\begin{align*}
\frac{\exp(1) -\sin(1) + \cos(1) }{2} -1=  0.2086.
\end{align*}
$$
采用 Problem 2中的积分公式 $T_1$ 的复化版本，首先将区域的横坐标和纵坐标都分为相同的 $n$ 份，每份的长度为 $h$, 设切分后每个子直角三角形的三个顶点坐标为 $(a_1,a_2), (b_1,b_2), (c_1,c_2)$, 则该三角形子区域的积分为，
$$
\begin{align*}
T_{ij} &= \frac{h^2}{6} f\left( \frac{a_1 +b_1}{2},\frac{a_2 +b_2}{2}\right) + \frac{h^2}{6} f\left( \frac{a_1 +c_1}{2},\frac{a_2 +c_2}{2}\right) + \frac{h^2}{6} f\left( \frac{b_1 +c_1}{2},\frac{b_2 +c_2}{2}\right).
\end{align*}
$$
将所有的子区域的积分求和得到最终的近似数值积分值，编写函数 `triangle_quatrature.m` 实现，下图展示对于上述例子的误差随着数目 $n$ 的增大的在对数坐标系下的变化，

![](code/img/tri-sin-exp.png)



## Problem 4



首先分析常用的正向五点差分的误差估计，考虑权重矩阵为


$$
\begin{align*}
\begin{pmatrix}
 0 & 1 & 0 \\
 1 & -4 & 0 \\
 0 & 1 & 0
\end{pmatrix}.
\end{align*}
$$


使用Tayor展开，并且注意到根据对称性关于 $h$ 的奇数次幂的项都为零，
$$
\begin{align*}
A_1  &= \frac{1}{h^2} ( f(x+h, y) + f(x-h,y) + f(x, y+h), f(x,y-h) - 4f(x)) \\
&=\frac{\partial^2 f}{\partial x^2} +\frac{\partial^2 f}{\partial y^2} +  \frac{h^2}{12} \left( \frac{\partial^4 f}{\partial x^4} +\frac{\partial^4 f}{\partial y^4}\right)  + o(h^4)
\end{align*}
$$


如果采用斜向的五点差分格式，也即权重矩阵为，


$$
\begin{align*}
\begin{pmatrix}
 1 & 0 & 1 \\
 0 & -4 & 0 \\
 1 & 0 & 1
\end{pmatrix}.
\end{align*}
$$


使用Tayor展开，并且注意到根据对称性关于 $h$ 的奇数次幂的项都为零，
$$
\begin{align*}
A_2 &= \frac{1}{2h^2} ( f(x+h, y+h) + f(x-h,y-h) + f(x+h, y-h), f(x-h,y+h) - 4f(x))\\
&=\frac{\partial^2 f}{\partial x^2} +\frac{\partial^2 f}{\partial y^2} +  \frac{h^2}{12} \left( \frac{\partial^4 f}{\partial x^4} +\frac{\partial^4 f}{\partial y^4}\right)  + \frac{h^2}{2} \frac{\partial^4 f}{\partial x^2 \partial y^2} + o(h^4).
\end{align*}
$$


但此时发现误差中含有交叉项，因此斜向的五点差分格式并不一定比正向的五点差分格式好，可能需要根据交叉项的符号选择。



对于九点差分格式，使用正向五点差分和斜向五点差分进行线性组合即可，例如对于常见的权重矩阵为，




$$
\begin{align*}
\begin{pmatrix}
 1 & 1 & 1 \\
 1 & -8 & 1 \\
 1 & 1 & 1
\end{pmatrix}.
\end{align*}
$$


也即，


$$
A_3 = \frac{1}{3h^2} ( f(x+h,y+h) + f(x,y+h), f(x-h,y+h) + f(x+h,y) + f(x,y) \\
+ f(x-h,y) + f(x+h,y-h) + f(x,y-h) + f(x-h,y-h))
$$


可以看到，
$$
\begin{align*}
A_3 &= \frac{1}{3}A_1 + \frac{2}{3}A_2 \\
&= \frac{\partial^2 f}{\partial x^2} +\frac{\partial^2 f}{\partial y^2} +  \frac{h^2}{12} \left( \frac{\partial^4 f}{\partial x^4} +\frac{\partial^4 f}{\partial y^4}\right)  + \frac{h^2}{3} \frac{\partial^4 f}{\partial x^2 \partial y^2} + o(h^4).
\end{align*}
$$


## Problem 5



采用Richardson计算如下的导数，


$$
\begin{align*}
f(x) = x^3 \exp(x), \dot f(x=1) = \exp(x) (x^3 + 3x^2)  \Big \vert_{x=1}= 4\exp(1).    
\end{align*}
$$


外推法的递推公式为，
$$
\begin{align*}
T_{m+1}(h) = \frac{T_m (h/2) - (1/2)^{2m} T_m(h)}{ 1 - (1/2)^{2m}}.
\end{align*}
$$


其递推边界采用如下常用数值微分公式，
$$
\begin{align*}
df (x)  \approx\frac{f(x +h) - f(x-h)}{2h}  
\end{align*}
$$
选取 初始的 $h = 0.01$, 编写程序 `Richardson.m`, 在对数坐标系下误差如下图所示，

![](code/img/Richardson.png)



可以看到上述算法收敛很快，但是如果持续迭代下去，会由于截断误差导致误差爆炸，

![](code/img/Richardson-iter.png)