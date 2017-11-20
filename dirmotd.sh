#!/usr/bin/env bash

cwdStore='/tmp/.cwd'

function get_working_dir() {
	pwd
}

function read_cwdStore() {
	cat "${cwdStore}"
}

function create_cwdStore() {
	touch "${cwdStore}"
}

function update_cwdStore() {
	echo "${1}" > "${cwdStore}"
}

function previous_dir() {
	if [ -f "${cwdStore}" ]; then
		read_cwdStore
	else
		create_cwdStore
		read_cwdStore
	fi
}

function read_motd() {
  if [ -f 'test_file' ]; then
    cat test_file
  fi
}

if [ "$(get_working_dir)" == "$(previous_dir)" ]; then
	exit 0
else
	update_cwdStore "$(get_working_dir)"
	read_motd
fi
