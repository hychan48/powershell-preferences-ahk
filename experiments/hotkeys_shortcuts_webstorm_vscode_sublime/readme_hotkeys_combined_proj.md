# Hotkey Combined
* need consolidation
* for commonly used hotkeys

## Snippets
* [Snippet Generator](https://snippet-generator.app/?description=BBElements+media+block+snippet&tabtrigger=bb.media-block&snippet=%3Csection+class%3D%22media%22+data-fullwidth%3D%22%24%7B1%3Atrue%7D%22%3E%0A++++%3Cimg+src%3D%22%24%7B0%3Aimage.jpg%7D%22+alt%3D%22%24%7B2%3AText+that+appears+under+the+%5Bimage%5D%28%23%29%7D%22%3E%0A%3C%2Fsection%3E&mode=sublimetext)

* VSCode / Sublime
* https://github.com/babel/babel-sublime-snippets

### Sublime
* https://www.freecodecamp.org/news/a-guide-to-preserving-your-wrists-with-sublime-text-snippets-7541662a53f2/
* https://gist.github.com/J2TeaM/a54bafb082f90c0f20c9
```xml

```
```powershell
explorer.exe '%APPDATA%\Sublime Text 3\Packages\User'


# no work
cd '%APPDATA%\Sublime Text 3\Packages\User'

# cmd work
cd "%APPDATA%\Sublime Text 3\Packages\User"
cd %APPDATA%\Sublime Text 3\Packages\User

# ps1 work
cd "$env:APPDATA\Sublime Text 3\Packages\User"
```

  * https://github.com/jaywcjlove/hotkeys-js
# Hotkey demo?
* https://github.com/jaywcjlove/hotkeys-js



 # user32.dll 
 * once again
* These are usually achieved using the RegisterHotKey function of the user32.dll library.
* Hotkey commander?
* i think using ahk or w/e is better

```txt

.lnk files on your desktop or start menu that have a "Shortcut key" defined in their properties, then yes, they are global in the sense that they work regardless of which application is currently in focus. However, they might not work over other global hotkeys set by applications using RegisterHotKey or if a full-screen application (like a game) captures all keyboard input.
```
# sharpkeys
* too basic

+ Hotkey Explorer

* Besides AHK, there are other tools like SharpKeys, KeyTweak, or Hotkeyz which allow you to remap or create hotkeys.
* group policy? has shortcuts apparently
* also accesiblity stuffus

# electron
* electron can ipc for sure

# Windows API

Win32 API (or Windows API): This is the traditional API for Windows, primarily for desktop applications. It's been around since the earliest versions of Windows and includes functions to handle window creation, message processing, file management, graphics drawing, and much more.

.NET Framework: Introduced in the early 2000s, the .NET Framework provides a managed way to develop Windows applications. It abstracts many of the details of the Win32 API and offers a richer set of libraries.

Windows Runtime (WinRT): This is the API introduced with Windows 8 for building modern, touch-friendly apps (initially called "Metro" apps). It's different from Win32 but offers ways for the two to interoperate.

Universal Windows Platform (UWP): Evolving from WinRT, UWP is a platform for building apps that can run across different Windows devices, from PCs to Xbox to HoloLens.

DirectX: This is Microsoft's collection of APIs for handling multimedia, especially game programming and video.

Windows Communication Foundation (WCF), Windows Presentation Foundation (WPF), and more: These are other APIs and frameworks that Microsoft has developed over the years to cater to specific application needs.

When someone mentions the "Windows API," they might be referring to any or a combination of these, depending on the context. It's always good to clarify which specific API or framework they mean if there's any uncertainty.


## tools
Windows Driver Kit (WDK): This is a set of tools used to develop, test, and deploy Windows drivers. It provides the necessary tools and headers for building, testing, debugging, and deploying drivers for Windows. It's not primarily for application development but for hardware driver development.

Windows Software Development Kit (SDK): This is a set of development tools that allows developers to create applications for Windows. It contains headers, libraries, tools, samples, and more. Most Windows application developers would be familiar with this kit.

WinAppDriver (Windows Application Driver): This is Microsoft's WebDriver protocol implementation for Windows applications. It's used for automated UI testing of Windows applications. It can test Universal Windows Platform (UWP) and Classic Windows (Win32) apps on Windows 10 PCs. WinAppDriver is often used with Appium, an open-source tool for automating native, mobile web, and hybrid applications on various platforms.

# Win RM - ssh like
Yes, WinRM (Windows Remote Management) is different from the aforementioned tools. It's a protocol and accompanying service in Windows that allows for the management of and remote operations on Windows machines.

Here's a brief overview:

Purpose: WinRM facilitates the execution of administrative operations remotely. It enables administrators to perform operations on a machine from another machine elsewhere in the network.

Based on: WinRM is based on the WS-Management protocol, which is a standard Simple Object Access Protocol (SOAP)-based, firewall-friendly protocol.

Usage: It's often used in conjunction with PowerShell, allowing administrators to run PowerShell commands on remote systems. This combination (PowerShell + WinRM) gives administrators a powerful toolset for automating tasks across many machines.

Configuration: For security reasons, WinRM is not enabled by default on Windows systems. Administrators need to enable it and configure it properly to ensure secure communication.

WinRM is a key component for tasks like remote server management, especially in large enterprise environments where manual administration of each server would be impractical.

# Recommendation
 WinAppDriver, Selenium, AutoIt, and others are more appropriate.

 # appium for sure

 # linux recommndations
 ```txt
 SikuliX: This tool automates anything you see on your screen by using image recognition to identify GUI elements. It's cross-platform and works with scripting languages like Python.

AutoKey: This is a desktop automation utility for Linux that allows you to manage a collection of scripts and phrases, and assign abbreviations and hotkeys to them.

xdotool: It's a command-line X11 automation tool. It can simulate mouse movements, key presses, and other input actions. It's handy for scripting and can be combined with other tools to detect window states, etc.

PyAutoGUI: This is a Python module that provides functions to programmatically control the mouse and keyboard. While it's cross-platform, it works well for automating GUI tasks on Linux.

Dogtail: It's a GUI test tool and automation framework written in Python. It uses Assistive Technologies (AT-SPI) to interact with desktop applications.

LDTP (Linux Desktop Testing Project): It's an open-source testing tool that uses accessibility libraries to c
```


# monitor cascade?
* favourites / bookmark kinda thing

# win32 / api
* so shortcuts have to have a trigger / api
* that only makes sense / has to have ipc