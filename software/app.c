#include <stdio.h> 
#include <stdlib.h>
#include <string.h>
#include <memory.h>

#include "PCIE.h"

//MAX BUFFER FOR DMA
#define MAXDMA 20

//BASE ADDRESS FOR CONTROL REGISTER
#define CRA 				0x00000000

#define RWSIZE (32 / 8)

//	----------	Address parameters	------------

//BASE ADDRESS TO SDRAM
#define SDRAM 				0x08000000

//	Start byte address
#define START_BYTE_ADDR 	0x00000000
//	Start byte
#define START_BYTE 			0xF00BF00B
//	Stop byte address
#define STOP_BYTE_ADDR 		0x00000000
//	Stop byte
#define STOP_BYTE 			0xDEADF00B
//	Copy Byte
#define COPY_BYTE			0x00000017
//	Next Byte
#define NEXT_BYTE			0x00000013
//	Last Pixel Byte
#define LASTPIX_BYTE		0x00000019
//	Error Byte
#define ERROR_BYTE 			0x00000069

// Status Byte  CSR Register 1
#define STATUS_BYTE_ADDR 0x00000004
// Status Byte  CSR Register 2
#define DATA_BYTE_ADDR 0x00000008
//	Input image base address
#define INP_IMG_START_ADDR 	0x09000000
//	Input image end address
#define INP_IMG_END_ADDR 	0x0912C000

PCIE_BAR pcie_bars[] = { PCIE_BAR0, PCIE_BAR1 , PCIE_BAR2 , PCIE_BAR3 , PCIE_BAR4 , PCIE_BAR5 };

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
    WORD  width;  //specifies width in pixels
    WORD dummy2;  //species height in pixels
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

void test32		( PCIE_HANDLE hPCIe, DWORD addr );
void testDMA	( PCIE_HANDLE hPCIe, DWORD addr);

BOOL WriteStartByte		(PCIE_HANDLE hPCIe);
BOOL ClearStartByte		(PCIE_HANDLE hPCIe);
BOOL ClearStatusByte	(PCIE_HANDLE hPCIe);
BOOL ClearDataWord		(PCIE_HANDLE hPCIe);

BYTE checkStatus		(PCIE_HANDLE hPCIe);
BOOL WriteStatus		(PCIE_HANDLE hPCIe, DWORD status);
BOOL WriteData			(PCIE_HANDLE hPCIe, DWORD data);

unsigned char * loadImage	(char *filename, BITMAPINFOHEADER *info);
unsigned char * loadColorImage  (char *filename, BITMAPINFOHEADER *info);

BOOL WriteInfo2			(PCIE_HANDLE hPCIe, BITMAPINFOHEADER *info);
BOOL checkImageDone		(PCIE_HANDLE hPCIe);

BOOL clearMem			(PCIE_HANDLE hPCIe, BITMAPINFOHEADER *info);
BOOL NewReadImage		(PCIE_HANDLE hPCIe, BITMAPINFOHEADER *info);

