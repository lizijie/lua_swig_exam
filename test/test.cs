using System;
 public class test_mydll {
     static void Main() {
         string scripts = @"print('hell5345345')";

        // 创建新的LUA运行环境
        SWIGTYPE_p_lua_State L = LuaNative.luaL_newstate();
        // 加载所有标准库
        LuaNative.luaL_openlibs(L);
        LuaNative.luaL_loadstring(L, scripts); 
        int result = LuaNative.lua_pcallk(L, 0, LuaNative.LUA_MULTRET, 0, null, null);
        if (result > 0)
        {
            Console.WriteLine("error");
        }

        LuaNative.lua_close(L);
    }
 }