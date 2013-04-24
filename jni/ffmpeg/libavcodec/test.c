//#include <stdlib.h>
//#include <stdio.h>
//#include <string.h>
//#include <math.h>
#include "dsputil.h"
#include "h264.h"
#include "avcodec.h"
#include "test.h"

#ifdef HAVE_AV_CONFIG_H
#undef HAVE_AV_CONFIG_H
#endif

extern  AVCodec ff_h264_decoder;

int jl_h264_init(int handle)
{
    AVCodecContext *context =(AVCodecContext *)handle;

    
    
    AVCodec *codec = &ff_h264_decoder;
    avcodec_init();
    context= avcodec_alloc_context();
    if(codec->capabilities&CODEC_CAP_TRUNCATED)
        context->flags|= CODEC_FLAG_TRUNCATED;
    if (avcodec_open(context, codec) < 0) 
    {
       return -1;
    }
    {
	   
	H264Context *h = context->priv_data;
        MpegEncContext *s = &h->s;
        s->dsp.idct_permutation_type =1;
	dsputil_init(&s->dsp, context);
    }
    return 0;
}

int jl_h264_decode(int handle,char *data,int data_len,char *out_data,int *width,int *height)
{
    AVCodecContext *context=(AVCodecContext *)handle;
    int got_picture;
    int len;
    AVPacket packet;
    packet.data=(unsigned char *)data;
    packet.size=data_len;
    AVFrame *picture=NULL;
    picture= avcodec_alloc_frame();
    len = avcodec_decode_video2(context, picture, &got_picture,
                                      &packet );
    if (len < 0) 
    {
	        return -1;
    }
      
    if (got_picture)
	{
        out_data =picture->data[0];
        *width=context->width;
        *height=context->height;
        
  		if (len ==0)
  		{
  			len = avcodec_decode_video2(context, picture, &got_picture,&packet);
  			if (len < 0) 
  			{
                return -1;
  			}
  			if (got_picture)
  			{
                 out_data =picture->data[0];
                 *width=context->width;
                 *height=context->height;
  			}
  		}
  	}	
    av_free(picture);
    return 0; 
}
int jl_h264_release(int handle)
{
    AVCodecContext *context=(AVCodecContext *)handle;
    avcodec_close(context);
    av_free(context);
}
