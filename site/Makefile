
TARGET = dest

PAGES = about contributors conventions docs/index download/index future index links lkmb/index

SOURCES = $(addprefix src/,$(addsuffix .html.wml,$(PAGES)))

DESTS = $(patsubst src/%.html.wml,$(TARGET)/%.html,$(SOURCES))

RAW_FILES = style.css clan_small.png
RAW_FILES_SOURCES = $(addprefix src/,$(RAW_FILES))
RAW_FILES_DEST = $(addprefix $(TARGET)/,$(RAW_FILES))

PODS = $(addprefix docs/,roadmap spec whitepaper version-0.2-spec)
PODS_DESTS_HTMLS = $(patsubst %,$(TARGET)/%.html,$(PODS))
PODS_DESTS_PODS = $(patsubst %,$(TARGET)/%.pod,$(PODS))

PACKAGES_DIR = $(TARGET)/download/arcs
# PACKAGES = $(shell cd temp && cd lk-module-compiler-final && ls)
PACKAGES =
PACKAGES_DESTS = $(addprefix $(PACKAGES_DIR)/,$(PACKAGES))

SUBDIRS = docs download download/arcs lkmb

SUBDIRS_DEST = $(addprefix $(TARGET)/,$(SUBDIRS))

WML_FLAGS += --passoption=2,-X --passoption=7,"-S imgsize" -DROOT~.

RSYNC = rsync --progress --verbose --rsh=ssh

all: dest $(SUBDIRS_DEST) $(DESTS) $(RAW_FILES_DEST) $(PODS_DESTS) $(PODS_DESTS_HTMLS) $(PACKAGES_DESTS)


dest:
	if [ ! -e $@ ] ; then mkdir $@ ; fi

$(DESTS) :: $(TARGET)/% : src/%.wml template.wml
	(cd src && wml $(WML_FLAGS) -DFILENAME=$(patsubst src/%.wml,%,$<) $(patsubst src/%,%,$<)) > $@

$(RAW_FILES_DEST) :: $(TARGET)/% : src/%
	cp -f $< $@

$(SUBDIRS_DEST) :: % : unchanged
	if [ ! -e $@ ] ; then mkdir $@ ; fi

$(PODS_DESTS) :: $(TARGET)/% : src/%
	cp -f $< $@

$(PODS_DESTS_HTMLS) :: $(TARGET)/%.html : src/%.pod
	pod2xhtml < $< > $@

$(PACKAGES_DESTS) :: $(PACKAGES_DIR)/% : ./temp/lk-module-compiler-final/%
	cp -f $< $@

UPLOAD_URL := hostgator:domains/fc-solve/public_html/CLAN/

upload: all
	( cd dest && $(RSYNC) -r * $(UPLOAD_URL) )
