/************************************************************************
Lab 9 Nios Software

Dong Kai Wang, Fall 2017
Christine Chen, Fall 2013

For use with ECE 385 Experiment 9
University of Illinois ECE Department
************************************************************************/

#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#include "aes.h"



// Pointer to base address of AES module, make sure it matches Qsys
volatile unsigned int * AES_PTR = (unsigned int *) 0x00000100;


// Execution mode: 0 for testing, 1 for benchmarking
int run_mode = 0;

/** charToHex
 *  Convert a single character to the 4-bit value it represents.
 *  
 *  Input: a character c (e.g. 'A')
 *  Output: converted 4-bit value (e.g. 0xA)
 */
char charToHex(char c)
{
	char hex = c;

	if (hex >= '0' && hex <= '9')
		hex -= '0';
	else if (hex >= 'A' && hex <= 'F')
	{
		hex -= 'A';
		hex += 10;
	}
	else if (hex >= 'a' && hex <= 'f')
	{
		hex -= 'a';
		hex += 10;
	}
	return hex;
}

/** charsToHex
 *  Convert two characters to byte value it represents.
 *  Inputs must be 0-9, A-F, or a-f.
 *  
 *  Input: two characters c1 and c2 (e.g. 'A' and '7')
 *  Output: converted byte value (e.g. 0xA7)
 */
char charsToHex(char c1, char c2)
{
	char hex1 = charToHex(c1);
	char hex2 = charToHex(c2);
	return (hex1 << 4) + hex2;
}

/** encrypt
 *  Perform AES encryption in software.
 *
 *  Input: msg_ascii - Pointer to 32x 8-bit char array that contains the input message in ASCII format
 *         key_ascii - Pointer to 32x 8-bit char array that contains the input key in ASCII format
 *  Output:  msg_enc - Pointer to 4x 32-bit int array that contains the encrypted message
 *               key - Pointer to 4x 32-bit int array that contains the input key
 */

void printMatrix(unsigned char(*w)[4]){
	int i;
	for(i=0; i<4; i++){
		printf("%2x %2x %2x %2x\n", w[i][0],  w[i][1],  w[i][2], w[i][3]);
	}
}


void AddRoundKey(unsigned char(*state)[4], unsigned char(*w)[4])
{
	int i, j;
	for(i=0; i<4; i++){
		for(j=0; j<4; j++){
			state[i][j] = state[i][j] ^ w[i][j];
		}
	}
}

void SubBytes(unsigned char(*state)[4]){
	int i, j;
	for(i=0; i<4; i++){
		for(j=0; j<4; j++){
			state[i][j] = aes_sbox[state[i][j]];
		}
	}
}

void ShiftRows(unsigned char(*state)[4]){
	unsigned char temp0[4] = {state[0][0], state[0][1], state[0][2], state[0][3]};
	unsigned char temp1[4] = {state[1][1], state[1][2], state[1][3], state[1][0]};
	unsigned char temp2[4] = {state[2][2], state[2][3], state[2][0], state[2][1]};
	unsigned char temp3[4] = {state[3][3], state[3][0], state[3][1], state[3][2]};
int i; 
	for (i=0;i<4;i++) {
		state[0][i] = temp0[i];
	}
	for (i=0;i<4;i++) {
		state[1][i] = temp1[i];
	}
	for (i=0;i<4;i++) {
		state[2][i] = temp2[i];
	}
	for (i=0;i<4;i++) {
		state[3][i] = temp3[i];
	}

}

