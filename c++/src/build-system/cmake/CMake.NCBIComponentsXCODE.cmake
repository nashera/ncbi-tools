#############################################################################
# $Id: CMake.NCBIComponentsXCODE.cmake 644712 2022-02-01 19:29:16Z ivanov $
#############################################################################

##
## NCBI CMake components description - XCODE
##
##
## As a result, the following variables should be defined for component XXX
##  NCBI_COMPONENT_XXX_FOUND
##  NCBI_COMPONENT_XXX_INCLUDE
##  NCBI_COMPONENT_XXX_DEFINES
##  NCBI_COMPONENT_XXX_LIBS
##  HAVE_LIBXXX
##  HAVE_XXX


if(XCODE)
    set(NCBI_REQUIRE_XCODE_FOUND YES)
    list(APPEND NCBI_ALL_REQUIRES XCODE)
endif()

#to debug
#set(NCBI_TRACE_COMPONENT_JPEG ON)

#############################################################################
# common settings
set(NCBI_OPT_ROOT  /opt/X11)

############################################################################
# prebuilt libraries

set(NCBI_ThirdParty_BACKWARD   ${NCBI_TOOLS_ROOT}/backward-cpp-1.3.20180206-44ae960 CACHE PATH "BACKWARD root")
set(NCBI_ThirdParty_LMDB       ${NCBI_TOOLS_ROOT}/lmdb-0.9.18 CACHE PATH "LMDB root")
set(NCBI_ThirdParty_LZO        ${NCBI_TOOLS_ROOT}/lzo-2.05 CACHE PATH "LZO root")
set(NCBI_ThirdParty_SQLITE3    ${NCBI_TOOLS_ROOT}/sqlite-3.26.0-ncbi1 CACHE PATH "SQLITE2 root")
set(NCBI_ThirdParty_Boost      ${NCBI_TOOLS_ROOT}/boost-1.76.0-ncbi1 CACHE PATH "Boost root")
set(NCBI_ThirdParty_BerkeleyDB ${NCBI_TOOLS_ROOT}/BerkeleyDB CACHE PATH "BerkeleyDB root")
set(NCBI_ThirdParty_FASTCGI    ${NCBI_TOOLS_ROOT}/fcgi-2.4.0 CACHE PATH "FASTCGI root")
set(NCBI_ThirdParty_FASTCGI_SHLIB ${NCBI_ThirdParty_FASTCGI})
set(NCBI_ThirdParty_PYTHON_version  2.7)
set(NCBI_ThirdParty_PYTHON     "/System/Library/Frameworks/Python.framework/Versions/${NCBI_ThirdParty_PYTHON_version}" CACHE PATH "PYTHON root")
#set(NCBI_ThirdParty_PYTHON     "/Applications/Xcode.app/Contents/Developer/Library/Frameworks/Python3.framework/Versions/3.8" CACHE PATH "PYTHON root")
#set(NCBI_ThirdParty_VDB        "/Volumes/trace_software/vdb/vdb-versions/2.11.2")
set(NCBI_ThirdParty_VDB        "/net/snowman/vol/projects/trace_software/vdb/vdb-versions/2.11.2" CACHE PATH "VDB root")
set(NCBI_ThirdParty_VDB_ARCH x86_64)
#set(NCBI_ThirdParty_XML        ${NCBI_TOOLS_ROOT}/libxml-2.7.8 CACHE PATH "XML root")
#set(NCBI_ThirdParty_XSLT       ${NCBI_TOOLS_ROOT}/libxml-2.7.8 CACHE PATH "XSLT root")
#set(NCBI_ThirdParty_EXSLT      ${NCBI_ThirdParty_XSLT})
set(NCBI_ThirdParty_FTGL      ${NCBI_TOOLS_ROOT}/ftgl-2.1.3-rc5 CACHE PATH "FTGL root")
set(NCBI_ThirdParty_GLEW      ${NCBI_TOOLS_ROOT}/glew-1.5.8 CACHE PATH "GLEW root")
set(NCBI_ThirdParty_GRPC      ${NCBI_TOOLS_ROOT}/grpc-1.36.4-ncbi1 CACHE PATH "GRPC root")
set(NCBI_ThirdParty_Boring    ${NCBI_ThirdParty_GRPC})
set(NCBI_ThirdParty_PROTOBUF  ${NCBI_TOOLS_ROOT}/grpc-1.36.4-ncbi1 CACHE PATH "PROTOBUF root")
set(NCBI_ThirdParty_wxWidgets ${NCBI_TOOLS_ROOT}/wxWidgets-3.1.4-ncbi2 CACHE PATH "wxWidgets root")
set(NCBI_ThirdParty_UV        ${NCBI_TOOLS_ROOT}/libuv-1.35.0 CACHE PATH "UV root")
set(NCBI_ThirdParty_NGHTTP2   ${NCBI_TOOLS_ROOT}/nghttp2-1.40.0 CACHE PATH "NGHTTP2 root")
set(NCBI_ThirdParty_GL2PS     ${NCBI_TOOLS_ROOT}/gl2ps-1.4.0 CACHE PATH "GL2PS root")
set(NCBI_ThirdParty_GMP       ${NCBI_TOOLS_ROOT}/gmp-6.0.0a CACHE PATH "GMP root")
set(NCBI_ThirdParty_NETTLE    ${NCBI_TOOLS_ROOT}/nettle-3.1.1 CACHE PATH "NETTLE root")
set(NCBI_ThirdParty_GNUTLS     ${NCBI_TOOLS_ROOT}/gnutls-3.4.0 CACHE PATH "GNUTLS root")

