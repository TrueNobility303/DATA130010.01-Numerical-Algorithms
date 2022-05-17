19307130195 陈乐偲



## Problem 1



定义 $T_n(x)$ 为 $n$ 界CHebyshev多项式，$\lambda_1, \cdots, \lambda_n$ 为其 $n$ 个零点，积分公式可以写为，


$$
\begin{align*}
\int_{-1}^1 \frac{1}{\sqrt{1-x^2}} f(x) \text{d}x \approx \sum_{k=1}^{n} A_k \lambda_k = \sum_{k=1}^n A_k \cos \frac{(2k-1) \pi}{2n}  .
\end{align*}
$$




Chebyshev多项式具有性质，


$$
\begin{align*}
\int_{-1}^1 \frac{1}{\sqrt{1-x^2}} T_i(x) T_j(x) \text{d}x &= 
\begin{cases}
0, & i \ne j; \\
\pi, & i = j =0; \\
\pi/2, & i = j \ne 0.
\end{cases}
\end{align*}
$$


定义如下的矩阵 $Q$,


$$
\begin{align*}
Q =
\begin{pmatrix}
q_1, q_2, \cdots, q_n
\end{pmatrix}
= 
\begin{pmatrix}
T_0(\lambda_1) & T_0(\lambda_2) & \cdots & T_0(\lambda_n) \\
T_1(\lambda_1) & T_1(\lambda_2) & \cdots & T_1(\lambda_n) \\
\vdots & \vdots & \ddots  & \vdots \\
T_{n-1}(\lambda_1) & T_{n-1}(\lambda_2) &  \cdots &T_{n-1}(\lambda_n)
\end{pmatrix}.
\end{align*}
$$


利用Gauss型积分公式对于 $2n$ 次多项式精确成立,


$$
\begin{align*}
\int_{-1}^1 \frac{1}{\sqrt{1-x^2}} T_i(x) T_j(x) =  \sum_{k=1}^n A_k \lambda_k = \begin{cases}
0, & i \ne j; \\
\pi, & i = j =0; \\
\pi/2, & i = j \ne 0.
\end{cases}
\end{align*}
$$


写成矩阵形式为，
$$
\begin{align*}
Q \text{diag} \{ A_1, A_2,\cdots, A_n \} Q^\top = \text{diag}\{\pi, \pi/2, \cdots, \pi/2 \}.
\end{align*}
$$


定义归一化的特征向量矩阵，
$$
\begin{align*}
\tilde Q =
\begin{pmatrix}
\tilde q_1, \tilde q_2, \cdots, \tilde q_n
\end{pmatrix}
= 
\begin{pmatrix}
q_1\sqrt \frac{1}{\pi}, q_2\sqrt \frac{2}{\pi}, \cdots, q_n \sqrt \frac{2}{\pi}
\end{pmatrix}
\end{align*}
$$
可以得到，
$$
\begin{align*}
\tilde Q \text{diag} \{ A_1, A_2,\cdots, A_n \} \tilde Q^\top = I_n  \\
\text{diag} \{ A_1, A_2,\cdots, A_n \} \tilde Q \tilde Q^\top  = I_n \\

\end{align*}
$$


因此可以求解积分公式中的系数，
$$
\begin{align*}
A_k &= \left( \sum_{j=0}^{n-1} \tilde q_{k,j}^2\right)^{-1} \\
&= \left( \frac{1}{\pi} + \frac{2}{\pi}\sum_{j=1}^{n-1} \cos^2 \left( \frac{j(2k-1) \pi}{2n}\right)\right)^{-1} \\
&= \left( \frac{1}{\pi} + \frac{1}{\pi}\sum_{j=1}^{n-1} \cos^2 \left(\frac{j(2k-1) \pi}{2n}\right)+ \frac{1}{\pi}\sum_{j=1}^{n-1} \cos^2 \left(\frac{(n-j)(2k-1) \pi}{2n}\right)\right)^{-1} \\
&=  \left( \frac{1}{\pi} + \frac{1}{\pi}\sum_{j=1}^{n-1} \cos^2 \left(\frac{j(2k-1) \pi}{2n}\right)+  \cos^2 \left(k - \frac{\pi}{2} - \frac{ j(2k-1) \pi}{2n}\right)\right)^{-1} \\
&=\left( \frac{1}{\pi} + \frac{1}{\pi}\sum_{j=1}^{n-1} \cos^2 \left(\frac{j(2k-1) \pi}{2n}\right) +\sin^2 \left(\frac{j(2k-1) \pi}{2n}\right)\right) \\
&= \frac{n}{\pi}
\end{align*}
$$


