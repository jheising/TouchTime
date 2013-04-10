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

#import "TouchTimeTests.h"
#import "TouchTime.h"

@implementation TouchTimeTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testDates
{
    //TODO: Connect tests up to this. At least you can debug and try it out.
    NSDate* parsedDate;
    
    parsedDate = [TouchTime stringToDate:@"2008/06/30"];
    parsedDate = [TouchTime stringToDate:@"08-06-30"];
    parsedDate = [TouchTime stringToDate:@"30-June 2008"];
    parsedDate = [TouchTime stringToDate:@"22DEC78"];
    parsedDate = [TouchTime stringToDate:@"10/Oct/2000:13:55:36 -0700"];
    parsedDate = [TouchTime stringToDate:@"2008:08:07 18:11:31"];
    parsedDate = [TouchTime stringToDate:@"2008-W28"];
    parsedDate = [TouchTime stringToDate:@"2008-07-01T22:35:17.03+08:00"];
    parsedDate = [TouchTime stringToDate:@"@1215282385"];
    parsedDate = [TouchTime stringToDate:@"2008-7-1T9:3:37"];
    parsedDate = [TouchTime stringToDate:@"2 months 5 days ago"];
    
    
    //STFail(@"Unit tests are not implemented yet in TouchTimeTests");
}

@end
