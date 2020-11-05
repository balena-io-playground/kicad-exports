V1.0

V1.1
- removed [PcbDraw](https://github.com/yaqwsx/PcbDraw) as I never was able to make it work properly. 
- set timestamp of gerber files and schematic.pdf according time of last commit
- add LICENSE
- update submodules
- added [KiCad-Diff](https://github.com/Gasman2014/KiCad-Diff)

V2.0
- `-c` does not anymore select the command, it specifies a config file. This is much more flexible!
- added pcbdraw again but dumped tracespace
- all parameters are now interchangeable in their order
- add kicad-git-filters
- removed kicad-diff
- currently no kikit support anymore, would like to get it somehow back
- much better entrypoint.sh - big thx to @joaoantoniocardoso

V2.1
- update kiplot to kibot v0.7.0
  - *.kiplot.yaml files now have to be called *.kibot.yaml!
  - path of pcbdraw changed, please use:
      - `style: '/usr/share/pcbdraw/styles/jlcpcb-green-hasl.json'`
      - `libs: ['/usr/share/pcbdraw/footprints/KiCAD-base']`
- using docker image `setsoft/kicad_auto:10.4-5.1.6` instead of including all packages by myself
- enable verbose output in CI runs
- add codefactor.io
- fix file permissions

V2.2
- make verbose optional again
- refactor all config files
- run several configs at once