因此Gauss-Chebyshev积分公式可以写为，


$$
\begin{align*}
\int_{-1}^1 \frac{1}{\sqrt{1-x^2}} f(x) \text{d}x \approx \sum_{k=1}^{n} A_k \lambda_k = \frac{n}{\pi}\sum_{k=1}^n \cos \frac{(2k-1) \pi}{2n}  .
\end{align*}
$$


## Problem 2



对于三次样条插值，设 $f'(x_i) $  为自变量， 可以写出其对应的线性方程组，解得后代入每一个区间 $[x_i,x_{i+1} ]$ 上的如下插值公式即可获得对应的查询点 $x$ 的插值结果，



$$
\begin{align*}
f_i(x) &= f(x_i) \phi(\frac{x_{i+1}-x}{x_{i+1} - x_i}) + f(x_{i+1}) \phi( \frac{x-x_i}{x_{i+1} -x_i}) \\
&\quad -f'(x_i) (x_{i+1}-x_i)\psi (\frac{x_{i+1}-x}{x_{i+1}-x_i}) + f'(x_{i+1}) (x_{i+1}-x_i) \psi(\frac{x-x_i}{x_{i+1}-x_i}) \\
\text{With } \phi(x) &=  - 2x^3 + 3x^2, \psi(x) = x^3 - x^2 
\end{align*}
$$



如果要求获得导数值，可以用如下公式计算，


$$
\begin{align*}
f_i'(x) &=  -\frac{f(x_i)}{x_{i+1}  -x_i} \phi'(\frac{x_{i+1} - x}{x_{i+1}-x_i}) +  \frac{f(x_{i+1})}{x_{i+1} - x_i} \phi'(\frac{x - x_i}{x_{i+1}-x_i}) \\
&\quad + f'(x_i) \psi' ( \frac{x_{i+1} -x}{ x_{i+1}-x_i}) + f'(x_{i+1}) \psi'( \frac{x-x_i}{x_{i+1}-x_i}) \\
\text{With } \phi'(x) &= - 6x^2 + 6x, \psi'(x) = 3x^2 - 2x.
\end{align*}
$$


设计数值实验， $n$ 为插值点的数目，对比导数的拟合值和真实值，绘制如下图

![](code/img/p2.png)

可以看到当 $n$ 选取过小或者过大都会导致效果不好。





## Problem 3



直接验证即可，


$$
\begin{align*}
F_n =
\begin{pmatrix}
w_n^0 & w_n^0 & w_n^0 &\cdots & w_n^0 \\
w_n^1 & w_n^2 & w_n^3 &\cdots & w_n^n \\
w_n^2 & w_n^4 & w_n^6 &\cdots & w_n^{2n} \\
\vdots & \vdots &\vdots &\ddots &\vdots \\
w_n^n & w_n^{2n} & w_n^{3n} &\cdots & w_n^{n^2} \\
\end{pmatrix}, 
J_n =
\begin{pmatrix}
0 & 1 & 0 &\cdots & 0 \\
0 & 0 & 1 &\cdots & 0 \\
0 & 0 & 0 &\cdots & 0 \\
\vdots & \vdots &\vdots &\ddots &\vdots \\
1 & 0 & 0 &\cdots & 0 \\
\end{pmatrix}
\end{align*}
$$
那么有，


