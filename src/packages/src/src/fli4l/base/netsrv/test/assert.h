/**
 * @file    test/assert.h
 * Simple assertion macro.
 * @author  Christoph Schulz
 * @since   2009-01-20
 * @version $Id: assert.h 24102 2012-10-21 07:28:16Z kristov $
 */

#ifndef INC_NETSRV_TEST_ASSERT_H_
#define INC_NETSRV_TEST_ASSERT_H_

#define ASSERT(expr, rc) \
	if (!(expr)) { fprintf (stderr, "[%d] %s\n", __LINE__, # expr); return rc; }

#endif
