FasdUAS 1.101.10   ��   ��    k             l      ��  ��   --------------------------------------------Outlook Exchange Setup 5.0
� Copyright 2008-2015 William Smith
bill@officeformachelp.com

Except where otherwise noted, this work is licensed under
http://creativecommons.org/licenses/by/4.0/

This file accompanies four files for assisting a user with configuring
an Exchange account in Microsoft Outlook 2016 for Mac:

1. Outlook Exchange Setup 5.1.0.scpt
2. OutlookExchangeSetupLaunchAgent.sh
3. net.talkingmoose.OutlookExchangeSetupLaunchAgent.plist
4. com.microsoft.Outlook.plist for creating a configuraiton profile

These scripts and files may be freely modified for personal or commercial
purposes but may not be republished for profit without prior consent.

If you find these resources useful or have ideas for improving them,
please let me know. It is only compatible with Outlook 2016 for Mac.--------------------------------------------This script assists administrators with creating an Apple Installer
package for deploying the necessary files for Outlook Exchange Setup 5.0.

     � 	 	&   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  O u t l o o k   E x c h a n g e   S e t u p   5 . 0 
 �   C o p y r i g h t   2 0 0 8 - 2 0 1 5   W i l l i a m   S m i t h 
 b i l l @ o f f i c e f o r m a c h e l p . c o m 
 
 E x c e p t   w h e r e   o t h e r w i s e   n o t e d ,   t h i s   w o r k   i s   l i c e n s e d   u n d e r 
 h t t p : / / c r e a t i v e c o m m o n s . o r g / l i c e n s e s / b y / 4 . 0 / 
 
 T h i s   f i l e   a c c o m p a n i e s   f o u r   f i l e s   f o r   a s s i s t i n g   a   u s e r   w i t h   c o n f i g u r i n g 
 a n   E x c h a n g e   a c c o u n t   i n   M i c r o s o f t   O u t l o o k   2 0 1 6   f o r   M a c : 
 
 1 .   O u t l o o k   E x c h a n g e   S e t u p   5 . 1 . 0 . s c p t 
 2 .   O u t l o o k E x c h a n g e S e t u p L a u n c h A g e n t . s h 
 3 .   n e t . t a l k i n g m o o s e . O u t l o o k E x c h a n g e S e t u p L a u n c h A g e n t . p l i s t 
 4 .   c o m . m i c r o s o f t . O u t l o o k . p l i s t   f o r   c r e a t i n g   a   c o n f i g u r a i t o n   p r o f i l e 
 
 T h e s e   s c r i p t s   a n d   f i l e s   m a y   b e   f r e e l y   m o d i f i e d   f o r   p e r s o n a l   o r   c o m m e r c i a l 
 p u r p o s e s   b u t   m a y   n o t   b e   r e p u b l i s h e d   f o r   p r o f i t   w i t h o u t   p r i o r   c o n s e n t . 
 
 I f   y o u   f i n d   t h e s e   r e s o u r c e s   u s e f u l   o r   h a v e   i d e a s   f o r   i m p r o v i n g   t h e m , 
 p l e a s e   l e t   m e   k n o w .   I t   i s   o n l y   c o m p a t i b l e   w i t h   O u t l o o k   2 0 1 6   f o r   M a c .   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -   T h i s   s c r i p t   a s s i s t s   a d m i n i s t r a t o r s   w i t h   c r e a t i n g   a n   A p p l e   I n s t a l l e r 
 p a c k a g e   f o r   d e p l o y i n g   t h e   n e c e s s a r y   f i l e s   f o r   O u t l o o k   E x c h a n g e   S e t u p   5 . 0 .  
 
   
  
 l     ��������  ��  ��        l     ��  ��    !  prompt for package details     �   6   p r o m p t   f o r   p a c k a g e   d e t a i l s      l    + ����  r     +    n     '    1   # '��
