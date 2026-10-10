# My Rime Config

个人自用的 Rime 输入法配置，适用于 **Fcitx5 + Rime** 和 **Trime（同文输入法）**。

整理了一些常用输入方案，并添加了泰语释义提示功能。希望能给有相同需求的人提供一个可以直接使用、也方便自行修改的配置。

## 输入方案

仓库目前包含以下输入方案及相关配置：

| 方案 | 说明 |
|---|---|
| `wubi_pinyin` | 五笔拼音混合输入方案 |
| `wubi86` | 五笔 86 版输入方案 |
| `pinyin_simp` | 简拼输入方案 |
| `sawcuenghmoq` | 壮语相关输入方案 |

此外，仓库还包含 Rime 的默认配置、OpenCC 转换数据，以及 Trime 使用的配置文件。

## 特色功能

### 泰语释义提示

通过 Lua 过滤器，为部分输入候选添加泰语释义提示。

相关文件：

- `lua/thai_hint.lua`：泰语提示过滤器。
- `lua/thai_hint.tsv`：中文词条与泰语释义对应表。

在支持该 Lua 过滤器的 Rime 环境中，启用相关配置后，输入中文时即可在候选词旁查看对应的泰语释义。

**注意：** 泰语释义属于辅助参考，不保证每个词条都符合具体语境。该功能依赖 Lua 支持；如果当前 Rime 环境不支持 Lua，相关过滤器可能无法使用。

### Trime 配置

仓库包含以下 Trime 相关文件：

- `trime.yaml`
- `trime.custom.yaml`
- `tongwenfeng.trime.yaml`

可用于配置 Trime 的输入法界面及相关行为。不同设备上的字体、布局和输入体验可能有所区别。

## 兼容性测试

目前已进行以下环境的测试：

- **Fcitx5 + Rime**：已测试。
- **Trime（同文输入法）**：已测试。

不同平台、不同版本的 Rime 引擎对 Lua、输入方案及配置项的支持可能存在差异，建议部署后实际验证。

## 安装与使用

### Linux：Fcitx5 + Rime

1. 安装 Fcitx5 和 Rime。
2. 将本仓库中的配置文件复制到 Fcitx5 Rime 用户目录：

   ```text
   ~/.local/share/fcitx5/rime/
   ```

3. 重新部署 Rime。
4. 在输入法中选择需要使用的方案。

Arch Linux 用户可以安装：

```bash
sudo pacman -S fcitx5 fcitx5-rime
```

如果已经在使用 Fcitx5 + Rime，可以将配置合并到现有用户目录。建议先备份原有配置，避免覆盖个人设置。

### Android：Trime

1. 安装 Trime（同文输入法）。
2. 将所需配置文件及相关词典、Lua 文件复制到 Trime 使用的 Rime 用户目录。
3. 根据实际使用的输入方案调整配置。
4. 重新部署并测试。

Trime 的数据目录因安装方式和版本而异，请以当前应用实际使用的用户目录为准。不要直接覆盖整个目录，以免丢失已有配置或用户词典。

## 项目结构

```text
.
├── lua/
│   ├── thai_hint.lua
│   └── thai_hint.tsv
├── opencc/
├── default.custom.yaml
├── pinyin_simp.dict.yaml
├── pinyin_simp.schema.yaml
├── sawcuenghmoq.dict.yaml
├── sawcuenghmoq.schema.yaml
├── wubi86.dict.yaml
├── wubi86.schema.yaml
├── wubi_pinyin.custom.yaml
├── wubi_pinyin.schema.yaml
├── trime.yaml
├── trime.custom.yaml
├── tongwenfeng.trime.yaml
└── user.yaml
```

仓库中的文件以实际版本为准；部分输入方案还可能依赖 Rime 已安装的其他基础词典或组件。

## 说明

- 本项目是个人配置备份与分享项目，不是独立的输入法引擎。
- 输入法引擎、基础词典及其他运行时依赖需要根据平台另行安装。
- 用户词典数据库、同步副本及部分运行时状态不包含在仓库中。
- 如果某项功能在你的设备上无法使用，欢迎提交问题并附上操作系统、输入法版本和部署日志。

## 使用许可

本仓库包含个人配置、脚本和词典数据。使用或再分发前，请确认相关第三方词典及数据文件各自的授权要求。

个人配置可根据自己的需求修改使用。
