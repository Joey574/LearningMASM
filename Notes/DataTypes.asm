.data

; ===== DATA TYPES ======>

t1a DB 255 ; Max value for a signed 8 bit, 1 byte value
t1b DB -255 ; Min value for a signed 8 bit, 1 byte value

t2a DW 65535 ; Max value for a signed 16 bit, 2 byte value (word)
t2b DW -65535 ; Min value for a signed 16 bit, 2 byte value (word)

t3a DD 4294967295 ; Max value for a signed 32 bit, 4 byte value (double word)
t3b DD -4294967295 ; Min value for a signed 32 bit, 4 byte value (double word)

t4a DF 281474976710655 ; Max value for a signed 48 bit, 6 byte value (F word)
t4b DF -281474976710655 ; Min value for a signed 48 bit, 6 byte value (F word)

t5a DQ 18446744073709551615 ; Max value for a signed 64 bit, 8 byte value (quad word)
t5b DQ -18446744073709551615 ; Min value for a signed 64 bit, 8 byte value (quad word)

t6a DT 1208925819614629174706175 ; Max value for a signed 80 bit, 10 byte value (T word)
t6b DT -1208925819614629174706175 ; Min value for a signed 80 bit, 10 byte value (T word)

t7a sbyte -255 ; Initializes a signed byte, from what I can tell db defaults to being signed as well idk why
t7b sword -65535 ; Initializes a signed DW (word) same as above
t7c sdword -4294967295 ; Initializes a signed DD (double word) same as above
t7d sqword -18446744073709551615 ; Initializes a signed DQ (duad word) same as above

; <===== DATA TYPES ======

.code

DataTypes PROC


	ret

	DataTypes ENDP
	END