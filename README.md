[![GitHub top language](https://img.shields.io/github/languages/top/FredHappyface/Python.NFGrab.svg?style=for-the-badge)](../../)
[![Repository size](https://img.shields.io/github/repo-size/FredHappyface/Python.NFGrab.svg?style=for-the-badge)](../../)
[![Issues](https://img.shields.io/github/issues/FredHappyface/Python.NFGrab.svg?style=for-the-badge)](../../issues)
[![License](https://img.shields.io/github/license/FredHappyface/Python.NFGrab.svg?style=for-the-badge)](/LICENSE.md)
[![Commit activity](https://img.shields.io/github/commit-activity/m/FredHappyface/Python.NFGrab.svg?style=for-the-badge)](../../commits/master)
[![Last commit](https://img.shields.io/github/last-commit/FredHappyface/Python.NFGrab.svg?style=for-the-badge)](../../commits/master)

<!-- omit in toc -->
# Python.NFGrab

Generate Chocolatey https://chocolatey.org/ packages from nerd fonts.

## Rationale

- Chocolatey is commonly used for package management in Windows.
- Nerd fonts are already available on the AUR and I thought this would make for a
relatively useful and fun project.

## Build

1. Clone nerd fonts `git clone https://github.com/ryanoasis/nerd-fonts.git --depth=1`
2. update `templates/paths.json` with the commit id and date (other paths may need updating)
3. Run the `nfgrab.py` script
	```bash
	./nfgrab.py
	```
4. Navigate to the package directory. e.g. `output/3270nf/package`
5. Run `choco pack`
6. Publish to Chocolatey

<!-- omit in toc -->
## Table of Contents

- [Rationale](#rationale)
- [Build](#build)
- [Language information](#language-information)
	- [Built for](#built-for)
- [Install Python on Windows](#install-python-on-windows)
	- [Chocolatey](#chocolatey)
	- [Download](#download)
- [Install Python on Linux](#install-python-on-linux)
	- [Apt](#apt)
- [How to run](#how-to-run)
	- [With VSCode](#with-vscode)
	- [From the Terminal](#from-the-terminal)
- [Download Project](#download-project)
	- [Clone](#clone)
		- [Using The Command Line](#using-the-command-line)
		- [Using GitHub Desktop](#using-github-desktop)
	- [Download Zip File](#download-zip-file)
- [Community Files](#community-files)
	- [Licence](#licence)
	- [Changelog](#changelog)
	- [Code of Conduct](#code-of-conduct)
	- [Contributing](#contributing)
	- [Security](#security)
	- [Support](#support)
	- [Rationale](#rationale-1)

## Language information

### Built for
This program has been written for Python 3 and has been tested with
Python version 3.9.0 <https://www.python.org/downloads/release/python-380/>.

## Install Python on Windows

### Chocolatey

```powershell
choco install python
```

### Download
To install Python, go to <https://www.python.org/> and download the latest
version.

## Install Python on Linux

### Apt

```bash
sudo apt install python3.9
```

## How to run

### With VSCode

1. Open the .py file in vscode
2. Ensure a python 3.9 interpreter is selected (Ctrl+Shift+P > Python:Select
Interpreter > Python 3.9)
3. Run by pressing Ctrl+F5 (if you are prompted to install any modules, accept)

### From the Terminal

```bash
./[file].py
```

## Download Project

### Clone

#### Using The Command Line

1. Press the Clone or download button in the top right
2. Copy the URL (link)
3. Open the command line and change directory to where you wish to
clone to
4. Type 'git clone' followed by URL in step 2

```bash
git clone https://github.com/FredHappyface/Python.NFGrab
```

More information can be found at
<https://help.github.com/en/articles/cloning-a-repository>

#### Using GitHub Desktop

1. Press the Clone or download button in the top right
2. Click open in desktop
3. Choose the path for where you want and click Clone

More information can be found at
<https://help.github.com/en/desktop/contributing-to-projects/cloning-a-repository-from-github-to-github-desktop>

### Download Zip File

1. Download this GitHub repository
2. Extract the zip archive
3. Copy/ move to the desired location

## Community Files

### Licence
MIT License
Copyright (c) FredHappyface
(See the [LICENSE](/LICENSE.md) for more information.)

### Changelog
See the [Changelog](/CHANGELOG.md) for more information.

### Code of Conduct
Online communities include people from many backgrounds. The *Project*
contributors are committed to providing a friendly, safe and welcoming
environment for all. Please see the
[Code of Conduct](https://github.com/FredHappyface/.github/blob/master/CODE_OF_CONDUCT.md)
 for more information.

### Contributing
Contributions are welcome, please see the
[Contributing Guidelines](https://github.com/FredHappyface/.github/blob/master/CONTRIBUTING.md)
for more information.

### Security
Thank you for improving the security of the project, please see the
[Security Policy](https://github.com/FredHappyface/.github/blob/master/SECURITY.md)
for more information.

### Support
Thank you for using this project, I hope it is of use to you. Please be aware that
those involved with the project often do so for fun along with other commitments
(such as work, family, etc). Please see the
[Support Policy](https://github.com/FredHappyface/.github/blob/master/SUPPORT.md)
for more information.

### Rationale
The rationale acts as a guide to various processes regarding projects such as
the versioning scheme and the programming styles used. Please see the
[Rationale](https://github.com/FredHappyface/.github/blob/master/RATIONALE.md)
for more information.
