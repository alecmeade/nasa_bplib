
main : main.o rb_tree.o crc.o ut_assert.o ut_rb_tree.o ut_crc.o
	cc -o main main.o rb_tree.o crc.o ut_assert.o ut_rb_tree.o ut_crc.o

main.o : main.c ut_rb_tree.h ut_crc.h ut_assert.h
	cc -c main.c

rb_tree.o : rb_tree.c rb_tree.h
	cc -c rb_tree.c

crc.o : crc.c crc.h
	cc -c crc.c

ut_assert.o : ut_assert.c ut_assert.h
	cc -c ut_assert.c

ut_rb_tree.o: ut_rb_tree.c ut_rb_tree.h
	cc -c ut_rb_tree.c

ut_crc.o: crc.o ut_crc.c ut_crc.h
	cc -c ut_crc.c

clean:
	rm rb_tree.o rm crc.o