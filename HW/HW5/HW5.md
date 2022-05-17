19307130195 陈乐偲



## Problem 1

编写函数 `cubic_spline` 使用三次样条插值，其中 `type` 参数可选 `type = 'complete', 'narural', 'periodic'`分别对应自然样条完全样条和周期样条，对应求解不同的线性方程组，该问题中采用完全样条插值正弦函数，取插值点个数 $n=9$, 但是端点处的导数可能计算错误，当 $\nabla f(0) = 1,0,-1$ 三种情况的插值曲线如下，对比可以明显见到当端点处导数值计算错误时对插值函数的影响。



![](code/img/wrong-sine.png)  



由于讲义上所给的方程组的系数在下标 $i$ 上有误，以及程序中所用到的方程组稍微与讲义上所给的方程组不同，但解相同，下面给出程序中出所求解的方程组。



设 $n$ 个插值点 $x_i, 1 \le i \le n$ 的函数值为 $y_i $ , 设其一阶导数为自变量 $k_i$, 定义如下的符号，


$$
\begin{align*}
h_i &=  x_{i+1} - x_i,1 \le i \le n-1\\
\beta_i &= \frac{1}{h_i}, 1 \le i \le n-1 \\
\eta_i &= \frac{3(y_{i+1}-y_i)}{h_i^2}, 1 \le i \le n-1
\end{align*}
$$


对于完全样条，设端点处的导数给定位 $k_1',  k_2'$, 对应的方程组为


$$
\begin{align*}
\begin{pmatrix}
1 &  \\
\beta_1 & 2(\beta_1 + \beta_2) & \beta_2 &  \\
   & \ddots & \ddots & \ddots & \\ 
   & \beta_{n-2} & 2(\beta_{n-2}+ \beta_{n-1}) & \beta_{n-1}  \\
   & & & 1 \\ 
\end{pmatrix} 
\begin{pmatrix}
k_1 \\
k_2 \\
\vdots  \\
k_{n-1} \\
k_n \\
\end{pmatrix} 
= 
\begin{pmatrix}
k_1' \\
\eta_1 + \eta_2 \\
\vdots  \\
\eta_{n-2} + \eta_{n-1} \\
k_n' \\
\end{pmatrix} 
\end{align*}
$$


对于自然样条，对应的方程组为，


$$
\begin{align*}
\begin{pmatrix}
2 \beta_1 & \beta_1  \\
\beta_1 & 2(\beta_1 + \beta_2) & \beta_2 &  \\
   & \ddots & \ddots & \ddots & \\ 
   & \beta_{n-2} & 2(\beta_{n-2}+ \beta_{n-1}) & \beta_{n-1}  \\
   & & \beta_{n-1}& 2 \beta_{n-1} \\ 
\end{pmatrix} 
\begin{pmatrix}
k_1 \\
k_2 \\
\vdots  \\
k_{n-1} \\
k_n \\
\end{pmatrix} 
= 
\begin{pmatrix}
\eta_1 \\
\eta_1 + \eta_2 \\
\vdots  \\
\eta_{n-2} + \eta_{n-1} \\
\eta_{n-1} \\
\end{pmatrix} 
\end{align*}
$$


 对于周期样条，由于 $k_1 = k_n$,  因此方程组可以减少最后一个变量，


$$
\begin{align*}
\begin{pmatrix}
(\beta_1 + \beta_{n-1}) & \beta_1  & & \beta_{n-1} \\
\beta_1 & 2(\beta_1 + \beta_2) & \beta_2 &  \\
   & \ddots & \ddots & \ddots & \\ 
   & \beta_{n-3} & 2(\beta_{n-3}+ \beta_{n-2}) & \beta_{n-2}  \\
 \beta_{n-1}  & & \beta_{n-2}& 2 (\beta_{n-2} + \beta_{n-1}) \\ 
\end{pmatrix} 
\begin{pmatrix}
k_1 \\
k_2 \\
\vdots  \\
k_{n-2} \\
k_{n-1} \\
\end{pmatrix} 
= 
\begin{pmatrix}
\eta_1 \\
\eta_1 + \eta_2 \\
\vdots  \\
\eta_{n-3} + \eta_{n-2} \\
\eta_{n-2} + \eta_{n-1} \\
\end{pmatrix} 
\end{align*}
$$




解得对应的 $f'(x_i) = k_i$ 后代入每一个区间 $[x_i,x_{i+1} ]$ 上的如下插值公式即可获得对应的查询点 $x$ 的插值结果



$$
\begin{align*}
f_i(x) &= f(x_i) \phi(\frac{x_{i+1}-x}{x_{i+1} - x_i}) + f(x_{i+1}) \phi( \frac{x-x_i}{x_{i+1} -x_i}) -f'(x_i) (x_{i+1}-x_i)\psi (\frac{x_{i+1}-x}{x_{i+1}-x_i}) + f'(x_{i+1}) (x_{i+1}-x_i) \psi(\frac{x-x_i}{x_{i+1}-x_i}) \\
\text{With } \phi(x) &=  - 2x^3 + 3x^2, \psi(x) = x^3 - x^2 
\end{align*}
$$






## Problem 2



使用周期样条对所给数据进行插值，结果如下，可以看见在左右端点处的斜率和曲率都几乎相等，这也与周期样条的理论性质相吻合



![](code/img/temperature.png)



## Problem 3



