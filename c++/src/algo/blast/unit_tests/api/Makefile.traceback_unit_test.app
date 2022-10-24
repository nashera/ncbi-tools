# $Id: Makefile.traceback_unit_test.app 634439 2021-07-12 14:42:44Z ucko $

APP = traceback_unit_test
SRC = traceback_unit_test 

CPPFLAGS = -DNCBI_MODULE=BLAST $(ORIG_CPPFLAGS) $(BOOST_INCLUDE)  $(OPENMP_FLAGS) -I$(srcdir)/../../api
LIB = blast_unit_test_util test_boost $(BLAST_LIBS) xobjsimple $(OBJMGR_LIBS:ncbi_x%=ncbi_x%$(DLL)) 
LIBS = $(GENBANK_THIRD_PARTY_LIBS) $(BLAST_THIRD_PARTY_LIBS) $(NETWORK_LIBS) $(CMPRS_LIBS) $(DL_LIBS) $(ORIG_LIBS)
LDFLAGS = $(FAST_LDFLAGS) $(OPENMP_FLAGS) 

CHECK_REQUIRES = MT in-house-resources
CHECK_CMD = traceback_unit_test
CHECK_COPY = traceback_unit_test.ini data

WATCHERS = boratyng madden camacho fongah2
