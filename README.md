# TouchTime

An Objective-C class library for iOS that will parse a veritable cornucopia of formatted and unformatted (natural language) date and time strings and magically turn them into an NSDate. The conversion routines are based on the code provided in the powerful _strtotime_ function in PHP 5.4.

For information on the PHP _strtotime_ function, see http://php.net/manual/en/function.strtotime.php.

## examples

    NSDate* myDate = [TouchTime stringToDate:@"2008/06/30"];
    myDate = [TouchTime stringToDate:@"08-06-30"];`
    myDate = [TouchTime stringToDate:@"30-June 2008"];
    myDate = [TouchTime stringToDate:@"22DEC78"];`
    myDate = [TouchTime stringToDate:@"10/Oct/2000:13:55:36 -0700"];`
    myDate = [TouchTime stringToDate:@"2008:08:07 18:11:31"];`
    myDate = [TouchTime stringToDate:@"2008-W28"];`
    myDate = [TouchTime stringToDate:@"2008-07-01T22:35:17.03+08:00"];`
    myDate = [TouchTime stringToDate:@"@1215282385"];`
    myDate = [TouchTime stringToDate:@"2008-7-1T9:3:37"];`
    myDate = [TouchTime stringToDate:@"2 months 5 days ago"];`
    myDate = [TouchTime stringToDate:@"+5 days"];`
    myDate = [TouchTime stringToDate:@"last day of next month"];`
    myDate = [TouchTime stringToDate:@"Monday next week"];`
    myDate = [TouchTime stringToDate:@"second month"];`
    myDate = [TouchTime stringToDate:@"first day of January 2008"];`
    myDate = [TouchTime stringToDate:@"5PM"];`

For a detailed list of formats supported by the PHP _strtotime_ function, see http://www.php.net/manual/en/datetime.formats.php.

If you like what you see, don't hesitate to show your love via twitter and [tweet me](https://twitter.com/jimheising).