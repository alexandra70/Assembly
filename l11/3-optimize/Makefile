all: optimize ce

optimize: optimize.c
	gcc -m32 -o optimize optimize.c

ce: ce.c
	gcc -m32 -o ce ce.c

clean:
	rm -f optimize ce