#############################################################################
#############################################################################

set(FOUNDATION_LIBS "-framework foundation")
set(COREFOUNDATION_LIBS "-framework CoreFoundation")

#############################################################################
# in-house-resources
set(NCBI_REQUIRE_in-house-resources_FOUND NO)
if (NCBI_COMPONENT_in-house-resources_DISABLED)
    message("DISABLED in-house-resources")
else()
    if (EXISTS "${NCBI_TOOLS_ROOT}/.ncbirc")
      if (EXISTS "/am/ncbiapdata/test_data")
        set(NCBITEST_TESTDATA_PATH "/am/ncbiapdata/test_data")
        set(NCBI_REQUIRE_in-house-resources_FOUND YES)
        list(APPEND NCBI_ALL_REQUIRES in-house-resources)
      elseif (EXISTS "/Volumes/ncbiapdata/test_data")
        set(NCBITEST_TESTDATA_PATH "/Volumes/ncbiapdata/test_data")
        set(NCBI_REQUIRE_in-house-resources_FOUND YES)
        list(APPEND NCBI_ALL_REQUIRES in-house-resources)
      endif()
    endif()
endif()

#############################################################################
# NCBI_C
if(NOT NCBI_COMPONENT_NCBI_C_DISABLED)
    set(NCBI_C_ROOT "${NCBI_TOOLS_ROOT}/c++.by-date/production/20220108/C_TOOLKIT")

    get_directory_property(_foo_defs COMPILE_DEFINITIONS)
    if("${_foo_defs}" MATCHES NCBI_INT4_GI)
        set(NCBI_CTOOLKIT_PATH "${NCBI_C_ROOT}")
    else()
        if (EXISTS "${NCBI_C_ROOT}/ncbi.gi64")
            set(NCBI_CTOOLKIT_PATH "${NCBI_C_ROOT}/ncbi.gi64")
        elseif (EXISTS "${NCBI_C_ROOT}.gi64")
            set(NCBI_CTOOLKIT_PATH "${NCBI_C_ROOT}.gi64")
        else ()
            set(NCBI_CTOOLKIT_PATH "${NCBI_C_ROOT}")
        endif ()
    endif()

    if(EXISTS "${NCBI_CTOOLKIT_PATH}/include64" AND EXISTS "${NCBI_CTOOLKIT_PATH}/lib64")
        set(NCBI_C_INCLUDE  "${NCBI_CTOOLKIT_PATH}/include64")
        if ("${CMAKE_BUILD_TYPE}" STREQUAL "Debug")
            set(NCBI_C_LIBPATH  "${NCBI_CTOOLKIT_PATH}/altlib64")
        else()
            set(NCBI_C_LIBPATH  "${NCBI_CTOOLKIT_PATH}/lib64")
        endif()

        set(NCBI_C_ncbi     "ncbi")
        if (APPLE)
            set(NCBI_C_ncbi ${NCBI_C_ncbi} -Wl,-framework,AppKit)
        endif ()
        set(HAVE_NCBI_C YES)
    else()
        set(HAVE_NCBI_C NO)
    endif()

    if(HAVE_NCBI_C)
        message("NCBI_C found at ${NCBI_C_INCLUDE}")
        set(NCBI_COMPONENT_NCBI_C_FOUND YES)
        set(NCBI_COMPONENT_NCBI_C_INCLUDE ${NCBI_C_INCLUDE})
        set(_c_libs  ncbiobj ncbimmdb ${NCBI_C_ncbi})
        set(NCBI_COMPONENT_NCBI_C_LIBS -L${NCBI_C_LIBPATH} ${_c_libs})
        set(NCBI_COMPONENT_NCBI_C_DEFINES HAVE_NCBI_C=1)
        set(NCBI_COMPONENT_NCBI_C_LIBPATH ${NCBI_C_LIBPATH})
        list(APPEND NCBI_ALL_COMPONENTS NCBI_C)
        list(APPEND NCBI_ALL_LEGACY C-Toolkit)
        set(NCBI_COMPONENT_C-Toolkit_FOUND NCBI_C)
    else()
        set(NCBI_COMPONENT_NCBI_C_FOUND NO)
        message("NOT FOUND NCBI_C")
    endif()
