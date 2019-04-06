#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
    DESTDIR_ARG="--root=$DESTDIR"
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/nazir/ws_moveit/src/rosserial/rosserial_python"

# snsure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/nazir/ws_moveit/install/lib/python2.7/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/nazir/ws_moveit/install/lib/python2.7/dist-packages:/home/nazir/ws_moveit/build/rosserial_python/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/nazir/ws_moveit/build/rosserial_python" \
    "/usr/bin/python" \
    "/home/nazir/ws_moveit/src/rosserial/rosserial_python/setup.py" \
    build --build-base "/home/nazir/ws_moveit/build/rosserial_python" \
    install \
    $DESTDIR_ARG \
    --install-layout=deb --prefix="/home/nazir/ws_moveit/install" --install-scripts="/home/nazir/ws_moveit/install/bin"
