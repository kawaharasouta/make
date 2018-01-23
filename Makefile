#VPATH = src
CC = gcc
LEX = flex
vpath %.c src
vpath %.l src
vpath %.h include
CPPFLAGS = -I include

#Dependency
count_words: counter.o lexer.o -lfl
count_words.o: counter.h
counter.o: counter.h lexer.h
lexer.o: lexer.h

#Production rule
#%.o: %.c
.c.o:
	$(COMPILE.c) $(OUTPUT_OPTION) $<
#%.c: %.l
.l.c:
	@$(RM) $@
	$(LEX.l) $< > $@
#%: %.o
.o:
	$(LINK.o) $^ $(LOADLIBES) $(LDLIBS) -o $@

#Pseudo target
.PHONY: install remove clean
install:
	cp count_words /home/khwarizmi/bin/
remove: 
	rm /home/khwarizmi/bin/count_words
clean:
	rm *.o
