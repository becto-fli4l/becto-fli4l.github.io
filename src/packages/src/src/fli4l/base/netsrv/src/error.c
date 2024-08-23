/**
 * @file    src/error.c
 * NetSrv: Error handling.
 * @author  Christoph Schulz
 * @since   2004-11-08
 * @version $Id: error.c 24102 2012-10-21 07:28:16Z kristov $
 */

#include "netsrv/error.h"
#include <stdio.h>

int
netsrv_scerror (const char *message, int errorcode)
{
	perror (message);
	return errorcode;
}

int
netsrv_error (const char *message, int errorcode)
{
	fprintf (stderr, "%s\n", message);
	return errorcode;
}
