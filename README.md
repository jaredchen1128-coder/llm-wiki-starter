# LLM Wiki / AI Knowledge Base Starter

一个面向普通知识工作者的个人知识库模板。它把 Karpathy 风格的 LLM Wiki 思路落成一个可复制的 Markdown/Obsidian 目录：

- `RAW` 保存原始资料。
- `WIKI` 保存整理后的知识。
- `SCHEMA` 保存 Agent 需要遵守的规则、模板和检查脚本。

第一版不追求全自动。推荐方式是：先用 `RAW/INBOX` 收集资料，再让 Agent 按 `SCHEMA` 规则整理入库。

## 快速开始

1. 复制这个仓库。
2. 把文章、截图、网页剪藏、笔记等放进 `RAW/INBOX/`。
3. 对你的 Agent 说：

```text
我新增了资料，帮我扫描并入库
```

4. Agent 应读取 `SCHEMA/agent.md`、`SCHEMA/knowledge-iteration-protocol.md` 和 `SCHEMA/knowledge-use-protocol.md`，再更新 `WIKI`。
5. 定期运行只读检查：

```bash
bash SCHEMA/scripts/audit-knowledge-base.sh
```

更多步骤见 [Quickstart](docs/quickstart.md)。

常用 Agent 触发语见 [Agent Prompts](docs/agent-prompts.md)。

## 目录结构

```text
RAW/
  INBOX/                临时收集入口
SCHEMA/
  agent.md             Agent 总规则
  knowledge-iteration-protocol.md
  knowledge-use-protocol.md
  templates/           页面模板
  scripts/             只读检查脚本
WIKI/
  index.md             知识库索引
  ingest-register.md   RAW 资料处理台账
  log.md               操作日志
  topics/              主题页
  concepts/            概念页
  sources/             来源整理页
  questions/           长期问题
  decisions/           决策记录
  reviews/             周期复盘和语义 Lint
  archive/             归档内容
examples/
  fictional/           虚构示例，不是你的真实知识
```

## 核心原则

- 收藏时不要急着分类，先放 `RAW/INBOX`。
- `RAW` 不改写，`WIKI` 可迭代，`SCHEMA` 定规则。
- 新资料进入时，不只写摘要，还要更新已有主题、概念、问题或决策。
- `相关页面` 必须写关系说明，不要只放裸链接。
- Query 后要判断是否回写，避免知识库只收藏不用。
- 自动化先做只读检查，再逐步考虑写入动作。

## 推荐工作流

### Ingest

新资料进入后：

1. 登记到 `WIKI/ingest-register.md`。
2. 如果有长期价值，创建 `WIKI/sources/` 来源整理页。
3. 更新相关主题页、概念页、问题页或决策页。
4. 更新 `WIKI/index.md` 和 `WIKI/log.md`。

### Query

提问时：

1. 先读 `WIKI/index.md`。
2. 再读相关 WIKI 页面，必要时追溯到 `RAW`。
3. 回答后判断是否需要写回。

### Lint

结构检查：

```bash
bash SCHEMA/scripts/audit-knowledge-base.sh
```

语义检查：

- 核心结论是否过时。
- 页面之间是否冲突。
- 相关页面是否真的相关。
- 长期问题是否无人处理。

## 示例

`examples/fictional/` 里有一个虚构示例，用来展示来源页、概念页和主题页的写法。不要把示例当成真实资料。

## 开源说明

这个模板不包含任何真实个人资料或第三方平台原文。你可以基于它建立自己的个人知识库，也可以继续改造成 Codex/Claude/其他 Agent 的 Skill。

## 发布前检查

如果你要把自己的版本发布到 GitHub，建议先运行：

```bash
bash SCHEMA/scripts/audit-knowledge-base.sh
rg -n "替换成你自己的隐私关键词" .
```

只发布脱敏后的模板，不要把自己的 `RAW` 原始资料直接开源。
