19307130195 陈乐偲

## 1



根据Taylor展开，


$$
\begin{align*}
\arctan(x) &= x - \frac{1}{3}x^3 + \frac{1}{5} x^5 - \frac{1}{7} x^7 + ...
\end{align*}
$$


对于级数，


$$
\begin{align*}
S_n &= \sum_{k=1}^{2n} \frac{(-1)^k}{2k-1} \\
\end{align*}
$$


定义下列极限，其极限收敛，


$$
\begin{align*}
S_{\infty} &= \sum_{k=1}^{\infty} \frac{(-1)^k}{2k-1}
\end{align*}
$$


其差值，


$$
\begin{align}
D_n &= S_{\infty} - S_{n}  = \sum_{k=2n+1}^{\infty} \frac{(-1)^{k+1}}{2k-1} = 2\sum_{k=2n+1}^{\infty} \frac{1}{4k^2 - 1} 
\end{align}
$$


利用积分的上下界，


$$
\begin{align*}
2\int_{2n+1}^{\infty} \frac{1}{4x^2 - 1} &\le D_n \le 2\int_{2n}^{\infty} \frac{1}{4x^2 -1} \\
2\int_{2n+1}^{\infty} \frac{1}{4x^2} &\le D_n \le 2\int_{2n-1}^{\infty} \frac{1}{4x^2}  \\
\frac{1}{2(2n+1)} &\le D_n \le \frac{1}{2(2n-1)}
\end{align*}
$$


此时其收敛率为 $\Theta(1/n)$



考虑对该级数的估计进行修正，令


$$
\begin{align*}
\hat S_n &=  S_n + \frac{1}{2n(2n+1)} \\

\end{align*}
$$


此时误差满足，


$$
\begin{align*}
0 &\le \hat D_n = S_{\infty} - \hat S_n  \le  \frac{1}{4n^2-1}
\end{align*}
$$


因此经过修正后的收敛率为 $\Theta(1/n^2)$ 



## 2



使用Taylor展开计算sin函数值，


$$
\begin{align*}
\sin(x) &= x - \frac{x^3}{3!} + \frac{x^5}{5!} - \frac{x^7}{7!} + ...
\end{align*}
$$




下图展示shift 操作的影响，



![cmp-shift](code/img/cmp-shift.png)



假设 $\vert x \vert < c$, 对于该交错级数其截断误差也即余项估计有，


$$
\begin{align*}
\vert D_{n-1} \vert \le \vert \frac{x^{2n+1}}{(2n+1)!} \vert \le  \frac{c^{2n+1}}{(2n+1)!}  
\end{align*}
$$


因此其界 $c$ 越小，达到给定的截断精度所需要展开的项数 $n$ 越小，产生的舍入误差也相应的越小，





## 3





条件等价于，


$$
\begin{align*}
\Vert r \Vert_{\alpha} &= \Vert b - A \hat x \Vert_{\alpha} = \Vert A (x_{\ast} - \hat x) \Vert_{\alpha} = \Vert x_{\ast} - \hat x \Vert_{\beta}
\end{align*}
$$


只需令如下的范数就可以满足条件，


$$
\begin{align*}
\Vert x - \hat x \Vert_{\beta} &= \Vert A(x_{\ast} - \hat x) \Vert_{\alpha}
\end{align*}
$$


容易根据范数的定义验证当 $\Vert \cdot \Vert_{\alpha}$ 为向量范数时，如上定义的范数 $\Vert \cdot \Vert_{\beta}$ 也满足向量范数的定义。





## 4



利用 《数值逼近》一书中关于舍入误差的引理，


$$
\begin{align*}
1- n u &\le\prod_{i=1}^n (1 +\delta_i) \le 1 + 1.01 n u, \vert \delta_i\vert \le u, nu \le 0.01
\end{align*}
$$


结合二次型的公式，


$$
\begin{align*}
x^\top Ax &= \sum_{ij} a_{ij} x_i x_j
\end{align*}
$$


得到其运算结果满足，


$$
\begin{align*}
fl(x^\top A x) &= \sum_{ij} a_{ij} x_i x_j (1 +w_{ij}) , \vert w_{ij} \vert \le 1.01 \times(n^2+1) u  
\end{align*}
$$


因此误差满足，


$$
\begin{align*}
\vert fl(x^\top Ax) - x^\top A x \vert \le \vert \sum_{ij}a_{ij} w_{ij} \vert \le 1.01 \times(n^2+1) u \times \sum_{ij} \vert a_{ij} \vert 
\end{align*}
$$