else()
    set(NCBI_COMPONENT_NCBI_C_FOUND NO)
    message("DISABLED NCBI_C")
endif()


#############################################################################
# BACKWARD, UNWIND
NCBI_define_Xcomponent(NAME BACKWARD)
list(REMOVE_ITEM NCBI_ALL_COMPONENTS BACKWARD)
if(NCBI_COMPONENT_BACKWARD_FOUND)
    set(HAVE_LIBBACKWARD_CPP YES)
    if(NOT NCBI_PTBCFG_USECONAN AND NOT NCBI_PTBCFG_PACKAGING AND NOT NCBI_PTBCFG_PACKAGED)
        find_library(LIBDW_LIBS NAMES dw)
        if (LIBDW_LIBS)
            set(HAVE_LIBDW 1)
            set(NCBI_COMPONENT_BACKWARD_LIBS ${NCBI_COMPONENT_BACKWARD_LIBS} ${LIBDW_LIBS})
        endif()
    endif()
endif()

#############################################################################
# Kerberos 5
set(KRB5_LIBS "-framework Kerberos" -liconv)
list(APPEND NCBI_ALL_COMPONENTS KRB5)

##############################################################################
# CURL
NCBI_define_Xcomponent(NAME CURL MODULE libcurl PACKAGE CURL LIB curl)

#############################################################################
#LMDB
NCBI_define_Xcomponent(NAME LMDB LIB lmdb)
if(NOT NCBI_COMPONENT_LMDB_FOUND)
    set(NCBI_COMPONENT_LMDB_FOUND ${NCBI_COMPONENT_LocalLMDB_FOUND})
    set(NCBI_COMPONENT_LMDB_INCLUDE ${NCBI_COMPONENT_LocalLMDB_INCLUDE})
    set(NCBI_COMPONENT_LMDB_NCBILIB ${NCBI_COMPONENT_LocalLMDB_NCBILIB})
    set(HAVE_LIBLMDB ${NCBI_COMPONENT_LMDB_FOUND})
endif()

#############################################################################
# PCRE
#NCBI_define_Xcomponent(NAME PCRE MODULE libpcre LIB pcre)
set(NCBI_COMPONENT_PCRE_FOUND NO)
if(NOT NCBI_COMPONENT_PCRE_FOUND)
    set(NCBI_COMPONENT_PCRE_FOUND ${NCBI_COMPONENT_LocalPCRE_FOUND})
    set(NCBI_COMPONENT_PCRE_INCLUDE ${NCBI_COMPONENT_LocalPCRE_INCLUDE})
    set(NCBI_COMPONENT_PCRE_NCBILIB ${NCBI_COMPONENT_LocalPCRE_NCBILIB})
    set(HAVE_LIBPCRE ${NCBI_COMPONENT_PCRE_FOUND})
    list(APPEND NCBI_ALL_COMPONENTS PCRE)
endif()

#############################################################################
# Z
set(NCBI_COMPONENT_LocalZ_FOUND NO)
list(REMOVE_ITEM NCBI_ALL_REQUIRES LocalZ)

