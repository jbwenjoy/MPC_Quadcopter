# MPC Quadcopter
基于Matlab MPC Toolbox的简易四旋翼无人机模型 (In Progress)

一个简单的练手小项目（MATLAB版本：2022b）

顺便计划将之前适用于另一型无人机的、基于PID的控制器整合进来

---

2023-Feb-28

---

把原来的12个输出量改为4个（位置xyz和偏航yaw），因为轨迹通常只需要这几个量

目前可以以大约6m/s的速度跟踪圆圈轨迹

![屏幕截图_20230227_215849](https://user-images.githubusercontent.com/71893666/221734470-75dfc473-668a-49a3-a0ee-dac02ca09cd8.png)

但仍存在较大的稳态误差，尤其是高度

---

2023-Feb-18

---

虽然解决了一些bug，程序基本能跑了，但问题还很多，比如模型线性化以及MPC参数。

目前仅采用了MATLAB自带的模型线性化器，问题是当系统状态改变较大时这种近似效果不好。
下一步计划采用反馈线性化(Feedback Linearization)。

MPC设计还比较naive，需要继续学习一个。。。
