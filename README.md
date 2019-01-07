# runescape-bot

## Prerequisites:

- Ubuntu 17.04 / 18.10

## Installation

Currently this is a mix of command-line
and graphical interface configuration.

```bash
chmod +x setup.sh
sudo ./setup.sh
```

After you have installed everything using the `setup.sh` file,
you should be able to launch RSU launcher by typing 

```$ runescape```
in your terminal. Similarly you can launch RuneMate by using 

```$ RuneMate```




## Usage

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
