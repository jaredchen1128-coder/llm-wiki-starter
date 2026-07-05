# 快速开始

语言：[English](quickstart.md) | [中文](quickstart.zh-CN.md)

这个指南帮助你在大约 10 分钟内开始使用这个模板。

## 1. 复制模板

创建这个仓库的副本。

如果你使用 GitHub：

1. 打开仓库页面。
2. 点击 **Use this template**。
3. 创建一个新的私有或公开仓库。
4. 克隆到你的电脑。

如果你下载 ZIP 文件，解压后在本地打开文件夹即可。

## 2. 打开文件夹

你可以使用任何支持 Markdown 的工具：

- Obsidian
- Cursor
- Claude Code
- Codex
- VS Code
- 任意文本编辑器

关键是你的 Agent 能够读取和编辑本地文件。

## 3. 把新资料放进 RAW/INBOX

当你发现有价值的文章、笔记、截图、转录稿、博客或想法时，先放进：

```text
RAW/INBOX/
```

不用在收藏时追求完美分类。推荐流程是：

```text
先收集，再整理
```

## 4. 让 Agent 入库

使用这个提示词：

```text
我新增了资料，帮我扫描并入库
```

Agent 应该：

1. 读取 `SCHEMA/agent.md`。
2. 读取 `SCHEMA/` 下的迭代协议和使用协议。
3. 扫描 `RAW/INBOX/`。
4. 创建或更新 `WIKI/sources/`。
5. 更新相关主题页、概念页、问题页或决策页。
6. 更新 `WIKI/ingest-register.md`。
7. 更新 `WIKI/index.md`。
8. 追加 `WIKI/log.md`。

## 5. 基于 WIKI 提问

使用类似提示：

```text
基于我的知识库回答这个问题：……
```

Agent 应先读取 `WIKI/index.md`，再沿着相关页面和来源回答。

如果答案有长期价值，应写回 `WIKI`。

## 6. 运行只读审计

在项目根目录运行：

```bash
bash SCHEMA/scripts/audit-knowledge-base.sh
```

审计会检查：

- 没有登记到 `WIKI/ingest-register.md` 的 RAW 文件
- 没有被 `WIKI` 引用的 RAW 文件
- 没有写入 `WIKI/index.md` 的来源页
- 缺少 `source_count` 的 WIKI 页面
- 没有关系说明的相关页面链接

这个脚本是只读的。它只报告问题，不会修改文件。

## 7. 一开始保持简单

不要立刻自动化所有事情。

先从这些开始：

- 一个 inbox
- 一个 index
- 一个 log
- 少量主题页
- 少量来源页

等知识库增长后，再逐步增加复杂度。

