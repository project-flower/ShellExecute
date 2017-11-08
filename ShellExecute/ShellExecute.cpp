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

    TCHAR file[MAX_PATH] = { '\0' };

    if (ExpandEnvironmentStrings(__targv[1], file, MAX_PATH) == 0)
    {
        return -1;
    }

    TCHAR parameters[MAX_PATH] = { '\0' };

    if (__argc > 1)
    {
        if (ExpandEnvironmentStrings(__targv[2], parameters, MAX_PATH) == 0)
        {
            return -1;
        }
    }

    TCHAR directory[MAX_PATH] = { '\0' };

    if (__argc > 2)
    {
        if (ExpandEnvironmentStrings(__targv[3], directory, MAX_PATH) == 0)
        {
            return -1;
        }
    }

    return (INT_PTR)ShellExecute(nullptr, _T("open"), file, parameters, directory, SW_SHOW);
}
