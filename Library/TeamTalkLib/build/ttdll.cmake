include (ttclient)
include (ttsrvlib)

set (TTCLIENTDLL_INCLUDE_DIR ${TTCLIENT_INCLUDE_DIR} ${TEAMTALK_ROOT}/Library/TeamTalk_DLL)
set (TTCLIENTDLL_COMPILE_FLAGS -DTEAMTALKDLL_EXPORTS -DENABLE_HTTP_AUTH ${TTCLIENT_COMPILE_FLAGS})
set (TTCLIENTDLL_LINK_FLAGS ${ACEINET_STATIC_LIB} ${TTCLIENT_LINK_FLAGS})

set (TTCLIENTDLL_HEADERS
  ${TTCLIENT_HEADERS}
  ${TEAMTALKLIB_ROOT}/bin/dll/Convert.h
  ${TEAMTALKLIB_ROOT}/bin/dll/TTClientMsg.h
  ${TEAMTALKLIB_ROOT}/bin/dll/resource.h
  ${TEAMTALK_ROOT}/Library/TeamTalk_DLL/TeamTalk.h )

set (TTCLIENTDLL_SOURCES
  ${TTCLIENT_SOURCES}
  ${TEAMTALKLIB_ROOT}/bin/dll/Convert.cpp
  ${TEAMTALKLIB_ROOT}/bin/dll/TTClientMsg.cpp
  ${TEAMTALKLIB_ROOT}/bin/dll/ttdll.rc
  ${TEAMTALKLIB_ROOT}/bin/dll/TeamTalk.cpp )

# TeamTalk Professional shared library

set (TTCLIENTPRODLL_INCLUDE_DIR ${TTCLIENTDLL_INCLUDE_DIR} ${OPENSSL_INCLUDE_DIR})
set (TTCLIENTPRODLL_COMPILE_FLAGS ${TTCLIENTDLL_COMPILE_FLAGS}
  -DENABLE_TEAMTALKPRO -DENABLE_ENCRYPTION)
set (TTCLIENTPRODLL_LINK_FLAGS ${TTCLIENTDLL_LINK_FLAGS}
  ${ACESSL_STATIC_LIB} ${ACEINETSSL_STATIC_LIB} ${OPENSSL_STATIC_LIB})

set (TTCLIENTPRODLL_HEADERS
  ${TTCLIENTDLL_HEADERS}
  ${TTSRVLIB_HEADERS}
  ${TEAMTALKLIB_ROOT}/bin/dll/ServerMonitor.h
  ${TEAMTALK_ROOT}/Library/TeamTalk_DLL/TeamTalkSrv.h )

set (TTCLIENTPRODLL_SOURCES
  ${TTCLIENTDLL_SOURCES}
  ${TTSRVLIB_SOURCES}
  ${TEAMTALKLIB_ROOT}/bin/dll/ServerMonitor.cpp
  ${TEAMTALKLIB_ROOT}/bin/dll/TeamTalkSrv.cpp )

if (MSVC)
  if (${CMAKE_SIZEOF_VOID_P} EQUAL 8)
    list (APPEND TTCLIENTDLL_COMPILE_FLAGS -D_WIN64)
  endif()
endif()
