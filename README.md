Multiple Alphabet Encryption - Ruby Gem
===============

Encryption class made into a Ruby Gem. Multi alphabet encryption works by encrypting data across multiple alphabets to make it more obscure, these alphabets are then saved as a key file so the data can later be recovered.

###Usage:

```
require 'Multi-Alphabet-Encryption'
```
  Include the gem in your current application
  
  
```
encryption = Encrypt.new

```
  Access the Multi-Alphabet-Encryption gem.

```
generate_encryption_key("key_file_location_and_name.txt", 30)
```
  Create a new encryption key, pass 2 parameters. One is the location of your key file and the other is the   strength   aka how many alphabets are used. Note do not include more that your data's length as its just a waste of space.
  
```
encrypted_data = encryption.encrypt("Hello and welcome")
```
  Simply pass the text via 1 parameter and the gem will do the rest


```
decrypted_data = encryption.decrypt(encrypted_data)
```
  Pass the encrypted data and the gem will do the rest.
  
  
##Sample Output:

###Key:
```
2x#X51etz]DYc6CuMk."vWa!,mHNlhJ}~@7pKwjRUFqn[r)dO9s<;8Zi&BQ*|\f-4P^3bEL_{+g=V0:%ST G('£$>yIA?o/
7UP.:LZ$XC}'=zbwc%!Il#{V3Q;~^OyG-,](gJ)p<£Em2d\fNM&|86n"?1T0K9xBYa45Fu_Drj*[R@/iv>k+he otsqASHW
0+LHJf7geR)$k"84lD!tV?#j;FmS}%<c£P[ZEpWN|d'uxa@\hBq:X*1YGAoMvwQ2.6I=-n^U&sCK]/39 {>(Ti,O_b5zry~
v$9oX56:<{ 7~m[)Ug&^*'VLHF#_£nN"i]u|-xT=lRGA.SjPz4Wed@0Da}h>JZKEpb/,%rw(yOk?238tICq;cB+QYs!M1f\
' da4LerW5IqlTf2{y]?p7!(n>0&Bx<j=6QY\c/N)mS-%8^9C~U+Rsw1KPogF*J.vtX,bZOzu£|A#h}H"kD$ME;@V:i3_[G
```

###Encrypted Message:
```
#Message = Hello this is a ruby gem.

#Encrypted = typx)fdPu%f]xK0fm@_Uf-<Tv

```
