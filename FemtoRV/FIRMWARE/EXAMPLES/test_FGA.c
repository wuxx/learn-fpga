#include <femtorv32.h>

int main() {
  int frame=0;
  uint16_t* graph_mem = (uint16_t *)(1 << 21);
  
  for(;;) { 
    uint16_t* graph_ptr = graph_mem;
    for(int y=0; y<200; ++y) {
      for(int x=0; x<320; ++x) {
	uint32_t R = (x+frame) & 63;
	uint32_t G = (x >> 3)  & 63;
	uint32_t B = (y+frame) & 63;
	*graph_ptr = GL_RGB(R<<3,G<<3,B<<3);
	graph_ptr++;
      }
    }
    ++frame;
  }
  
  return 0;
}
