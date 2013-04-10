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

#import "TouchTime.h"
#import "cpp_touchtime.h"

@implementation TouchTime

#define NSSTRING_2_STDSTRING(nsString) std::string((const char*)[nsString cStringUsingEncoding:NSUTF8StringEncoding])

+(NSDate*)stringToDate:(NSString*)string
{
    std::string stdString = NSSTRING_2_STDSTRING(string);
    std::string tzName = NSSTRING_2_STDSTRING([[NSTimeZone systemTimeZone] name]);
    
    int unixTimestamp = CPPTouchTime::stringToUnixTimestamp(stdString, tzName);
    
    if(unixTimestamp == -1)
        return nil;
    
    return [NSDate dateWithTimeIntervalSince1970:unixTimestamp];
}

@end