分别采用Delauay方法和Shepard方法对所给数据进行2d函数插值，参见代码 `2d_iterpolation.m` 文件，结果可视化如下，在Delauay方法中网格取对应的Delaunay 三角剖分，在Shepard方法中网格取等间距的 $n \times n$ 个结点，在下图中取 $n=10$, 



![](code/img/2d-int.png)



## Problem 4 



参见代码 `problem4.m` 文件， 对于该题目混合高斯模型对应的函数，注意下式中的参数 $\beta_1,\beta_2$ 和原定义不同，但函数类等价


$$
\begin{align*}
\phi(x \vert \alpha_1,\alpha_2 ,\beta_1, \beta_2,\gamma_1,\gamma_2 ) = \alpha_1 \exp(-\beta_1 (x-\gamma_1)^2) + \alpha_2 \exp(- \beta_2 (x - \gamma_2)^2)
\end{align*}
$$


设定参数矩阵为 $ \theta = [\alpha_1, \beta_1 ,\gamma_1 ,\alpha_2, \beta_2, \gamma_2]^\top$, 给定样本 $(x_i,y_i)$ 后其对应的梯度为，




$$
\begin{align*}
\nabla \phi_i =
\begin{pmatrix}
\exp(-\beta_1 (x_i-\gamma_1)^2) \\
-\alpha_1 (x_i - \gamma_1)^2\exp(-\beta_1 (x_i-\gamma_1)^2) \\
2\beta_1 \alpha_1 (x_i -\gamma_1) \exp(- \beta_1(x_i - \gamma_1)^2) \\
\exp(-\beta_2 (x_i-\gamma_2)^2) \\
-\alpha_2 (x_i - \gamma_1)^2\exp(-\beta_2 (x_i-\gamma_2)^2) \\
2\beta_2 \alpha_2 (x_i -\gamma_2) \exp(- \beta_1(x_i - \gamma_2)^2） \\
\end{pmatrix}^\top
\end{align*}
$$


记所有 $n$ 个的样本的梯度拼成矩阵 $J$,  以及所有的函数值的残差拼成向量 $r $


$$
\begin{align*}
J_{\theta} = 
\begin{pmatrix}
\nabla \phi_1 \\
\nabla \phi_2 \\
\vdots \\
\nabla \phi_n
\end{pmatrix}, 
r_{\theta} = 
\begin{pmatrix}
y_1 - \phi_1 \\
y_2 - \phi_2 \\
\vdots \\
y_n - \phi_n
\end{pmatrix}, 
\end{align*}
$$


由于残差的梯度和 $\phi$ 的梯度相反，因此使用广义逆的符号，Gauss-Newton迭代格式为，


$$
\begin{align*}
\theta_{k+1} &= \theta_k + J_{\theta}^{\dagger} r_{\theta}
\end{align*}
$$



由于Gauss-Newton法依赖于初值的选取，根据所给数据设置初值为 $\alpha_1 = 2, \alpha_2 = 1, \beta_1 = 1 ,\beta_2 =1, \gamma_1 = -2.5, \gamma_2 = 1.5$, Gauss-Newton法在 $10$ 步迭代内可以得到如下的拟合结果，



![](code/img/gn-gmm.png)



在数值实验中可以发现Gauss-Newton法虽然与Newton法类似具有很快的局部收敛性，但其弊端在于初值依赖严重以及方法缺少明确的停止准则，但该非线性拟合问题本身可能就较难解决。



## Problem 5



代码参见 `problem5.m` 文件，记样本点为 $(x_i,y_i), 1 \le i\le n$ ,分别使用线性回归和非线回归方法对所给指数函数进行拟合，函数类为，


$$
\begin{align*}
\phi(x \vert \alpha,\beta) = \alpha \beta^x
\end{align*}
$$


对数化后可以转变为线性回归模型，


$$
\begin{align*}
\log y  \approx \log \alpha + x \log \beta 
\end{align*}
$$


记 $z = \log y$,  则函数的参数可以通过最小二乘解的表达式求出，


$$
\begin{align*}
\hat \beta &= \exp \left(\frac{S_{xz}}{S_{xx}} \right) \\ 
\hat \alpha &= \exp(\bar z - x \log \hat \beta)\\
\text{Where }S_{xz} &= \sum_{i=1}^n (x_i - \bar x)(z_i -\bar z), S_{xx} = \sum_{i=1}^n (x_i -\bar x)^2
\end{align*}
$$


如果不进行对数化，采用Gauss-Newton法求解该非线性回归问题，设定参数矩阵为 $ \theta = [\alpha, \beta]^\top$, 给定样本 $(x_i,y_i)$ 后其对应的梯度为，




$$
\begin{align*}
\nabla \phi_i =
\begin{pmatrix}
\beta^{x_i} \\
\alpha x_i \beta^{x_i-1}
\end{pmatrix}
\end{align*}
$$

程序中选取初值为 $\alpha = 6,\beta = 1.3$ , 迭代格式为，


$$
\begin{align*}
\theta_{k+1} &= \theta_k + J_{\theta}^{\dagger} r_{\theta}
\end{align*}
$$



线性和非线性的回归方法结果对比如下，



![](code/img/exp-regression.png)



在数值实验中可以发现，非线性回归方法初值依赖问题严重，如果选取初值偏离最优解较远，拟合出的曲线也可能出现严重偏离的现象，因此在实际问题中入股可以进行线性化操作应该优先进行线性化操作而避免直接求解非线性回归问题。mei