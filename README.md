[![Github top language](https://img.shields.io/github/languages/top/FredHappyface/Python.NFGrab.svg?style=for-the-badge)](../../)
[![Codacy grade](https://img.shields.io/codacy/grade/[codacy-proj-id].svg?style=for-the-badge)](https://www.codacy.com/manual/FredHappyface/Python.NFGrab)
[![Repository size](https://img.shields.io/github/repo-size/FredHappyface/Python.NFGrab.svg?style=for-the-badge)](../../)
[![Issues](https://img.shields.io/github/issues/FredHappyface/Python.NFGrab.svg?style=for-the-badge)](../../issues)
[![License](https://img.shields.io/github/license/FredHappyface/Python.NFGrab.svg?style=for-the-badge)](/LICENSE.md)
[![Commit activity](https://img.shields.io/github/commit-activity/m/FredHappyface/Python.NFGrab.svg?style=for-the-badge)](../../commits/master)
[![Last commit](https://img.shields.io/github/last-commit/FredHappyface/Python.NFGrab.svg?style=for-the-badge)](../../commits/master)

# Python.NFGrab

Generate Chocolatey https://chocolatey.org/ packages from nerd fonts.

## Rationale
- One excellent part of Linux (at least in my opinion) is the inclusion of a
package manager such as apt, yum etc.
- Chocolatey is commonly used for package management in Windows.
- Nerd fonts is already available on the AUR and I thought this would make for a
relatively useful and fun project

## Build
1. Clone nerd fonts
2. update `templates/paths.json` with the commit id and date (other paths may need updating)
3. Run the `nfgrab.py` script
	```bash
	./nfgrab.py
	```
4. Navigate to the package directory. e.g. `output/3270nf/package`
5. Run `choco pack`
6. Publish to Chocolatey

## Language information
### Built for
This program has been written for Python 3 and has been tested with
Python version 3.8.0 <https://www.python.org/downloads/release/python-380/>.

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
sudo apt install python3.8
```

## How to run
### With VSCode
1. Open the .py file in vscode
2. Ensure a python 3.8 interpreter is selected (Ctrl+Shift+P > Python:Select
Interpreter > Python 3.8)
3. Run by pressing Ctrl+F5 (if you are prompted to install any modules, accept)
### From the Terminal
```bash
./[file].py
```

## Download
### Clone
#### Using The Command Line
1. Press the Clone or download button in the top right
2. Copy the URL (link)
3. Open the command line and change directory to where you wish to
clone to
4. Type 'git clone' followed by URL in step 2
```bash
$ git clone https://github.com/FredHappyface/Python.NFGrab
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
In the interest of fostering an open and welcoming environment, we
as contributors and maintainers pledge to make participation in our
project and our community a harassment-free experience for everyone.
Please see the
[Code of Conduct](https://github.com/FredHappyface/.github/blob/master/CODE_OF_CONDUCT.md) for more information.

### Contributing
Contributions are welcome, please see the [Contributing Guidelines](https://github.com/FredHappyface/.github/blob/master/CONTRIBUTING.md) for more information.

### Security
Thank you for improving the security of the project, please see the [Security Policy](https://github.com/FredHappyface/.github/blob/master/SECURITY.md) for more information.
