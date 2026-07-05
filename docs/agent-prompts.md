# Agent Prompts

Languages: [English](agent-prompts.md) | [中文](agent-prompts.zh-CN.md)

Use these prompts with Cursor, Claude Code, Codex, or any coding/knowledge Agent that can read and edit local files.

## Ingest New Material

```text
I added new material. Please scan and ingest it into the knowledge base.

First read SCHEMA/agent.md, SCHEMA/knowledge-iteration-protocol.md, and SCHEMA/knowledge-use-protocol.md.
Then scan RAW/INBOX and decide which materials should enter WIKI.
Do not rewrite or modify RAW source files.
After ingestion, update WIKI/sources, related topic/concept/question/decision pages, WIKI/ingest-register.md, WIKI/index.md, and WIKI/log.md.
Finally, run the read-only audit script and report the result.
```

## Answer from the Knowledge Base

```text
Answer this question based on my knowledge base: ...

Start from WIKI/index.md, then read the relevant pages.
If needed, trace the answer back to RAW sources.
After answering, decide whether the conclusion should be written back into WIKI.
If it has long-term value, suggest which page should be updated.
```

## Query Writeback

```text
The previous answer has long-term value. Please write it back into the knowledge base according to SCHEMA/knowledge-use-protocol.md.

Decide whether to update a topic page, concept page, question page, or decision page.
Do not only add a summary. Update existing related pages when appropriate.
After making changes, update WIKI/log.md.
```

## Semantic Lint

```text
Please run a semantic lint pass.

Follow SCHEMA/knowledge-use-protocol.md and check:
1. whether core conclusions are outdated
2. whether pages contradict each other
3. whether there are duplicate concepts
4. whether related-page links are truly useful
5. whether source pages actually influenced topic or concept pages
6. whether long-running questions remain unresolved

Write the result into WIKI/reviews and update WIKI/log.md.
```

## Structure Audit

```text
Please run the read-only structural audit:

bash SCHEMA/scripts/audit-knowledge-base.sh

Then explain what each reported issue means and what should be fixed next.
```

## Create a Question Page

```text
This question is worth tracking long-term. Please create a question page in WIKI/questions based on SCHEMA/templates/question.md.

Question: ...

Include the current judgment, known evidence, related pages with relationship notes, knowledge gaps, and next steps.
```

## Create a Decision Record

```text
This discussion affects a real decision. Please create a decision record in WIKI/decisions based on SCHEMA/templates/decision.md.

Record the background, options, final decision, reasoning, knowledge base pages used, risks, objections, and review plan.
```

## Archive Outdated Knowledge

```text
Please check whether this page should be archived: [[Page Name]]

If it should be archived, follow SCHEMA/knowledge-iteration-protocol.md and SCHEMA/templates/archive.md.
Do not directly delete the old page.
```

## Good Agent Behavior

Ask your Agent to follow these rules:

- Do not modify `RAW` unless explicitly asked.
- Do not add internal links without relationship notes.
- Do not create a new page when an existing page should be updated.
- Do not write unsupported claims as facts.
- Always update `WIKI/log.md` after meaningful changes.
- Prefer small, focused pages over large summary dumps.

