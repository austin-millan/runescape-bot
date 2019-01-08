# runescape-bot

This repository includes Debian-based installation scripts for Old School RuneScape (OSRS), RuneScape 3 (RS3), and RuneMate Spectre.


## Prerequisites:

- Ubuntu 17.04 / 18.10
- Git (for convenience)

## Installation

Currently this is a mix of command-line and graphical user interface configuration. Only RuneMate should require user interaction.

To begin installation, either clone this repository or download the ZIP file.  
```bash
git clone https://github.com/austin-millan/runescape-bot.git
cd runescape-bot
chmod +x setup.sh
sudo ./setup.sh
```

After some time, you will be prompted for input by the RuneMate installer. If all went well, OSRS, RS3, RuneMate, all the relevant dependencies should be installed.

## Usage

After installation,
you should be able to launch each respective client with the following commands in your terminal:

```botter@bash$ oldschool```
```botter@bash$ runescape```
```botter@bash$ RuneMate```

### `accounts.csv`

This CSV file is for importing bulk-accounts into RuneMate. This import most be done via the GUI in RuneMate.

### `run.sh`

This file includes the RuneMate invocation and example arguments supplied to the RuneMate program. 

Here's a list of arguments that can be supplied to `RuneMate`.
```
-sdk (starts the bot in developer mode)
-login=username:password (auto logs you into the client)
-autostart=OSRS|RS3|PID:ALIAS:INTERNAL_ID|PUBLISHED_BOT_NAME) (auto starts a bot from command line)
-world="301" (selects a world to auto-login to)
-decorated (toggles game rendering for OSRS)
```

## References
- [RuneMate Community Thread on Setting up RuneMate](https://www.runemate.com/community/threads/runemate-on-linux.15688/)
- [GitHub: RSU Client](https://github.com/rsu-client/rsu-client)
- [Linux game installation guide (OSRS)](https://oldschool.runescape.wiki/w/Linux_game_installation_guide#Desktop_Launcher)
