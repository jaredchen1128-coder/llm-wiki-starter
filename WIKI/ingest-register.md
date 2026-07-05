---
type: register
tags: [knowledge-base, ingest]
source_count: 0
created: YYYY-MM-DD
updated: YYYY-MM-DD
status: active
---

# 资料入库台账

这个台账记录 `RAW` 资料的处理状态，用来避免重复整理、漏整理或只写来源页但没有更新知识页面。

## 状态说明

- `pending`：已发现，尚未整理。
- `processed`：已进入 `WIKI`，并完成来源页、相关知识页、索引和日志更新。
- `skipped`：已判断不值得进入 `WIKI`，保留在 `RAW`。
- `review-needed`：已初步整理，但需要后续复盘或人工判断。

## 入库记录

| RAW 路径 | 状态 | 来源整理页 | 最近处理 | 说明 |
|---|---|---|---|---|

## 忽略规则

- `.DS_Store`、`Thumbs.db`、`README.md`、`README.zh-CN.md` 和 `.gitkeep` 不进入台账。
- 临时文件、重复导出文件和明显无知识价值文件可以标记为 `skipped`。