NCBI_define_Xcomponent(NAME Z MODULE zlib PACKAGE ZLIB LIB z)
if(NOT NCBI_COMPONENT_Z_FOUND)
    set(NCBI_COMPONENT_Z_FOUND ${NCBI_COMPONENT_LocalZ_FOUND})
    set(NCBI_COMPONENT_Z_INCLUDE ${NCBI_COMPONENT_LocalZ_INCLUDE})
    set(NCBI_COMPONENT_Z_NCBILIB ${NCBI_COMPONENT_LocalZ_NCBILIB})
    set(HAVE_LIBZ ${NCBI_COMPONENT_Z_FOUND})
endif()

#############################################################################
#BZ2
set(NCBI_COMPONENT_LocalBZ2_FOUND NO)
list(REMOVE_ITEM NCBI_ALL_REQUIRES LocalBZ2)

NCBI_define_Xcomponent(NAME BZ2 PACKAGE BZip2 LIB bz2)
if(NOT NCBI_COMPONENT_BZ2_FOUND)
    set(NCBI_COMPONENT_BZ2_FOUND ${NCBI_COMPONENT_LocalBZ2_FOUND})
    set(NCBI_COMPONENT_BZ2_INCLUDE ${NCBI_COMPONENT_LocalBZ2_INCLUDE})
    set(NCBI_COMPONENT_BZ2_NCBILIB ${NCBI_COMPONENT_LocalBZ2_NCBILIB})
    set(HAVE_LIBBZ2 ${NCBI_COMPONENT_BZ2_FOUND})
endif()

#############################################################################
# LZO
NCBI_define_Xcomponent(NAME LZO LIB lzo2)

#############################################################################
# Boost.Test.Included
if(NOT NCBI_COMPONENT_Boost_DISABLED AND NOT NCBI_COMPONENT_Boost_FOUND)
    if (EXISTS ${NCBI_ThirdParty_Boost}/include)
        message(STATUS "Found Boost.Test.Included: ${NCBI_ThirdParty_Boost}")
        set(NCBI_COMPONENT_Boost.Test.Included_FOUND YES)
        set(NCBI_COMPONENT_Boost.Test.Included_INCLUDE ${NCBI_ThirdParty_Boost}/include)
        set(NCBI_COMPONENT_Boost.Test.Included_DEFINES BOOST_TEST_NO_LIB)
        list(APPEND NCBI_ALL_COMPONENTS Boost.Test.Included)
    else()
        message("Component Boost.Test.Included ERROR: ${NCBI_ThirdParty_Boost}/include not found")
        set(NCBI_COMPONENT_Boost.Test.Included_FOUND NO)
    endif()
endif()

#############################################################################
# Boost.Test
NCBI_define_Xcomponent(NAME Boost.Test LIB boost_unit_test_framework-clang-darwin)

#############################################################################
# Boost.Spirit
NCBI_define_Xcomponent(NAME Boost.Spirit LIB boost_thread-mt)

#############################################################################
# Boost.Thread
NCBI_define_Xcomponent(NAME Boost.Thread LIB boost_thread-mt)

#############################################################################
# JPEG
NCBI_define_Xcomponent(NAME JPEG MODULE libjpeg PACKAGE JPEG LIB jpeg)

#############################################################################
# PNG
NCBI_define_Xcomponent(NAME PNG MODULE libpng PACKAGE PNG LIB png)

#############################################################################
# GIF
#NCBI_find_package(GIF GIF)
#set(NCBI_COMPONENT_GIF_FOUND YES)
#list(APPEND NCBI_ALL_COMPONENTS GIF)

#############################################################################
# TIFF
NCBI_define_Xcomponent(NAME TIFF MODULE libtiff-4 PACKAGE TIFF LIB tiff)

#############################################################################
# FASTCGI
NCBI_define_Xcomponent(NAME FASTCGI LIB fcgi)

#############################################################################
# SQLITE3
NCBI_define_Xcomponent(NAME SQLITE3 MODULE sqlite3 PACKAGE SQLite3 LIB sqlite3)
if(NCBI_COMPONENT_SQLITE3_FOUND)
    check_symbol_exists(sqlite3_unlock_notify ${NCBI_COMPONENT_SQLITE3_INCLUDE}/sqlite3.h HAVE_SQLITE3_UNLOCK_NOTIFY)
    check_include_file(sqlite3async.h HAVE_SQLITE3ASYNC_H -I${NCBI_COMPONENT_SQLITE3_INCLUDE})
