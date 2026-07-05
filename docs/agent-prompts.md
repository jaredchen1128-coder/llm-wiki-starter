# Agent Prompts

Use these prompts with Cursor, Claude Code, Codex, or any coding/knowledge Agent that can read and edit local files.

## Ingest New Material

```text
我新增了资料，帮我扫描并入库。

请先读取 SCHEMA/agent.md、SCHEMA/knowledge-iteration-protocol.md 和 SCHEMA/knowledge-use-protocol.md。
然后扫描 RAW/INBOX，判断哪些资料需要进入 WIKI。
不要改写 RAW 原文。
整理完成后，请更新 WIKI/sources、相关主题/概念/问题/决策页、WIKI/ingest-register.md、WIKI/index.md 和 WIKI/log.md。
最后运行只读审计脚本并告诉我结果。
```

## Answer from the Knowledge Base

```text
基于我的知识库回答这个问题：……

请先读取 WIKI/index.md，再读取相关页面。
如果需要，请追溯到 RAW 来源。
回答后判断这个结论是否需要写回 WIKI。
如果有长期价值，请说明建议写回哪个页面。
```

## Query Writeback

```text
刚才这个回答有长期价值，请按 SCHEMA/knowledge-use-protocol.md 写回知识库。

请判断应该更新主题页、概念页、问题页还是决策页。
不要只新增摘要，要更新已有相关页面。
完成后更新 WIKI/log.md。
```

## Semantic Lint

```text
帮我做一次语义 Lint。

请按 SCHEMA/knowledge-use-protocol.md 检查：
1. 核心结论是否过时
2. 页面之间是否有观点冲突
3. 是否有重复概念
4. 相关页面链接是否真的有关系
5. 来源整理页是否影响了主题页或概念页
6. 待确认问题是否长期无人处理

请把结果写入 WIKI/reviews，并更新 WIKI/log.md。
```

## Structure Audit

```text
请运行只读结构审计：

bash SCHEMA/scripts/audit-knowledge-base.sh

然后解释每一类问题是什么意思，以及下一步应该怎么修。
```

## Create a Question Page

```text
这个问题值得长期跟踪，请基于 SCHEMA/templates/question.md 在 WIKI/questions 创建问题页：

问题：……

请写清当前判断、已知依据、相关页面关系说明、知识缺口和下一步。
```

## Create a Decision Record

```text
这次讨论会影响我的实际选择，请基于 SCHEMA/templates/decision.md 在 WIKI/decisions 创建决策记录。

请记录背景、选项、最终决策、理由、使用的知识库页面、风险与反对意见、复盘计划。
```

## Archive Outdated Knowledge

```text
请检查这个页面是否应该归档：[[页面名]]

如果应该归档，请按 SCHEMA/knowledge-iteration-protocol.md 和 SCHEMA/templates/archive.md 处理。
不要直接删除旧页面。
```

## Good Agent Behavior

Ask your Agent to follow these rules:

- Do not modify `RAW` unless explicitly asked.
- Do not add internal links without relationship notes.
- Do not create a new page when an existing page should be updated.
- Do not write unsupported claims as facts.
- Always update `WIKI/log.md` after meaningful changes.
- Prefer small, focused pages over large summary dumps.

