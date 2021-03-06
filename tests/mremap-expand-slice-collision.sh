#!/bin/bash

. wrapper-utils.sh

# mremap-expand-slice-collision is known broken before 2.6.33
compare_kvers `uname -r` "2.6.33"
if [ $? -eq 1 ]; then
	echo "FAIL (assumed) kernel bug"
	exit $RC_FAIL
else
	EXP_RC=$RC_PASS
	exec_and_check $EXP_RC mremap-expand-slice-collision "$@"
fi