void MixColumns(unsigned char(*state)[4]){
	unsigned char currCol[4];
	unsigned char resCol[4]; // result Col

	int i, j;
	for(j=0;j<4;j++){

		for(i=0; i<4; i++){
			currCol[i] = state[i][j];
		}

		// determine the current column
		// 2->index 0
		// 3->index 1

		resCol[0] = gf_mul[currCol[0]][0] ^ gf_mul[currCol[1]][1] ^ currCol[2] ^ currCol[3];
		resCol[1] = currCol[0] ^ gf_mul[currCol[1]][0] ^ gf_mul[currCol[2]][1] ^ currCol[3];
		resCol[2] = currCol[0] ^ currCol[1] ^ gf_mul[currCol[2]][0] ^ gf_mul[currCol[3]][1];
		resCol[3] = gf_mul[currCol[0]][1] ^ currCol[1] ^ currCol[2] ^ gf_mul[currCol[3]][0];


		// update the values of the whole column in the state
		for(i=0; i<4; i++){
			state[i][j] = resCol[i];
		}
	}
}

void KeyExpansion(unsigned char(*w)[4][4])
{
	int key;
	int word;
	int byte;
	unsigned char temp[4];
	unsigned char tempbyte;
	unsigned char tempm[11][4][4];
	for (key = 1; key < 11; key++){
		for (word = 0; word < 4; word++){
			if (word == 0){
				for (byte = 0; byte < 4; byte++){					//rotword begin
					temp[byte] = w[key-1][3][byte];
				}
				tempbyte = temp[0];
				for (byte = 0; byte < 3; byte++){
					temp[byte] = temp[byte + 1];
				}
				temp[3] = tempbyte;									//rotword end

				for (byte = 0; byte < 4; byte++){					//subword begin
					temp[byte] = aes_sbox[temp[byte]];
				}													//subword end

				temp[0] = temp[0]^(Rcon[key]>>24);
				temp[1]	= temp[1]^((Rcon[key]<<8)>>24);
				temp[2] = temp[2]^((Rcon[key]<<16)>>24);
				temp[3] = temp[3]^((Rcon[key]<<24)>>24);			//xor with Rcon
			}
			else{
				for (byte = 0; byte < 4; byte++){					//temp for word 1-3
					temp[byte] = w[key][word-1][byte];
				}
			}
			for (byte = 0; byte < 4; byte++){
				w[key][word][byte] = temp[byte]^w[key-1][word][byte]; //xor with temp
			}
		}
	}
	for (key = 0; key < 11; key ++){
		for (word = 0 ; word < 4; word ++){
			for (byte = 0; byte <4; byte ++){
				tempm[key][byte][word] = w[key][word][byte];
			}
		}
	}
	for (key = 0; key < 11; key ++){
		for (word = 0 ; word < 4; word ++){
			for (byte = 0; byte <4; byte ++){
				w[key][word][byte] = tempm[key][word][byte];
			}
		}
	}
//	for (key = 0; key < 11; key ++){
//		printMatrix(w[key]);
//	}
}


// ece298dcece298dcece298dcece298dc
// 000102030405060708090a0b0c0d0e0f
void encrypt(unsigned char * msg_ascii, unsigned char * key_ascii, unsigned int * msg_enc, unsigned int * key)
{
	// Implement this function

	int i,j,index;
	unsigned char w[11][4][4];
	unsigned char state[4][4];
	for (i=0;i<4;i++) {
		for (j=0;j<4;j++) {
			index = i*2+j*8; // store vertically
			w[0][j][i] = charsToHex(key_ascii[index],key_ascii[index+1]); // 16 * 8-bit
			state[i][j] = charsToHex(msg_ascii[index],msg_ascii[index+1]); // 16 * 8-bit
		}
	}

	printMatrix(state);
	KeyExpansion(w);


	AddRoundKey(state, w[0]);

	for(i=0;i<9;i++){
		// printf("State at start of round# %d\n", i+1);
		// printMatrix(state);

		SubBytes(state);
		ShiftRows(state);
		MixColumns(state);
		AddRoundKey(state, w[i+1]);

	}

	SubBytes(state);
	ShiftRows(state);
	AddRoundKey(state, w[10]);

	// printf("FINAL_STATE");
	// printMatrix(state);
	for (i=0;i<4;i++){
		msg_enc[i] = (state[0][i]<<24) ^ (state[1][i]<<16) ^ (state[2][i]<<8) ^ (state[3][i]);
		key[i] = (w[0][0][i]<<24) ^ (w[0][1][i]<<16) ^ (w[0][2][i]<<8) ^ (w[0][3][i]);
	}
}


