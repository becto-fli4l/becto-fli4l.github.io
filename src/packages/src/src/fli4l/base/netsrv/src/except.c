/**
 * @file    src/except.c
 * NetSrv: Error handling.
 * @author  Christoph Schulz
 * @since   2009-01-20
 * @version $Id: except.c 24102 2012-10-21 07:28:16Z kristov $
 */

#include "netsrv/error.h"
#include <stdio.h>

const char netsrv_msg_exception_slots_exhaused [] =
	"netsrv: Exception cannot be thrown since all exception slots are in use.\n"
	"netsrv: Please recompile netsrv with NETSRV_MAX_NESTED_EXCEPTIONS being\n"
	"netsrv: set to at least %d.\n";
