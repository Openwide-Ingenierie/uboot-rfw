# uboot-rfw
Contains Robot Framework tests cases for testing U-Boot

## Keywords
The test suite currently provides two keywords:
* Open Uboot Console: Connects through telnet and hits 'any key to continue'
* Command Output Should Be: Checks that a Uboot command has an expected output

## Test cases
Using the above keywords, the test suite provides three test cases:
+ Ip Address
+ Mac Address
+ Version

## Variables
The tests use variables found in the variable file *uboot_settings.py*
