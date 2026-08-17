#!/usr/bin/env bash
# w8g 自研热更新引擎安装脚本（别人机器一条命令装好引擎）
#
# 用法：
#   bash install_engine.sh                    # 从默认地址下载
#   ENGINE_URL=... bash install_engine.sh     # 指定引擎包下载地址
#
# 安装位置：~/.w8g/engine/（w8g CLI 自动识别该路径）
set -euo pipefail

ENGINE_URL="${ENGINE_URL:-https://47.116.123.225/engine/w8g_engine_mini.tar.gz}"
TARGET="${HOME}/.w8g/engine"
TMP="$(mktemp -d)"

echo "==> 下载引擎包（约 384MB）..."
curl -fSL --progress-bar -o "${TMP}/engine.tar.gz" "${ENGINE_URL}"

echo "==> 解压到 ${TARGET}"
mkdir -p "${TARGET}"
tar -xzf "${TMP}/engine.tar.gz" -C "${TARGET}" --strip-components=1 engine_mini 2>/dev/null \
  || tar -xzf "${TMP}/engine.tar.gz" -C "${TARGET}"
rm -rf "${TMP}"

# 结构校验：w8g 需要 <src>/out/android_release_arm64 与 host_release
if [ ! -d "${TARGET}/out/android_release_arm64" ] && [ ! -d "${TARGET}/engine_mini/out/android_release_arm64" ]; then
  echo "❌ 引擎解压结构不正确，请检查引擎包"
  exit 1
fi
echo
echo "✅ 引擎安装完成：${TARGET}"
echo "   w8g release/patch 将自动使用该引擎（找不到时用 W8G_ENGINE_SRC 指定）"
