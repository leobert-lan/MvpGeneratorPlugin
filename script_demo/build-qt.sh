#!/usr/bin/env bash
set -e

# ==============================
# 配置
# ==============================
QT_SPEC=win32-msvc
QT_BIN="D:/ide/Qt/6.4.0/msvc2019_64/bin"
QT_EXE="XXX.exe"
VCVARS="D:/ide/VS/VC/Auxiliary/Build/vcvars64.bat"
ROOTDIR="$(cd "$(dirname "$0")"; pwd)"
PROJECT="$ROOTDIR/XXX.pro"

# 参数检查
if [ $# -eq 0 ]; then
  echo "用法: $0 [Debug|Release|RunDebug|RunRelease]"
  exit 1
fi

MODE="$1"
BUILDDIR="$ROOTDIR/build/Desktop_Qt_6_4_0_MSVC2019_64bit-$MODE"

# 调 MSVC 环境变量（抓 PATH）
VCENV=$(cmd.exe /c "call \"${VCVARS}\" x64 && set")
export PATH="$QT_BIN:$(echo "$VCENV" | grep '^PATH=' | cut -d= -f2- | tr -d '\r')"

case "$MODE" in
  Debug|Release)
    mkdir -p "$BUILDDIR/release"
    cd "$BUILDDIR"
    echo "====== qmake + nmake ======"
    qmake "$PROJECT" -r -spec $QT_SPEC CONFIG+=$MODE
    nmake -nologo -f Makefile.$MODE
    ;;
  RunDebug)
    MODE=Debug
    EXE_PATH="$BUILDDIR/$MODE/$QT_EXE"
    if [ ! -f "$EXE_PATH" ]; then
      echo "错误: 未找到 $EXE_PATH"
      exit 1
    fi
    echo "====== 运行 $EXE_PATH ======"
    "$EXE_PATH"
    ;;
  RunRelease)
    MODE=Release
    EXE_PATH="$BUILDDIR/$MODE/$QT_EXE"
    if [ ! -f "$EXE_PATH" ]; then
      echo "错误: 未找到 $EXE_PATH"
      exit 1
    fi
    echo "====== 运行 $EXE_PATH ======"
    "$EXE_PATH"
    ;;
  *)
    echo "参数错误: $MODE"
    exit 1
    ;;
esac
