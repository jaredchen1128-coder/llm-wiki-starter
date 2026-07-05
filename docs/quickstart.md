# Quickstart

This guide helps you start using the template in about 10 minutes.

## 1. Copy the Template

Create your own copy of this repository.

If you use GitHub:

1. Open the repository page.
2. Click **Use this template**.
3. Create a new private or public repository.
4. Clone it to your computer.

If you download a ZIP file, unzip it and open the folder locally.

## 2. Open the Folder

You can use any Markdown-friendly tool:

- Obsidian
- Cursor
- Claude Code
- Codex
- VS Code
- Any text editor

The important part is that your Agent can read and edit the local files.

## 3. Put New Material in RAW/INBOX

When you find a useful article, note, screenshot, transcript, blog post, or idea, put it into:

```text
RAW/INBOX/
```

Do not worry about perfect classification at capture time. The workflow is:

```text
capture first, organize later
```

## 4. Ask an Agent to Ingest It

Use this prompt:

```text
我新增了资料，帮我扫描并入库
```

Or in English:

```text
I added new material. Please scan and ingest it into the knowledge base.
```

The Agent should:

1. Read `SCHEMA/agent.md`.
2. Read the iteration and use protocols in `SCHEMA/`.
3. Scan `RAW/INBOX/`.
4. Create or update `WIKI/sources/`.
5. Update related topic, concept, question, or decision pages.
6. Update `WIKI/ingest-register.md`.
7. Update `WIKI/index.md`.
8. Append `WIKI/log.md`.

## 5. Ask Questions Against the Wiki

Use prompts like:

```text
基于我的知识库，帮我回答这个问题：……
```

The Agent should read `WIKI/index.md` first, then follow relevant pages and sources.

If the answer has long-term value, it should write the result back into `WIKI`.

## 6. Run a Read-Only Audit

From the project root:

```bash
bash SCHEMA/scripts/audit-knowledge-base.sh
```

The audit checks:

- RAW files not listed in `WIKI/ingest-register.md`
- RAW files not referenced from `WIKI`
- Source pages missing from `WIKI/index.md`
- WIKI pages missing `source_count`
- Related-page links without relationship notes

The script is read-only. It reports problems but does not modify files.

## 7. Keep the System Small at First

Do not automate everything immediately.

Start with:

- one inbox
- one index
- one log
- a few topics
- a few source pages

Add complexity only when the knowledge base starts to grow.

