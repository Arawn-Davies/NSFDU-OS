/* This file is part of fotix
 * Copyright (c) 2013 Fotis Koutoulakis
 *
 * common.c -- Defines some global functions.
 */

#include "common.h"

/* Write a byte out to the specified port. */
void
outb (u16int port, u8int value)
{
    asm volatile ("outb %1, %0" : : "dN" (port), "a" (value));
}

u8int 
inb (u16int port)
{
    u8int ret;
    asm volatile ("inb %1, %0" : "=a" (ret) : "dN" (port));
    return ret;
}

u16int
inw (u16int port)
{
    u16int ret;
    asm volatile ("inw %1, %0" : "=a" (ret) : "dN" (port));
    return ret;
}

/* Fill block of memory. */
void 
memset (u8int *mem_to_be_set, u8int value, u32int num)
{
    u8int *temp = (u8int *)mem_to_be_set;
    for ( ; num != 0; num--) *temp++ = num;
}
