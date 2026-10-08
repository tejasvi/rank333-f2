/* bin7enc: R22N.Bin7 encoder (stdin -> stdout): 7 payload bits per ASCII char, little-endian bit stream, zero-padded. */
#include <stdio.h>
#include <stdint.h>
int main(void){ static unsigned char in[1<<20], out[(1<<20)*8/7+16]; uint64_t acc=0; int nb=0; size_t n;
  while((n=fread(in,1,sizeof in,stdin))>0){ size_t o=0;
    for(size_t i=0;i<n;i++){ acc|=(uint64_t)in[i]<<nb; nb+=8; while(nb>=7){ out[o++]=acc&127; acc>>=7; nb-=7; } }
    fwrite(out,1,o,stdout); }
  if(nb){ unsigned char c=acc&127; fwrite(&c,1,1,stdout); } return 0; }
