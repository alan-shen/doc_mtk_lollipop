#include <stddef.h>

void d()
{
	char *p = NULL;
	*p = 0x323; /* ±¿¿£ */
}

void c()
{
	int var4 = 6;
}

void b()
{
	int var3 = 3;
	c();
	d();
}

void a()
{
	int var1, var2;
	var1 = 1;
}

int main(int argc, char *argv[])
{
	int var0 = 4;
	a();
	b();

	return 0;
}
