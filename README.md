# runescape-bot

This repository includes Debian-based installation scripts for Old School RuneScape (OSRS), RuneScape 3 (RS3), and RuneMate Spectre.


## Prerequisites:

- Ubuntu 17.04 / 18.10
- Git (for convenience)

## Installation

`configure_vm.sh`: Optional script if deploying from a server. It sets up a VNC server
that you can access on port `5901`. This will need to be ran if deploying on a virtual
machine where you require remote access.

To begin installation, either clone this repository or download the ZIP file.  
```bash
git clone https://github.com/austin-millan/runescape-bot.git
cd runescape-bot
chmod +x setup.sh
sudo ./setup.sh
```

After some time, you will be prompted for input by the RuneMate installer. If all went well, Java, OSRS, RS3, RuneMate, all the relevant dependencies should be installed.

## Usage

After installation,
you should be able to launch each respective client with the following commands in your terminal:

```
bash$ oldschool
```

```
bash$ runescape
```

```
bash$ ./runemate.sh
```

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

## TODOs / Issues

- High CPU usage when running OSRS:
    - Possible Java options that may remedy the issue:
        - `-Xincgc`
        - Thread options (reduce/minimize)
        - `-Dsun.java2d.xrender='True'`
        - `-XX:CICompilerCount=2` (minimum)
        - `-Xms512m` (initial heap value)
        - `-Xmx512m` (maximum heap value... when the same as initial, reduces garbage collections)

## References
- [RuneMate Community Thread on Setting up RuneMate](https://www.runemate.com/community/threads/runemate-on-linux.15688/)
- [GitHub: RSU Client](https://github.com/rsu-client/rsu-client)
- [Linux game installation guide (OSRS)](https://oldschool.runescape.wiki/w/Linux_game_installation_guide#Desktop_Launcher)
