#
# GENIVI Development Platform
# Software Developmpent Environment (SDE) Makefile
# (C) 2018 GENIVI Alliance
# License: MPLv2

# vim: ts=8 noexpandtab

# Components
all:    \
	capicxx-core-tools \
	capicxx-dbus-tools \
	capicxx-someip-tools \
	d-feet \
	dlt-viewer \
	eclipse \
	sdk \
	qt
	qtcreator \
	sde

# FIXME:capicxx-wamp-tools \

clean:
	@echo "Are you sure?  If so run make cleanall"

cleanall:
	rm -rf artifacts/*


# Helpers to allow doing just make "component" and simplify the all: target
capicxx-core-tools:        artifacts/capicxx-core-tools
capicxx-dbus-tools:        artifacts/capicxx-dbus-tools
capicxx-someip-tools:      artifacts/capicxx-someip-tools
capicxx-wamp-tools:        artifacts/capicxx-wamp-tools
d-feet:                    artifacts/d-feet
dlt-viewer:                artifacts/dlt-viewer
eclipse:                   artifacts/eclipse
sdk:                       artifacts/sdk
qt:                        artifacts/qt
qtcreator:                 artifacts/qtcreator
sde:                       staging
sdk/minnowboard:           artifacts/sdk/minnowboard
sdk/raspberrypi2:          artifacts/sdk/raspberrypi2
sdk/raspberrypi3:          artifacts/sdk/raspberrypi3
sdk/dragonboard-410c:      artifacts/sdk/dragonboard-410c
sdk/r-car-m3-starter-kit:  artifacts/sdk/r-car-m3-starter-kit
sdk/r-car-h3-starter-kit:  artifacts/sdk/r-car-h3-starter-kit

#dlt-viewer

# Rules for how to build artifacts. Most of these just delegate
# to build/<componentname>
#
# The Make setup depends on that material/component timestamp is older
# than # artifact/component timestamp to determine if rebuilding is necessary.
# Therefore build scripts are required to only provide results in artifacts/ if
# the build was fully successful.

artifacts/d-feet:
	build/d-feet && touch $@

artifacts/dlt-viewer: material/dlt-viewer
	build/dlt-viewer && touch $@

artifacts/capicxx-core-tools: material/capicxx-core-tools
	build/capicxx-core-tools && touch $@

artifacts/capicxx-dbus-tools: material/capicxx-dbus-tools
	build/capicxx-dbus-tools && touch $@

artifacts/capicxx-someip-tools: material/capicxx-someip-tools
	build/capicxx-someip-tools && touch $@

#artifacts/capicxx-wamp-tools: material/capicxx-wamp-tools
#	build/capicxx-wamp-tools && touch $@

artifacts/eclipse: material/eclipse
	build/eclipse && touch $@

# artifacts/qt is never populated since we do a system install to /usr/ or
# /opt instead.  However, the touch will run if successful and leave a file
# that prevents repeating the build
artifacts/qt: material/qt
	build/qt && touch $@

artifacts/qtcreator:
	build/qtcreator && touch $@

artifacts/sdk/dragonboard-410c:      material/dragonboard-410c
	export TARGET=dragonboard-410c && build/sdk && touch $@

artifacts/sdk/minnowboard: material/sdk
	export TARGET=minnowboard && build/sdk && touch $@

artifacts/sdk/raspberrypi2: material/sdk
	export TARGET=raspberrypi2 && build/sdk && touch $@

artifacts/sdk/raspberrypi3: material/sdk
	export TARGET=raspberrypi3 && build/sdk && touch $@

artifacts/sdk/r-car-m3-starter-kit: material/sdk
	export TARGET=r-car-m3-starter-kit && build/sdk && touch $@

artifacts/sdk/r-car-h3-starter-kit: material/sdk
	export TARGET=r-car-h3-starter-kit && build/sdk && touch $@

#dlt-viewer: ../artifacts/dlt-viewer
#	./dlt-viewer
