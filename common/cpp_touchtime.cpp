//
//  The MIT License (MIT)
//
//  Copyright (c) 2013 Jim Heising (HAARD) http://www.haardsystems.com
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"),
//  to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense,
//  and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
//  IN THE SOFTWARE.
//

#include "cpp_touchtime.h"
#import <iostream>

#ifdef __cplusplus
extern "C" {
#endif
#include "timelib.h"
#ifdef __cplusplus
}
#endif

long CPPTouchTime::stringToUnixTimestamp(const std::string& timeString, const std::string& currentTimezoneName)
{
    // Get our timezone from the built-in database
    timelib_tzinfo *tzi = timelib_parse_tzfile((char*)currentTimezoneName.c_str(), timelib_builtin_db());
    
    if(!tzi)
    {
        return -1;
    }
    
    timelib_error_container* error = NULL;
    
    // Get our current time in the passed in timezone
    timelib_time* now = timelib_time_ctor();
    now->tz_info = tzi;
    now->zone_type = TIMELIB_ZONETYPE_ID;
    timelib_unixtime2local(now, (timelib_sll) time(NULL));
    
    // Parse the time string
    timelib_time* parsed_time = timelib_strtotime((char*)timeString.c_str(), (int)timeString.length(), &error, timelib_builtin_db(), NULL);
    
    if (error->error_count)
    {
        timelib_tzinfo_dtor(tzi);
        timelib_time_dtor(now);
		timelib_error_container_dtor(error);
		return -1;
	}
    
    timelib_fill_holes(parsed_time, now, TIMELIB_NO_CLONE);
    timelib_update_ts(parsed_time, tzi);
    
    int error2 = 0;
    long ts = timelib_date_to_int(parsed_time, &error2);
    
    timelib_error_container_dtor(error);
    timelib_tzinfo_dtor(tzi);
    timelib_time_dtor(parsed_time);
    timelib_time_dtor(now);
    
    if(error2)
        return -1;
    else
        return ts;
}

