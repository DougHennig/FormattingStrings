# Formatting Strings

In his [String.Format for Visual FoxPro](https://saltydogllc.com/string-format-for-visual-foxpro/) blog post, Eric Selje presented a program for formatting strings like the String.Format method in .NET. I won't repeat his rationale here; you can read about it yourself. Suffice to say, it saves a lot of typing TRANSFORM() statements and is *much* easier to read.

I adapted his idea and added support for [C# string interpolation](https://learn.microsoft.com/en-us/dotnet/csharp/tutorials/string-interpolation), which is more concise and easier to read than String.Format syntax.

## Using Format.prg

Simply add Format.prg to your project and call it as necessary.

## Syntax

You can call Format.prg with either String.Format-like syntax or string interpolation syntax. In both cases, the first parameter is an expression containing placeholders delimited with ```{}``` for values that are inserted at runtime. The placeholders can include format strings. Use "\r" in the expression for a carriage return (CHR(13)) and "\n" for a linefeed (CHR(10)). If you want to use "\r", "\n", "{", or "}" as literals, escape them with "\\" (for example, "\\\r" to include "\\r" in the expression without adding a carriage return).

### String.Format

The expression contains numbered placeholders, starting with {0}. Each placeholder is replaced with the appropriate parameter: {0} is replaced with the first parameter following the expression (the second parameter passed to Format.prg), {1} is replaced with the next one, and so on. Here's an example:

```
lcUser    = alltrim(substr(sys(0), at('#', sys(0)) + 1))
lnBalance = 12.3456
wait window Format('The balance for {0} on {1} is {2}', lcUser, datetime(), lnBalance)
```

This displays something like "The balance for dhenn on 12/16/2023 8:23:53 AM is 12.3456".

### Interpolation

The placeholders contain expressions that are evaluated and replaced with the result. Here's an example:

```
wait window Format('The balance for {lcUser} on {datetime()} is {lnBalance}')
```

Notice how more concise and easier to read this is, yet it displays the same result as the String.Format example.

The expressions in the placeholders must be visible to Format.prg:

* Variables must be private or public, not local.
* You can't use an expression like This.SomeProperty or Thisform.SomeMethod(). Instead, copy the result of the expression to a variable and use the variable in the placeholder.

## Format strings

You can specify how each parameter should be formatted by adding ":" and a format string after the placeholder number or expression. For example:

```
wait window Format('The balance for {0} on {1:F} is {2:C2}', lcUser, datetime(), lnBalance)
wait window Format('The balance for {lcUser} on {datetime():F} is {lnBalance:C2}')
```

"F" for the datetime parameter specifies a full long datetime and C2 for the numeric parameter specifies a currency format with two decimal places. Both statements display something like "The balance for dhenn on December 16, 2023 8:23:53 AM is $12.35".

See the [Format string component](https://learn.microsoft.com/en-us/dotnet/standard/base-types/composite-formatting#format-string-component) section of the [Composite Formatting](https://learn.microsoft.com/en-us/dotnet/standard/base-types/composite-formatting) article for details on format strings. Note that not all format strings are available: only datetime (with the exception of the O format) and numeric (with the exception of the B, E, G, and R formats) format strings are supported.

## Release History

### 2023-12-16

* Initial release.
