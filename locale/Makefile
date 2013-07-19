# if it fails, try make clean;export LANG=en_US.utf8;make
#   -lynX
#
LANG=en_US.utf8
PATH:=$(PATH):/opt/rocketwiki/

DIRS = help
HTML_SOURCE := $(foreach DIR,$(DIRS),$(wildcard $(DIR)/*.txt))
HTML_HELP := $(HTML_SOURCE:.txt=.txt.html)
TARGET = all


%.txt.html: %.txt
	rocketwiki-lqfb < $< > $@


help_html: $(HTML_HELP)

clean:
	rm -f $(HTML_HELP)

all: help_html

