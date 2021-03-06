#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
#

#
# Copyright (c) 2018, Joyent, Inc.
#

#
# Tools
#
NODE			= node
NPM			= npm

#
# Files
#
JS_FILES	 = bin/dates
JSL_CONF_NODE	 = tools/jsl.node.conf
JSL_FILES_NODE   = $(JS_FILES)
JSSTYLE_FILES	 = $(JS_FILES)
JSON_FILES	 = package.json

CLEAN_FILES	+= node_modules
all:
	$(NPM) install

include ./tools/mk/Makefile.targ
