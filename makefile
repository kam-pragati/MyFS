username = $(shell whoami)
files = fsmain.c fsoperations.c fstree.c
opflag = -o fs
flags = `pkg-config fuse --cflags --libs` -DFUSE_USE_VERSION=22

all: run

run: compile
	./fs -f /home/$(username)/Desktop/mountpoint

debugrun: dcompile
	./fs -d -f -s /home/$(username)/Desktop/mountpoint

compile: checkdir
	gcc -Wall $(files) $(opflag) $(flags)

dcompile: checkdir	
	gcc -Wall -g $(files) $(opflag) $(flags)

checkdir:
	if [ -d "/home/$(username)/Desktop/mountpoint" ]; then echo "mountpoint exists"; else mkdir /home/$(username)/Desktop/mountpoint; fi