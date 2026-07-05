# LLM Wiki / AI Knowledge Base Starter

Languages: [English](README.md) | [中文](README.zh-CN.md)

A Markdown-first starter template for building an AI-assisted personal knowledge base.

It turns the Karpathy-style LLM Wiki idea into a practical folder structure that works with Obsidian, Cursor, Claude Code, Codex, VS Code, or any local-file-aware Agent.

- `RAW` keeps original source material.
- `WIKI` stores distilled and connected knowledge.
- `SCHEMA` defines the rules, templates, and audit scripts your Agent should follow.

This is intentionally not fully automated in v1. The recommended workflow is: collect first, then ask an Agent to ingest and update the Wiki.

## Quickstart

1. Copy this repository.
2. Put articles, screenshots, web clippings, notes, transcripts, or ideas into `RAW/INBOX/`.
3. Ask your Agent:

```text
I added new material. Please scan and ingest it into the knowledge base.
```

4. The Agent should read `SCHEMA/agent.md`, `SCHEMA/knowledge-iteration-protocol.md`, and `SCHEMA/knowledge-use-protocol.md`, then update `WIKI`.
5. Run the read-only audit regularly:

```bash
bash SCHEMA/scripts/audit-knowledge-base.sh
```

See [Quickstart](docs/quickstart.md) for the full setup guide.

See [Agent Prompts](docs/agent-prompts.md) for reusable prompts.

## Folder Structure

```text
RAW/
  INBOX/                temporary capture inbox
SCHEMA/
  agent.md             main Agent rules
  knowledge-iteration-protocol.md
  knowledge-use-protocol.md
  templates/           page templates
  scripts/             read-only audit script
WIKI/
  index.md             knowledge base index
  ingest-register.md   RAW processing register
  log.md               operation log
  topics/              topic pages
  concepts/            concept pages
  sources/             source distillation pages
  questions/           long-running questions
  decisions/           decision records
  reviews/             reviews and semantic lint results
  archive/             archived knowledge
examples/
  fictional/           fictional example, not real personal data
```

## Core Principles

- Capture first, organize later.
- Keep `RAW` unchanged; let `WIKI` evolve.
- Use `SCHEMA` to make Agent behavior explicit and repeatable.
- Do not only summarize new material; update existing topics, concepts, questions, or decisions.
- Every related-page link must explain why it is related.
- After a useful answer, decide whether it should be written back into `WIKI`.
- Start with read-only automation before allowing write actions.

## Recommended Workflows

### Ingest

When new material arrives:

1. Register it in `WIKI/ingest-register.md`.
2. If it has long-term value, create a source page in `WIKI/sources/`.
3. Update related topic, concept, question, or decision pages.
4. Update `WIKI/index.md` and `WIKI/log.md`.

### Query

When asking questions:

1. Start from `WIKI/index.md`.
2. Read relevant Wiki pages, and trace back to `RAW` when needed.
3. Answer from the current Wiki understanding.
4. Decide whether the answer should be written back.

### Lint

Run the structural audit:

```bash
bash SCHEMA/scripts/audit-knowledge-base.sh
```

Use semantic lint to check:

- whether core conclusions are outdated
- whether pages contradict each other
- whether related-page links are truly useful
- whether long-running questions are unresolved

## Examples

`examples/fictional/` contains a fictional mini example showing how source pages, concept pages, and related-page notes can be written.

The example is not real personal knowledge.

## Before Publishing Your Own Version

Before publishing your own version to GitHub, run a structure audit and search for private keywords.

```bash
bash SCHEMA/scripts/audit-knowledge-base.sh
rg -n "your-name|private-email|private-path|private-project" .
```

Replace the keywords above with your own name, email, local paths, company names, client names, or private project names.

Only publish a sanitized template. Do not open-source your personal `RAW` materials directly.

## License

MIT

