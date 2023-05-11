KISS_PATH=/home/dk/repos/noir/core
KISS_PATH=$KISS_PATH:/home/dk/repos/noir/extra
KISS_PATH=$KISS_PATH:/home/dk/repos/noir/xorg
KISS_PATH=$KISS_PATH:/home/dk/repos/noir/wayland
KISS_PATH=$KISS_PATH:/home/dk/repos/noir/community
export KISS_PATH

# Build Flags
export CFLAGS="-march=x86-64 -mtune=generic -Os"
export CXXFLAGS="-march=x86-64 -mtune=generic -Os"
export MAKEFLAGS="-j1"

# Set date and time
export TZ=CDT
