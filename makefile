
main: main.c 
	cc -c main.c 

rb_tree.o: rb_tree/rb_tree.c rb_tree/rb_tree.h
	cc -c rb_tree/rb_tree.c

crc.o : crc/crc.c crc/crc.h
	cc -c crc/crc.c

assert.o : unittest/ut_assert.c unittest/ut_assert.h
	cc -c unittest/ut_assert.c

test.o : unittest/unittest.c unittest/unittest.h
	cc -c unittest/unittest.c

clean :
	rm main.o rb_tree.o crc.o assert.o test.o
