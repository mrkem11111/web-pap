# @desc makefile for World
# @author viticm<viticm.ti@gmail.com>
# @date 2013-06-25 20:00:12
include ../../premake.mk

CFLAGS  = -I$(BASEDIR)/World/Main -I$(BASEDIR)/World/Packets -I$(BASEDIR)/World/WorldData -I$(BASEDIR)/World $(SERVER_BASE_INCLUDES) -I$(BASEDIR)/Server/SMU
LDFLAGS =
DIRS =  
OBJS =  PlayerPool.o \
		WorldTable.o \
		World.o \
		PlayerManager.o \
		ShareMemManager.o \
		ServerPlayer.o \
		ServerManager.o \
		Player.o

debug:$(OBJS)
	for dir in $(DIRS); do \
		$(MAKE) debug -C $$dir; \
	done

release:$(OBJS)
	for dir in $(DIRS); do \
		$(MAKE) release -C $$dir; \
	done

all:debug

clean:
	$(RM) -f *.o
