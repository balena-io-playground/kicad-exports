#!/bin/bash

# Script configurations
SCRIPT="kicad-exports"
VERSION="2.1"

# Mandatory arguments
margs=1

# Arguments and their default values
CONFIG=""
BOARD=""
SCHEMA=""
SKIP=""
DIR=""
OVERWRITE=""
VERBOSE=""

# Exit error code
EXIT_ERROR=1

function msg_example {
    echo -e "example: $SCRIPT -d docs -b example.kicad_pcb -e example.sch -c docs.kibot.yaml"
}

function msg_usage {
    echo -e "usage: $SCRIPT [OPTIONS]... -c <yaml-config-file>"
}

function msg_disclaimer {
    echo -e "This is free software: you are free to change and redistribute it"
    echo -e "There is NO WARRANTY, to the extent permitted by law.\n"
	echo -e "See <https://github.com/nerdyscout/kicad-exports>."
}

function msg_version {
	echo -e "kicad-exports $VERSION"
}

function msg_illegal_arg {
    echo -e "$SCRIPT: illegal option $@"
}

function msg_help {
	echo -e "Mandatory arguments:"
    echo -e "  -c, --config FILE .kibot.yaml config file"

	echo -e "\nOptional control arguments:"
    echo -e "  -d, --dir DIR output path. Default: current dir, will be used as prefix of dir configured in config file"
    echo -e "  -b, --board FILE .kicad_pcb board file. Default: first board file found in current folder."
    echo -e "  -e, --schema FILE .sch schematic file. Default: first schematic file found in current folder."
    echo -e "  -s, --skip Skip preflights, comma separated or 'all'"

	echo -e "\nMiscellaneous:"
    echo -e "  -o, --overwrite parameter of config file VAR=VAL"
    echo -e "  -v, --verbose annotate program execution"
    echo -e "  -h, --help display this message and exit"
    echo -e "  -V, --version output version information and exit"
}

function msg_more_info {
    echo -e "Try '$SCRIPT --help' for more information."
}

function helpme {
    msg_usage
    echo ""
    msg_help
    echo ""
    msg_example
    echo ""
    msg_disclaimer
}

function version {
    msg_version
    echo ""
    msg_disclaimer
}

function illegal_arg {
    msg_illegal_arg "$@"
    echo ""
    msg_usage
    echo ""
    msg_example
    echo ""
    msg_more_info
}

function usage {
    msg_usage
    echo ""
    msg_more_info
}

# Ensures that the number of passed args are at least equals
# to the declared number of mandatory args.
# It also handles the special case of the -h or --help arg.
function margs_precheck {
	if [ "$1" -lt "$margs" ]; then
        if [ "$2" == "--help" ] || [ "$2" == "-h" ]; then
            helpme
        elif [ "$2" == "--version" ] || [ "$2" == "-V" ]; then
            version
        else
            usage
        fi
        exit $EXIT_ERROR
	fi
}

# Ensures that all the mandatory args are not empty
function margs_check {
	if [ "$#" -lt "$margs" ]; then
        usage
	    exit $EXIT_ERROR
	fi
}

function args_process {
    while [ "$1" != "" ];
    do
        case "$1" in
            -c | --config ) shift
                CONFIG="$@"
                ;;
            -b | --board ) shift
                BOARD="-b $1"
                ;;
            -e | --schematic ) shift
                SCHEMA="-e $1"
                ;;
            -d | --dir) shift
                DIR="-d $1"
                ;;
            -s | --skip) shift
                SKIP="-s $1"
                ;;
            -o | --overwrite) shift
                OVERWRITE="-g $1"
                ;;
            -v | --verbose ) 
                VERBOSE="-v"
                ;;
            -h | --help )
                helpme
                exit
                ;;
            -V | --version)
                version
                exit
                ;;
#            *)
#                illegal_arg "$@"
#                exit $EXIT_ERROR
#                ;;
        esac
        shift
    done
}

function run {
    if [ -d .git ]; then
        filter="/opt/git-filters/kicad-git-filters.py"
        if [ -f $filter ]; then
            python3 $filter
        else
            echo -e "warning: $filter not found!"
        fi
    fi

    for conf in $CONFIG; do
        if [ -f $conf ]; then
            echo "running: kibot -c $conf $DIR $BOARD $SCHEMA $SKIP $OVERWRITE $VERBOSE"
            kibot -c $conf $DIR $BOARD $SCHEMA $SKIP $OVERWRITE $VERBOSE
        elif [ -f "/opt/kibot/config/$conf" ]; then
            echo "running: kibot -c $conf $DIR $BOARD $SCHEMA $SKIP $OVERWRITE $VERBOSE"
            kibot -c /opt/kibot/config/$conf $DIR $BOARD $SCHEMA $SKIP $OVERWRITE $VERBOSE
        else
            echo "config file '$conf' not found! Please pass own file or choose from:"
            ls /opt/kibot/config/*.yaml
            exit $EXIT_ERROR
        fi
    done
}

function main {
    margs_precheck "$#" "$1"

    args_process "$@"

    run
}

# Removes quotes
args=$(xargs <<<"$@")

# Arguments as an array
IFS=' ' read -r -a args <<< "$args"

# Run main
main "${args[@]}"
