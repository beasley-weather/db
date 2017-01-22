CC		  := gcc
CFLAGS	  := -Wall -g
INC		  := -I include
LIBS	  := -l sqlite3
TEST_LIBS := -l criterion


DIRS := bin


all: bin bin/test_structs bin/test_db_create bin/test_db_insert

bin:
	mkdir $@

bin/test_structs: test/test_structs.c src/db.c
	$(CC) $(CFLAGS) $(INC) $(LIBS) $(TEST_LIBS) $^ -o $@

bin/test_db_create: test/test_db_create.c src/db.c
	$(CC) $(CFLAGS) $(INC) $(LIBS) $(TEST_LIBS) $^ -o $@

bin/test_db_insert: test/test_db_insert.c src/db.c
	$(CC) $(CFLAGS) $(INC) $(LIBS) $(TEST_LIBS) $^ -o $@

clean:
	rm -rf bin/*
