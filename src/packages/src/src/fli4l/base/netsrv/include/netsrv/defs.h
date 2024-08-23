/**
 * @file    include/netsrv/defs.h
 * NetSrv: General definitions.
 * @author  Christoph Schulz
 * @since   2009-03-21
 * @version $Id: defs.h 24102 2012-10-21 07:28:16Z kristov $
 */

#ifndef INC_NETSRV_DEFS_H_
#define INC_NETSRV_DEFS_H_

#include <stddef.h>

/**
 * The library version.
 */
#define NETSRV_VERSION "netsrv v1.1"

/**
 * Suppresses compiler warnings about unused parameters or variables.
 * @param var
 *   A variable or parameter which is otherwise not used.
 * @note
 *   This macro should not generate any additional code.
 */
#define UNUSED(var) (void) &var

#endif
