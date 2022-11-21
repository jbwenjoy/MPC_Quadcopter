# MPC Quadcopter
基于MPC控制器的简易四旋翼无人机模型

一个简单的练手小项目

顺便做一个基于PID的控制器

## 四旋翼数学建模

太多资料了不解释

$$\begin{bmatrix} \ddot{x} \\ \ddot{y} \\ \ddot{z} \end{bmatrix}=\frac{1}{m}\begin{bmatrix} (cos\phi sin\theta cos\psi +sin\phi sin\psi)\sum_1^4(-F_i) \\
 (cos\phi sin\theta sin\psi-sin\phi cos\psi)\sum_1^4(-F_i) \\
 mg+cos\phi cos\theta \sum_1^4(-F_i) \end{bmatrix}+\frac{1}{m}\begin{bmatrix} A_x & & \\
 & A_y & \\
 & & A_z \end{bmatrix}\begin{bmatrix}\dot{x}\\
\dot{y}\\
\dot{z}\end{bmatrix}$$

$$\begin{bmatrix} \dot{\phi} \\ \dot{\theta} \\ \dot{\psi} \end{bmatrix}^e=\begin{bmatrix} 1 & tan\theta sin\phi & tan\theta cos\phi \\ 0 & cos\phi & -sin\phi \\ 0 & \frac{sin\phi}{cos\theta} & \frac{cos\phi}{cos\theta} \end{bmatrix}\begin{bmatrix} p \\ q \\ r \end{bmatrix}^b$$

$$\begin{bmatrix} \dot{p} \\ \dot{q} \\ \dot{r} \end{bmatrix}=\begin{bmatrix} (I_{yy}-I_{zz})qr/I_{xx} \\
(I_{zz}-I_{xx})pr/I_{yy} \\
(I_{xx}-I_{yy})pq/I_{zz}
\end{bmatrix}-I_r\begin{bmatrix} q/I_{xx} \\
-p/I_{yy} \\
0 \end{bmatrix}\omega_{\Gamma}+\begin{bmatrix}\tau_{\phi}/I_{xx} \\
\tau_{\theta}/I_{yy}\\
\tau_{\psi}/I_{zz}\end{bmatrix}$$
