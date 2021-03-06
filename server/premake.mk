
BASEDIR = /home/dc/develop/pap/server
UNIX_ODBC_INCLUDES = -I/usr/local/unixODBC/include
UNIX_ODBC_LIBS = -I/usr/local/unixODBC/lib
MYSQL_INCLUDES = -I/usr/local/mysql/include
MYSQL_CLIENT_LIBS = -L/usr/local/mysql/lib

release: VFLAGS = -O2 -Wall -DRELEASE -DNDEBUG -D_FILE_OFFSET_BITS=32
debug:   VFLAGS = -g -Wall -DDEBUG -D_FILE_OFFSET_BITS=32

COMMON_INCLUDES           = -I$(BASEDIR)/Common \
                            -I$(BASEDIR)/Common/Combat \
                            -I$(BASEDIR)/Common/DataBase \
                            -I$(BASEDIR)/Common/DBSystem \
                            -I$(BASEDIR)/Common/DBSystem/DataBase \
                            -I$(BASEDIR)/Common/Net \
                            -I$(BASEDIR)/Common/Packets \
                            -I$(BASEDIR)/Common/Util

SERVER_BASE_INCLUDES      = -I$(BASEDIR)/Server/Base

BILLING_INCLUDES          = -I$(BASEDIR)/Billing \
                            -I$(BASEDIR)/Billing/Main \
                            -I$(BASEDIR)/Billing/Packets

LOGIN_INCLUDES            = -I$(BASEDIR)/Login \
                            -I$(BASEDIR)/Login/DB \
                            -I$(BASEDIR)/Login/Main \
                            -I$(BASEDIR)/Login/Packets \
                            -I$(BASEDIR)/Login/Player \
                            -I$(BASEDIR)/Login/Process

SERVER_INCLUDES           = -I$(BASEDIR)/Server \
                            -I$(BASEDIR)/Server/Ability \
                            -I$(BASEDIR)/Server/ActionModule \
                            -I$(BASEDIR)/Server/AI \
                            -I$(BASEDIR)/Server/Base \
                            -I$(BASEDIR)/Server/DB \
                            -I$(BASEDIR)/Server/EventModule \
                            -I$(BASEDIR)/Server/Item \
                            -I$(BASEDIR)/Server/Main \
                            -I$(BASEDIR)/Server/MenPai \
                            -I$(BASEDIR)/Server/Mission \
                            -I$(BASEDIR)/Server/Obj \
                            -I$(BASEDIR)/Server/Other \
                            -I$(BASEDIR)/Server/Packets \
                            -I$(BASEDIR)/Server/Player \
                            -I$(BASEDIR)/Server/Scene \
                            -I$(BASEDIR)/Server/Script \
                            -I$(BASEDIR)/Server/Skills \
                            -I$(BASEDIR)/Server/SMU \
                            -I$(BASEDIR)/Server/Team

SHARE_MEMORY_INCLUDES     = -I$(BASEDIR)/ShareMemory \
                            -I$(BASEDIR)/ShareMemory/DB \
                            -I$(BASEDIR)/ShareMemory/Main \
                            -I$(BASEDIR)/ShareMemory/ShareData


WORLD_INCLUDES            = -I$(BASEDIR)/World \
                            -I$(BASEDIR)/World/Main \
                            -I$(BASEDIR)/World/Packets \
                            -I$(BASEDIR)/World/WorldData

COMMON_LDS                = -L$(BASEDIR)/Common \
                            -L$(BASEDIR)/Common/Combat \
                            -L$(BASEDIR)/Common/DataBase \
                            -L$(BASEDIR)/Common/DBSystem \
                            -L$(BASEDIR)/Common/Net \
                            -L$(BASEDIR)/Common/Packets

SERVER_BASE_LDS           = -L$(BASEDIR)/Server/Base

OTHER_LDS                 = -lpthread -lodbc

LUA_LDS                   = -lm -llua

MYSQL_CLIENT_LDS          = $(MYSQL_CLIENT_LIBS) -lmysqlclient

GCFLAGS                   = $(COMMON_INCLUDES) $(UNIX_ODBC_INCLUDES) 

release:GLDFLAGS = $(COMMON_LDS) $(OTHER_LDS)
debug:GLDFLAGS = $(COMMON_LDS) $(OTHER_LDS)

ARFLAGS = -sr
AR      = ar
CC      = gcc
CXX     = g++
CPP     = g++
RM      = rm

%.o:%.c
	$(CC) $(VFLAGS) $(GCFLAGS) $(CFLAGS) -c $< -o $@

%.o:%.cpp
	$(CPP) $(VFLAGS) $(GCFLAGS) $(CFLAGS) -c $< -o $@

