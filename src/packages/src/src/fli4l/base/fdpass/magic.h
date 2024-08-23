/**
 * @file    magic.h
 * Definition of IPC key.
 * @author  Christoph Schulz
 * @since   2015-02-16
 * @version $Id: magic.h 37118 2015-02-17 07:02:59Z kristov $
 */

/// Used for inter-process communication.
#define MAGIC ((((unsigned) 'C') << 8) + (unsigned) 'S')
