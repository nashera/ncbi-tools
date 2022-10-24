# $Id: Makefile.subj_ranges_unit_test.app 634439 2021-07-12 14:42:44Z ucko $

APP = subj_ranges_unit_test
SRC = subj_ranges_unit_test 

CPPFLAGS = -DNCBI_MODULE=BLAST $(ORIG_CPPFLAGS) $(BOOST_INCLUDE)
LIB = test_boost $(BLAST_LIBS) xobjsimple $(OBJMGR_LIBS:ncbi_x%=ncbi_x%$(DLL)) 
LIBS = $(BLAST_THIRD_PARTY_LIBS) $(NETWORK_LIBS) $(CMPRS_LIBS) $(DL_LIBS) $(ORIG_LIBS)
LDFLAGS = $(FAST_LDFLAGS)

CHECK_REQUIRES = MT in-house-resources
CHECK_CMD = subj_ranges_unit_test
CHECK_COPY = subj_ranges_unit_test.ini

WATCHERS = boratyng madden camacho fongah2 
