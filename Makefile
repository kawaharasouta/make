VPATH = src
CPPFLAGS = -I include

count_words: count_words.o counter.o lexer.o -lfl
	gcc $(CPPFLAGS) $^ -o $@

count_words.o: count_words.c include/counter.h
	gcc $(CPPFLAGS) -c $<

counter.o: counter.c include/counter.h include/lexer.h
	gcc $(CPPFLAGS) -c $<

lexer.o: lexer.c include/lexer.h
	gcc $(CPPFLAGS) -c $<

lexer.c: lexer.l
	flex -t $< > $@

.PHONY: install clean
install:
	cp count_words /home/khwarizmi/bin/

clean: 
	rm /home/khwarizmi/bin/count_words