endif()

#############################################################################
#BerkeleyDB
NCBI_define_Xcomponent(NAME BerkeleyDB LIB db)
if(NCBI_COMPONENT_BerkeleyDB_FOUND)
  set(HAVE_BERKELEY_DB 1)
  set(HAVE_BDB         1)
  set(HAVE_BDB_CACHE   1)
endif()

#############################################################################
# ODBC
set(NCBI_COMPONENT_ODBC_FOUND NO)
if(EXISTS  ${NCBITK_INC_ROOT}/dbapi/driver/odbc/unix_odbc)
    set(NCBI_COMPONENT_XODBC_FOUND YES)
    set(NCBI_COMPONENT_XODBC_INCLUDE ${NCBITK_INC_ROOT}/dbapi/driver/odbc/unix_odbc)
    set(ODBC_INCLUDE  ${NCBI_COMPONENT_XODBC_INCLUDE})
endif()
set(HAVE_ODBC 0)
set(HAVE_ODBCSS_H 0)

#############################################################################
# MySQL
set(NCBI_COMPONENT_MySQL_FOUND NO)

#############################################################################
# Sybase
set(NCBI_COMPONENT_Sybase_FOUND NO)

#############################################################################
# PYTHON
NCBI_define_Xcomponent(NAME PYTHON LIB python${NCBI_ThirdParty_PYTHON_version} INCLUDE python${NCBI_ThirdParty_PYTHON_version})

#############################################################################
# VDB
NCBI_define_Xcomponent(NAME VDB LIB ncbi-vdb
    LIBPATH_SUFFIX mac/release/${NCBI_ThirdParty_VDB_ARCH}/lib INCPATH_SUFFIX interfaces)
if(NCBI_COMPONENT_VDB_FOUND)
    set(NCBI_COMPONENT_VDB_INCLUDE
        ${NCBI_COMPONENT_VDB_INCLUDE} 
        ${NCBI_COMPONENT_VDB_INCLUDE}/os/mac
        ${NCBI_COMPONENT_VDB_INCLUDE}/os/unix
        ${NCBI_COMPONENT_VDB_INCLUDE}/cc/gcc/${NCBI_ThirdParty_VDB_ARCH}
        ${NCBI_COMPONENT_VDB_INCLUDE}/cc/gcc
    )
    set(NCBI_COMPONENT_VDB_LIBPATH ${NCBI_ThirdParty_VDB}/mac/release/${NCBI_ThirdParty_VDB_ARCH}/lib)
#    set(NCBI_COMPONENT_VDB_BINPATH ${NCBI_ThirdParty_VDB}/mac/release/${NCBI_ThirdParty_VDB_ARCH}/lib)
    set(HAVE_NCBI_VDB 1)
endif()

#############################################################################
# wxWidgets
set(_wx_ver 3.1)
NCBI_define_Xcomponent(NAME wxWidgets LIB
    wx_osx_cocoa_gl-${_wx_ver}
    wx_osx_cocoa_richtext-${_wx_ver}
    wx_osx_cocoa_aui-${_wx_ver}
    wx_osx_cocoa_propgrid-${_wx_ver}
    wx_osx_cocoa_xrc-${_wx_ver}
    wx_osx_cocoa_qa-${_wx_ver}
    wx_osx_cocoa_html-${_wx_ver}
    wx_osx_cocoa_adv-${_wx_ver}
    wx_osx_cocoa_core-${_wx_ver}
    wx_base_xml-${_wx_ver}
    wx_base_net-${_wx_ver}
    wx_base-${_wx_ver}
)
if(NCBI_COMPONENT_wxWidgets_FOUND)
    list(GET NCBI_COMPONENT_wxWidgets_LIBS 0 _lib)
    get_filename_component(_libdir ${_lib} DIRECTORY)
    set(NCBI_COMPONENT_wxWidgets_INCLUDE ${NCBI_COMPONENT_wxWidgets_INCLUDE}/wx-${_wx_ver} ${_libdir}/wx/include/osx_cocoa-ansi-${_wx_ver})
    set(NCBI_COMPONENT_wxWidgets_LIBS    ${NCBI_COMPONENT_wxWidgets_LIBS}  "-framework Cocoa")
    set(NCBI_COMPONENT_wxWidgets_DEFINES __WXMAC__ __WXOSX__ __WXOSX_COCOA__ wxDEBUG_LEVEL=0)
