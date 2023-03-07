# MPC Quadcopter
基于Matlab MPC Toolbox的简易四旋翼无人机模型

一个简单的练手小项目（MATLAB版本：2022b）

---

## 2023-Mar-7

更新了MPC权重，添加了新的可视化模块（需要在MATLAB中安装3dscope），移除了废弃的工程文件

可以飞一个稍微复杂些的8字

![image](https://user-images.githubusercontent.com/71893666/223416003-44f12782-4abf-411c-95dc-69de66f95615.png)

![image](https://user-images.githubusercontent.com/71893666/223416487-a65492b0-9c10-4158-b87a-25cc04617708.png)

---

## 2023-Feb-28

把原来的12个输出量改为4个（位置xyz和偏航yaw），因为轨迹通常只需要这几个量

目前可以以大约6m/s的速度跟踪圆圈轨迹，下图中的轨迹为一位于$z=0$平面、半径$r=10m$的圆

![屏幕截图_20230227_215849](https://user-images.githubusercontent.com/71893666/221734470-75dfc473-668a-49a3-a0ee-dac02ca09cd8.png)

位移

![image](https://user-images.githubusercontent.com/71893666/221735408-42035e65-6157-42cb-9c7f-e2369f0e3d9d.png)

速度

![image](https://user-images.githubusercontent.com/71893666/221735458-a3076e59-5d39-4442-be44-658248d24c5a.png)

姿态欧拉角

![image](https://user-images.githubusercontent.com/71893666/221825953-47d9515f-ac29-4fac-9b9f-35d98bf9b532.png)

桨转速

![image](https://user-images.githubusercontent.com/71893666/221735575-256d7918-e711-44dc-bba3-aa162c20d7ad.png)

目前的问题：

参数几乎没怎么调，特别是高度上存在较大的稳态误差，同时第一圈的跟踪性能很差

---

## 2023-Feb-18

虽然解决了一些bug，程序基本能跑了，但问题还很多，比如模型线性化以及MPC参数。

目前仅采用了MATLAB自带的模型线性化器，问题是当系统状态改变较大时这种近似效果不好。
下一步计划采用反馈线性化(Feedback Linearization)。

MPC设计还比较naive，需要继续学习一个。。。
