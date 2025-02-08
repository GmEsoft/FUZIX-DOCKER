FUZIX_DOCKER
============

**_Docker image to build FUZIX for Z80-based platforms_**


This repo contains a Docker image based on Ubuntu that will be used to
build [Fuzix](https://github.com/EtchedPixels/Fuzix) for some supported 
Z80-based platforms, and maye others.


I. Install WSL 2 _(Windows users)_
----------------------------------

- `wsl --install`
- Reboot the system.

See https://learn.microsoft.com/en-us/windows/wsl/install .


II. Install Docker _(Windows users)_
------------------------------------

- Download [Docker Desktop for Windows - x86_64](https://desktop.docker.com/win/main/amd64/Docker%20Desktop%20Installer.exe?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-win-amd64)
- Install the downloaded package.
- Configuration:
  - [x] Use WSL 2 instead of Hyper-V (recommended)
  - [x] Add shortcut to desktop
  - Click `OK`
  - After the installation, click `Close and restart` to restart Windows and complete the installation.

https://docs.docker.com/desktop/setup/install/windows-install/


III. Convert the tree to Linux _(Windows users)_
------------------------------------------------

If running Docker for Windows, change the end-of-line of all files to LF ($0A).

- Run the script `convert_tree_linux.sh`.


IV. Build the Docker image
--------------------------

- Run the script `build.sh`.


V. Run a container on that image
--------------------------------

- Run the script `run.sh`. If the container exists, it will be created and started, 
  else it will simply be restarted. If the container needs to be re-created, then
  delete the container and restart the script `run.sh`. The container can be delete
  with `docker -rm $(docker ps -q -l -a -f name=^ubuntu-fuzix.work$)` or using
  Docker Desktop.


VI. Build Fuzix for TRS-80 Model 4/4p
-------------------------------------

This is an example of a successful build of Fuzix. The scripts can be accomodated for
other platforms.

- Run the script `clone_and_build_fuzix_trs80`. This will execute the following scripts:
  - `clone_sdcc280`: get the 'sdcc' compiler specially adapted to build Fuzix;
  - `build_sdcc280-z80`: build sdcc for the Z80 target CPU;
  - `clone_fuzix-bintools`: get the Fuzix build binary tools (assemblers);
  - `build_fuzix-bintools`: build them;
  - `clone_fuzix-compiler-kit`: get the Fuzix compiler kit;
  - `build_fuzix-compiler-kit-bootstrap-z80`: build the Fuzix compiler bootstrap for Z80;
  - `build_fuzix-compiler-kit-z80`: build the full Fuzix compiler for Z80;
  - `clone_fuzix`: get the Fuzix source code;
  - `build_fuzix-trs80`: build Fuzix for the TRS-80 Model 4/4p.

The output images are exported in `mount/FUZIX/Images/trs80`.

The full Fuzix tree can be exported from the Docker container to `mount/FUZIX` with this 
command: `export-fuzix`. They can be re-imported using `import-fuzix` or 
`import_and_build_fuzix-trs80` which will also do an incremental build of Fuzix for the
TRS-80.


VII. Test Fuzix for TRS-80 Model 4/4p _(Windows users)_
-------------------------------------------------------

The new Fuzix disk images can be tested using a TRS-80 emulator, for example 
[TRS80gp](http://48k.ca/trs80gp.html) by [George Phillips](http://48k.ca).
Start the emulator by running the Windows batch file `test_fuzix_trs80_trs80gp.bat`.

When the system is started:
- at the prompt `bootdev:`, reply `0`;
- at the prompt `Enter new date:`, type `<Enter>`;
- at the prompt `Enter new date:`, type `<Enter>`;
- at the prompt `login:`, reply `root`;
- type any Fuzix command, like `date`, `cal`, `ps -ef`, `df -k`, `ls -la`, etc.;
- there are some games in `/usr/games` such as `adv01`, `startrek`;
- end your session with `shutdown`;
- when `Halted.` is displayed, the machine can be powered off.


Credits
-------

[_Alan Cox_](https://en.wikipedia.org/wiki/Alan_Cox_(computer_programmer)) 
[(EtchedPixels)](https://github.com/EtchedPixels) for that great project 
[Fuzix](https://github.com/EtchedPixels/Fuzix), 'Because Small Is Beautiful'.

[_George Phillips_](http://48k.ca) for [TRS80gp](http://48k.ca/trs80gp.html) 
probably the best TRS-80 emulator in the world.



GPLv3 License
-------------

Created by Michel Bernard (michel_bernard@icloud.com) -
<http://www.github.com/GmEsoft/FUZIX-DOCKER>

Copyright (c) 2025 Michel Bernard. All rights reserved.

This file is part of FUZIX-DOCKER.

FUZIX-DOCKER is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

FUZIX-DOCKER is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with FUZIX-DOCKER.  If not, see <https://www.gnu.org/licenses/>.

