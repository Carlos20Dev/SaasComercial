# Design Notes

This skill is a thin OpenCode layer over a two-tool browser-automation model:
agent-browser for fast control and bounded exploration, and Playwright CLI for
deep inspection and durable evidence. It favors explicit, inspectable commands
and saved artifacts for proof.

## Decision summary

- **agent-browser:** a first-class layer — fast deterministic commands for
  everyday browser control, plus goal-driven `chat` mode for bounded
  exploratory work.
- **playwright-cli / MCP:** deep inspection and durable evidence — traces,
  video, console, network, storage, mocking, recording.
- **Default evidence:** accessibility snapshots, screenshots, console output,
  relevant network requests, and traces for intermittent failures.
- **Default session:** a unique, non-persistent session per validation run.
- **Escalation rule:** use `chat` only for intrinsic uncertainty; reproduce
  material discoveries with deterministic commands.

The structure and installation method follow OpenCode's conventional skill
layout: a directory named after the skill containing a `SKILL.md`. The
repository is the tracked source of truth; the installer copies `SKILL.md` to
the global skill directory because the current global loader does not reliably
discover symbolic links.

The hybrid model is informed by "Agent Browser vs Playwright CLI: AI Browser
Control" (bytetunnels.com/posts/agent-browser-vs-playwright-cli-ai-browser-control/),
which recommends deterministic browser commands by default with agent-browser
frameworks reserved for genuinely exploratory tasks.