endif()

#############################################################################
# XML
NCBI_define_Xcomponent(NAME XML MODULE libxml-2.0 PACKAGE LibXml2 LIB xml2 INCLUDE libxml2)
if(NCBI_COMPONENT_XML_FOUND)
    list(APPEND NCBI_ALL_LEGACY LIBXML)
    set(NCBI_COMPONENT_LIBXML_FOUND XML)

    string(REPLACE ";" "?" _x "${NCBI_COMPONENT_XML_LIBS}")
    string(REPLACE "-L/sw/lib?" "" _x "${_x}")
    string(REPLACE "?" ";" NCBI_COMPONENT_XML_LIBS "${_x}")
endif()

#############################################################################
# XSLT
NCBI_define_Xcomponent(NAME XSLT MODULE libxslt PACKAGE LibXslt LIB xslt ADD_COMPONENT XML)
if(NCBI_COMPONENT_XSLT_FOUND)
    if(NOT DEFINED NCBI_XSLTPROCTOOL)
        if(LIBXSLT_XSLTPROC_EXECUTABLE)
            set(NCBI_XSLTPROCTOOL ${LIBXSLT_XSLTPROC_EXECUTABLE})
        elseif(EXISTS ${NCBI_ThirdParty_XSLT}/bin/xsltproc)
            set(NCBI_XSLTPROCTOOL ${NCBI_ThirdParty_XSLT}/bin/xsltproc)
        else()
            find_program(NCBI_XSLTPROCTOOL xsltproc)
        endif()
        if(NCBI_XSLTPROCTOOL)
            set(NCBI_REQUIRE_XSLTPROCTOOL_FOUND YES)
        endif()
    endif()

    string(REPLACE ";" "?" _x "${NCBI_COMPONENT_XSLT_LIBS}")
    string(REPLACE "-L/sw/lib?" "" _x "${_x}")
    string(REPLACE "?" ";" NCBI_COMPONENT_XSLT_LIBS "${_x}")
endif()
if(NCBI_COMPONENT_XSLT_FOUND)
    list(APPEND NCBI_ALL_LEGACY LIBXSLT)
    set(NCBI_COMPONENT_LIBXSLT_FOUND XSLT)
endif()

#############################################################################
# EXSLT
NCBI_define_Xcomponent(NAME EXSLT MODULE libexslt PACKAGE LibXslt LIB exslt ADD_COMPONENT XML GCRYPT)
if(NCBI_COMPONENT_EXSLT_FOUND)
    set(NCBI_COMPONENT_EXSLT_LIBS ${LIBXSLT_EXSLT_LIBRARIES} ${NCBI_COMPONENT_EXSLT_LIBS})

    string(REPLACE ";" "?" _x "${NCBI_COMPONENT_EXSLT_LIBS}")
    string(REPLACE "-L/sw/lib?" "" _x "${_x}")
    string(REPLACE "?" ";" NCBI_COMPONENT_EXSLT_LIBS "${_x}")
endif()
if(NCBI_COMPONENT_EXSLT_FOUND)
    list(APPEND NCBI_ALL_LEGACY LIBEXSLT)
    set(NCBI_COMPONENT_LIBEXSLT_FOUND EXSLT)
endif()

#############################################################################
# LAPACK
NCBI_define_Xcomponent(NAME LAPACK PACKAGE LAPACK LIB lapack)

#############################################################################
# FreeType
NCBI_define_Xcomponent(NAME FreeType MODULE freetype2 PACKAGE Freetype LIB freetype INCLUDE freetype2)

#############################################################################
# FTGL
NCBI_define_Xcomponent(NAME FTGL MODULE ftgl LIB ftgl INCLUDE FTGL)

#############################################################################
# GLEW
NCBI_define_Xcomponent(NAME GLEW MODULE glew LIB GLEW)
if(NCBI_COMPONENT_GLEW_FOUND)
    get_filename_component(_incdir ${NCBI_COMPONENT_GLEW_INCLUDE} DIRECTORY)
    get_filename_component(_incGL ${NCBI_COMPONENT_GLEW_INCLUDE} NAME)
    if("${_incGL}" STREQUAL "GL")
        set(NCBI_COMPONENT_GLEW_INCLUDE ${_incdir})
    endif()
endif()