$$
\begin{align*}
J_n F_n &= \begin{pmatrix}
0 & 1 & 0 &\cdots & 0 \\
0 & 0 & 1 &\cdots & 0 \\
0 & 0 & 0 &\cdots & 0 \\
\vdots & \vdots &\vdots &\ddots &\vdots \\
1 & 0 & 0 &\cdots & 0 \\
\end{pmatrix}
\begin{pmatrix}
w_n^0 & w_n^0 & w_n^0 &\cdots & w_n^0 \\
w_n^1 & w_n^2 & w_n^3 &\cdots & w_n^n \\
w_n^2 & w_n^4 & w_n^6 &\cdots & w_n^{2n} \\
\vdots & \vdots &\vdots &\ddots &\vdots \\
w_n^n & w_n^{2n} & w_n^{3n} &\cdots & w_n^{n^2} \\
\end{pmatrix}\\
&= 
\begin{pmatrix}
w_n^1 & w_n^2 & w_n^3 &\cdots & w_n^n \\
w_n^2 & w_n^4 & w_n^6 &\cdots & w_n^{2n} \\
w_n^3 & w_n^{6} & w_n^{9} &\cdots & w_n^{3n} \\
\vdots & \vdots &\vdots &\ddots &\vdots \\
w_n^0 & w_n^0 & w_n^0 &\cdots & w_n^0 \\
\end{pmatrix}\\
&=
\begin{pmatrix}
w_n^1 & 0 & 0 &\cdots & 0 \\
0 & w_n^2 & 0 &\cdots & 0 \\
0 & 0 & w_n^3 &\cdots & 0 \\
\vdots & \vdots &\vdots &\ddots &\vdots \\
0 & 0 & 0 &\cdots & w_n^{n} \\
\end{pmatrix} 
\begin{pmatrix}
w_n^0 & w_n^0 & w_n^0 &\cdots & w_n^0 \\
w_n^1 & w_n^2 & w_n^3 &\cdots & w_n^n \\
w_n^2 & w_n^4 & w_n^6 &\cdots & w_n^{2n} \\
\vdots & \vdots &\vdots &\ddots &\vdots \\
w_n^n & w_n^{2n} & w_n^{3n} &\cdots & w_n^{n^2} \\
\end{pmatrix} \\
&= D_n F_n
\end{align*}
$$


也即，


$$
\begin{align*}
F_n^{-1} J_n F_n = D_n
\end{align*}
$$

## Problem 4

  

使用MATLAB自带的 `fft`函数绘制出傅里叶变换后的功率谱，

![](code/img/p4.png)

放大可以看见左图在原点附近仅有连续的单峰，而右图在原点附近出现连续的双峰，

![](code/img/p4-big.png)



下面解释该现象，首先对连续的傅里叶变换进行解释，考虑冲激函数的逆傅里叶变换，
$$
\begin{align*}
\text{IFT}(\delta(s - s_0)) =\frac{1}{2 \pi }\int_{-\infty}^{\infty} \delta(s-s_0) \exp(it s) \text{ds} = \frac{1}{2 \pi}\exp(its_0).
\end{align*}
$$
根据傅里叶变换和逆傅里叶变换的一一对应，
$$
\begin{align*}
\text{FT}( \exp(its_0)) = 2 \pi \delta (s-s_0).
\end{align*}
$$
利用欧拉公式可以求得正弦函数的傅里叶变换，
$$
\begin{align*}
\sin(s_0 t ) &= \frac{\exp( is_0 t) - \exp(-i s_0t)}{2 i} = i \pi \delta (s+s_0) - i \pi \delta(s- s_0) 
\end{align*}
$$
而且傅里叶变换具有线性性质，可以通过定义验证，
$$
\begin{align*}
\text{FT} (a f(t) + bg(t)) = a \text{FT} (f(t)) + b \text{FT} (f(t)).
\end{align*}
$$
从上述的推导可以看出，傅里叶变换将不同正弦函数的分离开来，因此出现上图的现象，当然对于余弦函数同样成立。



我们还可以看到功率谱关于原点对称，如下图所示，

![](code/img/p4-sym.png)

这是由于傅里叶变换关于实函数是共轭对称的，
$$
\begin{align*}
F(s) = \int_{-\infty}^{\infty} f(t) \exp( -its) \text{d}t = F^{\ast}(-s)
\end{align*}
$$
因此其功率谱关于原点中心对称，
$$
\begin{align*}
\vert F(s) \vert = \vert F (-s) \vert
\end{align*}
$$


上述的解释仍然不完全严谨，由于在数值实验中，我们采用等距结点对原函数进行采样，我们关心采样后的函数的傅里叶变换，记原函数为 $f(t)$, 采用周期为 $\Delta T$ 的冲激串 $s_{\Delta T}$ 对其进行采样，记采样后的函数为 $\tilde f(t)$, 假设我们已知 $f(t)$ 的傅里叶变换为 $F(s)$, 我们关心 $\tilde f(t)$ 的傅里叶变换 $\tilde F(s)$ 的表达式，