void DemoMyWay 			(PCIE_HANDLE hPCIe, char *filename, char imageType);
void DemoMyWayImage		(char *filename);

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
	if (strcmp("-i",input)==0)
	{
		//	Start main process
		DemoMyWayImage(argv[2]);
		return 0;

	}

	//	------------	PCIE stuff	------------
	else
	{
	//	Init library handle
	void *lib_handle;
	PCIE_HANDLE hPCIe;

	//	Load PCIE library handle
	lib_handle = PCIE_Load();

	//	Check PCIE library load
	if (!lib_handle)
	{
		printf("PCIE_Load failed\n");
		return 0;
	}

	//	Open PCIE handle
	hPCIe = PCIE_Open(0,0,0);

	//	Check PCIE handle
	if (!hPCIe)
	{
		printf("PCIE_Open failed\n");
		return 0;
	}

	//	------------	Arg Parsing	------------
	
	//	Check arguments

	if (strcmp("-c",input)==0)
	{
		//	Start main process
		DemoMyWay(hPCIe, argv[2], 'c');
		//Demo(hPCIe, argv[2]);
	}
	else if (strcmp("-g",input)==0)
	{
		//	Start main process
		DemoMyWay(hPCIe, argv[2], 'g');
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
}

//	------------	MAIN PROCESS	------------

void DemoMyWayImage(char *filename)
{
	BITMAPINFOHEADER info;
	unsigned char * imageDataBuffer;
	imageDataBuffer = loadColorImage(filename, &info);
	long int i, index;
	index = 0;
	unsigned char zero = 0;
	DWORD pixelValue;
	for (i = 0; i <(640)*(480); ++i)
	{
		pixelValue =  ( (zero << 24) | (imageDataBuffer[index] << 16) | (imageDataBuffer[index+1] << 8) | (imageDataBuffer[index+2] << 0) );
		printf("%ld %hx\n", i, pixelValue);
		index = index + 3;
	}
	free(imageDataBuffer);
}

void DemoMyWay(PCIE_HANDLE hPCIe, char *filename, char imageType)
{
	
	//	Clear start byte
	printf("\nClearing start byte from SDRAM\n");
	if(!ClearStartByte(hPCIe))
		return;

		//	Clear status byte
	printf("\nClearing  status byte from SDRAM\n");
	if(!ClearStatusByte(hPCIe))
		return;

		//	Clear data word
	printf("\nClearing data word from SDRAM\n");
	if(!ClearDataWord(hPCIe))
		return;

	//	Write start byte to start image processing
	printf("\nWriting start byte to SDRAM\n");
	if(!WriteStartByte(hPCIe))
		return;

	//	------------	Store image data into buffer	------------

	printf("Loading image into buffer\n");
	BITMAPINFOHEADER info;
	unsigned char * imageDataBuffer;
	imageDataBuffer = loadColorImage(filename, &info);

	long int i, index = 0;
	DWORD pixelValue;
	unsigned char zero = 0;
	// Test Image
	//for (i = 0; i <(640)*(480); ++i)
	//{
	//	pixelValue =  ( (imageDataBuffer[index] << 24) | (imageDataBuffer[index] << 16) | (imageDataBuffer[index+1] << 8) | (imageDataBuffer[index+2] << 0) );
	//	printf("%ld %hx\n", i, pixelValue);
	//	index = index + 3;
	//}

	//int a;
	//printf("Hello: ");
	//scanf("%d", &a);
	//index = 0;
	printf("Image loaded into buffer\n");

	//	------------	Writing image to the FPGA	------------

	
	
	for (i = 0; i <(640)*(480); ++i)
	{
		pixelValue =  ( (zero << 24) | (imageDataBuffer[index] << 16) | (imageDataBuffer[index+1] << 8) | (imageDataBuffer[index+2] << 0) );
		//printf("%ld %hx\n", i, pixelValue);
		index = index + 3;
		//	Check for write to slave register
		if(!WriteData(hPCIe, pixelValue)) return;
		//	Write COPY BYTE to status slave register
		if(!WriteStatus(hPCIe, COPY_BYTE)) return;
		//	Check for NEXT BYTE status
		while(checkStatus(hPCIe) != 0x13);
	}
	//	Write LAST PIX status
	if(!WriteStatus(hPCIe, LASTPIX_BYTE)) return;

	//	------------	Done writing image, checking stop byte form FPGA	------------

	printf("\nChecking for stop byte!\n");

	//	Check for stop byte done
	while(!checkImageDone(hPCIe));
	printf("\nProcessing finished.\n");
	//free(imageDataBuffer);
	
}

// Clear STARTBYTE in SDRAM
BOOL ClearStartByte( PCIE_HANDLE hPCIe )
{
	DWORD addr 	= 	START_BYTE_ADDR;
	DWORD clear 	= 	0x00;

	BOOL bPass 	= 	PCIE_Write32( hPCIe, pcie_bars[0], addr, clear );

	//	Check success
	if( !bPass )
	{
		printf( "ERROR: unsuccessful clearing start byte.\n" );
		return FALSE;
	}
	else
		printf( "Start byte cleared!\n" );

	return TRUE;
}

// Clear StatusBYTE in SDRAM
BOOL ClearStatusByte( PCIE_HANDLE hPCIe )
{
	DWORD addr 	= 	STATUS_BYTE_ADDR;
	DWORD clear 	= 	0x00;

	BOOL bPass 	= 	PCIE_Write32( hPCIe, pcie_bars[0], addr, clear );

	//	Check success
	if( !bPass )
	{
		printf( "ERROR: unsuccessful clearing status byte.\n" );
		return FALSE;
	}
	else
		printf( "Status byte cleared!\n" );

	return TRUE;
}


// Clear DATAWORD in SDRAM
BOOL ClearDataWord( PCIE_HANDLE hPCIe )
{
	DWORD addr 	= 	DATA_BYTE_ADDR;
	DWORD clear 	= 	0x00;

	BOOL bPass 	= 	PCIE_Write32( hPCIe, pcie_bars[0], addr, clear );

	//	Check success
	if( !bPass )
	{
		printf( "ERROR: unsuccessful clearing data word.\n" );
		return FALSE;
	}
	else
		printf( "Data word cleared!\n" );

	return TRUE;
}

BOOL WriteData( PCIE_HANDLE hPCIe, DWORD data )
{
	DWORD addr 	= 	DATA_BYTE_ADDR;

	BOOL bPass 	= 	PCIE_Write32( hPCIe, pcie_bars[0], addr, data );

	//	Check success
	if( !bPass )
	{
		printf( "ERROR: unsuccessful writing data %x.\n", data );
		return FALSE;
	}
	else
	{
		//printf( "data %x written.\n", data );
	}
	return TRUE;
}

BOOL WriteStatus( PCIE_HANDLE hPCIe, DWORD status )
{
	DWORD addr 	= 	STATUS_BYTE_ADDR;

	BOOL bPass 	= 	PCIE_Write32( hPCIe, pcie_bars[0], addr, status);

	//	Check success
	if( !bPass )
	{
		printf( "ERROR: unsuccessful writing status %x.\n", status );
		return FALSE;
	}
	else
	{
		//printf( "Status %x written.\n", status );
	}
	return TRUE;
}

BYTE checkStatus(PCIE_HANDLE hPCIe)
{
   BYTE b;
   DWORD addr = STATUS_BYTE_ADDR;
   BOOL bPass = PCIE_Read8( hPCIe, pcie_bars[0], addr, &b);

    if(bPass)
    {
   	 return b;
    }
    else
	{
		printf("Status read failed\n");
		return ERROR_BYTE;
	}
}

// Write STARTBYTE in SDRAM
BOOL WriteStartByte( PCIE_HANDLE hPCIe )
{
	DWORD addr 	= 	START_BYTE_ADDR;
	DWORD start 	= 	0x00000053;

	BOOL bPass 	= 	PCIE_Write32( hPCIe, pcie_bars[0], addr, start );

	//	Check success
	if( !bPass )
	{
		printf( "ERROR: unsuccessful start byte writing.\n" );
		return FALSE;
	}
	else
		printf( "Start byte written.\n" );

	return TRUE;
}

// Load the image field to buffer
unsigned char * loadColorImage(char *filename, BITMAPINFOHEADER *info)
{
	FILE * pFile;
 	pFile = fopen(filename,"rb");
	BITMAPFILEHEADER bitmapFileHeader; 
  	fread(&bitmapFileHeader, sizeof(BITMAPFILEHEADER),1,pFile);
	//read the info header
	fread(info, sizeof(BITMAPINFOHEADER),1,pFile);

	unsigned char *imageDataBuffer;
	imageDataBuffer = (unsigned char*)malloc(640*480*3*sizeof(unsigned char));

	unsigned char *imageDataBufferInv;
	imageDataBufferInv = (unsigned char*)malloc(640*480*3*sizeof(unsigned char));

	fread(imageDataBuffer,640*480*3*sizeof(unsigned char),1,pFile);


	if (!imageDataBuffer)
   	{
        	free(imageDataBuffer);
        	fclose(pFile);
			printf("Image loading failed.\n");
        	
    }

    long int i;
    long int j = 640 * 480 * 3 - 1;
    for( i = 0; i < 640*480*3; i+=3 )
    {
    	imageDataBufferInv[j-2] = imageDataBuffer[i]; 
    	imageDataBufferInv[j-1] = imageDataBuffer[i+2];  
    	imageDataBufferInv[j] = imageDataBuffer[i+1]; 
    	j -= 3;  
    }

    int rowSize = 640 * 3;

    for( i = 0; i < 480; i++ )	//	Every row
    {	
    	for( j = 0; j < rowSize; j += 3 )	//	For every pixel in row
    	{
    		//	First in row 		= 	Last - 2 in row
    		imageDataBuffer[ i * rowSize + j ] 		= 	imageDataBufferInv[ ( i + 1 ) * rowSize - j - 1 - 2 ];
    		imageDataBuffer[ i * rowSize + j + 1 ] 	= 	imageDataBufferInv[ ( i + 1 ) * rowSize - j - 1 - 1 ];
    		imageDataBuffer[ i * rowSize + j + 2 ] 	= 	imageDataBufferInv[ ( i + 1 ) * rowSize - j - 1 ];
    	}
    }

    // long int ba1;
    // long int ba2;

    // for(i = 0 ; i < 480; i++)
    // {
    // 	for (j = 0; j < 320; j++)
    // 	{
    // 		ba1 = (i*640 + j)*3;
    // 		ba2 = (i*640 + (639 - j))*3 - 2;
    		
    // 		imageDataBuffer[ba1]     = imageDataBufferInv[ba2];
   	// 		imageDataBuffer[ba2]     = imageDataBufferInv[ba1];
   	// 		ba1++; ba2++;
    // 		imageDataBuffer[ba1]     = imageDataBufferInv[ba2];
   	// 		imageDataBuffer[ba2]     = imageDataBufferInv[ba1];
   	// 		ba1++; ba2++;
    // 		imageDataBuffer[ba1]     = imageDataBufferInv[ba2];
   	// 		imageDataBuffer[ba2]     = imageDataBufferInv[ba1];
    // 	}
    // }

	
	free( imageDataBufferInv );

	return imageDataBuffer;
}

// Load the image field to buffer
unsigned char * loadImage(char *filename, BITMAPINFOHEADER *info)
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
		imageDataBuffer[index++] = bitmapImage[i];
		imageDataBuffer[index++] = bitmapImage[i];
		imageDataBuffer[index++] = bitmapImage[i];
	}
	
	free(bitmapImage);
	return imageDataBuffer;
}

// Check whether an image is finished by looking for STOPBYTE in slave register[0]
BOOL checkImageDone(PCIE_HANDLE hPCIe)
{
   BYTE b;
   DWORD addr = 0x00000000;
   BOOL bPass = PCIE_Read8( hPCIe, pcie_bars[0], addr, &b);
   BYTE check = 0x12;

   if(bPass)
   {
		if(b == check)
		{
			//printf("Image done\n");
			return TRUE;
		}
		else
		{
			//printf("Image not done yet\n");
			return FALSE;
		}
   }

   return FALSE;
}
