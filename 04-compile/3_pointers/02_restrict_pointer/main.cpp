// void func(int *__restrict a, int *__restrict b, int *__restrict c) {
//     *c = *a;
//     *c = *b;
// }
void func(int *__restrict a, int *__restrict b, int *__restrict c) {
    *c = *a;
    *c = *b;
}