#############################################################################
# OpenGL
if(NOT NCBI_COMPONENT_OpenGL_DISABLED)
    set(NCBI_COMPONENT_OpenGL_FOUND YES)
    set(NCBI_COMPONENT_OpenGL_LIBS "-framework AGL -framework OpenGL -framework Metal -framework MetalKit")
    list(APPEND NCBI_ALL_COMPONENTS OpenGL)
else()
    set(NCBI_COMPONENT_OpenGL_FOUND NO)
    message("DISABLED OpenGL")
endif()

##############################################################################
# GRPC/PROTOBUF
if(NOT DEFINED NCBI_PROTOC_APP)
    set(NCBI_PROTOC_APP "${NCBI_ThirdParty_GRPC}/bin/protoc")
endif()
if(NOT DEFINED NCBI_GRPC_PLUGIN)
    set(NCBI_GRPC_PLUGIN "${NCBI_ThirdParty_GRPC}/bin/grpc_cpp_plugin")
endif()
if(NOT EXISTS "${NCBI_PROTOC_APP}")
    find_program(NCBI_PROTOC_APP protoc)
endif()
if(NOT EXISTS "${NCBI_GRPC_PLUGIN}")
    find_program(NCBI_GRPC_PLUGIN grpc_cpp_plugin)
endif()

if ("${CMAKE_BUILD_TYPE}" STREQUAL "Debug")
    NCBI_define_Xcomponent(NAME PROTOBUF LIB protobufd)
endif()
if(NOT NCBI_COMPONENT_PROTOBUF_FOUND)
    NCBI_define_Xcomponent(NAME PROTOBUF MODULE protobuf PACKAGE Protobuf LIB protobuf)
endif()
NCBI_define_Xcomponent(NAME Boring LIB boringssl boringcrypto)
NCBI_define_Xcomponent(NAME GRPC MODULE grpc++ LIB
    grpc++ grpc address_sorting upb cares gpr re2
    absl_raw_hash_set absl_hashtablez_sampler absl_exponential_biased absl_hash 
    absl_city absl_statusor absl_bad_variant_access absl_status absl_cord 
    absl_str_format_internal absl_synchronization absl_graphcycles_internal 
    absl_symbolize absl_demangle_internal absl_stacktrace absl_debugging_internal 
    absl_malloc_internal absl_time absl_time_zone absl_civil_time absl_strings 
    absl_strings_internal absl_throw_delegate absl_int128 absl_base absl_spinlock_wait 
    absl_bad_optional_access absl_raw_logging_internal absl_log_severity
    )
if(NCBI_COMPONENT_GRPC_FOUND)
    set(NCBI_COMPONENT_GRPC_LIBS ${NCBI_COMPONENT_GRPC_LIBS} ${NCBI_COMPONENT_Boring_LIBS})
    set(NCBI_COMPONENT_GRPC_LIBS ${NCBI_COMPONENT_GRPC_LIBS} ${COREFOUNDATION_LIBS})
endif()

#############################################################################
# UV
NCBI_define_Xcomponent(NAME UV MODULE libuv LIB uv)
if(NCBI_COMPONENT_UV_FOUND)
    list(APPEND NCBI_ALL_LEGACY LIBUV)
    set(NCBI_COMPONENT_LIBUV_FOUND UV)
endif()

#############################################################################
# NGHTTP2
NCBI_define_Xcomponent(NAME NGHTTP2 MODULE libnghttp2 LIB nghttp2)

#############################################################################
# GL2PS
NCBI_define_Xcomponent(NAME GL2PS LIB gl2ps)

#############################################################################
# GMP
NCBI_define_Xcomponent(NAME GMP LIB gmp)

#############################################################################
# NETTLE
NCBI_define_Xcomponent(NAME NETTLE LIB hogweed nettle ADD_COMPONENT GMP)

#############################################################################
# GNUTLS
set(NCBI_COMPONENT_GNUTLS_FOUND NO)
if(DEFINED NCBI_COMPONENT_GNUTLS_DISABLED AND NOT NCBI_COMPONENT_GNUTLS_DISABLED)
    NCBI_define_Xcomponent(NAME GNUTLS LIB gnutls ADD_COMPONENT NETTLE)
else()
    set(NCBI_COMPONENT_GNUTLS_FOUND NO)
    message("DISABLED GNUTLS")
endif()


