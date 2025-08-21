# 篮球比赛积分计分程序 - 部署指南

## 项目概述
这是一个基于PyQt5的篮球比赛积分计分程序，支持比赛计时、得分记录、球员数据统计、赛程管理等功能。

## Docker 部署

### 1. 构建Docker镜像
```bash
docker build -t basketball-scoreboard .
```

### 2. 运行容器（需要X11服务器支持）
```bash
# 允许本地X11服务器接受连接
xhost +local:

# 运行容器
docker run -it \
  -e DISPLAY=$DISPLAY \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v $(pwd)/data:/app/data \
  basketball-scoreboard
```

### 3. 使用docker-compose（推荐）
```bash
# 允许X11连接
xhost +local:

# 启动服务
docker-compose up
```

## 云部署注意事项

### 对于无图形界面的云服务器：
1. **使用虚拟显示服务器**：安装Xvfb（虚拟帧缓冲区）
2. **修改Dockerfile**：添加Xvfb安装和启动脚本
3. **使用VNC**：设置VNC服务器来远程访问GUI

### 修改Dockerfile支持无头模式：
```dockerfile
# 安装Xvfb
RUN apt-get update && apt-get install -y xvfb

# 修改启动脚本
CMD ["xvfb-run", "-a", "python", "basketball_JF.py"]
```

### 使用VNC的替代方案：
1. 在容器中安装VNC服务器
2. 暴露VNC端口（通常是5900）
3. 使用VNC客户端连接

## 环境要求
- Docker 20.10+
- Docker Compose 1.29+
- X11服务器（本地运行）
- 或 Xvfb（无头服务器）

## 文件结构
```
.
├── basketball_JF.py      # 主程序文件
├── Dockerfile           # Docker构建配置
├── docker-compose.yml   # Docker Compose配置
├── requirements.txt     # Python依赖
└── data/               # 数据目录（挂载卷）
```

## 故障排除

### 常见问题：
1. **X11连接错误**：确保运行 `xhost +local:` 允许Docker连接
2. **权限问题**：检查X11 socket文件的权限
3. **依赖缺失**：确保所有系统依赖已正确安装

### 调试命令：
```bash
# 检查容器日志
docker logs basketball-scoreboard

# 进入容器调试
docker exec -it basketball-scoreboard bash

# 测试GUI功能
docker run -it --rm basketball-scoreboard python -c "from PyQt5.QtWidgets import QApplication; app = QApplication([]); print('PyQt5 works')"
```

## 生产环境部署建议
1. 使用更轻量的基础镜像（如alpine）
2. 设置资源限制（CPU、内存）
3. 配置健康检查
4. 使用容器编排平台（Kubernetes）
5. 设置持久化存储

## 技术支持
如有部署问题，请检查：
- Docker和Docker Compose版本
- 系统依赖是否完整
- X11服务器配置
- 网络和防火墙设置
