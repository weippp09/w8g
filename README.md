# w8g

Flutter 热更新 CLI —— Android + iOS 双端增量更新，秒级生效。

## 安装（Homebrew）

```bash
brew tap weippp09/homebrew-w8g
brew install w8g
```

或者直接使用 Formula：

```bash
brew install https://raw.githubusercontent.com/weippp09/homebrew-w8g/main/Formula/w8g.rb
```

> 未发布前可在源码目录直接运行：
> ```bash
> dart pub get
> dart run bin/w8g.dart --help
> ```

## 快速开始

在 Flutter 项目目录中初始化：

```bash
cd /path/to/your-flutter-app
w8g init
```

交互式填写（或参数直填）：

```bash
w8g init --app-id my_app --environment prod
```

生成的 `w8g.yaml`：

```yaml
app_id: my_app
environment: prod   # test | uat | prod
```

**只需配置 app_id 与环境** —— 版本号自动读取项目 `pubspec.yaml` 的 `version` 字段，平台地址、渠道等运行参数由 CLI 自动处理，无需配置。

## 命令

| 命令 | 说明 |
| --- | --- |
| `w8g init` | 初始化 w8g.yaml（app_id + 环境 test/uat/prod） |
| `w8g version` | 显示版本号 |
| `w8g login` / `w8g release` / `w8g patch` | 即将支持（发布首包与双端补丁） |

## 适配环境

- Flutter **3.38.4**
- macOS arm64（darwin-arm64）二进制

## 支持

- 问题反馈：GitHub Issues
- 接入文档：完善中
