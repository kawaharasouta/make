#VPATH = src
vpath %.c src
vpath %.l src
vpath %.h include
CPPFLAGS = -I include

count_words: count_words.o counter.o lexer.o -lfl
	gcc $(CPPFLAGS) $^ -o $@

count_words.o: count_words.c counter.h
	gcc $(CPPFLAGS) -c $<

counter.o: counter.c counter.h lexer.h
	gcc $(CPPFLAGS) -c $<

lexer.o: lexer.c include/lexer.h
	gcc $(CPPFLAGS) -c $<

lexer.c: lexer.l
	flex -t $< > $@

.PHONY: install remove clean
install:
	cp count_words /home/khwarizmi/bin/

remove: 
	rm /home/khwarizmi/bin/count_words

clean:
	rm *.o
	rm *.c
