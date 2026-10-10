# Fcitx5 Rime 配置恢复说明

## 1. 安装基础环境（Arch Linux）

sudo pacman -S fcitx5 fcitx5-rime

## 2. 恢复配置

将本仓库中的配置文件复制到：

~/.local/share/fcitx5/rime/

## 3. 检查配置

确认以下文件存在：

- wubi_pinyin.custom.yaml
- wubi_pinyin.schema.yaml
- lua/thai_hint.lua
- lua/thai_hint.tsv

## 4. 重新部署

使用 Fcitx5 的 Rime 部署功能重新部署配置。
部署完成后，检查输入方案及泰语提示是否正常。

## 注意

本仓库不包含 Rime 的运行环境，也不包含被排除的用户词典数据库。
