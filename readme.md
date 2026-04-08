Simple Alias for adding an AI as a co-author to your commit.

Currently supported:
- ChatGPT
- Claude
- Cursor

## How to use

Run `gitca claude` and it will amend the last commit from the current directory with the given AI co-author.

## Linux / macOS

Add the alias to your shell profile (`~/.bashrc`, `~/.zshrc`, etc.):

```bash
alias gitca='/yourpath/Gitca/gitca.sh'
```

Then reload your profile and run:

```bash
gitca claude
```

## Windows

Add `gitca.bat` to a folder that is on your `PATH` (e.g. `C:\tools\`), or add its folder to the `PATH` environment variable:

1. Copy `gitca.bat` to a directory in your `PATH` (or add its directory to `PATH` via System Properties → Environment Variables).
2. Open a Command Prompt in your repository and run:

```bat
gitca claude
```
