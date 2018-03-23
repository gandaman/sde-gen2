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
capicxx-core-tools:   artifacts/capicxx-core-tools
capicxx-dbus-tools:   artifacts/capicxx-dbus-tools
capicxx-someip-tools: artifacts/capicxx-someip-tools
capicxx-wamp-tools:   artifacts/capicxx-wamp-tools
dlt-viewer:           artifacts/dlt-viewer
eclipse:              artifacts/eclipse
sdk:                  artifacts/sdk
qt:                   artifacts/qt
qtcreator:            artifacts/qtcreator
sde:                  staging


# Rules for how to build artifacts. Most of these just delegate
# to build/<componentname>
#
# The Make setup depends on that material/component timestamp is older
# than # artifact/component timestamp to determine if rebuilding is necessary.
# Therefore build scripts are required to only provide results in artifacts/ if
# the build was fully successful.

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

artifacts/sdk: material/sdk
	build/sdk && touch $@


#dlt-viewer: ../artifacts/dlt-viewer
#	./dlt-viewer