�� 
ttxt  l    # ����  I    #��  
�� .sysodlogaskr        TEXT  m        �   , N a m e   y o u r   i n s t a l l e r . . .  ��  
�� 
dtxt  m       �     $ C o n f i g u r e _ O u t l o o k -  �� ! "
�� 
disp ! 4    �� #
�� 
file # l    $���� $ b     % & % l    '���� ' I   �� ( )
�� .earsffdralis        afdr ( m     * *�                                                                                  xins  alis    �  Macintosh HD               �\	'H+  ��Installer.app                                                  �t����:        ����  	                CoreServices    �\Ag      ��z    ������  9Macintosh HD:System: Library: CoreServices: Installer.app     I n s t a l l e r . a p p    M a c i n t o s h   H D  )System/Library/CoreServices/Installer.app   / ��   ) �� +��
�� 
rtyp + m    	��
�� 
TEXT��  ��  ��   & m     , , � - - > C o n t e n t s : R e s o u r c e s : p a c k a g e . i c n s��  ��   " �� . /
�� 
btns . J     0 0  1 2 1 m     3 3 � 4 4  C a n c e l 2  5�� 5 m     6 6 � 7 7  N e x t��   / �� 8 9
�� 
dflt 8 J     : :  ;�� ; m     < < � = =  N e x t��   9 �� >��
�� 
appr > m     ? ? � @ @ , P a c k a g e   f o r   D e p l o y m e n t��  ��  ��    o      ���� 0 packagename packageName��  ��     A B A l     ��������  ��  ��   B  C D C l  , o E���� E r   , o F G F n   , k H I H 1   g k��
�� 
ttxt I l  , g J���� J I  , g�� K L
�� .sysodlogaskr        TEXT K m   , / M M � N N X E n t e r   y o u r   i n s t a l l e r   p a c k a g e ' s   i d e n t i f i e r . . . L �� O P
�� 
dtxt O b   0 ? Q R Q b   0 7 S T S m   0 3 U U � V V * c o m . c o m c a s t . c a b l e . c e s T m   3 6 W W � X X  . R l  7 > Y���� Y n   7 > Z [ Z 2   : >��
�� 
cwor [ o   7 :���� 0 packagename packageName��  ��   P �� \ ]
�� 
disp \ 4   @ N�� ^
�� 
file ^ l  B M _���� _ b   B M ` a ` l  B I b���� b I  B I�� c d
�� .earsffdralis        afdr c m   B C e e�                                                                                  xins  alis    �  Macintosh HD               �\	'H+  ��Installer.app                                                  �t����:        ����  	                CoreServices    �\Ag      ��z    ������  9Macintosh HD:System: Library: CoreServices: Installer.app     I n s t a l l e r . a p p    M a c i n t o s h   H D  )System/Library/CoreServices/Installer.app   / ��   d �� f��
�� 
rtyp f m   D E��
�� 
TEXT��  ��  ��   a m   I L g g � h h > C o n t e n t s : R e s o u r c e s : p a c k a g e . i c n s��  ��   ] �� i j
�� 
btns i J   O W k k  l m l m   O R n n � o o  C a n c e l m  p�� p m   R U q q � r r  N e x t��   j �� s t
�� 
dflt s J   X ] u u  v�� v m   X [ w w � x x  N e x t��   t �� y��
�� 
appr y m   ^ a z z � { { , P a c k a g e   f o r   D e p l o y m e n t��  ��  ��   G o      ���� &0 packageidentifier packageIdentifier��  ��   D  | } | l     ��������  ��  ��   }  ~  ~ l  p � ����� � r   p � � � � n   p � � � � 2   � ���
�� 
cwor � n   p � � � � 1   � ���
�� 
ttxt � l  p � ����� � I  p ��� � �
�� .sysodlogaskr        TEXT � m   p s � � � � � X E n t e r   a   v e r s i o n   n u m b e r   f o r   y o u r   i n s t a l l e r . . . � �� � �
�� 
dtxt � m   t w � � � � � 
 1 . 0 . 0 � �� � �
�� 
disp � 4   x ��� �
�� 
file � l  z � ����� � b   z � � � � l  z � ����� � I  z ��� � �
�� .earsffdralis        afdr � m   z { � ��                                                                                  xins  alis    �  Macintosh HD               �\	'H+  ��Installer.app                                                  �t����:        ����  	                CoreServices    �\Ag      ��z    ������  9Macintosh HD:System: Library: CoreServices: Installer.app     I n s t a l l e r . a p p    M a c i n t o s h   H D  )System/Library/CoreServices/Installer.app   / ��   � �� ���
�� 
rtyp � m   | }��
�� 
TEXT��  ��  ��   � m   � � � � � � � > C o n t e n t s : R e s o u r c e s : p a c k a g e . i c n s��  ��   � �� � �
�� 
btns � J   � � � �  � � � m   � � � � � � �  C a n c e l �  ��� � m   � � � � � � � 
 B u i l d��   � �� � �
�� 
dflt � J   � � � �  ��� � m   � � � � � � � 
 B u i l d��   � �� ���
�� 
appr � m   � � � � � � � , P a c k a g e   f o r   D e p l o y m e n t��  ��  ��   � o      ����  0 packageversion packageVersion��  ��     � � � l     ��������  ��  ��   �  � � � l     �� � ���   �   locate the ROOT folder    � � � � .   l o c a t e   t h e   R O O T   f o l d e r �  � � � l  � � ����� � r   � � � � � I  � ��� ���
�� .earsffdralis        afdr �  f   � ���   � o      ���� 0 
mylocation 
myLocation��  ��   �  � � � l     ��������  ��  ��   �  � � � l  � � ����� � O   � � � � � k   � � � �  � � � r   � � � � � b   � � � � � l  � � ����� � c   � � � � � n   � � � � � m   � ���
�� 
ctnr � o   � ����� 0 
mylocation 
myLocation � m   � ���
�� 
TEXT��  ��   � m   � � � � � � � 
 R O O T : � o      ���� 0 
rootfolder 
rootFolder �  ��� � Z   � � � ����� � =  � � � � � l  � � ����� � I  � ��� ���
�� .coredoexbool        obj  � 4   � ��� �
�� 
cfol � o   � ����� 0 
rootfolder 
rootFolder��  ��  ��   � m   � ���
�� boovfals � k   � � � �  � � � r   � � � � � I  � ����� �
�� .sysostflalis    ��� null��   � �� ���
�� 
prmp � m   � � � � � � � n S e l e c t   t h e   R O O T   f o l d e r   c o n t a i n i n g   f i l e s   f o r   d e p l o y m e n t .��   � o      ���� 0 
rootfolder 
rootFolder �  ��� � r   � � � � � c   � � � � � o   � ����� 0 
rootfolder 
rootFolder � m   � ���
�� 
TEXT � o      ���� 0 
rootfolder 
rootFolder��  ��  ��  ��   � m   � � � ��                                                                                  MACS  alis    t  Macintosh HD               �\	'H+  ��
Finder.app                                                     �f���2        ����  	                CoreServices    �\Ag      ��r    ������  6Macintosh HD:System: Library: CoreServices: Finder.app   
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��  ��  ��   �  � � � l     ��~�}�  �~  �}   �  � � � l  �	 ��|�{ � r   �	 � � � n   � � � � 1  �z
�z 
psxp � o   ��y�y 0 
rootfolder 
rootFolder � o      �x�x 0 rootpath rootPath�|  �{   �  � � � l 
" ��w�v � O  
" � � � r  ! � � � n   � � � 1  �u
�u 
psxp � l  ��t�s � c   � � � n   � � � m  �r
�r 
ctnr � o  �q�q 0 
mylocation 
myLocation � m  �p
�p 
TEXT�t  �s   � o      �o�o 0 myfolderpath myFolderPath � m  
  �                                                                                  MACS  alis    t  Macintosh HD               �\	'H+  ��
Finder.app                                                     �f���2        ����  	                CoreServices    �\Ag      ��r    ������  6Macintosh HD:System: Library: CoreServices: Finder.app   
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��  �w  �v   �  l     �n�m�l�n  �m  �l    l     �k�k     delete any hidden files    � 0   d e l e t e   a n y   h i d d e n   f i l e s 	 l #4
�j�i
 r  #4 c  #0 b  #. b  #* m  #& �  f i n d   ' o  &)�h�h 0 rootpath rootPath m  *- � 2 '   - n a m e   . D S _ S t o r e   - d e l e t e m  ./�g
�g 
TEXT o      �f�f  0 removedsstores removeDSStores�j  �i  	  l 5<�e�d I 5<�c�b
�c .sysoexecTEXT���     TEXT o  58�a�a  0 removedsstores removeDSStores�b  �e  �d    l     �`�_�^�`  �_  �^    l     �] �]     build the package     �!! $   b u i l d   t h e   p a c k a g e "#" l =r$�\�[$ r  =r%&% c  =n'(' b  =l)*) b  =h+,+ b  =d-.- b  =`/0/ b  =\121 b  =X343 b  =T565 b  =P787 b  =L9:9 b  =H;<; b  =D=>= m  =@?? �@@ . p k g b u i l d   - - i d e n t i f i e r   '> o  @C�Z�Z &0 packageidentifier packageIdentifier< m  DGAA �BB  '   - - v e r s i o n   ': o  HK�Y�Y  0 packageversion packageVersion8 m  LOCC �DD  '   - - s c r i p t s   '6 o  PS�X�X 0 myfolderpath myFolderPath4 m  TWEE �FF " S c r i p t s '   - - r o o t   '2 o  X[�W�W 0 rootpath rootPath0 m  \_GG �HH  '   '. o  `c�V�V 0 myfolderpath myFolderPath, o  dg�U�U 0 packagename packageName* m  hkII �JJ 
 . p k g '( m  lm�T
