#include "unittest.h"
#include "rb_tree.h"
#include "crc.h"

int main(int arc, const char* argv[])
{
    bplib_unittest_crc();
    bplib_unittest_rb_tree();
}