对于冲激串，为周期为 $\Delta T$ 的周期函数，可以对其进行傅里叶展开，惊喜地发现级数前每一项系数都为 $1 /\Delta T$, 
$$
\begin{align*}
s_{\Delta T} = \frac{1}{\Delta T} \sum_{n=-\infty}^{\infty} \exp(i \frac{2 \pi n }{\Delta T}) \\
\end{align*}
$$
其傅里叶变换为为周期为 $ 2 \pi /\Delta T$ 的冲激串，
$$
\begin{align*}
S_{\Delta T}(s) =\text{FT}( s_{\Delta T} ) = \frac{1}{\Delta T} \sum_{n=-\infty}^{\infty} \text{FT} (\exp(i \frac{2 \pi n }{\Delta T})) =\frac{2 \pi}{\Delta T} \sum_{n=-\infty}^{\infty} \delta (s - \frac{2 \pi n}{\Delta T})
\end{align*}
$$
利用卷积定理，
$$
\begin{align*}
\tilde F(s) &= \text{FT}( \tilde f(t)) \\
&=\text{FT} ( f(t) \odot s_{\Delta T}(t)) \\
&= F(s) \otimes S_{\Delta T}(s) \\
&= \frac{2\pi}{\Delta T}  \int_{-\infty}^{\infty} F(x)  \sum_{n=-\infty}^{\infty} \delta(s - x - \frac{2 \pi n}{\Delta T} ) \text{d}x\\
&= \frac{2\pi}{\Delta T} \sum_{n=-\infty}^{\infty} \int_{-\infty}^{\infty} F(x)\delta(s - x - \frac{2 \pi n}{\Delta T} ) \text{d}x \\
&= \frac{2\pi}{\Delta T} \sum_{n=-\infty}^{\infty}  F(s - \frac{2 \pi n}{ \Delta T})
\end{align*}
$$


从上式中可以看到 $\tilde F(s)$ 是 $F(s)$ 的一个周期为 $2 \pi /\Delta T$ 的无限拷贝，因此在未放大的图中我们正好看到了两个周期。

由于 $\tilde F(s)$ 的周期为 $ 2 \pi/\Delta T$， 如果采样的间距过小，会出现混淆的情况，例如在上述实验中取 $n=10$, 可以看到

![](code/img/p4-ji.png)

上述的推导针对的是连续的傅里叶变换，但在实际中使用的是离散的傅里叶变换，那么上述的性质对于离散的傅里叶变换是否仍然成立的，为了说明这一点，可以考虑连续傅里叶变换到离散的傅里叶变换之间的联系，参见书中的结论，离散傅里叶变换可以看作是对 $\tilde F(s)$ 的一个周期进行等距采样的结果，


$$
\begin{align*}
\tilde F(s) &= \int_{-\infty}^{\infty} \tilde f(t) \exp( -its) \text{d}t \\
&= \int_{-\infty}^{\infty}  \sum_{n = -{\infty}}^{\infty}f(t) \delta (t- n \Delta T) \exp(-its) \text{d} t \\
&= \sum_{n = -{\infty}}^{\infty}\int_{-\infty}^{\infty} f(t) \delta (t- n \Delta T) \exp(-its) \text{d} t \\
&= \sum_{n = -{\infty}}^{\infty} f(n \Delta T) \exp( - i n \Delta T s) \\
\end{align*}
$$


实际中，我们并不可能对 $n = -\infty \sim +\infty$ 求和，因此只能选择考虑有限求和，此时也相当于考虑一个带限函数的傅里叶变换，记对原函数所采样的点为 $f_n, n =0,\cdots, N-1$ ,  我们已经知道 $\tilde F(s)$ 的一个周期为 $2 \pi /\Delta T$, 考虑我们在该周期中采集 $\tilde F(s)$ 的 $N$ 个样本，对应所采集到的点位为 $F_m, m = 0,\cdots, N-1$, 那么
$$
\begin{align*}
F_m(s) = \sum_{n=0}^{N-1} f_n \exp( - \frac{i2 \pi  mn}{N} ).
\end{align*}
$$
即为离散傅里叶变换的表达式。

因此，离散傅里叶变换的结果，可以看作对连续的傅里叶变换采样后的结果，因此上述对于连续傅里叶变换的分析可以仍然适用。