�T 
TEXT& o      �S�S 0 buildpackage buildPackage�\  �[  # KLK l     �R�Q�P�R  �Q  �P  L M�OM l s�N�N�MN Q  s�OPQO k  v�RR STS r  v�UVU I v}�LW�K
�L .sysoexecTEXT���     TEXTW o  vy�J�J 0 buildpackage buildPackage�K  V o      �I�I 0 theinstaller theInstallerT XYX I ���HZ[
�H .sysodlogaskr        TEXTZ m  ��\\ �]] 0 P a c k a g e   b u i l d   s u c c e e d e d .[ �G^_
�G 
disp^ 4  ���F`
�F 
file` l ��a�E�Da b  ��bcb l ��d�C�Bd I ���Aef
�A .earsffdralis        afdre m  ��gg�                                                                                  xins  alis    �  Macintosh HD               �\	'H+  ��Installer.app                                                  �t����:        ����  	                CoreServices    �\Ag      ��z    ������  9Macintosh HD:System: Library: CoreServices: Installer.app     I n s t a l l e r . a p p    M a c i n t o s h   H D  )System/Library/CoreServices/Installer.app   / ��  f �@h�?
�@ 
rtyph m  ���>
�> 
TEXT�?  �C  �B  c m  ��ii �jj > C o n t e n t s : R e s o u r c e s : p a c k a g e . i c n s�E  �D  _ �=kl
�= 
apprk m  ��mm �nn , P a c k a g e   f o r   D e p l o y m e n tl �<op
�< 
btnso J  ��qq r�;r m  ��ss �tt  S h o w   P a c k a g e�;  p �:u�9
�: 
dfltu J  ��vv w�8w m  ��xx �yy  S h o w   P a c k a g e�8  �9  Y z{z r  ��|}| 4  ���7~
�7 
psxf~ l ���6�5 b  ����� b  ����� o  ���4�4 0 myfolderpath myFolderPath� o  ���3�3 0 packagename packageName� m  ���� ���  . p k g�6  �5  } o      �2�2 0 
thepackage 
thePackage{ ��1� O  ����� k  ���� ��� I ���0�/�.
�0 .miscactvnull��� ��� obj �/  �.  � ��-� I ���,��+
�, .miscslctnull���    obj � o  ���*�* 0 
thepackage 
thePackage�+  �-  � m  �����                                                                                  MACS  alis    t  Macintosh HD               �\	'H+  ��
Finder.app                                                     �f���2        ����  	                CoreServices    �\Ag      ��r    ������  6Macintosh HD:System: Library: CoreServices: Finder.app   
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��  �1  P R      �)�(�'
�) .ascrerr ****      � ****�(  �'  Q I ���&��
�& .sysodlogaskr        TEXT� m  ���� ��� � P a c k a g e   b u i l d   f a i l e d .   V e r i f y   R O O T   a n d   S c r i p t s   f o l d e r s   a r e   i n   t h e   s a m e   f o l d e r   a s   t h i s   P a c k a g e   f o r   D e p l o y m e n t   a p p .� �%��
�% 
disp� m  ���$
�$ stic    � �#��
�# 
appr� m  ���� ��� , P a c k a g e   f o r   D e p l o y m e n t� �"��
�" 
btns� J  ���� ��!� m  ���� ���  O K�!  � � ��
�  
dflt� J  ���� ��� m  ���� ���  O K�  �  �N  �M  �O       ����  � �
� .aevtoappnull  �   � ****� �������
� .aevtoappnull  �   � ****� k    ���  ��  C��  ~��  ���  ���  ���  ��� �� �� "�� M��  �  �  �  � R � �� *��� ,� 3 6� <� ?����
 M U W�	 g n q w z� � � � � � � ��� �� ����� �� ����������?ACEGI����\imsx���������������������
� 
dtxt
� 
disp
� 
file
� 
rtyp
� 
TEXT
� .earsffdralis        afdr
� 
btns
� 
dflt
� 
appr� 

� .sysodlogaskr        TEXT
� 
ttxt�
 0 packagename packageName
�	 
cwor� &0 packageidentifier packageIdentifier�  0 packageversion packageVersion� 0 
mylocation 
myLocation
� 
ctnr� 0 
rootfolder 
rootFolder
� 
cfol
� .coredoexbool        obj 
� 
prmp
�  .sysostflalis    ��� null
�� 
psxp�� 0 rootpath rootPath�� 0 myfolderpath myFolderPath��  0 removedsstores removeDSStores
�� .sysoexecTEXT���     TEXT�� 0 buildpackage buildPackage�� 0 theinstaller theInstaller�� 
�� 
psxf�� 0 
thepackage 
thePackage
�� .miscactvnull��� ��� obj 
�� .miscslctnull���    obj ��  ��  
�� stic    ������*����l �%/���lv��kv�a a  a ,E` Oa �a a %_ a -%�*����l a %/�a a lv�a kv�a a  a ,E` Oa �a  �*����l a !%/�a "a #lv�a $kv�a %a  a ,a -E` &O)j E` 'Oa ( B_ 'a ),�&a *%E` +O*a ,_ +/j -f  *a .a /l 0E` +O_ +�&E` +Y hUO_ +a 1,E` 2Oa ( _ 'a ),�&a 1,E` 3UOa 4_ 2%a 5%�&E` 6O_ 6j 7Oa 8_ %a 9%_ &%a :%_ 3%a ;%_ 2%a <%_ 3%_ %a =%�&E` >O c_ >j 7E` ?Oa @�*����l a A%/�a B�a Ckv�a Dkva E O*a F_ 3_ %a G%/E` HOa ( *j IO_ Hj JUW $X K La M�a N�a O�a Pkv�a Qkva E  ascr  ��ޭ