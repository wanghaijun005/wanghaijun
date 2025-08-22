# 篮球比赛积分计分程序

一个基于Python和PyQt5开发的篮球比赛积分计分程序，支持实时比分统计、球员数据管理、比赛记录等功能。

## 功能特点

- 🏀 实时比分显示和更新
- 👥 球员数据统计（得分、篮板、助攻等）
- ⏰ 比赛计时器功能
- 📊 比赛记录导出
- 🎯 图形化用户界面

## 技术栈

- **Python 3.9+**
- **PyQt5** - GUI框架
- **openpyxl** - Excel文件处理

## 安装依赖

```bash
pip install PyQt5 openpyxl
```

## 运行程序

```bash
python basketball_JF.py
```

## 项目结构

```
basketball-jifen/
├── basketball_JF.py    # 主程序文件
└── README.md          # 项目说明
```

## 使用说明

1. 启动程序后，界面分为左右两个面板
2. 左侧显示比赛信息和队伍得分
3. 右侧提供计时器和球员管理功能
4. 支持导入赛程表和球员信息
5. 可以导出比赛数据到CSV文件

## 开发说明

本项目使用面向对象编程设计，主要类包括：
- `BasketballScoreboard` - 主窗口类
- `FoulDialog` - 犯规类型选择对话框

## 许可证

MIT License
