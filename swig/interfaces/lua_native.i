
#define LUA_API extern
#define LUALIB_API LUA_API
#define LUAMOD_API LUALIB_API

%warnfilter(314) lua_Debug::event;

%module LuaNative
%{
    /* Includes the header in the wrapper code */
    #include "../../lua534/src/lua.h"
    #include "../../lua534/src/lauxlib.h"
    #include "../../lua534/src/lualib.h"
    #include "../../lua534/src/lualib.h"
    //#include "../head/LuaHead.h"
%}

/* Parse the header file to generate wrappers */
%include "../../lua534/src/lua.h"
%include "../../lua534/src/lauxlib.h"
%include "../../lua534/src/lualib.h"
//$include "../head/LuaHead.h"