# OpenCode Browser Validation Skill

An OpenCode skill for validating frontend changes with
[agent-browser](https://github.com/vercel-labs/agent-browser) and
[Playwright CLI](https://github.com/microsoft/playwright-cli). It supplies a
repeatable browser-validation workflow for UI behavior, responsive layout,
accessibility, console errors, and frontend network failures.

## Architecture

The skill pairs two installed browser-automation CLIs:

- **agent-browser:** fast everyday browser control with compact output, plus
  goal-driven `chat` mode for genuinely exploratory segments.
- **playwright-cli:** deep inspection and evidence — traces, video, console,
  network, storage, mocking, recording.
- **Verification:** chat output is discovery; verify material outcomes with
  deterministic commands from either tool.

Use deterministic commands by default. Reach for `chat` only when the route is
unknown or the path is inherently ambiguous—not for a single failed selector.

## Repository layout

```text
.
├── SKILL.md             # Installable OpenCode skill
├── README.md            # Installation and usage
├── docs/
│   └── DESIGN.md        # Rationale and implementation notes
└── scripts/
    └── install.sh       # Global installer
```

## Prerequisites

- Git
- Node.js 18 or newer
- OpenCode
- Both CLIs:

  ```sh
  npm install -g @playwright/cli@latest
  npm install -g agent-browser
  agent-browser install   # downloads its Chrome build
  ```

The first browser runs may download browser builds. Approve those downloads
when prompted. The skill itself does not install packages.
`playwright-cli install --skills` is intentionally not part of this setup: it
installs Playwright's generic skill into the current project, while this
repository already provides the OpenCode workflow skill.

agent-browser's `chat` mode additionally requires `AI_GATEWAY_API_KEY`. Its
deterministic commands work without any credentials.

## Install globally (recommended)

Clone this repository somewhere durable, then run its installer from the
repository root:

```sh
git clone <repository-url> ~/src/opencode-browser-skill
cd ~/src/opencode-browser-skill
./scripts/install.sh
```

The installer copies the skill to:

```text
~/.config/opencode/skills/browser-validation/SKILL.md
```

The repository remains the tracked source of truth. This installer uses a real
copy because the current OpenCode global skill loader does not reliably discover
symbolic links. Quit and restart OpenCode after installing or changing the
skill.

### Verify installation

After restarting OpenCode, request a frontend validation task or explicitly
ask the agent to use `browser-validation`. It should appear in OpenCode's
available skills and load `SKILL.md` on demand.

## Update the global installation

Pull changes in this repository, then replace the installed copy:

```sh
git pull
./scripts/install.sh --force
```

`--force` only replaces the exact global skill directory. Inspect that directory
first if it may contain local changes.

## Install for one project

To make the skill available only inside a project, copy it into that project's
OpenCode skill directory:

```sh
mkdir -p /path/to/project/.opencode/skills
mkdir -p /path/to/project/.opencode/skills/browser-validation
cp "$(pwd)/SKILL.md" /path/to/project/.opencode/skills/browser-validation/SKILL.md
```

Run the command from this repository root. Restart OpenCode from the target
project after installation.

## Update and uninstall

For the global copy:

```sh
git pull
./scripts/install.sh --force
```

Then restart OpenCode. To uninstall:

```sh
rm -r ~/.config/opencode/skills/browser-validation
```

Remove the project-local skill directory instead when using project-local installation.

## Development

`SKILL.md` is the distributable artifact. Keep its YAML frontmatter valid:

- `name` must match the containing directory name, `browser-validation`.
- `description` must describe both what the skill does and when it applies.

Do not add generated Playwright screenshots, snapshots, traces, or browser
state to the repository. They are ignored by `.gitignore`.

## References

- [OpenCode skills documentation](https://opencode.ai/docs/skills/)
- [Playwright CLI](https://github.com/microsoft/playwright-cli)
- [Playwright MCP](https://github.com/microsoft/playwright-mcp)

The installation approach follows the standard OpenCode convention: a skill is
a directory containing `SKILL.md`, installed globally in
`~/.config/opencode/skills/<skill-name>/` or locally in
`.opencode/skills/<skill-name>/`.
