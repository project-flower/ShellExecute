// ShellExecute.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"


int APIENTRY _tWinMain(_In_ HINSTANCE hInstance,
    _In_opt_ HINSTANCE hPrevInstance,
    _In_ TCHAR* lpCmdLine,
    _In_ int nCmdShow)
{
    if (__argc < 2)
    {
        return -1;
    }

    TCHAR* operation = __targv[1];
    TCHAR file[MAX_PATH] = { '\0' };

    if (__argc > 2)
    {
        if (ExpandEnvironmentStrings(__targv[2], file, MAX_PATH) == 0)
        {
            return -1;
        }
    }

    TCHAR parameters[MAX_PATH] = { '\0' };

    if (__argc > 3)
    {
        if (ExpandEnvironmentStrings(__targv[3], parameters, MAX_PATH) == 0)
        {
            return -1;
        }
    }

    TCHAR directory[MAX_PATH] = { '\0' };

    if (__argc > 4)
    {
        if (ExpandEnvironmentStrings(__targv[4], directory, MAX_PATH) == 0)
        {
            return -1;
        }
    }

    INT nShowCmd = SW_SHOW;
    
    if (__argc > 5)
    {
        nShowCmd = _ttoi(__targv[5]);
    }

    return reinterpret_cast<int>(ShellExecute(nullptr, operation, file, parameters, directory, nShowCmd));
}
