
NAME = clan_spec

POD_RESULTS = $(NAME).txt $(NAME).html $(NAME).1
POD_RESULTS_WITH_SOURCE = $(POD_RESULTS) $(NAME).pod

all: $(POD_RESULTS)

$(NAME).txt: $(NAME).pod
	pod2text $< > $@

$(NAME).1: $(NAME).pod
	pod2man $< > $@

$(NAME).html: $(NAME).pod
	pod2html $< > $@

man: all
	nroff -man $(NAME).1 | less -r

upload: all
	rsync -r --progress -v $(POD_RESULTS_WITH_SOURCE) --rsh=ssh shlomif@shell.berlios.de:/home/groups/fc-solve/htdocs/clan/spec/

