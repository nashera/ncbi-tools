# $Id: Makefile.optionshandle_unit_test.app 634439 2021-07-12 14:42:44Z ucko $

APP = optionshandle_unit_test
SRC = optionshandle_unit_test 

CPPFLAGS = -DNCBI_MODULE=BLAST $(ORIG_CPPFLAGS) $(BOOST_INCLUDE)
LIB = test_boost $(BLAST_LIBS) xobjsimple $(OBJMGR_LIBS:ncbi_x%=ncbi_x%$(DLL))
LIBS = $(NETWORK_LIBS) $(CMPRS_LIBS) $(DL_LIBS) $(BLAST_THIRD_PARTY_LIBS) $(ORIG_LIBS)
LDFLAGS = $(FAST_LDFLAGS)

CHECK_REQUIRES = MT in-house-resources
CHECK_CMD = optionshandle_unit_test
CHECK_COPY = optionshandle_unit_test.ini

WATCHERS = boratyng madden camacho fongah2