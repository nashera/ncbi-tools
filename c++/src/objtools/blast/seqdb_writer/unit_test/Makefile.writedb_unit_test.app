# $Id: Makefile.writedb_unit_test.app 607944 2020-05-08 20:59:23Z ucko $

APP = writedb_unit_test
SRC = writedb_unit_test criteria_unit_test

CPPFLAGS = -DNCBI_MODULE=BLASTDB $(ORIG_CPPFLAGS) $(BOOST_INCLUDE) \
           $(BLAST_THIRD_PARTY_INCLUDE) 
CXXFLAGS = $(FAST_CXXFLAGS)
LDFLAGS = $(FAST_LDFLAGS)

LIB_ = test_boost writedb seqdb $(OBJREAD_LIBS) xobjutil blastdb \
       $(SOBJMGR_LIBS) 
LIB = $(LIB_:%=%$(STATIC)) $(LMDB_LIB)
LIBS = $(BLAST_THIRD_PARTY_LIBS) $(CMPRS_LIBS) $(NETWORK_LIBS) $(DL_LIBS) $(ORIG_LIBS)

CHECK_REQUIRES = in-house-resources
CHECK_CMD = writedb_unit_test
CHECK_COPY = writedb_unit_test.ini data

WATCHERS = madden camacho fongah2 boratyng
