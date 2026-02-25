int other(int a);

// 生成call，因为还需要回来+1
int func1() { return other(233) + 1; }

// 开03生成jmp，因为这是最后一句，已经不需要回来了
int func2() { return other(233); }
