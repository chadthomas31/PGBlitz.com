#!/bin/bash
#
# Title:      PlexGuide (Reference Title File)
# Author(s):  Admin9705
# URL:        https://plexguide.com - http://github.plexguide.com
# GNU:        General Public License v3.0
################################################################################

# BAD INPUT
badinput () {
echo
read -p '⛔️ ERROR - BAD INPUT! | PRESS [ENTER] ' typed < /dev/tty
question1
}

# FUNCTION - ONE
question1 () {

# Recall Program
image=$(cat /tmp/program_var)

# Checks Image List
file="/opt/plexguide/containers/image/$image"
if [ ! -e "$file" ]; then exit; fi

tee <<-EOF

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🌵  PG - Multi Image Selector
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

EOF

count=1
while read p; do
  echo "$count - $p"
  echo "$p" > /tmp/display$count
  count=$[count+1]
done </opt/plexguide/containers/image/$image
echo ""
read -p '🚀  Type Number | PRESS [ENTER]: ' typed < /dev/tty
#cat /tmp/display$typed

  if [[ "$typed" -ge "1" && "$typed" -le "$count" ]]; then echo GOOD;
else badinput; fi
}

# END OF FUNCTIONS ############################################################

question1
