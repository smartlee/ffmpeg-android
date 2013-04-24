#ifndef _TEST_H_LEE
#define _TEST_H_LEE

int jl_h264_init(int handle);


int jl_h264_decode(int handle,char *data,int data_len,
			char *out_data,int *width,int *height);


int jl_release(handle);






#endif