/** decrypt
 *  Perform AES decryption in hardware.
 *
 *  Input:  msg_enc - Pointer to 4x 32-bit int array that contains the encrypted message
 *              key - Pointer to 4x 32-bit int array that contains the input key
 *  Output: msg_dec - Pointer to 4x 32-bit int array that contains the decrypted message
 */
void decrypt(unsigned int * msg_enc, unsigned int * msg_dec, unsigned int * key)
{
	// Implement this function
	// Send the 128-bit Key (Split into 4* 32-bit)
	AES_PTR[0] = key[0];
	AES_PTR[1] = key[1];
	AES_PTR[2] = key[2];
	AES_PTR[3] = key[3];
	AES_PTR[4] = msg_enc[0];
	AES_PTR[5] = msg_enc[1];
	AES_PTR[6] = msg_enc[2];
	AES_PTR[7] = msg_enc[3];

	AES_PTR[14] = 1;
	while(AES_PTR[15] == 0){}
	msg_dec[0] = AES_PTR[8];
	msg_dec[1] = AES_PTR[9];
	msg_dec[2] = AES_PTR[10];
	msg_dec[3] = AES_PTR[11];
	AES_PTR[14] = 0;
}

/** main
 *  Allows the user to enter the message, key, and select execution mode
 *
 */
int main()
{
	// Input Message and Key as 32x 8-bit ASCII Characters ([33] is for NULL terminator)
	unsigned char msg_ascii[33];
	unsigned char key_ascii[33];
	// Key, Encrypted Message, and Decrypted Message in 4x 32-bit Format to facilitate Read/Write to Hardware
	unsigned int key[4];
	unsigned int msg_enc[4];
	unsigned int msg_dec[4];


	AES_PTR[10] = 0xDEADBEEF;
	if (AES_PTR[10] != 0xDEADBEEF)
		printf("Error !");
	else
		printf("No Error for Week1 !");


	printf("Select execution mode: 0 for testing, 1 for benchmarking: ");
	scanf("%d", &run_mode);

	if (run_mode == 0) {
		// Continuously Perform Encryption and Decryption
		while (1) {
			int i = 0;
			printf("\nEnter Message:\n");
			scanf("%s", msg_ascii);
			printf("\n");
			printf("\nEnter Key:\n");
			scanf("%s", key_ascii);
			printf("\n");
			encrypt(msg_ascii, key_ascii, msg_enc, key);
			printf("\nEncrpted message is: \n");
			for(i = 0; i < 4; i++){
				printf("%08x", msg_enc[i]);
			}
			printf("\n");
			decrypt(msg_enc, msg_dec, key);
			printf("\nDecrypted message is: \n");
			for(i = 0; i < 4; i++){
				printf("%08x", msg_dec[i]);
			}
			printf("\n");
		}
	}
	else {
		// Run the Benchmark
		int i = 0;
		int size_KB = 2;
		// Choose a random Plaintext and Key
		for (i = 0; i < 32; i++) {
			msg_ascii[i] = 'a';
			key_ascii[i] = 'b';
		}
		// Run Encryption
		clock_t begin = clock();
		for (i = 0; i < size_KB * 64; i++)
			encrypt(msg_ascii, key_ascii, msg_enc, key);
		clock_t end = clock();
		double time_spent = (double)(end - begin) / CLOCKS_PER_SEC;
		double speed = size_KB / time_spent;
		printf("Software Encryption Speed: %f KB/s \n", speed);
		// Run Decryption
		begin = clock();
		for (i = 0; i < size_KB * 64; i++)
			decrypt(msg_enc, msg_dec, key);
		end = clock();
		time_spent = (double)(end - begin) / CLOCKS_PER_SEC;
		speed = size_KB / time_spent;
		printf("Hardware Encryption Speed: %f KB/s \n", speed);
	}
	return 0;
}
