#include <stdio.h>
#include <string.h>

void parcurgere(FILE *fp, FILE *ot) {
    char buffer[803];
    int i = 1;
    while(fgets(buffer, 803, fp)) {
        buffer[strcspn(buffer, "\n")] = 0;
        fprintf(ot, "%d => \"%s\",\n", i, buffer);
        i++;
    }
}

int main() {
    FILE *fp = fopen("input.txt", "r");
    FILE *ot = fopen("output.txt", "w");
    parcurgere(fp, ot);
    return 0;
}
