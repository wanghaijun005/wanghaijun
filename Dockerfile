# 使用Python官方镜像作为基础镜像
FROM python:3.9-slim

# 设置工作目录
WORKDIR /app

# 安装系统依赖（包括PyQt5和GUI相关的依赖）
RUN apt-get update && apt-get install -y --no-install-recommends \
    libgl1 \
    libglib2.0-0 \
    libxcb1 \
    libxext6 \
    libx11-6 \
    libxkbcommon-x11-0 \
    libxrender1 \
    libxi6 \
    libdbus-1-3 \
    libfontconfig1 \
    libfreetype6 \
    libxcb-icccm4 \
    libxcb-image0 \
    libxcb-keysyms1 \
    libxcb-randr0 \
    libxcb-render-util0 \
    libxcb-shape0 \
    libxcb-sync1 \
    libxcb-xfixes0 \
    libxcb-xinerama0 \
    libxcb-xinput0 \
    libxcb-xkb1 \
    fonts-wqy-microhei \
    && rm -rf /var/lib/apt/lists/*

# 复制项目文件
COPY basketball_JF.py .
COPY requirements.txt .

# 安装Python依赖
RUN pip install --no-cache-dir -r requirements.txt

# 设置环境变量（避免PyQt5的某些警告）
ENV QT_DEBUG_PLUGINS=0
ENV QT_QPA_PLATFORM=xcb
ENV DISPLAY=:0

# 设置入口点
ENTRYPOINT ["python", "basketball_JF.py"]
