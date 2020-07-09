#!/bin/bash

print_emphasis() {
	LSPCI_GREP_STRING=$1
	if [ "x$(lspci | grep -i ${LSPCI_GREP_STRING})" != "x" ]; then
		IFS=$'\n'
		for dev in $(lspci | grep -i ${LSPCI_GREP_STRING}); do
		  echo ${dev}
		  DEV_FN=$(echo ${dev} | cut -d " " -f 1)
		  echo ${DEV_FN}
		  sudo lspci -s ${DEV_FN} -vvv | grep -i emp -A 1
		done
		unset IFS
	fi
}

print_emphasis "VGA"
print_emphasis "Eth"
