#include <stdio.h> 
#include <stdlib.h>
#include <string.h>
#include <memory.h>
#include "PCIE.h"



typedef struct tagBITMAPFILEHEADER
{
    WORD bfType;  //specifies the file type
    DWORD bfSize;  //specifies the size in bytes of the bitmap file
    WORD bfReserved1;  //reserved; must be 0
    WORD bfReserved2;  //reserved; must be 0
    DWORD bOffBits;  //species the offset in bytes from the bitmapfileheader to the bitmap bits
}BITMAPFILEHEADER;

typedef struct tagBITMAPINFOHEADER
{
    WORD dummy1;  //specifies the number of bytes required by the struct
    /*signed int*/ WORD  width;  //specifies width in pixels
    /*signed int*/ WORD dummy2;  //species height in pixels
    WORD height;
    DWORD dummy3;
    WORD biPlanes; //specifies the number of color planes, must be 1
    WORD biBitCount; //specifies the number of bit per pixel
    DWORD biCompression;//spcifies the type of compression
    DWORD biSizeImage;  //size of image in bytes
    signed int biXPelsPerMeter;  //number of pixels per meter in x axis
    signed int biYPelsPerMeter;  //number of pixels per meter in y axis
    DWORD biClrUsed;  //number of colors used by th ebitmap
    DWORD biClrImportant;  //number of colors that are important
}BITMAPINFOHEADER;

void readImage(char *filename);
void loadImage(char *filename, BITMAPINFOHEADER *info);

int main( int argc, char *argv[])
{
	//	Check number of arguments
	if(argc != 3 && argc != 2)
	{
	 	printf("Wrong command. Use **./app -h** for help.\n");
	 	return 0;
	}
	char* input = argv[1];
	//	Demo

	//	------------	Arg Parsing	------------

	if (strcmp("-d",input)==0)
	{
		//	Start main process
		readImage(argv[2]);
		//Demo(hPCIe, argv[2]);
	}
	//	Help Message
	else if(strcmp("-h",input)==0)
	{
		printf("Use **./app -d <imagefilename>** to start demo.\n");	
	}
	//	Error Message
	else {
		printf("Wrong command. Use **./app -h** for help.\n");
	}
	
	return 0;
}


void readImage(char *filename)
{

	//	------------	Store image data into buffer	------------

	printf("Loading image into buffer\n");
	BITMAPINFOHEADER info;
	unsigned char * imageDataBuffer;
	loadImage(filename, &info);
	long int index;
	index = 0;
	printf("Image loaded into buffer\n");

	//	------------	Writing image to the FPGA	------------

	//	------------	Done writing image, checking stop byte form FPGA	------------
	printf("\nProcessing finished.\n");
	
}


// Load the image field to buffer
void loadImage(char *filename, BITMAPINFOHEADER *info)
{
	FILE * pFile;
 	pFile = fopen(filename,"rb");
	BITMAPFILEHEADER bitmapFileHeader; 
  	fread(&bitmapFileHeader, sizeof(BITMAPFILEHEADER),1,pFile);
	//read the info header
	fread(info, sizeof(BITMAPINFOHEADER),1,pFile);

	unsigned char *bitmapImage;//image buffer
	bitmapImage = (unsigned char*)malloc(info->width*info->height*sizeof(unsigned char));
	if (!bitmapImage)
   	{
        	free(bitmapImage);
        	fclose(pFile);
			printf("Image loading failed.\n");
    }

	printf("Image loaded.\n");

	//	Read in the bitmap image data into bitmapImage buffer
  	fread(bitmapImage,info->width*info->height*sizeof(unsigned char),1,pFile);
	
	//	Padded image buffer
	unsigned char *imageDataBuffer;
	imageDataBuffer = (unsigned char*)malloc(640*480*4*sizeof(unsigned char));
	int index = 0;
	int i,j;

	for( i = 0; i < 640; i++ )
	{
		for( j = 0; j < 480; j++ )
		{
			printf("%d ", bitmapImage[i] );
		}
		printf( "\n" );
	}


	printf( "Printing final buffer now \n\n\n\n" );

	//	Clear image buffer
	for (i = 0; i <640 * 480; ++i)
	{
		imageDataBuffer[index++] = 0;
		imageDataBuffer[index++] = 0;
		imageDataBuffer[index++] = 0;
		imageDataBuffer[index++] = 0;
	}
	index = 0;

	//	Fill image buffer
	for (i = 0; i <info->width*info->height; ++i)
	{
		imageDataBuffer[index++] = 0;
		imageDataBuffer[index++] = bitmapImage[i++];
		imageDataBuffer[index++] = bitmapImage[i++];
		imageDataBuffer[index++] = bitmapImage[i];
	}


	for( i = 0; i < 640*3; i++ )
	{
		for( j = 0; j < 480; j++ )
		{
			printf("%d ", imageDataBuffer[i] );
		}
		printf( "\n" );
	}

	
	free(bitmapImage);
}
