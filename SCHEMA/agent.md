# 知识库 Agent 规则

本文件定义 Agent 如何维护这个知识库。

## 目录职责

### RAW

`RAW` 是原始资料区。

- 不修改、不重写、不删除原始资料。
- 新资料优先放进 `RAW/INBOX/`。
- 资料可以是文章、PDF、网页剪藏、截图、会议记录、课程笔记、书摘或聊天记录。

### WIKI

`WIKI` 是知识沉淀区。

- 写入经过整理、归纳、交叉链接和更新后的 Markdown 页面。
- 页面应小而聚焦，一个页面围绕一个主题、概念、来源、问题、项目或决策。
- 新资料进入时，不只是新增摘要，还要更新已有页面。

### SCHEMA

`SCHEMA` 是规则区。

- `SCHEMA/agent.md` 是 Agent 总规则。
- `SCHEMA/knowledge-iteration-protocol.md` 定义知识迭代。
- `SCHEMA/knowledge-use-protocol.md` 定义 Query 回写、问题库、决策记录和语义 Lint。
- `SCHEMA/templates/` 保存页面模板。
- `SCHEMA/scripts/` 保存只读检查脚本。

## 基本原则

1. `RAW` 是事实来源，`WIKI` 是当前理解。
2. 原始资料不可变，沉淀内容可演化。
3. 每次整理都要让知识库更容易查询、复用和继续扩展。
4. 有长期价值的聊天结论应写回 `WIKI`。
5. 所有重要观点尽量能追溯到来源。

## WIKI 推荐结构

- `WIKI/index.md`：总索引。
- `WIKI/log.md`：操作日志。
- `WIKI/ingest-register.md`：资料入库台账。
- `WIKI/topics/`：主题页。
- `WIKI/concepts/`：概念页。
- `WIKI/sources/`：单篇来源整理页。
- `WIKI/questions/`：长期问题。
- `WIKI/projects/`：项目页。
- `WIKI/decisions/`：决策记录。
- `WIKI/reviews/`：周期复盘和语义 Lint。
- `WIKI/archive/`：归档页。

## 页面格式

页面建议包含 frontmatter：

```yaml
---
type: topic
tags: []
source_count: 0
created: YYYY-MM-DD
updated: YYYY-MM-DD
status: active
---
```

常用 `type`：

- `index`
- `log`
- `register`
- `source`
- `topic`
- `concept`
- `question`
- `project`
- `decision`
- `review`
- `archive`

## 链接规则

- 使用 Obsidian 兼容的 `[[页面名]]` 内部链接。
- `相关页面` 必须写成 `- [[页面名]]：关系说明`。
- 关系说明要解释为什么相关，以及点进去能补充理解什么。
- 如果无法写出关系说明，说明这个链接可能不必要。
- 新建页面后更新 `WIKI/index.md`。

## Ingest 工作流

当用户要求整理新资料时：

1. 读取 `SCHEMA/agent.md` 和 `SCHEMA/knowledge-iteration-protocol.md`。
2. 优先扫描 `RAW/INBOX/`，再扫描其他 `RAW` 文件。
3. 判断资料类型和是否值得入库。
4. 如果资料来自 `RAW/INBOX/` 且分类明确，可移动到最相关的 `RAW` 分类文件夹。
5. 创建或更新 `WIKI/sources/` 来源整理页。
6. 更新相关主题页、概念页、问题页或决策页。
7. 更新 `WIKI/ingest-register.md`。
8. 更新 `WIKI/index.md`。
9. 追加 `WIKI/log.md`。

## Query 工作流

当用户基于知识库提问时：

1. 读取 `SCHEMA/knowledge-use-protocol.md`。
2. 先读 `WIKI/index.md`。
3. 再读相关 WIKI 页面，必要时追溯到 `RAW`。
4. 回答后判断是否需要写回。
5. 如果问题有长期价值，更新主题页、概念页、问题页或决策页。

## Lint 工作流

结构 Lint：

```bash
bash SCHEMA/scripts/audit-knowledge-base.sh
```

语义 Lint：

- 检查核心结论是否过时。
- 检查页面之间是否冲突。
- 检查相关页面是否真的相关。
- 检查长期问题是否无人处理。
