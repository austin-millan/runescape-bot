#!/bin/sh
# runemate.sh
# RuneMate Argument List
# -sdk (starts the bot in developer mode)
# -login=username:password (auto logs you into the client)
# -autostart=OSRS|RS3|PID:ALIAS:INTERNAL_ID|PUBLISHED_BOT_NAME) (auto starts a bot from command line)
# -world="301" (selects a world to auto-login to)
# -decorated (toggles game rendering for OSRS)

# metadata script path
# Run `source utils/gcloud/get_metadata.sh` to fetch RUNEMATE_USER and RUNEMATE_PASSWORD.

DEFAULT_WORLD=301
DEFAULT_CLIENT="OSRS"
if [ -z "$RUNEMATE_USERNAME" ]; then
    echo "You can set your username in 'runemate.sh', or by using the command: 'export RUNEMATE_USERNAME=youremail'"
    RUNEMATE_USER="changeme"
fi
if [ -z "$RUNEMATE_PASSWORD" ]; then
    echo "You can set your username in 'runemate.sh', or by using the command: 'export RUNEMATE_USERNAME=yourpassword'"
    RUNEMATE_PASSWORD="changeme"
fi
if [ -z "$RS_INSTANCE_COUNT" ]; then
    RS_INSTANCE_COUNT="1"
fi

echo "($RUNEMATE_USERNAME) logging into RuneMate... ($RS_INSTANCE_COUNT instances)"
if [ $RS_INSTANCE_COUNT = 0 ];then
    echo "Using 1 instance..."
    oldschool_func &
    java -jar "RuneMate.jar" -login=$RUNEMATE_USERNAME:$RUNEMATE_PASSWORD -world=$DEFAULT_WORLD
elif [ $RS_INSTANCE_COUNT = 2 ];then
    oldschool_func & oldschool_func &
    java -jar "RuneMate.jar" -login=$RUNEMATE_USERNAME:$RUNEMATE_PASSWORD -autostart="17243:account1:GE Walker" -world=$DEFAULT_WORLD & java -jar "RuneMate.jar" -login=$RUNEMATE_USERNAME:$RUNEMATE_PASSWORD -autostart="17243:account1:GE Walker" -world=$DEFAULT_WORLD &
fi

