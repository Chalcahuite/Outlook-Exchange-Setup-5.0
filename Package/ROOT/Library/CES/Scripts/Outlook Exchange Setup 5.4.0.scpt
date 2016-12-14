FasdUAS 1.101.10   ��   ��    k             l      ��  ��   ��

--------------------------------------------
Outlook Exchange Setup 5
� Copyright 2008-2016 William Smith
bill@officeformachelp.com

Except where otherwise noted, this work is licensed under
http://creativecommons.org/licenses/by/4.0/

This file is one of four files for assisting a user with configuring
an Exchange account in Microsoft Outlook 2016 for Mac:

1. Outlook Exchange Setup 5.4.0.scpt
2. OutlookExchangeSetupLaunchAgent.sh
3. net.talkingmoose.OutlookExchangeSetupLaunchAgent.plist
4. com.microsoft.Outlook.plist for creating a configuraiton profile

These scripts and files may be freely modified for personal or commercial
purposes but may not be republished for profit without prior consent.

If you find these resources useful or have ideas for improving them,
please let me know. It is only compatible with Outlook 2016 for Mac.

--------------------------------------------

This script assists a user with the setup of his Exchange account
information. Below are basic instructions for using the script.
Consult the Outlook Exchange Setup 5 Administrator's Guide
for complete details.

1.	Customize the "network and  server properties" below with information
	appropriate to your network.
	
2.	Deploy this script to a location on your Macs such as
	"/Library/CompanyName/OutlookExchangeSetup5.4.0.scpt".

3. 	Deploy the recommended "Outlook preferences.mobileconfig"
	configuration profile to eliminate Outlook's startup windows.
	This assumes you're using the volume license edition
	of Office 2016 for Mac.
	
4.	Deploy the OutlookExchangeSetup5.plist file to
	/Library/LaunchAgents. Update the path to point to the
	OutlookExchangeSetup5.4.0.scpt script.
	  
This script assumes the user's full name is in the form of "Last, First",
but is easily modified if the full name is in the form of "First Last".
It works especially well if the Mac is bound to Active Directory where
the user's short name will match his login name. Optionally, you cans set dscl
to pull the user's EMailAddress from a directory service.

     � 	 	� 
 
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 O u t l o o k   E x c h a n g e   S e t u p   5 
 �   C o p y r i g h t   2 0 0 8 - 2 0 1 6   W i l l i a m   S m i t h 
 b i l l @ o f f i c e f o r m a c h e l p . c o m 
 
 E x c e p t   w h e r e   o t h e r w i s e   n o t e d ,   t h i s   w o r k   i s   l i c e n s e d   u n d e r 
 h t t p : / / c r e a t i v e c o m m o n s . o r g / l i c e n s e s / b y / 4 . 0 / 
 
 T h i s   f i l e   i s   o n e   o f   f o u r   f i l e s   f o r   a s s i s t i n g   a   u s e r   w i t h   c o n f i g u r i n g 
 a n   E x c h a n g e   a c c o u n t   i n   M i c r o s o f t   O u t l o o k   2 0 1 6   f o r   M a c : 
 
 1 .   O u t l o o k   E x c h a n g e   S e t u p   5 . 4 . 0 . s c p t 
 2 .   O u t l o o k E x c h a n g e S e t u p L a u n c h A g e n t . s h 
 3 .   n e t . t a l k i n g m o o s e . O u t l o o k E x c h a n g e S e t u p L a u n c h A g e n t . p l i s t 
 4 .   c o m . m i c r o s o f t . O u t l o o k . p l i s t   f o r   c r e a t i n g   a   c o n f i g u r a i t o n   p r o f i l e 
 
 T h e s e   s c r i p t s   a n d   f i l e s   m a y   b e   f r e e l y   m o d i f i e d   f o r   p e r s o n a l   o r   c o m m e r c i a l 
 p u r p o s e s   b u t   m a y   n o t   b e   r e p u b l i s h e d   f o r   p r o f i t   w i t h o u t   p r i o r   c o n s e n t . 
 
 I f   y o u   f i n d   t h e s e   r e s o u r c e s   u s e f u l   o r   h a v e   i d e a s   f o r   i m p r o v i n g   t h e m , 
 p l e a s e   l e t   m e   k n o w .   I t   i s   o n l y   c o m p a t i b l e   w i t h   O u t l o o k   2 0 1 6   f o r   M a c . 
 
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 
 T h i s   s c r i p t   a s s i s t s   a   u s e r   w i t h   t h e   s e t u p   o f   h i s   E x c h a n g e   a c c o u n t 
 i n f o r m a t i o n .   B e l o w   a r e   b a s i c   i n s t r u c t i o n s   f o r   u s i n g   t h e   s c r i p t . 
 C o n s u l t   t h e   O u t l o o k   E x c h a n g e   S e t u p   5   A d m i n i s t r a t o r ' s   G u i d e 
 f o r   c o m p l e t e   d e t a i l s . 
 
 1 . 	 C u s t o m i z e   t h e   " n e t w o r k   a n d     s e r v e r   p r o p e r t i e s "   b e l o w   w i t h   i n f o r m a t i o n 
 	 a p p r o p r i a t e   t o   y o u r   n e t w o r k . 
 	 
 2 . 	 D e p l o y   t h i s   s c r i p t   t o   a   l o c a t i o n   o n   y o u r   M a c s   s u c h   a s 
 	 " / L i b r a r y / C o m p a n y N a m e / O u t l o o k E x c h a n g e S e t u p 5 . 4 . 0 . s c p t " . 
 
 3 .   	 D e p l o y   t h e   r e c o m m e n d e d   " O u t l o o k   p r e f e r e n c e s . m o b i l e c o n f i g " 
 	 c o n f i g u r a t i o n   p r o f i l e   t o   e l i m i n a t e   O u t l o o k ' s   s t a r t u p   w i n d o w s . 
 	 T h i s   a s s u m e s   y o u ' r e   u s i n g   t h e   v o l u m e   l i c e n s e   e d i t i o n 
 	 o f   O f f i c e   2 0 1 6   f o r   M a c . 
 	 
 4 . 	 D e p l o y   t h e   O u t l o o k E x c h a n g e S e t u p 5 . p l i s t   f i l e   t o 
 	 / L i b r a r y / L a u n c h A g e n t s .   U p d a t e   t h e   p a t h   t o   p o i n t   t o   t h e 
 	 O u t l o o k E x c h a n g e S e t u p 5 . 4 . 0 . s c p t   s c r i p t . 
 	     
 T h i s   s c r i p t   a s s u m e s   t h e   u s e r ' s   f u l l   n a m e   i s   i n   t h e   f o r m   o f   " L a s t ,   F i r s t " , 
 b u t   i s   e a s i l y   m o d i f i e d   i f   t h e   f u l l   n a m e   i s   i n   t h e   f o r m   o f   " F i r s t   L a s t " . 
 I t   w o r k s   e s p e c i a l l y   w e l l   i f   t h e   M a c   i s   b o u n d   t o   A c t i v e   D i r e c t o r y   w h e r e 
 t h e   u s e r ' s   s h o r t   n a m e   w i l l   m a t c h   h i s   l o g i n   n a m e .   O p t i o n a l l y ,   y o u   c a n s   s e t   d s c l 
 t o   p u l l   t h e   u s e r ' s   E M a i l A d d r e s s   f r o m   a   d i r e c t o r y   s e r v i c e . 
 
   
  
 l     ��������  ��  ��        l     ��  ��      global logMesage     �   "   g l o b a l   l o g M e s a g e      l     ��������  ��  ��        l     ��  ��    A ;5.4.1 customized for Comcast. 2016-12-12 by Sergio Aviles.      �   v 5 . 4 . 1   c u s t o m i z e d   f o r   C o m c a s t .   2 0 1 6 - 1 2 - 1 2   b y   S e r g i o   A v i l e s .        l     ��������  ��  ��        l     ��  ��    0 *------------------------------------------     �   T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -       l     �� ! "��   ! , & Begin network, server and preferences    " � # # L   B e g i n   n e t w o r k ,   s e r v e r   a n d   p r e f e r e n c e s    $ % $ l     �� & '��   & 0 *------------------------------------------    ' � ( ( T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - %  ) * ) l     ��������  ��  ��   *  + , + l     ��������  ��  ��   ,  - . - l     �� / 0��   / C =------------- Exchange Server settings ----------------------    0 � 1 1 z - - - - - - - - - - - - -   E x c h a n g e   S e r v e r   s e t t i n g s   - - - - - - - - - - - - - - - - - - - - - - .  2 3 2 l     ��������  ��  ��   3  4 5 4 j     �� 6�� 0 usekerberos useKerberos 6 m     ��
�� boovtrue 5  7 8 7 l     �� 9 :��   9 B < Set this to true only if Macs in your environment are bound    : � ; ; x   S e t   t h i s   t o   t r u e   o n l y   i f   M a c s   i n   y o u r   e n v i r o n m e n t   a r e   b o u n d 8  < = < l     �� > ?��   > C = to Active Directory and your network is properly configured.    ? � @ @ z   t o   A c t i v e   D i r e c t o r y   a n d   y o u r   n e t w o r k   i s   p r o p e r l y   c o n f i g u r e d . =  A B A l     ��������  ��  ��   B  C D C j    �� E��  0 exchangeserver ExchangeServer E m     F F � G G & w e b m a i l . c o m c a s t . c o m D  H I H l     �� J K��   J 6 0 Address of your organization's Exchange server.    K � L L `   A d d r e s s   o f   y o u r   o r g a n i z a t i o n ' s   E x c h a n g e   s e r v e r . I  M N M l     ��������  ��  ��   N  O P O j    �� Q�� 60 exchangeserverrequiresssl ExchangeServerRequiresSSL Q m    ��
�� boovtrue P  R S R l     �� T U��   T   True for most servers.    U � V V .   T r u e   f o r   m o s t   s e r v e r s . S  W X W l     ��������  ��  ��   X  Y Z Y j   	 �� [�� .0 exchangeserversslport ExchangeServerSSLPort [ m   	 
����� Z  \ ] \ l     �� ^ _��   ^ @ : If ExchangeServerRequiresSSL is true set the port to 443.    _ � ` ` t   I f   E x c h a n g e S e r v e r R e q u i r e s S S L   i s   t r u e   s e t   t h e   p o r t   t o   4 4 3 . ]  a b a l     �� c d��   c @ : If ExchangeServerRequiresSSL is false set the port to 80.    d � e e t   I f   E x c h a n g e S e r v e r R e q u i r e s S S L   i s   f a l s e   s e t   t h e   p o r t   t o   8 0 . b  f g f l     �� h i��   h L F Use a different port number only if your administrator instructs you.    i � j j �   U s e   a   d i f f e r e n t   p o r t   n u m b e r   o n l y   i f   y o u r   a d m i n i s t r a t o r   i n s t r u c t s   y o u . g  k l k l     ��������  ��  ��   l  m n m j    �� o�� "0 directoryserver DirectoryServer o m     p p � q q 0 a d a p p s . c a b l e . c o m c a s t . c o m n  r s r l     �� t u��   t Z T Address of an internal Global Catalog server (a type of Windows domain controller).    u � v v �   A d d r e s s   o f   a n   i n t e r n a l   G l o b a l   C a t a l o g   s e r v e r   ( a   t y p e   o f   W i n d o w s   d o m a i n   c o n t r o l l e r ) . s  w x w l     �� y z��   y L F The LDAP server in a Windows network will be a Global Catalog server,    z � { { �   T h e   L D A P   s e r v e r   i n   a   W i n d o w s   n e t w o r k   w i l l   b e   a   G l o b a l   C a t a l o g   s e r v e r , x  | } | l     �� ~ ��   ~ 2 , which is separate from the Exchange Server.     � � � X   w h i c h   i s   s e p a r a t e   f r o m   t h e   E x c h a n g e   S e r v e r . }  � � � l     ��������  ��  ��   �  � � � j    �� ��� N0 %directoryserverrequiresauthentication %DirectoryServerRequiresAuthentication � m    ��
�� boovtrue �  � � � l     �� � ���   � ' ! This will almost always be true.    � � � � B   T h i s   w i l l   a l m o s t   a l w a y s   b e   t r u e . �  � � � l     ��������  ��  ��   �  � � � j    �� ��� 80 directoryserverrequiresssl DirectoryServerRequiresSSL � m    ��
�� boovtrue �  � � � l     �� � ���   � ' ! This will almost always be true.    � � � � B   T h i s   w i l l   a l m o s t   a l w a y s   b e   t r u e . �  � � � l     ��������  ��  ��   �  � � � j    �� ��� 00 directoryserversslport DirectoryServerSSLPort � m    ����� �  � � � l     �� � ���   � B < If DirectoryServerRequiresSSL is true set the port to 3269.    � � � � x   I f   D i r e c t o r y S e r v e r R e q u i r e s S S L   i s   t r u e   s e t   t h e   p o r t   t o   3 2 6 9 . �  � � � l     �� � ���   � C = If DirectoryServerRequiresSSL is false set the port to 3268.    � � � � z   I f   D i r e c t o r y S e r v e r R e q u i r e s S S L   i s   f a l s e   s e t   t h e   p o r t   t o   3 2 6 8 . �  � � � l     �� � ���   � U O Use a different port number only if your Exchange administrator instructs you.    � � � � �   U s e   a   d i f f e r e n t   p o r t   n u m b e r   o n l y   i f   y o u r   E x c h a n g e   a d m i n i s t r a t o r   i n s t r u c t s   y o u . �  � � � l     ��������  ��  ��   �  � � � j    �� ��� >0 directoryservermaximumresults DirectoryServerMaximumResults � m    ����� �  � � � l     �� � ���   � G A When searching the Global Catalog server, this number determines    � � � � �   W h e n   s e a r c h i n g   t h e   G l o b a l   C a t a l o g   s e r v e r ,   t h i s   n u m b e r   d e t e r m i n e s �  � � � l     �� � ���   � 0 * the maximum number of entries to display.    � � � � T   t h e   m a x i m u m   n u m b e r   o f   e n t r i e s   t o   d i s p l a y . �  � � � l     ��������  ��  ��   �  � � � j    �� ��� 60 directoryserversearchbase DirectoryServerSearchBase � m     � � � � �   �  � � � l     �� � ���   � + % example: "cn=users,dc=domain,dc=com"    � � � � J   e x a m p l e :   " c n = u s e r s , d c = d o m a i n , d c = c o m " �  � � � l     �� � ���   �   Usually, this is empty.    � � � � 0   U s u a l l y ,   t h i s   i s   e m p t y . �  � � � l     ��������  ��  ��   �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � D >------------- For Active Directory users ---------------------    � � � � | - - - - - - - - - - - - -   F o r   A c t i v e   D i r e c t o r y   u s e r s   - - - - - - - - - - - - - - - - - - - - - �  � � � l     ��������  ��  ��   �  � � � j     �� ��� N0 %getuserinformationfromactivedirectory %getUserInformationFromActiveDirectory � m    ��
�� boovtrue �  � � � l     �� � ���   � B < If Macs are bound to Active Directory they can probably use    � � � � x   I f   M a c s   a r e   b o u n d   t o   A c t i v e   D i r e c t o r y   t h e y   c a n   p r o b a b l y   u s e �  � � � l     �� � ���   � Q K dscl to return the current user's email address, phone number, title, etc.    � � � � �   d s c l   t o   r e t u r n   t h e   c u r r e n t   u s e r ' s   e m a i l   a d d r e s s ,   p h o n e   n u m b e r ,   t i t l e ,   e t c . �  � � � l     �� � ���   � O I Use Active Directory when possible, otherwise complete the next section.    � � � � �   U s e   A c t i v e   D i r e c t o r y   w h e n   p o s s i b l e ,   o t h e r w i s e   c o m p l e t e   t h e   n e x t   s e c t i o n . �  � � � l     ��������  ��  ��   �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � B <------------- For non Active Directory users ---------------    � � � � x - - - - - - - - - - - - -   F o r   n o n   A c t i v e   D i r e c t o r y   u s e r s   - - - - - - - - - - - - - - - �  � � � j   ! %�� ��� 0 usershortname userShortName � m   ! $ � � � � �   �  � � � j   & *�� ��� 0 userfullname userFullName � m   & ) � � � � �   �  � � � j   + /�� ��� 0 emailaddress emailAddress � m   + . � � � � �   �  � � � l     �� ��    ! Leave these variables blank    � 6 L e a v e   t h e s e   v a r i a b l e s   b l a n k �  l     ��������  ��  ��    j   0 4���� 0 
domainname 
domainName m   0 3 �		   

 l     ����   P J Complete this only if not using Active Directory to get user information.    � �   C o m p l e t e   t h i s   o n l y   i f   n o t   u s i n g   A c t i v e   D i r e c t o r y   t o   g e t   u s e r   i n f o r m a t i o n .  l     ����   L F The part of your organization's email address following the @ symbol.    � �   T h e   p a r t   o f   y o u r   o r g a n i z a t i o n ' s   e m a i l   a d d r e s s   f o l l o w i n g   t h e   @   s y m b o l .  l     ��������  ��  ��    j   5 9���� 0 emailformat emailFormat m   5 8����   l     ����   P J Complete this only if not using Active Directory to get user information.    � �   C o m p l e t e   t h i s   o n l y   i f   n o t   u s i n g   A c t i v e   D i r e c t o r y   t o   g e t   u s e r   i n f o r m a t i o n .  l     �� !��    P J When Active Directory is unavailable to determine a user's email address,   ! �"" �   W h e n   A c t i v e   D i r e c t o r y   i s   u n a v a i l a b l e   t o   d e t e r m i n e   a   u s e r ' s   e m a i l   a d d r e s s , #$# l     �%&�  % V P this script will attempt to parse it from the display name of the user's login.   & �'' �   t h i s   s c r i p t   w i l l   a t t e m p t   t o   p a r s e   i t   f r o m   t h e   d i s p l a y   n a m e   o f   t h e   u s e r ' s   l o g i n .$ ()( l     �~�}�|�~  �}  �|  ) *+* l     �{,-�{  , 1 + Describe your organization's email format:   - �.. V   D e s c r i b e   y o u r   o r g a n i z a t i o n ' s   e m a i l   f o r m a t :+ /0/ l     �z12�z  1 / ) 1: Email format is first.last@domain.com   2 �33 R   1 :   E m a i l   f o r m a t   i s   f i r s t . l a s t @ d o m a i n . c o m0 454 l     �y67�y  6 * $ 2: Email format is first@domain.com   7 �88 H   2 :   E m a i l   f o r m a t   i s   f i r s t @ d o m a i n . c o m5 9:9 l     �x;<�x  ; N H 3: Email format is flast@domain.com (first name initial plus last name)   < �== �   3 :   E m a i l   f o r m a t   i s   f l a s t @ d o m a i n . c o m   ( f i r s t   n a m e   i n i t i a l   p l u s   l a s t   n a m e ): >?> l     �w@A�w  @ . ( 4: Email format is shortName@domain.com   A �BB P   4 :   E m a i l   f o r m a t   i s   s h o r t N a m e @ d o m a i n . c o m? CDC l     �v�u�t�v  �u  �t  D EFE j   : >�sG�s 0 displayname displayNameG m   : ;�r�r F HIH l     �qJK�q  J P J Complete this only if not using Active Directory to get user information.   K �LL �   C o m p l e t e   t h i s   o n l y   i f   n o t   u s i n g   A c t i v e   D i r e c t o r y   t o   g e t   u s e r   i n f o r m a t i o n .I MNM l     �pOP�p  O M G Describe how the user's display name appears at the bottom of the menu   P �QQ �   D e s c r i b e   h o w   t h e   u s e r ' s   d i s p l a y   n a m e   a p p e a r s   a t   t h e   b o t t o m   o f   t h e   m e n uN RSR l     �oTU�o  T R L when clicking the Apple menu (Log Out Joe Cool... or Log Out Cool, Joe...).   U �VV �   w h e n   c l i c k i n g   t h e   A p p l e   m e n u   ( L o g   O u t   J o e   C o o l . . .   o r   L o g   O u t   C o o l ,   J o e . . . ) .S WXW l     �nYZ�n  Y / ) 1: Display name appears as "Last, First"   Z �[[ R   1 :   D i s p l a y   n a m e   a p p e a r s   a s   " L a s t ,   F i r s t "X \]\ l     �m^_�m  ^ . ( 2: Display name appears as "First Last"   _ �`` P   2 :   D i s p l a y   n a m e   a p p e a r s   a s   " F i r s t   L a s t "] aba l     �l�k�j�l  �k  �j  b cdc j   ? E�ie�i 0 domainprefix domainPrefixe m   ? Bff �gg  d hih l     �hjk�h  j Y S Optionally append a NetBIOS domain name to the beginning of the user's short name.   k �ll �   O p t i o n a l l y   a p p e n d   a   N e t B I O S   d o m a i n   n a m e   t o   t h e   b e g i n n i n g   o f   t h e   u s e r ' s   s h o r t   n a m e .i mnm l     �gop�g  o 9 3 Be sure to use two backslashes when adding a name.   p �qq f   B e   s u r e   t o   u s e   t w o   b a c k s l a s h e s   w h e n   a d d i n g   a   n a m e .n rsr l     �ftu�f  t N H Example: Use "TALKINGMOOSE\\" to set user name "TALKINGMOOSE\username".   u �vv �   E x a m p l e :   U s e   " T A L K I N G M O O S E \ \ "   t o   s e t   u s e r   n a m e   " T A L K I N G M O O S E \ u s e r n a m e " .s wxw l     �e�d�c�e  �d  �c  x yzy l     �b�a�`�b  �a  �`  z {|{ l     �_}~�_  } C =------------- User Experience -------------------------------   ~ � z - - - - - - - - - - - - -   U s e r   E x p e r i e n c e   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -| ��� l     �^�]�\�^  �]  �\  � ��� j   F J�[��[ (0 verifyemailaddress verifyEMailAddress� m   F G�Z
�Z boovfals� ��� l     �Y���Y  � M G If set to "true", a dialog asks the user to confirm his email address.   � ��� �   I f   s e t   t o   " t r u e " ,   a   d i a l o g   a s k s   t h e   u s e r   t o   c o n f i r m   h i s   e m a i l   a d d r e s s .� ��� l     �X�W�V�X  �W  �V  � ��� j   K O�U��U *0 verifyserveraddress verifyServerAddress� m   K L�T
�T boovfals� ��� l     �S���S  � W Q If set to "true", a dialog asks the user to confirm his Exchange server address.   � ��� �   I f   s e t   t o   " t r u e " ,   a   d i a l o g   a s k s   t h e   u s e r   t o   c o n f i r m   h i s   E x c h a n g e   s e r v e r   a d d r e s s .� ��� l     �R�Q�P�R  �Q  �P  � ��� j   P T�O��O *0 displaydomainprefix displayDomainPrefix� m   P Q�N
�N boovtrue� ��� l     �M���M  � C = If set to "true", the username appears as "DOMAIN\username".   � ��� z   I f   s e t   t o   " t r u e " ,   t h e   u s e r n a m e   a p p e a r s   a s   " D O M A I N \ u s e r n a m e " .� ��� l     �L���L  � 5 / Otherwise, the username appears as "username".   � ��� ^   O t h e r w i s e ,   t h e   u s e r n a m e   a p p e a r s   a s   " u s e r n a m e " .� ��� l     �K�J�I�K  �J  �I  � ��� j   U Y�H��H *0 downloadheadersonly downloadHeadersOnly� m   U V�G
�G boovfals� ��� l     �F���F  � H B If set to "true", only email headers are downloaded into Outlook.   � ��� �   I f   s e t   t o   " t r u e " ,   o n l y   e m a i l   h e a d e r s   a r e   d o w n l o a d e d   i n t o   O u t l o o k .� ��� l     �E���E  � B < This takes much less time to sync but a user must be online   � ��� x   T h i s   t a k e s   m u c h   l e s s   t i m e   t o   s y n c   b u t   a   u s e r   m u s t   b e   o n l i n e� ��� l     �D���D  � %  to download and view messages.   � ��� >   t o   d o w n l o a d   a n d   v i e w   m e s s a g e s .� ��� l     �C�B�A�C  �B  �A  � ��� j   Z ^�@��@ 20 hideonmycomputerfolders hideOnMyComputerFolders� m   Z [�?
�? boovtrue� ��� l     �>���>  � - ' If set to "true", hides local folders.   � ��� N   I f   s e t   t o   " t r u e " ,   h i d e s   l o c a l   f o l d e r s .� ��� l     �=���=  � ; 5 A single Exchange account should do this by default.   � ��� j   A   s i n g l e   E x c h a n g e   a c c o u n t   s h o u l d   d o   t h i s   b y   d e f a u l t .� ��� l     �<�;�:�<  �;  �:  � ��� j   _ c�9��9 0 unifiedinbox unifiedInbox� m   _ `�8
�8 boovfals� ��� l     �7���7  � C = If set to "true", turns on the Group Similar Folders feature   � ��� z   I f   s e t   t o   " t r u e " ,   t u r n s   o n   t h e   G r o u p   S i m i l a r   F o l d e r s   f e a t u r e� ��� l     �6���6  � / ) in Outlook menu > Preferences > General.   � ��� R   i n   O u t l o o k   m e n u   >   P r e f e r e n c e s   >   G e n e r a l .� ��� l     �5�4�3�5  �4  �3  � ��� j   d h�2��2 *0 disableautodiscover disableAutodiscover� m   d e�1
�1 boovfals� ��� l     �0���0  � < 6 If set to "true", disables Autodiscover functionality   � ��� l   I f   s e t   t o   " t r u e " ,   d i s a b l e s   A u t o d i s c o v e r   f u n c t i o n a l i t y� ��� l     �/���/  � C = for the Exchange account. Not recommended for mobile devices   � ��� z   f o r   t h e   E x c h a n g e   a c c o u n t .   N o t   r e c o m m e n d e d   f o r   m o b i l e   d e v i c e s� ��� l     �.���.  � B < that may connect to an internal Exchange server address and   � ��� x   t h a t   m a y   c o n n e c t   t o   a n   i n t e r n a l   E x c h a n g e   s e r v e r   a d d r e s s   a n d� ��� l     �-���-  � ? 9 connect to a different external Exchange server address.   � ��� r   c o n n e c t   t o   a   d i f f e r e n t   e x t e r n a l   E x c h a n g e   s e r v e r   a d d r e s s .� ��� l     �,�+�*�,  �+  �*  � ��� j   i o�)��) 0 errormessage errorMessage� m   i l�� ��� � O u t l o o k ' s   s e t u p   f o r   y o u r   E x c h a n g e   a c c o u n t   f a i l e d .   P l e a s e   c o n t a c t   t h e   H e l p   D e s k   f o r   a s s i s t a n c e .� ��� l     �(���(  � T N Customize this error message for your users in case their account setup fails   � ��� �   C u s t o m i z e   t h i s   e r r o r   m e s s a g e   f o r   y o u r   u s e r s   i n   c a s e   t h e i r   a c c o u n t   s e t u p   f a i l s� ��� l     �'�&�%�'  �&  �%  � ��� l     �$���$  � 0 *------------------------------------------   � �   T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -�  l     �#�#   * $ End network, server and preferences    � H   E n d   n e t w o r k ,   s e r v e r   a n d   p r e f e r e n c e s  l     �"	�"   0 *------------------------------------------   	 �

 T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  l     �!� ��!  �   �    l     ��   0 *------------------------------------------    � T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  l     ��     Begin Domain Check    � &   B e g i n   D o m a i n   C h e c k  l     ��   0 *------------------------------------------    � T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  l     ����  �  �    l     ��  r     !"! l    #��# I    �$�
� .sysoexecTEXT���     TEXT$ m     %% �&& z d s c o n f i g a d   - s h o w   |   a w k   ' / A c t i v e   D i r e c t o r y   F o r e s t /   { p r i n t   $ 5 } '�  �  �  " o      �� 0 domainjoined domainJoined�  �   '(' l   )��) r    *+* l   ,��, I   �-�
� .sysoexecTEXT���     TEXT- m    	.. �// p d s c l   .   r e a d   / U s e r s / $ U S E R   O r i g i n a l A u t h e n t i c a t i o n A u t h o r i t y�  �  �  + o      �� 0 networkuser networkUser�  �  ( 010 l   )2�
�	2 Z   )34��3 G    565 =   787 o    �� 0 domainjoined domainJoined8 m    99 �::  6 =   ;<; o    �� 0 networkuser networkUser< m    == �>>  4 r    %?@? m    �
� boovfals@ o      �� N0 %getuserinformationfromactivedirectory %getUserInformationFromActiveDirectory�  �  �
  �	  1 ABA l     ��� �  �  �   B CDC l     ��EF��  E 0 *------------------------------------------   F �GG T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -D HIH l     ��JK��  J   Begin log file setup   K �LL *   B e g i n   l o g   f i l e   s e t u pI MNM l     ��OP��  O 0 *------------------------------------------   P �QQ T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -N RSR l     ��������  ��  ��  S TUT l     ��VW��  V < 6 create the log file in the current user's Logs folder   W �XX l   c r e a t e   t h e   l o g   f i l e   i n   t h e   c u r r e n t   u s e r ' s   L o g s   f o l d e rU YZY l     ��������  ��  ��  Z [\[ l  * 0]����] I   * 0��^���� 0 writelog writeLog^ _��_ m   + ,`` �aa D S t a r t i n g   E x c h a n g e   a c c o u n t   s e t u p . . .��  ��  ��  ��  \ bcb l  1 ;d����d I   1 ;��e���� 0 writelog writeLoge f��f b   2 7ghg m   2 3ii �jj  S c r i p t :  h n   3 6klk 1   4 6��
�� 
pnaml  f   3 4��  ��  ��  ��  c mnm l  < Bo����o I   < B��p���� 0 writelog writeLogp q��q o   = >��
�� 
ret ��  ��  ��  ��  n rsr l     ��������  ��  ��  s tut l     ��vw��  v 0 *------------------------------------------   w �xx T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -u yzy l     ��{|��  {   End log file setup    | �}} (   E n d   l o g   f i l e   s e t u p  z ~~ l     ������  � 0 *------------------------------------------   � ��� T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ��� l     ��������  ��  ��  � ��� l     ������  � 0 *------------------------------------------   � ��� T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     ������  � &   Begin logging script properties   � ��� @   B e g i n   l o g g i n g   s c r i p t   p r o p e r t i e s� ��� l     ������  � 0 *------------------------------------------   � ��� T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     ��������  ��  ��  � ��� l  C I������ I   C I������� 0 writelog writeLog� ���� m   D E�� ��� & S e t u p   p r o p e r t i e s . . .��  ��  ��  ��  � ��� l  J V������ I   J V������� 0 writelog writeLog� ���� b   K R��� m   K L�� ���  U s e   K e r b e r o s :  � o   L Q���� 0 usekerberos useKerberos��  ��  ��  ��  � ��� l  W c������ I   W c������� 0 writelog writeLog� ���� b   X _��� m   X Y�� ��� " E x c h a n g e   S e r v e r :  � o   Y ^����  0 exchangeserver ExchangeServer��  ��  ��  ��  � ��� l  d r������ I   d r������� 0 writelog writeLog� ���� b   e n��� m   e h�� ��� < E x c h a n g e   S e r v e r   R e q u i r e s   S S L :  � o   h m���� 60 exchangeserverrequiresssl ExchangeServerRequiresSSL��  ��  ��  ��  � ��� l  s ������� I   s �������� 0 writelog writeLog� ���� b   t }��� m   t w�� ��� , E x c h a n g e   S e r v e r   P o r t :  � o   w |���� .0 exchangeserversslport ExchangeServerSSLPort��  ��  ��  ��  � ��� l  � ������� I   � �������� 0 writelog writeLog� ���� b   � ���� m   � ��� ��� $ D i r e c t o r y   S e r v e r :  � o   � ����� "0 directoryserver DirectoryServer��  ��  ��  ��  � ��� l  � ������� I   � �������� 0 writelog writeLog� ���� b   � ���� m   � ��� ��� T D i r e c t o r y   S e r v e r   R e q u i r e s   A u t h e n t i c a t i o n :  � o   � ����� N0 %directoryserverrequiresauthentication %DirectoryServerRequiresAuthentication��  ��  ��  ��  � ��� l  � ������� I   � �������� 0 writelog writeLog� ���� b   � ���� m   � ��� ��� > D i r e c t o r y   S e r v e r   R e q u i r e s   S S L :  � o   � ����� 80 directoryserverrequiresssl DirectoryServerRequiresSSL��  ��  ��  ��  � ��� l  � ������� I   � �������� 0 writelog writeLog� ���� b   � ���� m   � ��� ��� 6 D i r e c t o r y   S e r v e r   S S L   P o r t :  � o   � ����� 00 directoryserversslport DirectoryServerSSLPort��  ��  ��  ��  � ��� l  � ������� I   � �������� 0 writelog writeLog� ���� b   � ���� m   � ��� ��� D D i r e c t o r y   S e r v e r   M a x i m u m   R e s u l t s :  � o   � ����� >0 directoryservermaximumresults DirectoryServerMaximumResults��  ��  ��  ��  � ��� l  � ������� I   � �������� 0 writelog writeLog� ���� b   � ���� m   � ��� ��� < D i r e c t o r y   S e r v e r   S e a r c h   B a s e :  � o   � ����� 60 directoryserversearchbase DirectoryServerSearchBase��  ��  ��  ��  � ��� l  � ������� I   � �������� 0 writelog writeLog� ���� b   � ���� m   � ��� ��� X G e t   U s e r   I n f o r m a t i o n   f r o m   A c t i v e   D i r e c t o r y :  � o   � ����� N0 %getuserinformationfromactivedirectory %getUserInformationFromActiveDirectory��  ��  ��  ��  �    l  � ����� I   � ������� 0 writelog writeLog �� o   � ���
�� 
ret ��  ��  ��  ��    l     ��������  ��  ��    l  �B	����	 Z   �B
����
 =  � � o   � ����� N0 %getuserinformationfromactivedirectory %getUserInformationFromActiveDirectory m   � ���
�� boovfals k   �>  I   �
��~� 0 writelog writeLog �} b   � m   �  �  D o m a i n   N a m e :   o   �|�| 0 
domainname 
domainName�}  �~    I  �{�z�{ 0 writelog writeLog �y b   m   �  E m a i l   f o r m a t :   o  �x�x 0 emailformat emailFormat�y  �z     I  (�w!�v�w 0 writelog writeLog! "�u" b  $#$# m  %% �&&  D i s p l a y   N a m e :  $ o  #�t�t 0 displayname displayName�u  �v    '(' I  )7�s)�r�s 0 writelog writeLog) *�q* b  *3+,+ m  *--- �..  D o m a i n   P r e f i x :  , o  -2�p�p 0 domainprefix domainPrefix�q  �r  ( /�o/ I  8>�n0�m�n 0 writelog writeLog0 1�l1 o  9:�k
�k 
ret �l  �m  �o  ��  ��  ��  ��   232 l     �j�i�h�j  �i  �h  3 454 l CQ6�g�f6 I  CQ�e7�d�e 0 writelog writeLog7 8�c8 b  DM9:9 m  DG;; �<< , V e r i f y   E m a i l   A d d r e s s :  : o  GL�b�b (0 verifyemailaddress verifyEMailAddress�c  �d  �g  �f  5 =>= l R`?�a�`? I  R`�_@�^�_ 0 writelog writeLog@ A�]A b  S\BCB m  SVDD �EE . V e r i f y   S e r v e r   A d d r e s s :  C o  V[�\�\ *0 verifyserveraddress verifyServerAddress�]  �^  �a  �`  > FGF l aoH�[�ZH I  ao�YI�X�Y 0 writelog writeLogI J�WJ b  bkKLK m  beMM �NN . D i s p l a y   D o m a i n   P r e f i x :  L o  ej�V�V *0 displaydomainprefix displayDomainPrefix�W  �X  �[  �Z  G OPO l p~Q�U�TQ I  p~�SR�R�S 0 writelog writeLogR S�QS b  qzTUT m  qtVV �WW . D o w n l o a d   H e a d e r s   O n l y :  U o  ty�P�P *0 downloadheadersonly downloadHeadersOnly�Q  �R  �U  �T  P XYX l �Z�O�NZ I  ��M[�L�M 0 writelog writeLog[ \�K\ b  ��]^] m  ��__ �`` : H i d e   O n   M y   C o m p u t e r   F o l d e r s :  ^ o  ���J�J 20 hideonmycomputerfolders hideOnMyComputerFolders�K  �L  �O  �N  Y aba l ��c�I�Hc I  ���Gd�F�G 0 writelog writeLogd e�Ee b  ��fgf m  ��hh �ii  U n i f i e d   I n b o x :  g o  ���D�D 0 unifiedinbox unifiedInbox�E  �F  �I  �H  b jkj l ��l�C�Bl I  ���Am�@�A 0 writelog writeLogm n�?n b  ��opo m  ��qq �rr , D i s a b l e   A u t o d i s c o v e r :  p o  ���>�> *0 disableautodiscover disableAutodiscover�?  �@  �C  �B  k sts l ��u�=�<u I  ���;v�:�; 0 writelog writeLogv w�9w b  ��xyx m  ��zz �{{ ( E r r o r   M e s s a g e   t e x t :  y o  ���8�8 0 errormessage errorMessage�9  �:  �=  �<  t |}| l ��~�7�6~ I  ���5�4�5 0 writelog writeLog ��3� o  ���2
�2 
ret �3  �4  �7  �6  } ��� l     �1�0�/�1  �0  �/  � ��� l     �.���.  � 0 *------------------------------------------   � ��� T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     �-���-  � %  End logging script properties    � ��� >   E n d   l o g g i n g   s c r i p t   p r o p e r t i e s  � ��� l     �,���,  � 0 *------------------------------------------   � ��� T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     �+�*�)�+  �*  �)  � ��� l     �(���(  � 0 *------------------------------------------   � ��� T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     �'���'  � ( " Begin collecting user information   � ��� D   B e g i n   c o l l e c t i n g   u s e r   i n f o r m a t i o n� ��� l     �&���&  � 0 *------------------------------------------   � ��� T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     �%�$�#�%  �$  �#  � ��� l     �"���"  � R L attempt to read information from Active Directory for the Me Contact record   � ��� �   a t t e m p t   t o   r e a d   i n f o r m a t i o n   f r o m   A c t i v e   D i r e c t o r y   f o r   t h e   M e   C o n t a c t   r e c o r d� ��� l     �!� ��!  �   �  � ��� l ������ r  ����� m  ���� ���  � o      �� 0 userfirstname userFirstName�  �  � ��� l ������ r  ����� m  ���� ���  � o      �� 0 userlastname userLastName�  �  � ��� l ������ r  ����� m  ���� ���  � o      ��  0 userdepartment userDepartment�  �  � ��� l ������ r  ����� m  ���� ���  � o      �� 0 
useroffice 
userOffice�  �  � ��� l ������ r  ����� m  ���� ���  � o      �� 0 usercompany userCompany�  �  � ��� l ������ r  ����� m  ���� ���  � o      �� 0 userworkphone userWorkPhone�  �  � ��� l ������ r  ����� m  ���� ���  � o      �
�
 0 
usermobile 
userMobile�  �  � ��� l ���	�� r  ���� m  ���� ���  � o      �� 0 userfax userFax�	  �  � ��� l 	���� r  	��� m  �� ���  � o      �� 0 	usertitle 	userTitle�  �  � ��� l 
���� r  
��� m  
�� ���  � o      �� 0 
userstreet 
userStreet�  �  � ��� l �� ��� r  ��� m  �� ���  � o      ���� 0 usercity userCity�   ��  � ��� l !������ r  !��� m  �� ���  � o      ���� 0 	userstate 	userState��  ��  �    l ")���� r  ") m  "% �   o      ����  0 userpostalcode userPostalCode��  ��    l *1	����	 r  *1

 m  *- �   o      ���� 0 usercountry userCountry��  ��    l 29���� r  29 m  25 �   o      ���� 0 userwebpage userWebPage��  ��    l     ��������  ��  ��    l :����� Z  :� = :A o  :?���� N0 %getuserinformationfromactivedirectory %getUserInformationFromActiveDirectory m  ?@��
�� boovtrue k  D-   !"! l DD��������  ��  ��  " #$# l DD��%&��  % + % Get information from Active Directoy   & �'' J   G e t   i n f o r m a t i o n   f r o m   A c t i v e   D i r e c t o y$ ()( l DD��������  ��  ��  ) *+* l DD��,-��  , 3 - get the domain's primary NetBIOS domain name   - �.. Z   g e t   t h e   d o m a i n ' s   p r i m a r y   N e t B I O S   d o m a i n   n a m e+ /0/ l DD��������  ��  ��  0 121 Q  D�3453 k  Gv66 787 r  GR9:9 I GN��;��
�� .sysoexecTEXT���     TEXT; m  GJ<< �== � / u s r / b i n / d s c l   " / A c t i v e   D i r e c t o r y / "   - r e a d   /   S u b N o d e s   |   a w k   ' B E G I N   { F S = " :   " }   { p r i n t   $ 2 } '��  : o      ���� 0 netbiosdomain netbiosDomain8 >��> Z  Sv?@��A? = SZBCB o  SX���� *0 displaydomainprefix displayDomainPrefixC m  XY��
�� boovtrue@ r  ]jDED b  ]dFGF o  ]`���� 0 netbiosdomain netbiosDomainG m  `cHH �II  \E o      ���� 0 domainprefix domainPrefix��  A r  mvJKJ m  mpLL �MM  K o      ���� 0 domainprefix domainPrefix��  4 R      ������
�� .ascrerr ****      � ****��  ��  5 k  ~�NN OPO l ~~��������  ��  ��  P QRQ l ~~��ST��  S   something went wrong   T �UU *   s o m e t h i n g   w e n t   w r o n gR VWV l ~~��������  ��  ��  W XYX I ~���Z[
�� .sysodlogaskr        TEXTZ b  ~�\]\ b  ~�^_^ b  ~�`a` o  ~����� 0 errormessage errorMessagea o  ����
�� 
ret _ o  ����
�� 
ret ] m  ��bb �cc � U n a b l e   t o   d e t e r m i n e   N E T B I O S   d o m a i n   n a m e .   T h i s   c o m p u t e r   m a y   n o t   b e   b o u n d   t o   A c t i v e   D i r e c t o r y .[ ��de
�� 
dispd m  ����
�� stic    e ��fg
�� 
btnsf J  ��hh i��i m  ��jj �kk  O K��  g ��lm
�� 
dfltl J  ��nn o��o m  ��pp �qq  O K��  m ��r��
�� 
apprr m  ��ss �tt , O u t l o o k   E x c h a n g e   S e t u p��  Y u��u R  ������v
�� .ascrerr ****      � ****��  v ��w��
�� 
errnw m  ����������  ��  2 xyx l ����������  ��  ��  y z{z l ����|}��  | 7 1 read full user information from Active Directory   } �~~ b   r e a d   f u l l   u s e r   i n f o r m a t i o n   f r o m   A c t i v e   D i r e c t o r y{ � l ����������  ��  ��  � ��� Q  ����� k  ���� ��� r  ����� J  ���� ���� m  ���� ���  :  ��  � n     ��� 1  ����
�� 
txdl� 1  ����
�� 
ascr� ���� r  ����� I �������
�� .sysoexecTEXT���     TEXT� b  ����� b  ����� m  ���� ��� B / u s r / b i n / d s c l   " / A c t i v e   D i r e c t o r y /� o  ������ 0 netbiosdomain netbiosDomain� m  ���� ���� / A l l   D o m a i n s / "   - r e a d   / U s e r s / $ U S E R   A u t h e n t i c a t i o n A u t h o r i t y   C i t y   c o   c o m p a n y   d e p a r t m e n t   p h y s i c a l D e l i v e r y O f f i c e N a m e   s A M A c c o u n t N a m e   w W W H o m e P a g e   E M a i l A d d r e s s   F A X N u m b e r   F i r s t N a m e   J o b T i t l e   L a s t N a m e   M o b i l e N u m b e r   P h o n e N u m b e r   P o s t a l C o d e   R e a l N a m e   S t a t e   S t r e e t��  � o      ���� "0 userinformation userInformation��  � R      ������
�� .ascrerr ****      � ****��  ��  � k  ��� ��� l ����������  ��  ��  � ��� l ��������  �   something went wrong   � ��� *   s o m e t h i n g   w e n t   w r o n g� ��� l ����������  ��  ��  � ��� I �����
�� .sysodlogaskr        TEXT� b  ����� b  ����� b  ����� o  ������ 0 errormessage errorMessage� o  ����
�� 
ret � o  ����
�� 
ret � m  ���� ��� n U n a b l e   t o   r e a d   u s e r   i n f o r m a t i o n   f r o m   n e t w o r k   d i r e c t o r y .� ����
�� 
disp� m  ����
�� stic    � ����
�� 
btns� J  � �� ���� m  ���� ���  O K��  � ����
�� 
dflt� J  �� ���� m  �� ���  O K��  � �����
�� 
appr� m  �� ��� , O u t l o o k   E x c h a n g e   S e t u p��  � ���� R  �����
�� .ascrerr ****      � ****��  � �����
�� 
errn� m  ��������  ��  � ��� l   ��������  ��  ��  � ��� Y   
��������� k  4
��� ��� l 44��������  ��  ��  � ��� r  4A��� J  49�� ���� m  47�� ���  :  ��  � n     ��� 1  <@��
�� 
txdl� 1  9<��
�� 
ascr� ��� Z  B�������� C BN��� n  BJ��� 4  EJ���
�� 
cpar� o  HI���� 0 i  � o  BE�� "0 userinformation userInformation� m  JM�� ���  E M a i l A d d r e s s :� Q  Q����� r  Tg��� n  Ta��� 4  \a�~�
�~ 
citm� m  _`�}�} � n  T\��� 4  W\�|�
�| 
cpar� o  Z[�{�{ 0 i  � o  TW�z�z "0 userinformation userInformation� o      �y�y 0 emailaddress emailAddress� R      �x�w�v
�x .ascrerr ****      � ****�w  �v  � k  o��� ��� r  o|��� J  ot�� ��u� m  or�� ���  �u  � n     ��� 1  w{�t
�t 
txdl� 1  tw�s
�s 
ascr� ��r� r  }���� c  }�� � n  }� 7���q
�q 
cha  m  ���p�p   ;  �� n  }� 4  ���o
�o 
cpar l ���n�m [  ��	
	 o  ���l�l 0 i  
 m  ���k�k �n  �m   o  }��j�j "0 userinformation userInformation  m  ���i
�i 
TEXT� o      �h�h 0 emailaddress emailAddress�r  ��  ��  �  l ���g�f�e�g  �f  �e    r  �� J  �� �d m  �� �  :  �d   n      1  ���c
�c 
txdl 1  ���b
�b 
ascr  Z  �	�a�` C �� n  �� 4  ���_
�_ 
cpar o  ���^�^ 0 i   o  ���]�] "0 userinformation userInformation m  ��   �!! ( d s A t t r T y p e N a t i v e : c o : Q  �"#$" r  ��%&% n  ��'(' 4  ���\)
�\ 
citm) m  ���[�[ ( n  ��*+* 4  ���Z,
�Z 
cpar, o  ���Y�Y 0 i  + o  ���X�X "0 userinformation userInformation& o      �W�W 0 usercountry userCountry# R      �V�U�T
�V .ascrerr ****      � ****�U  �T  $ k  �-- ./. r  ��010 J  ��22 3�S3 m  ��44 �55  �S  1 n     676 1  ���R
�R 
txdl7 1  ���Q
�Q 
ascr/ 8�P8 r  �9:9 c  �;<; n  ��=>= 7���O?@
�O 
cha ? m  ���N�N @  ;  ��> n  ��ABA 4  ���MC
�M 
cparC l ��D�L�KD [  ��EFE o  ���J�J 0 i  F m  ���I�I �L  �K  B o  ���H�H "0 userinformation userInformation< m  � �G
�G 
TEXT: o      �F�F 0 usercountry userCountry�P  �a  �`   GHG l 

�E�D�C�E  �D  �C  H IJI r  
KLK J  
MM N�BN m  
OO �PP  :  �B  L n     QRQ 1  �A
�A 
txdlR 1  �@
�@ 
ascrJ STS Z  rUV�?�>U C $WXW n   YZY 4   �=[
�= 
cpar[ o  �<�< 0 i  Z o  �;�; "0 userinformation userInformationX m   #\\ �]] 2 d s A t t r T y p e N a t i v e : c o m p a n y :V Q  'n^_`^ r  *;aba n  *7cdc 4  27�:e
�: 
citme m  56�9�9 d n  *2fgf 4  -2�8h
�8 
cparh o  01�7�7 0 i  g o  *-�6�6 "0 userinformation userInformationb o      �5�5 0 usercompany userCompany_ R      �4�3�2
�4 .ascrerr ****      � ****�3  �2  ` k  Cnii jkj r  CPlml J  CHnn o�1o m  CFpp �qq  �1  m n     rsr 1  KO�0
�0 
txdls 1  HK�/
�/ 
ascrk t�.t r  Qnuvu c  Qjwxw n  Qfyzy 7[f�-{|
�- 
cha { m  ac�,�, |  ;  dez n  Q[}~} 4  T[�+
�+ 
cpar l WZ��*�)� [  WZ��� o  WX�(�( 0 i  � m  XY�'�' �*  �)  ~ o  QT�&�& "0 userinformation userInformationx m  fi�%
�% 
TEXTv o      �$�$ 0 usercompany userCompany�.  �?  �>  T ��� l ss�#�"�!�#  �"  �!  � ��� r  s���� J  sx�� �� � m  sv�� ���  :  �   � n     ��� 1  {�
� 
txdl� 1  x{�
� 
ascr� ��� Z  ������� C ����� n  ����� 4  ����
� 
cpar� o  ���� 0 i  � o  ���� "0 userinformation userInformation� m  ���� ��� 8 d s A t t r T y p e N a t i v e : d e p a r t m e n t :� Q  ������ r  ����� n  ����� 4  ����
� 
citm� m  ���� � n  ����� 4  ����
� 
cpar� o  ���� 0 i  � o  ���� "0 userinformation userInformation� o      ��  0 userdepartment userDepartment� R      ���
� .ascrerr ****      � ****�  �  � k  ���� ��� r  ����� J  ���� ��� m  ���� ���  �  � n     ��� 1  ���
� 
txdl� 1  ���
� 
ascr� ��� r  ����� c  ����� n  ����� 7�����
� 
cha � m  ���
�
 �  ;  ��� n  ����� 4  ���	�
�	 
cpar� l ������ [  ����� o  ���� 0 i  � m  ���� �  �  � o  ���� "0 userinformation userInformation� m  ���
� 
TEXT� o      ��  0 userdepartment userDepartment�  �  �  � ��� l ���� ���  �   ��  � ��� r  ����� J  ���� ���� m  ���� ���  :  ��  � n     ��� 1  ����
�� 
txdl� 1  ����
�� 
ascr� ��� Z  �D������� C ����� n  ����� 4  �����
�� 
cpar� o  ������ 0 i  � o  ������ "0 userinformation userInformation� m  ���� ��� X d s A t t r T y p e N a t i v e : p h y s i c a l D e l i v e r y O f f i c e N a m e :� Q  �@���� r  ���� n  �	��� 4  	���
�� 
citm� m  ���� � n  ���� 4  ����
�� 
cpar� o  ���� 0 i  � o  ������ "0 userinformation userInformation� o      ���� 0 
useroffice 
userOffice� R      ������
�� .ascrerr ****      � ****��  ��  � k  @�� ��� r  "��� J  �� ���� m  �� ���  ��  � n     ��� 1  !��
�� 
txdl� 1  ��
�� 
ascr� ���� r  #@��� c  #<��� n  #8��� 7-8����
�� 
cha � m  35���� �  ;  67� n  #-��� 4  &-���
�� 
cpar� l ),������ [  ),��� o  )*���� 0 i  � m  *+���� ��  ��  � o  #&���� "0 userinformation userInformation� m  8;��
�� 
TEXT� o      ���� 0 
useroffice 
userOffice��  ��  ��  � ��� l EE��������  ��  ��  � ��� r  ER� � J  EJ �� m  EH �  :  ��    n      1  MQ��
�� 
txdl 1  JM��
�� 
ascr�  Z  S�	
����	 C S_ n  S[ 4  V[��
�� 
cpar o  YZ���� 0 i   o  SV���� "0 userinformation userInformation m  [^ � @ d s A t t r T y p e N a t i v e : s A M A c c o u n t N a m e :
 Q  b� r  ex n  er 4  mr��
�� 
citm m  pq����  n  em 4  hm��
�� 
cpar o  kl���� 0 i   o  eh���� "0 userinformation userInformation o      ���� 0 usershortname userShortName R      ������
�� .ascrerr ****      � ****��  ��   k  ��  r  �� !  J  ��"" #��# m  ��$$ �%%  ��  ! n     &'& 1  ����
�� 
txdl' 1  ����
�� 
ascr (��( r  ��)*) c  ��+,+ n  ��-.- 7����/0
�� 
cha / m  ������ 0  ;  ��. n  ��121 4  ����3
�� 
cpar3 l ��4����4 [  ��565 o  ������ 0 i  6 m  ������ ��  ��  2 o  ������ "0 userinformation userInformation, m  ����
�� 
TEXT* o      ���� 0 usershortname userShortName��  ��  ��   787 l ����������  ��  ��  8 9:9 r  ��;<; J  ��== >��> m  ��?? �@@  :  ��  < n     ABA 1  ����
�� 
txdlB 1  ����
�� 
ascr: CDC Z  �EF����E C ��GHG n  ��IJI 4  ����K
�� 
cparK o  ������ 0 i  J o  ������ "0 userinformation userInformationH m  ��LL �MM : d s A t t r T y p e N a t i v e : w W W H o m e P a g e :F Q  �NOPN r  ��QRQ n  ��STS 4  ����U
�� 
citmU m  ������ T n  ��VWV 4  ����X
�� 
cparX o  ������ 0 i  W o  ������ "0 userinformation userInformationR o      ���� 0 userwebpage userWebPageO R      ������
�� .ascrerr ****      � ****��  ��  P k  �YY Z[Z r  ��\]\ J  ��^^ _��_ m  ��`` �aa  ��  ] n     bcb 1  ����
�� 
txdlc 1  ����
�� 
ascr[ d��d r  �efe c  �ghg n  �iji 7��kl
�� 
cha k m  	���� l  ;  j n  �mnm 4  ���o
�� 
cparo l �p����p [  �qrq o  � ���� 0 i  r m   ���� ��  ��  n o  ������ "0 userinformation userInformationh m  ��
�� 
TEXTf o      ���� 0 userwebpage userWebPage��  ��  ��  D sts l ��������  ��  ��  t uvu r  (wxw J   yy z��z m  {{ �||  :  ��  x n     }~} 1  #'��
�� 
txdl~ 1   #��
�� 
ascrv � Z  )�������� C )5��� n  )1��� 4  ,1���
�� 
cpar� o  /0���� 0 i  � o  ),���� "0 userinformation userInformation� m  14�� ��� 
 C i t y :� Q  8���� r  ;L��� n  ;H��� 4  CH���
�� 
citm� m  FG���� � n  ;C��� 4  >C���
�� 
cpar� o  AB���� 0 i  � o  ;>���� "0 userinformation userInformation� o      ���� 0 usercity userCity� R      ������
�� .ascrerr ****      � ****��  ��  � k  T�� ��� r  Ta��� J  TY�� ���� m  TW�� ���  ��  � n     ��� 1  \`��
�� 
txdl� 1  Y\��
�� 
ascr� ���� r  b��� c  b{��� n  bw��� 7lw����
�� 
cha � m  rt���� �  ;  uv� n  bl��� 4  el���
�� 
cpar� l hk����� [  hk��� o  hi�~�~ 0 i  � m  ij�}�} ��  �  � o  be�|�| "0 userinformation userInformation� m  wz�{
�{ 
TEXT� o      �z�z 0 usercity userCity��  ��  ��  � ��� l ���y�x�w�y  �x  �w  � ��� r  ����� J  ���� ��v� m  ���� ���  :  �v  � n     ��� 1  ���u
�u 
txdl� 1  ���t
�t 
ascr� ��� Z  �����s�r� C ����� n  ����� 4  ���q�
�q 
cpar� o  ���p�p 0 i  � o  ���o�o "0 userinformation userInformation� m  ���� ���  F A X N u m b e r :� Q  ������ r  ����� n  ����� 4  ���n�
�n 
citm� m  ���m�m � n  ����� 4  ���l�
�l 
cpar� o  ���k�k 0 i  � o  ���j�j "0 userinformation userInformation� o      �i�i 0 userfax userFax� R      �h�g�f
�h .ascrerr ****      � ****�g  �f  � k  ���� ��� r  ����� J  ���� ��e� m  ���� ���  �e  � n     ��� 1  ���d
�d 
txdl� 1  ���c
�c 
ascr� ��b� r  ����� c  ����� n  ����� 7���a��
�a 
cha � m  ���`�` �  ;  ��� n  ����� 4  ���_�
�_ 
cpar� l ����^�]� [  ����� o  ���\�\ 0 i  � m  ���[�[ �^  �]  � o  ���Z�Z "0 userinformation userInformation� m  ���Y
�Y 
TEXT� o      �X�X 0 userfax userFax�b  �s  �r  � ��� l ���W�V�U�W  �V  �U  � ��� r  ����� J  ���� ��T� m  ���� ���  :  �T  � n     ��� 1  ���S
�S 
txdl� 1  ���R
�R 
ascr� ��� Z  �U���Q�P� C ���� n  ���� 4  ��O�
�O 
cpar� o  �N�N 0 i  � o  ���M�M "0 userinformation userInformation� m     �  F i r s t N a m e :� Q  
Q r   n   4  �L	
�L 
citm	 m  �K�K  n  

 4  �J
�J 
cpar o  �I�I 0 i   o  �H�H "0 userinformation userInformation o      �G�G 0 userfirstname userFirstName R      �F�E�D
�F .ascrerr ****      � ****�E  �D   k  &Q  r  &3 J  &+ �C m  &) �  �C   n      1  .2�B
�B 
txdl 1  +.�A
�A 
ascr �@ r  4Q c  4M n  4I 7>I�? 
�? 
cha  m  DF�>�>    ;  GH n  4>!"! 4  7>�=#
�= 
cpar# l :=$�<�;$ [  :=%&% o  :;�:�: 0 i  & m  ;<�9�9 �<  �;  " o  47�8�8 "0 userinformation userInformation m  IL�7
�7 
TEXT o      �6�6 0 userfirstname userFirstName�@  �Q  �P  � '(' l VV�5�4�3�5  �4  �3  ( )*) r  Vc+,+ J  V[-- .�2. m  VY// �00  :  �2  , n     121 1  ^b�1
�1 
txdl2 1  [^�0
�0 
ascr* 343 Z  d�56�/�.5 C dp787 n  dl9:9 4  gl�-;
�- 
cpar; o  jk�,�, 0 i  : o  dg�+�+ "0 userinformation userInformation8 m  lo<< �==  J o b T i t l e :6 Q  s�>?@> r  v�ABA n  v�CDC 4  ~��*E
�* 
citmE m  ���)�) D n  v~FGF 4  y~�(H
�( 
cparH o  |}�'�' 0 i  G o  vy�&�& "0 userinformation userInformationB o      �%�% 0 	usertitle 	userTitle? R      �$�#�"
�$ .ascrerr ****      � ****�#  �"  @ k  ��II JKJ r  ��LML J  ��NN O�!O m  ��PP �QQ  �!  M n     RSR 1  ��� 
�  
txdlS 1  ���
� 
ascrK T�T r  ��UVU c  ��WXW n  ��YZY 7���[\
� 
cha [ m  ���� \  ;  ��Z n  ��]^] 4  ���_
� 
cpar_ l ��`��` [  ��aba o  ���� 0 i  b m  ���� �  �  ^ o  ���� "0 userinformation userInformationX m  ���
� 
TEXTV o      �� 0 	usertitle 	userTitle�  �/  �.  4 cdc l ������  �  �  d efe r  ��ghg J  ��ii j�j m  ��kk �ll  :  �  h n     mnm 1  ���
� 
txdln 1  ���
� 
ascrf opo Z  �'qr��q C ��sts n  ��uvu 4  ���w
� 
cparw o  ���
�
 0 i  v o  ���	�	 "0 userinformation userInformationt m  ��xx �yy  L a s t N a m e :r Q  �#z{|z r  ��}~} n  ��� 4  ����
� 
citm� m  ���� � n  ����� 4  ����
� 
cpar� o  ���� 0 i  � o  ���� "0 userinformation userInformation~ o      �� 0 userlastname userLastName{ R      ��� 
� .ascrerr ****      � ****�  �   | k  �#�� ��� r  ���� J  ���� ���� m  ���� ���  ��  � n     ��� 1   ��
�� 
txdl� 1  � ��
�� 
ascr� ���� r  #��� c  ��� n  ��� 7����
�� 
cha � m  ���� �  ;  � n  ��� 4  	���
�� 
cpar� l ������ [  ��� o  ���� 0 i  � m  ���� ��  ��  � o  	���� "0 userinformation userInformation� m  ��
�� 
TEXT� o      ���� 0 userlastname userLastName��  �  �  p ��� l ((��������  ��  ��  � ��� r  (5��� J  (-�� ���� m  (+�� ���  :  ��  � n     ��� 1  04��
�� 
txdl� 1  -0��
�� 
ascr� ��� Z  6�������� C 6B��� n  6>��� 4  9>���
�� 
cpar� o  <=���� 0 i  � o  69���� "0 userinformation userInformation� m  >A�� ���  M o b i l e N u m b e r :� Q  E����� r  HY��� n  HU��� 4  PU���
�� 
citm� m  ST���� � n  HP��� 4  KP���
�� 
cpar� o  NO���� 0 i  � o  HK���� "0 userinformation userInformation� o      ���� 0 
usermobile 
userMobile� R      ������
�� .ascrerr ****      � ****��  ��  � k  a��� ��� r  an��� J  af�� ���� m  ad�� ���  ��  � n     ��� 1  im��
�� 
txdl� 1  fi��
�� 
ascr� ���� r  o���� c  o���� n  o���� 7y�����
�� 
cha � m  ����� �  ;  ��� n  oy��� 4  ry���
�� 
cpar� l ux������ [  ux��� o  uv���� 0 i  � m  vw���� ��  ��  � o  or���� "0 userinformation userInformation� m  ����
�� 
TEXT� o      ���� 0 
usermobile 
userMobile��  ��  ��  � ��� l ����������  ��  ��  � ��� r  ����� J  ���� ���� m  ���� ���  :  ��  � n     ��� 1  ����
�� 
txdl� 1  ����
�� 
ascr� ��� Z  ��������� C ����� n  ����� 4  �����
�� 
cpar� o  ������ 0 i  � o  ������ "0 userinformation userInformation� m  ���� ���  P h o n e N u m b e r :� Q  ������ r  ����� n  ����� 4  �����
�� 
citm� m  ������ � n  ����� 4  �����
�� 
cpar� o  ������ 0 i  � o  ������ "0 userinformation userInformation� o      ���� 0 userworkphone userWorkPhone� R      ������
�� .ascrerr ****      � ****��  ��  � k  ���� ��� r  ��   J  �� �� m  �� �  ��   n      1  ����
�� 
txdl 1  ����
�� 
ascr� �� r  ��	
	 c  �� n  �� 7����
�� 
cha  m  ������   ;  �� n  �� 4  ����
�� 
cpar l ������ [  �� o  ������ 0 i   m  ������ ��  ��   o  ������ "0 userinformation userInformation m  ����
�� 
TEXT
 o      ���� 0 userworkphone userWorkPhone��  ��  ��  �  l ����������  ��  ��    r  �	 J  �� �� m  �� �    :  ��   n     !"! 1  		��
�� 
txdl" 1  �	��
�� 
ascr #$# Z  		b%&����% C 		'(' n  		)*) 4  		��+
�� 
cpar+ o  		���� 0 i  * o  		���� "0 userinformation userInformation( m  		,, �--  P o s t a l C o d e :& Q  		^./0. r  		+121 n  		'343 4  	"	'��5
�� 
citm5 m  	%	&���� 4 n  		"676 4  		"��8
�� 
cpar8 o  	 	!���� 0 i  7 o  		���� "0 userinformation userInformation2 o      ����  0 userpostalcode userPostalCode/ R      ������
�� .ascrerr ****      � ****��  ��  0 k  	3	^99 :;: r  	3	@<=< J  	3	8>> ?��? m  	3	6@@ �AA  ��  = n     BCB 1  	;	?��
�� 
txdlC 1  	8	;��
�� 
ascr; D��D r  	A	^EFE c  	A	ZGHG n  	A	VIJI 7	K	V��KL
�� 
cha K m  	Q	S���� L  ;  	T	UJ n  	A	KMNM 4  	D	K��O
�� 
cparO l 	G	JP����P [  	G	JQRQ o  	G	H���� 0 i  R m  	H	I���� ��  ��  N o  	A	D���� "0 userinformation userInformationH m  	V	Y��
�� 
TEXTF o      ����  0 userpostalcode userPostalCode��  ��  ��  $ STS l 	c	c��������  ��  ��  T UVU r  	c	pWXW J  	c	hYY Z��Z m  	c	f[[ �\\  :  ��  X n     ]^] 1  	k	o��
�� 
txdl^ 1  	h	k��
�� 
ascrV _`_ Z  	q	�ab����a C 	q	}cdc n  	q	yefe 4  	t	y��g
�� 
cparg o  	w	x���� 0 i  f o  	q	t���� "0 userinformation userInformationd m  	y	|hh �ii  R e a l N a m e :b Q  	�	�jklj r  	�	�mnm n  	�	�opo 4  	�	���q
�� 
citmq m  	�	��� p n  	�	�rsr 4  	�	��~t
�~ 
cpart o  	�	��}�} 0 i  s o  	�	��|�| "0 userinformation userInformationn o      �{�{ 0 userfullname userFullNamek R      �z�y�x
�z .ascrerr ****      � ****�y  �x  l k  	�	�uu vwv r  	�	�xyx J  	�	�zz {�w{ m  	�	�|| �}}  �w  y n     ~~ 1  	�	��v
�v 
txdl 1  	�	��u
�u 
ascrw ��t� r  	�	���� c  	�	���� n  	�	���� 7	�	��s��
�s 
cha � m  	�	��r�r �  ;  	�	�� n  	�	���� 4  	�	��q�
�q 
cpar� l 	�	���p�o� [  	�	���� o  	�	��n�n 0 i  � m  	�	��m�m �p  �o  � o  	�	��l�l "0 userinformation userInformation� m  	�	��k
�k 
TEXT� o      �j�j 0 userfullname userFullName�t  ��  ��  ` ��� l 	�	��i�h�g�i  �h  �g  � ��� r  	�	���� J  	�	��� ��f� m  	�	��� ���  :  �f  � n     ��� 1  	�	��e
�e 
txdl� 1  	�	��d
�d 
ascr� ��� Z  	�
8���c�b� C 	�	���� n  	�	���� 4  	�	��a�
�a 
cpar� o  	�	��`�` 0 i  � o  	�	��_�_ "0 userinformation userInformation� m  	�	��� ���  S t a t e :� Q  	�
4���� r  	�
��� n  	�	���� 4  	�	��^�
�^ 
citm� m  	�	��]�] � n  	�	���� 4  	�	��\�
�\ 
cpar� o  	�	��[�[ 0 i  � o  	�	��Z�Z "0 userinformation userInformation� o      �Y�Y 0 	userstate 	userState� R      �X�W�V
�X .ascrerr ****      � ****�W  �V  � k  
	
4�� ��� r  
	
��� J  
	
�� ��U� m  
	
�� ���  �U  � n     ��� 1  

�T
�T 
txdl� 1  

�S
�S 
ascr� ��R� r  

4��� c  

0��� n  

,��� 7
!
,�Q��
�Q 
cha � m  
'
)�P�P �  ;  
*
+� n  

!��� 4  

!�O�
�O 
cpar� l 

 ��N�M� [  

 ��� o  

�L�L 0 i  � m  

�K�K �N  �M  � o  

�J�J "0 userinformation userInformation� m  
,
/�I
�I 
TEXT� o      �H�H 0 	userstate 	userState�R  �c  �b  � ��� l 
9
9�G�F�E�G  �F  �E  � ��� r  
9
F��� J  
9
>�� ��D� m  
9
<�� ���  :  �D  � n     ��� 1  
A
E�C
�C 
txdl� 1  
>
A�B
�B 
ascr� ��� Z  
G
����A�@� C 
G
S��� n  
G
O��� 4  
J
O�?�
�? 
cpar� o  
M
N�>�> 0 i  � o  
G
J�=�= "0 userinformation userInformation� m  
O
R�� ���  S t r e e t :� Q  
V
����� r  
Y
j��� n  
Y
f��� 4  
a
f�<�
�< 
citm� m  
d
e�;�; � n  
Y
a��� 4  
\
a�:�
�: 
cpar� o  
_
`�9�9 0 i  � o  
Y
\�8�8 "0 userinformation userInformation� o      �7�7 0 
userstreet 
userStreet� R      �6�5�4
�6 .ascrerr ****      � ****�5  �4  � k  
r
��� ��� r  
r
��� J  
r
w�� ��3� m  
r
u�� ���  �3  � n     ��� 1  
z
~�2
�2 
txdl� 1  
w
z�1
�1 
ascr� ��0� r  
�
���� c  
�
���� n  
�
���� 7
�
��/�	 
�/ 
cha � m  
�
��.�. 	   ;  
�
�� n  
�
�			 4  
�
��-	
�- 
cpar	 l 
�
�	�,�+	 [  
�
�			 o  
�
��*�* 0 i  	 m  
�
��)�) �,  �+  	 o  
�
��(�( "0 userinformation userInformation� m  
�
��'
�' 
TEXT� o      �&�& 0 
userstreet 
userStreet�0  �A  �@  � 	�%	 l 
�
��$�#�"�$  �#  �"  �%  �� 0 i  � m  #$�!�! � I $/� 	�
�  .corecnte****       ****	 n $+			
		 2 '+�
� 
cpar	
 o  $'�� "0 userinformation userInformation�  ��  � 			 l 
�
�����  �  �  	 			 r  
�
�			 J  
�
�		 			 m  
�
�		 �		  ; K e r b e r o s v 5 ; ;	 	�	 m  
�
�		 �		  ;�  	 n     			 1  
�
��
� 
txdl	 1  
�
��
� 
ascr	 			 l 
�
�����  �  �  	 			 Q  
�
�		 �	 r  
�
�	!	"	! n  
�
�	#	$	# 4  
�
��	%
� 
citm	% m  
�
��� 	$ o  
�
��� "0 userinformation userInformation	" o      �� &0 userkerberosrealm userKerberosRealm	  R      ���
� .ascrerr ****      � ****�  �  �  	 	&	'	& l 
�
���
�	�  �
  �	  	' 	(	)	( r  
�
�	*	+	* J  
�
�	,	, 	-�	- m  
�
�	.	. �	/	/  �  	+ n     	0	1	0 1  
�
��
� 
txdl	1 1  
�
��
� 
ascr	) 	2	3	2 l 
�
�����  �  �  	3 	4	5	4 Z  
�+	6	7��	6 = 
�
�	8	9	8 o  
�
�� �  0 emailaddress emailAddress	9 m  
�
�	:	: �	;	;  	7 k  
�'	<	< 	=	>	= l 
�
���������  ��  ��  	> 	?	@	? l 
�
���	A	B��  	A   something went wrong   	B �	C	C *   s o m e t h i n g   w e n t   w r o n g	@ 	D	E	D l 
�
���������  ��  ��  	E 	F	G	F I 
���	H	I
�� .sysodlogaskr        TEXT	H b  
�
�	J	K	J b  
�
�	L	M	L b  
�
�	N	O	N o  
�
����� 0 errormessage errorMessage	O o  
�
���
�� 
ret 	M o  
�
���
�� 
ret 	K m  
�
�	P	P �	Q	Q h U n a b l e   t o   r e a d   e m a i l   a d d r e s s   f r o m   n e t w o r k   d i r e c t o r y .	I ��	R	S
�� 
disp	R m  
� ��
�� stic    	S ��	T	U
�� 
btns	T J  	V	V 	W��	W m  	X	X �	Y	Y  O K��  	U ��	Z	[
�� 
dflt	Z J  	\	\ 	]��	] m  	^	^ �	_	_  O K��  	[ ��	`��
�� 
appr	` m  	a	a �	b	b , O u t l o o k   E x c h a n g e   S e t u p��  	G 	c��	c R  '����	d
�� .ascrerr ****      � ****��  	d ��	e��
�� 
errn	e m  !$��������  ��  �  �  	5 	f��	f l ,,��������  ��  ��  ��   	g	h	g F  0C	i	j	i = 07	k	l	k o  05���� 0 emailformat emailFormat	l m  56���� 	j = :A	m	n	m o  :?���� 0 displayname displayName	n m  ?@���� 	h 	o	p	o k  F�	q	q 	r	s	r l FF��������  ��  ��  	s 	t	u	t l FF��	v	w��  	v P J Pull user information from the account settings of the local user account   	w �	x	x �   P u l l   u s e r   i n f o r m a t i o n   f r o m   t h e   a c c o u n t   s e t t i n g s   o f   t h e   l o c a l   u s e r   a c c o u n t	u 	y	z	y l FF��������  ��  ��  	z 	{	|	{ r  FU	}	~	} n  FO		�	 1  KO��
�� 
sisn	� l FK	�����	� I FK������
�� .sysosigtsirr   ��� null��  ��  ��  ��  	~ o      ���� 0 usershortname userShortName	| 	�	�	� r  Ve	�	�	� n  V_	�	�	� 1  [_��
�� 
siln	� l V[	�����	� I V[������
�� .sysosigtsirr   ��� null��  ��  ��  ��  	� o      ���� 0 userfullname userFullName	� 	�	�	� l ff��������  ��  ��  	� 	�	�	� l ff��	�	���  	� D > first.last@domain.com and full name displays as "Last, First"   	� �	�	� |   f i r s t . l a s t @ d o m a i n . c o m   a n d   f u l l   n a m e   d i s p l a y s   a s   " L a s t ,   F i r s t "	� 	�	�	� l ff��������  ��  ��  	� 	�	�	� r  fq	�	�	� m  fi	�	� �	�	�  ,  	� n     	�	�	� 1  lp��
�� 
txdl	� 1  il��
�� 
ascr	� 	�	�	� r  r�	�	�	� n  r|	�	�	� 4 w|��	�
�� 
citm	� m  z{������	� o  rw���� 0 userfullname userFullName	� o      ���� 0 userfirstname userFirstName	� 	�	�	� r  ��	�	�	� n  ��	�	�	� 4  ����	�
�� 
cwor	� m  ������ 	� n  ��	�	�	� 4  ����	�
�� 
citm	� m  ������ 	� o  ������ 0 userfullname userFullName	� o      ���� 0 userlastname userLastName	� 	�	�	� r  ��	�	�	� m  ��	�	� �	�	�  	� n     	�	�	� 1  ����
�� 
txdl	� 1  ����
�� 
ascr	� 	�	�	� r  ��	�	�	� b  ��	�	�	� b  ��	�	�	� b  ��	�	�	� b  ��	�	�	� o  ������ 0 userfirstname userFirstName	� m  ��	�	� �	�	�  .	� o  ������ 0 userlastname userLastName	� m  ��	�	� �	�	�  @	� o  ������ 0 
domainname 
domainName	� o      ���� 0 emailaddress emailAddress	� 	���	� l ����������  ��  ��  ��  	p 	�	�	� F  ��	�	�	� = ��	�	�	� o  ������ 0 emailformat emailFormat	� m  ������ 	� = ��	�	�	� o  ������ 0 displayname displayName	� m  ������ 	� 	�	�	� k  �O	�	� 	�	�	� l ����������  ��  ��  	� 	�	�	� l ����	�	���  	� P J Pull user information from the account settings of the local user account   	� �	�	� �   P u l l   u s e r   i n f o r m a t i o n   f r o m   t h e   a c c o u n t   s e t t i n g s   o f   t h e   l o c a l   u s e r   a c c o u n t	� 	�	�	� l ����������  ��  ��  	� 	�	�	� r  ��	�	�	� n  ��	�	�	� 1  ����
�� 
sisn	� l ��	�����	� I ��������
�� .sysosigtsirr   ��� null��  ��  ��  ��  	� o      ���� 0 usershortname userShortName	� 	�	�	� r  ��	�	�	� n  ��	�	�	� 1  ����
�� 
siln	� l ��	�����	� I ��������
�� .sysosigtsirr   ��� null��  ��  ��  ��  	� o      ���� 0 userfullname userFullName	� 	�	�	� l ����������  ��  ��  	� 	�	�	� l ����	�	���  	� C = first.last@domain.com and full name displays as "First Last"   	� �	�	� z   f i r s t . l a s t @ d o m a i n . c o m   a n d   f u l l   n a m e   d i s p l a y s   a s   " F i r s t   L a s t "	� 	�	�	� l ����������  ��  ��  	� 	�	�	� r  �	�	�	� m  ��	�	� �	�	�   	� n     	�	�	� 1  ���
�� 
txdl	� 1  ����
�� 
ascr	� 	�	�	� r  	�	�	� n  	�	�	� 4  ��	�
�� 
cwor	� m  ���� 	� n  	�	�	� 4  ��
 
�� 
citm
  m  ���� 	� o  ���� 0 userfullname userFullName	� o      ���� 0 userfirstname userFirstName	� 


 r  %


 n  !


 4 !��

�� 
citm
 m   ������
 o  ���� 0 userfullname userFullName
 o      ���� 0 userlastname userLastName
 

	
 r  &1




 m  &)

 �

  
 n     


 1  ,0��
�� 
txdl
 1  ),�
� 
ascr
	 


 r  2M


 b  2G


 b  2A


 b  2=


 b  29


 o  25�~�~ 0 userfirstname userFirstName
 m  58

 �

  .
 o  9<�}�} 0 userlastname userLastName
 m  =@

 �

  @
 o  AF�|�| 0 
domainname 
domainName
 o      �{�{ 0 emailaddress emailAddress
 
 �z
  l NN�y�x�w�y  �x  �w  �z  	� 
!
"
! F  Re
#
$
# = RY
%
&
% o  RW�v�v 0 emailformat emailFormat
& m  WX�u�u 
$ = \c
'
(
' o  \a�t�t 0 displayname displayName
( m  ab�s�s 
" 
)
*
) k  h�
+
+ 
,
-
, l hh�r�q�p�r  �q  �p  
- 
.
/
. l hh�o
0
1�o  
0 P J Pull user information from the account settings of the local user account   
1 �
2
2 �   P u l l   u s e r   i n f o r m a t i o n   f r o m   t h e   a c c o u n t   s e t t i n g s   o f   t h e   l o c a l   u s e r   a c c o u n t
/ 
3
4
3 l hh�n�m�l�n  �m  �l  
4 
5
6
5 r  hw
7
8
7 n  hq
9
:
9 1  mq�k
�k 
sisn
: l hm
;�j�i
; I hm�h�g�f
�h .sysosigtsirr   ��� null�g  �f  �j  �i  
8 o      �e�e 0 usershortname userShortName
6 
<
=
< r  x�
>
?
> n  x�
@
A
@ 1  }��d
�d 
siln
A l x}
B�c�b
B I x}�a�`�_
�a .sysosigtsirr   ��� null�`  �_  �c  �b  
? o      �^�^ 0 userfullname userFullName
= 
C
D
C l ���]�\�[�]  �\  �[  
D 
E
F
E l ���Z
G
H�Z  
G ? 9 first@domain.com and full name displays as "Last, First"   
H �
I
I r   f i r s t @ d o m a i n . c o m   a n d   f u l l   n a m e   d i s p l a y s   a s   " L a s t ,   F i r s t "
F 
J
K
J l ���Y�X�W�Y  �X  �W  
K 
L
M
L r  ��
N
O
N m  ��
P
P �
Q
Q  ,  
O n     
R
S
R 1  ���V
�V 
txdl
S 1  ���U
�U 
ascr
M 
T
U
T r  ��
V
W
V n  ��
X
Y
X 4 ���T
Z
�T 
citm
Z m  ���S�S��
Y o  ���R�R 0 userfullname userFullName
W o      �Q�Q 0 userfirstname userFirstName
U 
[
\
[ r  ��
]
^
] n  ��
_
`
_ 4  ���P
a
�P 
cwor
a m  ���O�O 
` n  ��
b
c
b 4  ���N
d
�N 
citm
d m  ���M�M 
c o  ���L�L 0 userfullname userFullName
^ o      �K�K 0 userlastname userLastName
\ 
e
f
e r  ��
g
h
g m  ��
i
i �
j
j  
h n     
k
l
k 1  ���J
�J 
txdl
l 1  ���I
�I 
ascr
f 
m
n
m r  ��
o
p
o b  ��
q
r
q b  ��
s
t
s o  ���H�H 0 userfirstname userFirstName
t m  ��
u
u �
v
v  @
r o  ���G�G 0 
domainname 
domainName
p o      �F�F 0 emailaddress emailAddress
n 
w�E
w l ���D�C�B�D  �C  �B  �E  
* 
x
y
x F  ��
z
{
z = ��
|
}
| o  ���A�A 0 emailformat emailFormat
} m  ���@�@ 
{ = ��
~

~ o  ���?�? 0 displayname displayName
 m  ���>�> 
y 
�
�
� k  �a
�
� 
�
�
� l ���=�<�;�=  �<  �;  
� 
�
�
� l ���:
�
��:  
� P J Pull user information from the account settings of the local user account   
� �
�
� �   P u l l   u s e r   i n f o r m a t i o n   f r o m   t h e   a c c o u n t   s e t t i n g s   o f   t h e   l o c a l   u s e r   a c c o u n t
� 
�
�
� l ���9�8�7�9  �8  �7  
� 
�
�
� r  � 
�
�
� n  ��
�
�
� 1  ���6
�6 
sisn
� l ��
��5�4
� I ���3�2�1
�3 .sysosigtsirr   ��� null�2  �1  �5  �4  
� o      �0�0 0 usershortname userShortName
� 
�
�
� r  
�
�
� n  

�
�
� 1  
�/
�/ 
siln
� l 
��.�-
� I �,�+�*
�, .sysosigtsirr   ��� null�+  �*  �.  �-  
� o      �)�) 0 userfullname userFullName
� 
�
�
� l �(�'�&�(  �'  �&  
� 
�
�
� l �%
�
��%  
� = 7 first@domain.com if full name displays as "First Last"   
� �
�
� n   f i r s t @ d o m a i n . c o m   i f   f u l l   n a m e   d i s p l a y s   a s   " F i r s t   L a s t "
� 
�
�
� l �$�#�"�$  �#  �"  
� 
�
�
� r  
�
�
� m  
�
� �
�
�   
� n     
�
�
� 1  �!
�! 
txdl
� 1  � 
�  
ascr
� 
�
�
� r  0
�
�
� n  ,
�
�
� 4  ',�
�
� 
cwor
� m  *+�� 
� n  '
�
�
� 4  "'�
�
� 
citm
� m  %&�� 
� o  "�� 0 userfullname userFullName
� o      �� 0 userfirstname userFirstName
� 
�
�
� r  1?
�
�
� n  1;
�
�
� 4 6;�
�
� 
citm
� m  9:����
� o  16�� 0 userfullname userFullName
� o      �� 0 userlastname userLastName
� 
�
�
� r  @K
�
�
� m  @C
�
� �
�
�  
� n     
�
�
� 1  FJ�
� 
txdl
� 1  CF�
� 
ascr
� 
�
�
� r  L_
�
�
� b  LY
�
�
� b  LS
�
�
� o  LO�� 0 userfirstname userFirstName
� m  OR
�
� �
�
�  @
� o  SX�� 0 
domainname 
domainName
� o      �� 0 emailaddress emailAddress
� 
��
� l ``����  �  �  �  
� 
�
�
� F  dw
�
�
� = dk
�
�
� o  di�� 0 emailformat emailFormat
� m  ij�� 
� = nu
�
�
� o  ns�
�
 0 displayname displayName
� m  st�	�	 
� 
�
�
� k  z�
�
� 
�
�
� l zz����  �  �  
� 
�
�
� l zz�
�
��  
� P J Pull user information from the account settings of the local user account   
� �
�
� �   P u l l   u s e r   i n f o r m a t i o n   f r o m   t h e   a c c o u n t   s e t t i n g s   o f   t h e   l o c a l   u s e r   a c c o u n t
� 
�
�
� l zz����  �  �  
� 
�
�
� r  z�
�
�
� n  z�
�
�
� 1  ��
� 
sisn
� l z
�� ��
� I z������
�� .sysosigtsirr   ��� null��  ��  �   ��  
� o      ���� 0 usershortname userShortName
� 
�
�
� r  ��
�
�
� n  ��
�
�
� 1  ����
�� 
siln
� l ��
�����
� I ��������
�� .sysosigtsirr   ��� null��  ��  ��  ��  
� o      ���� 0 userfullname userFullName
� 
�
�
� l ����������  ��  ��  
� 
�
�
� l ����
�
���  
� ? 9 flast@domain.com and full name displays as "Last, First"   
� �
�
� r   f l a s t @ d o m a i n . c o m   a n d   f u l l   n a m e   d i s p l a y s   a s   " L a s t ,   F i r s t "
� 
�
�
� l ����������  ��  ��  
� 
�
�
� r  ��
�
�
� m  ��
�
� �
�
�  ,  
� n        1  ����
�� 
txdl 1  ����
�� 
ascr
�  r  �� n  �� 4 ����
�� 
citm m  �������� o  ������ 0 userfullname userFullName o      ���� 0 userfirstname userFirstName 	
	 r  �� n  �� 4  ����
�� 
cwor m  ������  n  �� 4  ����
�� 
citm m  ������  o  ������ 0 userfullname userFullName o      ���� 0 userlastname userLastName
  r  �� m  �� �   n      1  ����
�� 
txdl 1  ����
�� 
ascr  r  �� b  ��  b  ��!"! b  ��#$# l ��%����% n  ��&'& 4  ����(
�� 
cha ( m  ������ ' o  ������ 0 userfirstname userFirstName��  ��  $ o  ������ 0 userlastname userLastName" m  ��)) �**  @  o  ������ 0 
domainname 
domainName o      ���� 0 emailaddress emailAddress +��+ l ����������  ��  ��  ��  
� ,-, F  �	./. = ��010 o  ������ 0 emailformat emailFormat1 m  ������ / =  232 o   ���� 0 displayname displayName3 m  ���� - 454 k  �66 787 l ��������  ��  ��  8 9:9 l ��;<��  ; P J Pull user information from the account settings of the local user account   < �== �   P u l l   u s e r   i n f o r m a t i o n   f r o m   t h e   a c c o u n t   s e t t i n g s   o f   t h e   l o c a l   u s e r   a c c o u n t: >?> l ��������  ��  ��  ? @A@ r  BCB n  DED 1  ��
�� 
sisnE l F����F I ������
�� .sysosigtsirr   ��� null��  ��  ��  ��  C o      ���� 0 usershortname userShortNameA GHG r  +IJI n  %KLK 1  !%��
�� 
silnL l !M����M I !������
�� .sysosigtsirr   ��� null��  ��  ��  ��  J o      ���� 0 userfullname userFullNameH NON l ,,��������  ��  ��  O PQP l ,,��RS��  R > 8 flast@domain.com and full name displays as "First Last"   S �TT p   f l a s t @ d o m a i n . c o m   a n d   f u l l   n a m e   d i s p l a y s   a s   " F i r s t   L a s t "Q UVU l ,,��������  ��  ��  V WXW r  ,7YZY m  ,/[[ �\\   Z n     ]^] 1  26��
�� 
txdl^ 1  /2��
�� 
ascrX _`_ r  8Kaba n  8Gcdc 4  BG��e
�� 
cwore m  EF���� d n  8Bfgf 4  =B��h
�� 
citmh m  @A���� g o  8=���� 0 userfullname userFullNameb o      ���� 0 userfirstname userFirstName` iji r  LZklk n  LVmnm 4 QV��o
�� 
citmo m  TU������n o  LQ���� 0 userfullname userFullNamel o      ���� 0 userlastname userLastNamej pqp r  [frsr m  [^tt �uu  s n     vwv 1  ae��
�� 
txdlw 1  ^a��
�� 
ascrq xyx r  g�z{z l g}|����| b  g}}~} b  gw� b  gs��� n  go��� 4  jo���
�� 
cha � m  mn���� � o  gj���� 0 userfirstname userFirstName� o  or���� 0 userlastname userLastName� m  sv�� ���  @~ o  w|���� 0 
domainname 
domainName��  ��  { o      ���� 0 emailaddress emailAddressy ���� l ����������  ��  ��  ��  5 ��� F  ����� = ����� o  ������ 0 emailformat emailFormat� m  ������ � = ����� o  ������ 0 displayname displayName� m  ������ � ��� k  ��� ��� l ����������  ��  ��  � ��� l ��������  � P J Pull user information from the account settings of the local user account   � ��� �   P u l l   u s e r   i n f o r m a t i o n   f r o m   t h e   a c c o u n t   s e t t i n g s   o f   t h e   l o c a l   u s e r   a c c o u n t� ��� l ����������  ��  ��  � ��� r  ����� n  ����� 1  ����
�� 
sisn� l �������� I ��������
�� .sysosigtsirr   ��� null��  ��  ��  ��  � o      ���� 0 usershortname userShortName� ��� r  ����� n  ����� 1  ����
�� 
siln� l �������� I ��������
�� .sysosigtsirr   ��� null��  ��  ��  ��  � o      ���� 0 userfullname userFullName� ��� l ����~�}�  �~  �}  � ��� l ���|���|  � C = shortName@domain.com and full name displays as "Last, First"   � ��� z   s h o r t N a m e @ d o m a i n . c o m   a n d   f u l l   n a m e   d i s p l a y s   a s   " L a s t ,   F i r s t "� ��� l ���{�z�y�{  �z  �y  � ��� r  ����� m  ���� ���  ,  � n     ��� 1  ���x
�x 
txdl� 1  ���w
�w 
ascr� ��� r  ����� n  ����� 4 ���v�
�v 
citm� m  ���u�u��� o  ���t�t 0 userfullname userFullName� o      �s�s 0 userfirstname userFirstName� ��� r  ����� n  ����� 4  ���r�
�r 
cwor� m  ���q�q � n  ����� 4  ���p�
�p 
citm� m  ���o�o � o  ���n�n 0 userfullname userFullName� o      �m�m 0 userlastname userLastName� ��� r  ����� m  ���� ���  � n     ��� 1  ���l
�l 
txdl� 1  ���k
�k 
ascr� ��� r  ���� b  �
��� b  ���� o  � �j�j 0 usershortname userShortName� m   �� ���  @� o  	�i�i 0 
domainname 
domainName� o      �h�h 0 emailaddress emailAddress� ��g� l �f�e�d�f  �e  �d  �g  � ��� F  *��� = ��� o  �c�c 0 emailformat emailFormat� m  �b�b � = !(��� o  !&�a�a 0 displayname displayName� m  &'�`�` � ��� k  -��� ��� l --�_�^�]�_  �^  �]  � ��� l --�\���\  � P J Pull user information from the account settings of the local user account   � ��� �   P u l l   u s e r   i n f o r m a t i o n   f r o m   t h e   a c c o u n t   s e t t i n g s   o f   t h e   l o c a l   u s e r   a c c o u n t� ��� l --�[�Z�Y�[  �Z  �Y  � ��� r  -<��� n  -6��� 1  26�X
�X 
sisn� l -2��W�V� I -2�U�T�S
�U .sysosigtsirr   ��� null�T  �S  �W  �V  � o      �R�R 0 usershortname userShortName� ��� r  =L��� n  =F� � 1  BF�Q
�Q 
siln  l =B�P�O I =B�N�M�L
�N .sysosigtsirr   ��� null�M  �L  �P  �O  � o      �K�K 0 userfullname userFullName�  l MM�J�I�H�J  �I  �H    l MM�G�G   B < shortName@domain.com and full name displays as "First Last"    � x   s h o r t N a m e @ d o m a i n . c o m   a n d   f u l l   n a m e   d i s p l a y s   a s   " F i r s t   L a s t " 	
	 l MM�F�E�D�F  �E  �D  
  r  MX m  MP �    n      1  SW�C
�C 
txdl 1  PS�B
�B 
ascr  r  Yl n  Yh 4  ch�A
�A 
cwor m  fg�@�@  n  Yc 4  ^c�?
�? 
citm m  ab�>�>  o  Y^�=�= 0 userfullname userFullName o      �<�< 0 userfirstname userFirstName  r  m{  n  mw!"! 4 rw�;#
�; 
citm# m  uv�:�:��" o  mr�9�9 0 userfullname userFullName  o      �8�8 0 userlastname userLastName $%$ r  |�&'& m  |(( �))  ' n     *+* 1  ���7
�7 
txdl+ 1  ��6
�6 
ascr% ,-, r  ��./. b  ��010 b  ��232 o  ���5�5 0 usershortname userShortName3 m  ��44 �55  @1 o  ���4�4 0 
domainname 
domainName/ o      �3�3 0 emailaddress emailAddress- 6�26 l ���1�0�/�1  �0  �/  �2  � 787 F  ��9:9 = ��;<; o  ���.�. 0 emailformat emailFormat< m  ���-�- : = ��=>= o  ���,�, 0 displayname displayName> m  ���+�+ 8 ?�*? k  ��@@ ABA l ���)�(�'�)  �(  �'  B CDC l ���&EF�&  E $  Prompt User for relevant info   F �GG <   P r o m p t   U s e r   f o r   r e l e v a n t   i n f oD HIH l ���%�$�#�%  �$  �#  I JKJ V  ��LML k  ��NN OPO r  ��QRQ n  ��STS 1  ���"
�" 
ttxtT l ��U�!� U I ���VW
� .sysodlogaskr        TEXTV m  ��XX �YY > E n t e r   t h e   u s e r ' s   n e t w o r k   l o g i n .W �Z�
� 
dtxtZ m  ��[[ �\\  �  �!  �   R o      �� 0 usershortname userShortNameP ]�] Z ��^_��^ = ��`a` o  ���� 0 usershortname userShortNamea m  ��bb �cc  _ I ���d�
� .sysodisAaleR        TEXTd m  ��ee �ff  I n v a l i d   E n t r y !�  �  �  �  M = ��ghg o  ���� 0 usershortname userShortNameh m  ��ii �jj  K klk l ������  �  �  l mnm V  �9opo k  	4qq rsr r  	tut n  	vwv 1  �
� 
ttxtw l 	x��x I 	�yz
� .sysodlogaskr        TEXTy m  	{{ �|| J E n t e r   t h e   u s e r ' s   f i r s t   o r   g i v e n   n a m e .z �}�
� 
dtxt} m  ~~ �  �  �  �  u o      �� 0 userfirstname userFirstNames ��
� Z 4���	�� = &��� o  "�� 0 userfirstname userFirstName� m  "%�� ���  � I )0���
� .sysodisAaleR        TEXT� m  ),�� ���  I n v a l i d   E n t r y !�  �	  �  �
  p = ��� o  �� 0 userfirstname userFirstName� m  �� ���  n ��� l ::����  �  �  � ��� V  :v��� k  Fq�� ��� r  F[��� n  FW��� 1  SW� 
�  
ttxt� l FS������ I FS����
�� .sysodlogaskr        TEXT� m  FI�� ��� V E n t e r   t h e   u s e r ' s   l a s t   o r   f a m i l y   o r   s u r n a m e .� �����
�� 
dtxt� m  LO�� ���  ��  ��  ��  � o      ���� 0 userlastname userLastName� ���� Z \q������� = \c��� o  \_���� 0 userlastname userLastName� m  _b�� ���  � I fm�����
�� .sysodisAaleR        TEXT� m  fi�� ���  I n v a l i d   E n t r y !��  ��  ��  ��  � = >E��� o  >A���� 0 userlastname userLastName� m  AD�� ���  � ��� l ww��������  ��  ��  � ��� r  w���� b  w���� b  w~��� o  wz���� 0 userlastname userLastName� m  z}�� ���  ,  � o  ~����� 0 userfirstname userFirstName� o      ���� 0 userfullname userFullName� ��� l ����������  ��  ��  � ��� r  ����� m  ���� ���  � o      ���� 0 domainchoice domainChoice� ��� V  ����� k  ���� ��� r  ����� n  ����� 1  ����
�� 
bhit� l �������� I ������
�� .sysodlogaskr        TEXT� m  ���� ��� 2 S e l e c t   t h e   u s e r ' s   d o m a i n .� ����
�� 
btns� J  ���� ��� m  ���� ��� 
 C A B L E� ���� m  ���� ���  C O R P H Q��  � �����
�� 
dflt� m  ���� ��� 
 C A B L E��  ��  ��  � o      ���� 0 domainchoice domainChoice� ���� Z  �������� = ����� o  ������ 0 domainchoice domainChoice� m  ���� ���  C O R P H Q� r  ����� b  ����� o  ������ 0 domainchoice domainChoice� m  ���� ���  \� o      ���� 0 domainprefix domainPrefix��  � r  ����� b  ����� o  ������ 0 domainchoice domainChoice� m  ���� ���  \� o      ���� 0 domainprefix domainPrefix��  � = ����� o  ������ 0 domainchoice domainChoice� m  ���� ���  � ��� l ����������  ��  ��  � ��� V  ����� k  �    Z  �2�� = � o  ������ 0 domainchoice domainChoice m  � �		  C O R P H Q r  

 b   b   b   o  ���� 0 userfirstname userFirstName m   �  _ o  ���� 0 userlastname userLastName m   �  @ c o m c a s t . c o m o      ���� 0 emailaddress emailAddress��   r  2 b  , b  ( b  $ o   ���� 0 userfirstname userFirstName m   # �  _ o  $'���� 0 userlastname userLastName m  (+   �!! $ @ c a b l e . c o m c a s t . c o m o      ���� 0 emailaddress emailAddress "#" r  3g$%$ n  3a&'& 1  ]a��
�� 
ttxt' l 3](����( I 3]��)*
�� .sysodlogaskr        TEXT) b  3>+,+ b  38-.- m  36// �00 j V e r i f y   t h e   u s e r ' s   e m a i l   a d d r e s s .   C h a n g e   i f   i n c o r r e c t .. o  67��
�� 
ret , o  8=���� 0 emailaddress emailAddress* ��12
�� 
dtxt1 o  AF���� 0 emailaddress emailAddress2 ��34
�� 
btns3 J  IQ55 676 m  IL88 �99  C a n c e l7 :��: m  LO;; �<<  V e r i f y��  4 ��=��
�� 
dflt= m  TW>> �??  V e r i f y��  ��  ��  % o      ���� 0 emailaddress emailAddress# @��@ Z hAB����A = hqCDC o  hm���� 0 emailaddress emailAddressD m  mpEE �FF  B I t{��G��
�� .sysodisAaleR        TEXTG m  twHH �II  I n v a l i d   E n t r y !��  ��  ��  ��  � = ��JKJ o  ������ 0 emailaddress emailAddressK m  ��LL �MM  � NON l ����������  ��  ��  O P��P l ����������  ��  ��  ��  �*   k  ��QQ RSR l ����������  ��  ��  S TUT l ����VW��  V   something went wrong   W �XX *   s o m e t h i n g   w e n t   w r o n gU YZY l ����������  ��  ��  Z [\[ I ����]^
�� .sysodlogaskr        TEXT] b  ��_`_ b  ��aba b  ��cdc o  ������ 0 errormessage errorMessaged o  ����
�� 
ret b o  ����
�� 
ret ` m  ��ee �ff x U n a b l e   t o   p a r s e   a c c o u n t   i n f o r m a t i o n   f r o m   l o c a l   O S   X   a c c o u n t .^ ��gh
�� 
dispg m  ����
�� stic    h ��ij
�� 
btnsi J  ��kk l��l m  ��mm �nn  O K��  j ��op
�� 
dflto J  ��qq r��r m  ��ss �tt  O K��  p ��u��
�� 
appru m  ��vv �ww , O u t l o o k   E x c h a n g e   S e t u p��  \ xyx R  ������z
�� .ascrerr ****      � ****��  z ��{��
�� 
errn{ m  ����������  y |��| l ����������  ��  ��  ��  ��  ��   }~} l     ��������  ��  ��  ~ � l     ������  � 0 *------------------------------------------   � ��� T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     ������  � &   End collecting user information   � ��� @   E n d   c o l l e c t i n g   u s e r   i n f o r m a t i o n� ��� l     ������  � 0 *------------------------------------------   � ��� T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     ��������  ��  ��  � ��� l     ������  � 0 *------------------------------------------   � ��� T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     ������  � %  Begin logging user information   � ��� >   B e g i n   l o g g i n g   u s e r   i n f o r m a t i o n� ��� l     ������  � 0 *------------------------------------------   � ��� T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     ��������  ��  ��  � ��� l �������� I  ��������� 0 writelog writeLog� ���� m  ���� ��� & U s e r   i n f o r m a t i o n . . .��  ��  ��  ��  � ��� l �������� I  �����~� 0 writelog writeLog� ��}� b  ����� m  ���� ���  F i r s t   N a m e :  � o  ���|�| 0 userfirstname userFirstName�}  �~  ��  ��  � ��� l ����{�z� I  ���y��x�y 0 writelog writeLog� ��w� b  ����� m  ���� ���  L a s t   N a m e :  � o  ���v�v 0 userlastname userLastName�w  �x  �{  �z  � ��� l ����u�t� I  ���s��r�s 0 writelog writeLog� ��q� b  ����� m  ���� ���  E m a i l   A d d r e s s :  � o  ���p�p 0 emailaddress emailAddress�q  �r  �u  �t  � ��� l ���o�n� I  ��m��l�m 0 writelog writeLog� ��k� b  � ��� m  ���� ���  D e p a r t m e n t :  � o  ���j�j  0 userdepartment userDepartment�k  �l  �o  �n  � ��� l ��i�h� I  �g��f�g 0 writelog writeLog� ��e� b  ��� m  	�� ���  O f f i c e :  � o  	�d�d 0 
useroffice 
userOffice�e  �f  �i  �h  � ��� l ��c�b� I  �a��`�a 0 writelog writeLog� ��_� b  ��� m  �� ���  C o m p a n y :  � o  �^�^ 0 usercompany userCompany�_  �`  �c  �b  � ��� l +��]�\� I  +�[��Z�[ 0 writelog writeLog� ��Y� b   '��� m   #�� ���  W o r k   P h o n e :  � o  #&�X�X 0 userworkphone userWorkPhone�Y  �Z  �]  �\  � ��� l ,8��W�V� I  ,8�U��T�U 0 writelog writeLog� ��S� b  -4��� m  -0�� ���  M o b i l e   P h o n e :  � o  03�R�R 0 
usermobile 
userMobile�S  �T  �W  �V  � ��� l 9E��Q�P� I  9E�O��N�O 0 writelog writeLog� ��M� b  :A��� m  :=�� ��� 
 F A X :  � o  =@�L�L 0 userfax userFax�M  �N  �Q  �P  � ��� l FR��K�J� I  FR�I��H�I 0 writelog writeLog� ��G� b  GN��� m  GJ   �  T i t l e :  � o  JM�F�F 0 	usertitle 	userTitle�G  �H  �K  �J  �  l S_�E�D I  S_�C�B�C 0 writelog writeLog �A b  T[ m  TW		 �

  S t r e e t :   o  WZ�@�@ 0 
userstreet 
userStreet�A  �B  �E  �D    l `l�?�> I  `l�=�<�= 0 writelog writeLog �; b  ah m  ad �  C i t y :   o  dg�:�: 0 usercity userCity�;  �<  �?  �>    l my�9�8 I  my�7�6�7 0 writelog writeLog �5 b  nu m  nq �  S t a t e :   o  qt�4�4 0 	userstate 	userState�5  �6  �9  �8    l z��3�2 I  z��1 �0�1 0 writelog writeLog  !�/! b  {�"#" m  {~$$ �%%  P o s t a l   C o d e :  # o  ~��.�.  0 userpostalcode userPostalCode�/  �0  �3  �2   &'& l ��(�-�,( I  ���+)�*�+ 0 writelog writeLog) *�)* b  ��+,+ m  ��-- �..  C o u n t r y :  , o  ���(�( 0 usercountry userCountry�)  �*  �-  �,  ' /0/ l ��1�'�&1 I  ���%2�$�% 0 writelog writeLog2 3�#3 b  ��454 m  ��66 �77  W e b   P a g e :  5 o  ���"�" 0 userwebpage userWebPage�#  �$  �'  �&  0 898 l ��:�!� : I  ���;�� 0 writelog writeLog; <�< o  ���
� 
ret �  �  �!  �   9 =>= l     ����  �  �  > ?@? l     �AB�  A 0 *------------------------------------------   B �CC T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -@ DED l     �FG�  F #  End logging user information   G �HH :   E n d   l o g g i n g   u s e r   i n f o r m a t i o nE IJI l     �KL�  K 0 *------------------------------------------   L �MM T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -J NON l     ����  �  �  O PQP l     �RS�  R 0 *------------------------------------------   S �TT T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -Q UVU l     �WX�  W   Begin account setup   X �YY (   B e g i n   a c c o u n t   s e t u pV Z[Z l     �\]�  \ 0 *------------------------------------------   ] �^^ T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -[ _`_ l     ����  �  �  ` aba l ��c��c O  ��ded k  ��ff ghg I ���
�	�
�
 .miscactvnull��� ��� null�	  �  h iji l ������  �  �  j klk r  ��mnm m  ���
� boovtruen 1  ���
� 
wkOfl opo l ����� �  �  �   p qrq Q  ��stus k  ��vv wxw r  ��yzy o  ������ 0 unifiedinbox unifiedInboxz 1  ����
�� 
GrpFx {��{ n ��|}| I  ����~���� 0 writelog writeLog~ �� b  ����� b  ����� m  ���� ��� : S e t   G r o u p   S i m i l a r   F o l d e r s   t o  � o  ������ 0 unifiedinbox unifiedInbox� m  ���� ���  :   S u c c e s s f u l .��  ��  }  f  ����  t R      ������
�� .ascrerr ****      � ****��  ��  u n ����� I  ��������� 0 writelog writeLog� ���� b  ����� b  ����� m  ���� ��� : S e t   G r o u p   S i m i l a r   F o l d e r s   t o  � o  ������ 0 unifiedinbox unifiedInbox� m  ���� ���  :   F a i l e d .��  ��  �  f  ��r ��� l ����������  ��  ��  � ��� Q  �3���� k  ��� ��� r  ���� o  � ���� 20 hideonmycomputerfolders hideOnMyComputerFolders� 1   ��
�� 
hOMC� ���� n ��� I  ������� 0 writelog writeLog� ���� b  ��� b  ��� m  �� ��� F S e t   H i d e   O n   M y   C o m p u t e r   F o l d e r s   t o  � o  ���� 20 hideonmycomputerfolders hideOnMyComputerFolders� m  �� ���  :   S u c c e s s f u l .��  ��  �  f  ��  � R      ������
�� .ascrerr ****      � ****��  ��  � n !3��� I  "3������� 0 writelog writeLog� ���� b  "/��� b  "+��� m  "%�� ��� F S e t   H i d e   O n   M y   C o m p u t e r   F o l d e r s   t o  � o  %*���� 20 hideonmycomputerfolders hideOnMyComputerFolders� m  +.�� ���  :   F a i l e d .��  ��  �  f  !"� ��� l 44��������  ��  ��  � ��� Z  4�������� = 4;��� o  49���� (0 verifyemailaddress verifyEMailAddress� m  9:��
�� boovtrue� k  >��� ��� r  >p��� I >l����
�� .sysodlogaskr        TEXT� m  >A�� ��� X P l e a s e   v e r i f y   y o u r   e m a i l   a d d r e s s   i s   c o r r e c t .� ����
�� 
dtxt� o  DI���� 0 emailaddress emailAddress� ����
�� 
disp� m  LM���� � ����
�� 
appr� m  PS�� ��� , O u t l o o k   E x c h a n g e   S e t u p� ����
�� 
btns� J  V^�� ��� m  VY�� ���  C a n c e l� ���� m  Y\�� ���  V e r i f y��  � �����
�� 
dflt� J  af�� ���� m  ad�� ���  V e r i f y��  ��  � o      ���� 0 verifyemail verifyEmail� ��� r  q~��� n  qx��� 1  tx��
�� 
ttxt� o  qt���� 0 verifyemail verifyEmail� o      ���� 0 emailaddress emailAddress� ���� n ���� I  ��������� 0 writelog writeLog� ���� b  ����� b  ����� m  ���� ��� > U s e r   v e r i f i e d   e m a i l   a d d r e s s   a s  � o  ������ 0 emailaddress emailAddress� m  ���� ���  .��  ��  �  f  ���  ��  ��  � ��� l ����������  ��  ��  � ��� Z  ��������� = ����� o  ������ *0 verifyserveraddress verifyServerAddress� m  ����
�� boovtrue� k  ���� ��� r  ��� � I ����
�� .sysodlogaskr        TEXT m  �� � f P l e a s e   v e r i f y   y o u r   E x c h a n g e   S e r v e r   n a m e   i s   c o r r e c t . ��
�� 
dtxt o  ������  0 exchangeserver ExchangeServer ��
�� 
disp m  ������  ��	

�� 
appr	 m  �� � , O u t l o o k   E x c h a n g e   S e t u p
 ��
�� 
btns J  ��  m  �� �  C a n c e l �� m  �� �  V e r i f y��   ����
�� 
dflt J  �� �� m  �� �  V e r i f y��  ��    o      ���� 0 verifyserver verifyServer�  r  �� n  �� !  1  ����
�� 
ttxt! o  ������ 0 verifyserver verifyServer o      ����  0 exchangeserver ExchangeServer "��" n ��#$# I  ����%���� 0 writelog writeLog% &��& b  ��'(' b  ��)*) m  ��++ �,, @ U s e r   v e r i f i e d   s e r v e r   a d d r e s s   a s  * o  ������  0 exchangeserver ExchangeServer( m  ��-- �..  .��  ��  $  f  ����  ��  ��  � /0/ l ����������  ��  ��  0 121 l ����34��  3 "  create the Exchange account   4 �55 8   c r e a t e   t h e   E x c h a n g e   a c c o u n t2 676 l ����������  ��  ��  7 898 Q  ��:;<: k  ��== >?> r  ��@A@ I ������B
�� .corecrel****      � null��  B ��CD
�� 
koclC m  ���
�� 
EactD ��E��
�� 
prdtE l 	�F����F K  �GG ��HI
�� 
pnamH b  JKJ m  	LL �MM  M a i l b o x   -  K o  	���� 0 userfullname userFullNameI ��NO
�� 
unmeN b  PQP o  ���� 0 domainprefix domainPrefixQ o  ���� 0 usershortname userShortNameO ��RS
�� 
fnamR o   %���� 0 userfullname userFullNameS ��TU
�� 
emadT o  (-���� 0 emailaddress emailAddressU ��VW
�� 
hostV o  05����  0 exchangeserver ExchangeServerW ��XY
�� 
usssX o  8=���� 60 exchangeserverrequiresssl ExchangeServerRequiresSSLY ��Z[
�� 
portZ o  @E���� .0 exchangeserversslport ExchangeServerSSLPort[ ��\]
�� 
ExLS\ o  HM���� "0 directoryserver DirectoryServer] ��^_
�� 
LDAu^ o  PU���� N0 %directoryserverrequiresauthentication %DirectoryServerRequiresAuthentication_ ��`a
�� 
LDSL` o  X]���� 80 directoryserverrequiresssl DirectoryServerRequiresSSLa ��bc
�� 
LDMXb o  `e���� >0 directoryservermaximumresults DirectoryServerMaximumResultsc ��de
�� 
LDSBd o  hm���� 60 directoryserversearchbase DirectoryServerSearchBasee ��fg
�� 
ExPmf o  pu���� *0 downloadheadersonly downloadHeadersOnlyg ��h�
�� 
pBADh o  x}�~�~ *0 disableautodiscover disableAutodiscover�  ��  ��  ��  A o      �}�} (0 newexchangeaccount newExchangeAccount? i�|i n ��jkj I  ���{l�z�{ 0 writelog writeLogl m�ym m  ��nn �oo H C r e a t e   E x c h a n g e   a c c o u n t :   S u c c e s s f u l .�y  �z  k  f  ���|  ; R      �x�w�v
�x .ascrerr ****      � ****�w  �v  < k  ��pp qrq l ���u�t�s�u  �t  �s  r sts l ���ruv�r  u   something went wrong   v �ww *   s o m e t h i n g   w e n t   w r o n gt xyx l ���q�p�o�q  �p  �o  y z{z n ��|}| I  ���n~�m�n 0 writelog writeLog~ �l m  ���� ��� @ C r e a t e   E x c h a n g e   a c c o u n t :   F a i l e d .�l  �m  }  f  ��{ ��� l ���k�j�i�k  �j  �i  � ��� I ���h��
�h .sysodlogaskr        TEXT� b  ����� b  ����� b  ����� o  ���g�g 0 errormessage errorMessage� o  ���f
�f 
ret � o  ���e
�e 
ret � m  ���� ��� D U n a b l e   t o   c r e a t e   E x c h a n g e   a c c o u n t .� �d��
�d 
disp� m  ���c
�c stic    � �b��
�b 
btns� J  ���� ��a� m  ���� ���  O K�a  � �`��
�` 
dflt� J  ���� ��_� m  ���� ���  O K�_  � �^��]
�^ 
appr� m  ���� ��� , O u t l o o k   E x c h a n g e   S e t u p�]  � ��� R  ���\�[�
�\ .ascrerr ****      � ****�[  � �Z��Y
�Z 
errn� m  ���X�X���Y  � ��W� l ���V�U�T�V  �U  �T  �W  9 ��� l ���S�R�Q�S  �R  �Q  � ��� l ���P���P  � e _ The following lines enable Kerberos support if the userKerberos property above is set to true.   � ��� �   T h e   f o l l o w i n g   l i n e s   e n a b l e   K e r b e r o s   s u p p o r t   i f   t h e   u s e r K e r b e r o s   p r o p e r t y   a b o v e   i s   s e t   t o   t r u e .� ��� l ���O�N�M�O  �N  �M  � ��� Z  �b���L�K� = ����� o  ���J�J 0 usekerberos useKerberos� m  ���I
�I boovtrue� Q  �^���� k  ��� ��� r  ����� o  ���H�H 0 usekerberos useKerberos� n      ��� 1  ���G
�G 
Kerb� o  ���F�F (0 newexchangeaccount newExchangeAccount� ��� r  ���� o  � �E�E &0 userkerberosrealm userKerberosRealm� n      ��� 1  �D
�D 
ExGI� o   �C�C (0 newexchangeaccount newExchangeAccount� ��B� n 	��� I  
�A��@�A 0 writelog writeLog� ��?� m  
�� ��� P S e t   K e r b e r o s   a u t h e n t i c a t i o n :   S u c c e s s f u l .�?  �@  �  f  	
�B  � R      �>�=�<
�> .ascrerr ****      � ****�=  �<  � k  ^�� ��� l �;�:�9�;  �:  �9  � ��� l �8���8  �   something went wrong   � ��� *   s o m e t h i n g   w e n t   w r o n g� ��� l �7�6�5�7  �6  �5  � ��� n !��� I  !�4��3�4 0 writelog writeLog� ��2� m  �� ��� H S e t   K e r b e r o s   a u t h e n t i c a t i o n :   F a i l e d .�2  �3  �  f  � ��� l ""�1�0�/�1  �0  �/  � ��� I "Q�.��
�. .sysodlogaskr        TEXT� b  "/��� b  "+��� b  ")��� o  "'�-�- 0 errormessage errorMessage� o  '(�,
�, 
ret � o  )*�+
�+ 
ret � m  +.�� ��� ^ U n a b l e   t o   s e t   E x c h a n g e   a c c o u n t   t o   u s e   K e r b e r o s .� �*��
�* 
disp� m  25�)
�) stic    � �(��
�( 
btns� J  8=�� ��'� m  8;�� ���  O K�'  � �&��
�& 
dflt� J  @E�� ��%� m  @C�� ���  O K�%  � �$��#
�$ 
appr� m  HK�� ��� , O u t l o o k   E x c h a n g e   S e t u p�#  � ��� R  R\�"�!�
�" .ascrerr ****      � ****�!  � �  �
�  
errn  m  VY�����  � � l ]]����  �  �  �  �L  �K  �  l cc����  �  �    Q  cm k  f]		 

 l ff��   M G The Me Contact record is automatically created with the first account.    � �   T h e   M e   C o n t a c t   r e c o r d   i s   a u t o m a t i c a l l y   c r e a t e d   w i t h   t h e   f i r s t   a c c o u n t .  l ff��   a [ Set the first name, last name, email address and other information using Active Directory.    � �   S e t   t h e   f i r s t   n a m e ,   l a s t   n a m e ,   e m a i l   a d d r e s s   a n d   o t h e r   i n f o r m a t i o n   u s i n g   A c t i v e   D i r e c t o r y .  l ff����  �  �    r  fs o  fi�� 0 userfirstname userFirstName n       1  nr�
� 
pFrN 1  in�
� 
meCn  r  t� o  tw�� 0 userlastname userLastName n       !  1  |��
� 
pLsN! 1  w|�
� 
meCn "#" r  ��$%$ K  ��&& �'(
� 
radd' o  ���
�
 0 emailaddress emailAddress( �	)�
�	 
type) m  ���
� EATyeWrk�  % n      *+* 1  ���
� 
EmAd+ 1  ���
� 
meCn# ,-, r  ��./. o  ����  0 userdepartment userDepartment/ n      010 1  ���
� 
Dptm1 1  ���
� 
meCn- 232 r  ��454 o  ���� 0 
useroffice 
userOffice5 n      676 1  ��� 
�  
Ofic7 1  ����
�� 
meCn3 898 r  ��:;: o  ������ 0 usercompany userCompany; n      <=< 1  ����
�� 
Cmpy= 1  ����
�� 
meCn9 >?> r  ��@A@ o  ������ 0 userworkphone userWorkPhoneA n      BCB 1  ����
�� 
bsNmC 1  ����
�� 
meCn? DED r  ��FGF o  ������ 0 
usermobile 
userMobileG n      HIH 1  ����
�� 
mbNmI 1  ����
�� 
meCnE JKJ r  ��LML o  ������ 0 userfax userFaxM n      NON 1  ����
�� 
bFaxO 1  ����
�� 
meCnK PQP r  � RSR o  ������ 0 	usertitle 	userTitleS n      TUT 1  ����
�� 
pTtlU 1  ����
�� 
meCnQ VWV r  XYX o  ���� 0 
userstreet 
userStreetY n      Z[Z 1  	��
�� 
bStA[ 1  	��
�� 
meCnW \]\ r  ^_^ o  ���� 0 usercity userCity_ n      `a` 1  ��
�� 
bCtya 1  ��
�� 
meCn] bcb r  *ded o   ���� 0 	userstate 	userStatee n      fgf 1  %)��
�� 
bStag 1   %��
�� 
meCnc hih r  +8jkj o  +.����  0 userpostalcode userPostalCodek n      lml 1  37��
�� 
bZipm 1  .3��
�� 
meCni non r  9Fpqp o  9<���� 0 usercountry userCountryq n      rsr 1  AE��
�� 
bCous 1  <A��
�� 
meCno tut r  GTvwv o  GJ���� 0 userwebpage userWebPagew n      xyx 1  OS��
�� 
bsWPy 1  JO��
�� 
meCnu z��z n U]{|{ I  V]��}���� 0 writelog writeLog} ~��~ m  VY ��� X P o p u l a t e   M e   C o n t a c t   i n f o r m a t i o n :   S u c c e s s f u l .��  ��  |  f  UV��   R      ������
�� .ascrerr ****      � ****��  ��   n em��� I  fm������� 0 writelog writeLog� ���� m  fi�� ��� P P o p u l a t e   M e   C o n t a c t   i n f o r m a t i o n :   F a i l e d .��  ��  �  f  ef ��� l nn��������  ��  ��  � ��� l nn������  � 0 * Set Outlook to be the default application   � ��� T   S e t   O u t l o o k   t o   b e   t h e   d e f a u l t   a p p l i c a t i o n� ��� l nn������  � ( " for mail, calendars and contacts.   � ��� D   f o r   m a i l ,   c a l e n d a r s   a n d   c o n t a c t s .� ��� l nn��������  ��  ��  � ��� Q  n����� k  q��� ��� r  qx��� m  qr��
�� boovtrue� 1  rw��
�� 
pMSD� ��� r  y���� m  yz��
�� boovtrue� 1  z��
�� 
pCSD� ��� r  ����� m  ����
�� boovtrue� 1  ����
�� 
pABD� ���� n ����� I  ��������� 0 writelog writeLog� ���� m  ���� ��� � S e t   O u t l o o k   a s   d e f a u l t   m a i l ,   c a l e n d a r   a n d   c o n t a c t s   a p p l i c a t i o n :   S u c c e s s f u l .��  ��  �  f  ����  � R      ������
�� .ascrerr ****      � ****��  ��  � n ����� I  ��������� 0 writelog writeLog� ���� m  ���� ��� � S e t   O u t l o o k   a s   d e f a u l t   m a i l ,   c a l e n d a r   a n d   c o n t a c t s   a p p l i c a t i o n :   F a i l e d .��  ��  �  f  ��� ��� l ����������  ��  ��  � ��� I �������
�� .sysodelanull��� ��� nmbr� m  ������ ��  � ��� r  ����� m  ����
�� boovfals� 1  ����
�� 
wkOf� ��� l ����������  ��  ��  � ��� l ��������  �   We're done.   � ���    W e ' r e   d o n e .� ���� l ����������  ��  ��  ��  e m  �����                                                                                  OPIM  alis    x  Macintosh HD               �\	'H+  Z�Microsoft Outlook.app                                          'п�,�0        ����  	                Applications    �\Ag      �,�p    Z�  0Macintosh HD:Applications: Microsoft Outlook.app  ,  M i c r o s o f t   O u t l o o k . a p p    M a c i n t o s h   H D  "Applications/Microsoft Outlook.app  / ��  �  �  b ��� l     ��������  ��  ��  � ��� l     ������  � 0 *------------------------------------------   � ��� T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     ������  �   End account setup   � ��� $   E n d   a c c o u n t   s e t u p� ��� l     ������  � 0 *------------------------------------------   � ��� T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     ��������  ��  ��  � ��� l     ������  � 0 *------------------------------------------   � ��� T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     ������  �   Begin script cleanup   � ��� *   B e g i n   s c r i p t   c l e a n u p� ��� l     ������  � 0 *------------------------------------------   � ��� T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l �������� Q  ������ k  ���� ��� I �������
�� .sysoexecTEXT���     TEXT� m  ���� ��� � / b i n / r m   $ H O M E / L i b r a r y / L a u n c h A g e n t s / n e t . t a l k i n g m o o s e . O u t l o o k E x c h a n g e S e t u p 5 . p l i s t��  � ���� I  ��������� 0 writelog writeLog� ���� m  ���� ��� � D e l e t e   O u t l o o k E x c h a n g e S e t u p 5 . p l i s t   f i l e   f r o m   u s e r   L a u n c h A g e n t s   f o l d e r :   S u c c e s s f u l .��  ��  ��  � R      ������
�� .ascrerr ****      � ****��  ��  � I  ��������� 0 writelog writeLog� ���� m  ���� �   � D e l e t e   O u t l o o k E x c h a n g e S e t u p 5 . p l i s t   f i l e   f r o m   u s e r   L a u n c h A g e n t s   f o l d e r :   F a i l e d .��  ��  ��  ��  �  l     ��������  ��  ��    l ������ Q  �� k  ��		 

 I ������
�� .sysoexecTEXT���     TEXT m  �� � x / b i n / l a u n c h c t l   r e m o v e   n e t . t a l k i n g m o o s e . O u t l o o k E x c h a n g e S e t u p 5��   �� I  �������� 0 writelog writeLog �� m  �� � x U n l o a d   O u t l o o k E x c h a n g e S e t u p 5 . p l i s t   l a u n c h   a g e n t :   S u c c e s s f u l .��  ��  ��   R      ����~
�� .ascrerr ****      � ****�  �~   I  ���}�|�} 0 writelog writeLog �{ m  �� � p U n l o a d   O u t l o o k E x c h a n g e S e t u p 5 . p l i s t   l a u n c h   a g e n t :   F a i l e d .�{  �|  ��  ��    l     �z�y�x�z  �y  �x    l ��w�v I  ��u�t�u 0 writelog writeLog �s o  ���r
�r 
ret �s  �t  �w  �v     l 
!�q�p! I  
�o"�n�o 0 writelog writeLog" #�m# o  �l
�l 
ret �m  �n  �q  �p    $%$ l &�k�j& I  �i'�h�i 0 writelog writeLog' (�g( o  �f
�f 
ret �g  �h  �k  �j  % )*) l     �e�d�c�e  �d  �c  * +,+ l     �b-.�b  - 0 *------------------------------------------   . �// T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -, 010 l     �a23�a  2   End script cleanup   3 �44 &   E n d   s c r i p t   c l e a n u p1 565 l     �`78�`  7 0 *------------------------------------------   8 �99 T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -6 :;: l     �_�^�]�_  �^  �]  ; <=< l     �\>?�\  > 0 *------------------------------------------   ? �@@ T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -= ABA l     �[CD�[  C   Begin script handlers   D �EE ,   B e g i n   s c r i p t   h a n d l e r sB FGF l     �ZHI�Z  H 0 *------------------------------------------   I �JJ T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -G KLK l     �Y�X�W�Y  �X  �W  L MNM i   p sOPO I      �VQ�U�V 0 writelog writeLogQ R�TR o      �S�S 0 
logmessage 
logMessage�T  �U  P k     YSS TUT r     VWV b     	XYX l    Z�R�QZ I    �P[\
�P .earsffdralis        afdr[ m     �O
�O afdrcusr\ �N]�M
�N 
rtyp] m    �L
�L 
TEXT�M  �R  �Q  Y m    ^^ �__ L L i b r a r y : L o g s : O u t l o o k E x c h a n g e S e t u p 5 . l o gW o      �K�K 0 logfile logFileU `a` r    !bcb b    ded b    fgf b    hih n    jkj 1    �J
�J 
shdtk l   l�I�Hl I   �G�F�E
�G .misccurdldt    ��� null�F  �E  �I  �H  i m    mm �nn   g n    opo 1    �D
�D 
tstrp l   q�C�Bq I   �A�@�?
�A .misccurdldt    ��� null�@  �?  �C  �B  e 1    �>
�> 
tab c o      �=�= 0 rightnow rightNowa rsr Z   " 5tu�<vt =  " %wxw o   " #�;�; 0 
logmessage 
logMessagex o   # $�:
�: 
ret u r   ( +yzy o   ( )�9
�9 
ret z o      �8�8 0 loginfo logInfo�<  v r   . 5{|{ b   . 3}~} b   . 1� o   . /�7�7 0 rightnow rightNow� o   / 0�6�6 0 
logmessage 
logMessage~ o   1 2�5
�5 
ret | o      �4�4 0 loginfo logInfos ��� r   6 B��� I  6 @�3��
�3 .rdwropenshor       file� 4   6 :�2�
�2 
file� o   8 9�1�1 0 logfile logFile� �0��/
�0 
perm� m   ; <�.
�. boovtrue�/  � o      �-�- 0 openlogfile openLogFile� ��� I  C P�,��
�, .rdwrwritnull���     ****� o   C D�+�+ 0 loginfo logInfo� �*��
�* 
refn� o   E F�)�) 0 openlogfile openLogFile� �(��'
�( 
wrat� m   G J�&
�& rdwreof �'  � ��%� I  Q Y�$��#
�$ .rdwrclosnull���     ****� 4   Q U�"�
�" 
file� o   S T�!�! 0 logfile logFile�#  �%  N ��� l     � ���   �  �  � ��� l     ����  � 0 *------------------------------------------   � ��� T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     ����  �   End script handlers   � ��� (   E n d   s c r i p t   h a n d l e r s� ��� l     ����  � 5 /------------------------------------------5.4.0   � ��� ^ - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 5 . 4 . 0�       ��� F�� p���� �� � � ���f�����
�	�����  � �������� ����������������������������������������� 0 usekerberos useKerberos�  0 exchangeserver ExchangeServer� 60 exchangeserverrequiresssl ExchangeServerRequiresSSL� .0 exchangeserversslport ExchangeServerSSLPort� "0 directoryserver DirectoryServer� N0 %directoryserverrequiresauthentication %DirectoryServerRequiresAuthentication� 80 directoryserverrequiresssl DirectoryServerRequiresSSL�  00 directoryserversslport DirectoryServerSSLPort�� >0 directoryservermaximumresults DirectoryServerMaximumResults�� 60 directoryserversearchbase DirectoryServerSearchBase�� N0 %getuserinformationfromactivedirectory %getUserInformationFromActiveDirectory�� 0 usershortname userShortName�� 0 userfullname userFullName�� 0 emailaddress emailAddress�� 0 
domainname 
domainName�� 0 emailformat emailFormat�� 0 displayname displayName�� 0 domainprefix domainPrefix�� (0 verifyemailaddress verifyEMailAddress�� *0 verifyserveraddress verifyServerAddress�� *0 displaydomainprefix displayDomainPrefix�� *0 downloadheadersonly downloadHeadersOnly�� 20 hideonmycomputerfolders hideOnMyComputerFolders�� 0 unifiedinbox unifiedInbox�� *0 disableautodiscover disableAutodiscover�� 0 errormessage errorMessage�� 0 writelog writeLog
�� .aevtoappnull  �   � ****
� boovtrue
� boovtrue��
� boovtrue
� boovtrue����
� boovtrue� � 
� boovfals
� boovfals
� boovtrue
� boovfals
�
 boovtrue
�	 boovfals
� boovfals� ��P���������� 0 writelog writeLog�� ����� �  ���� 0 
logmessage 
logMessage��  � ������������ 0 
logmessage 
logMessage�� 0 logfile logFile�� 0 rightnow rightNow�� 0 loginfo logInfo�� 0 openlogfile openLogFile� ��������^����m������������������������
�� afdrcusr
�� 
rtyp
�� 
TEXT
�� .earsffdralis        afdr
�� .misccurdldt    ��� null
�� 
shdt
�� 
tstr
�� 
tab 
�� 
ret 
�� 
file
�� 
perm
�� .rdwropenshor       file
�� 
refn
�� 
wrat
�� rdwreof �� 
�� .rdwrwritnull���     ****
�� .rdwrclosnull���     ****�� Z���l �%E�O*j �,�%*j �,%�%E�O��  �E�Y 	��%�%E�O*�/�el E�O���a a  O*�/j � �����������
�� .aevtoappnull  �   � ****� k    �� �� '�� 0�� [�� b�� m�� ��� ��� ��� ��� ��� ��� ��� ��� ��� ��� ��� ���  �� �� 4�� =�� F�� O�� X�� a�� j�� s�� |�� ��� ��� ��� ��� ��� ��� ��� ��� ��� ��� ��� ���  �� �� �� �� ��� ��� ��� ��� ��� ��� ��� ��� ��� ��� ��� �� �� �� �� &�� /�� 8�� a�� ��� �� �� �� $����  ��  ��  � ���� 0 i  �f%����.��9=��`��i����������������%-;DMV_hqz������������������������������������������<��HL����b������j��p��s���������������������������������� 4O\p������$?L`{������ /<Pkx������,@[h|������		��	.	:	P	X	^	a������	���	�	�	�	�



P
i
u
�
�
�
�)[t������(4��iX��[��be���{~���������������������L /8;>��EHemsv���������� 	$-6������������������������������+-������L������������������~�}�|�{�z�y�xn������w�v�������u�t�s�r�q�p�o�n�m�l�k�j�i�h�g�f�e�d�c�b��a�`�_���^���
�� .sysoexecTEXT���     TEXT�� 0 domainjoined domainJoined�� 0 networkuser networkUser
�� 
bool�� 0 writelog writeLog
�� 
pnam
�� 
ret �� 0 userfirstname userFirstName�� 0 userlastname userLastName��  0 userdepartment userDepartment�� 0 
useroffice 
userOffice�� 0 usercompany userCompany�� 0 userworkphone userWorkPhone�� 0 
usermobile 
userMobile�� 0 userfax userFax�� 0 	usertitle 	userTitle�� 0 
userstreet 
userStreet�� 0 usercity userCity�� 0 	userstate 	userState��  0 userpostalcode userPostalCode�� 0 usercountry userCountry�� 0 userwebpage userWebPage�� 0 netbiosdomain netbiosDomain��  ��  
�� 
disp
�� stic    
�� 
btns
�� 
dflt
�� 
appr�� 
�� .sysodlogaskr        TEXT
�� 
errn����
�� 
ascr
�� 
txdl�� "0 userinformation userInformation
�� 
cpar
�� .corecnte****       ****
�� 
citm
�� 
cha 
�� 
TEXT�� &0 userkerberosrealm userKerberosRealm
�� .sysosigtsirr   ��� null
�� 
sisn
�� 
siln
�� 
cwor�� �� 
�� 
dtxt
�� 
ttxt
�� .sysodisAaleR        TEXT�� 0 domainchoice domainChoice
�� 
bhit�� 
�� .miscactvnull��� ��� null
�� 
wkOf
�� 
GrpF
�� 
hOMC�� 
�� 0 verifyemail verifyEmail�� 0 verifyserver verifyServer
�� 
kocl
�� 
Eact
�� 
prdt
�� 
unme
�� 
fnam
�� 
emad
�� 
host
�� 
usss
�� 
port
�� 
ExLS
�� 
LDAu
� 
LDSL
�~ 
LDMX
�} 
LDSB
�| 
ExPm
�{ 
pBAD�z 
�y .corecrel****      � null�x (0 newexchangeaccount newExchangeAccount
�w 
Kerb
�v 
ExGI
�u 
meCn
�t 
pFrN
�s 
pLsN
�r 
radd
�q 
type
�p EATyeWrk
�o 
EmAd
�n 
Dptm
�m 
Ofic
�l 
Cmpy
�k 
bsNm
�j 
mbNm
�i 
bFax
�h 
pTtl
�g 
bStA
�f 
bCty
�e 
bSta
�d 
bZip
�c 
bCou
�b 
bsWP
�a 
pMSD
�` 
pCSD
�_ 
pABD
�^ .sysodelanull��� ��� nmbr���j E�O�j E�O�� 
 �� �& fEc  
Y hO*�k+ 	O*�)�,%k+ 	O*�k+ 	O*�k+ 	O*�b   %k+ 	O*�b  %k+ 	O*a b  %k+ 	O*a b  %k+ 	O*a b  %k+ 	O*a b  %k+ 	O*a b  %k+ 	O*a b  %k+ 	O*a b  %k+ 	O*a b  	%k+ 	O*a b  
%k+ 	O*�k+ 	Ob  
f  G*a b  %k+ 	O*a b  %k+ 	O*a b  %k+ 	O*a b  %k+ 	O*�k+ 	Y hO*a b  %k+ 	O*a b  %k+ 	O*a b  %k+ 	O*a  b  %k+ 	O*a !b  %k+ 	O*a "b  %k+ 	O*a #b  %k+ 	O*a $b  %k+ 	O*�k+ 	Oa %E` &Oa 'E` (Oa )E` *Oa +E` ,Oa -E` .Oa /E` 0Oa 1E` 2Oa 3E` 4Oa 5E` 6Oa 7E` 8Oa 9E` :Oa ;E` <Oa =E` >Oa ?E` @Oa AE` BOb  
e � 4a Cj E` DOb  e  _ Da E%Ec  Y a FEc  W AX G Hb  �%�%a I%a Ja Ka La Mkva Na Okva Pa Qa R SO)a Ta UlhO &a Vkv_ Wa X,FOa Y_ D%a Z%j E` [W AX G Hb  �%�%a \%a Ja Ka La ]kva Na ^kva Pa _a R SO)a Ta UlhO�k_ [a `-j akh  a bkv_ Wa X,FO_ [a `�/a c P _ [a `�/a dl/Ec  W 4X G Ha ekv_ Wa X,FO_ [a `�k/[a f\[Zl\62a g&Ec  Y hOa hkv_ Wa X,FO_ [a `�/a i L _ [a `�/a dl/E` @W 2X G Ha jkv_ Wa X,FO_ [a `�k/[a f\[Zl\62a g&E` @Y hOa kkv_ Wa X,FO_ [a `�/a l L _ [a `�/a dl/E` .W 2X G Ha mkv_ Wa X,FO_ [a `�k/[a f\[Zl\62a g&E` .Y hOa nkv_ Wa X,FO_ [a `�/a o L _ [a `�/a dl/E` *W 2X G Ha pkv_ Wa X,FO_ [a `�k/[a f\[Zl\62a g&E` *Y hOa qkv_ Wa X,FO_ [a `�/a r L _ [a `�/a dl/E` ,W 2X G Ha skv_ Wa X,FO_ [a `�k/[a f\[Zl\62a g&E` ,Y hOa tkv_ Wa X,FO_ [a `�/a u P _ [a `�/a dl/Ec  W 4X G Ha vkv_ Wa X,FO_ [a `�k/[a f\[Zl\62a g&Ec  Y hOa wkv_ Wa X,FO_ [a `�/a x L _ [a `�/a dl/E` BW 2X G Ha ykv_ Wa X,FO_ [a `�k/[a f\[Zl\62a g&E` BY hOa zkv_ Wa X,FO_ [a `�/a { L _ [a `�/a dl/E` :W 2X G Ha |kv_ Wa X,FO_ [a `�k/[a f\[Zl\62a g&E` :Y hOa }kv_ Wa X,FO_ [a `�/a ~ L _ [a `�/a dl/E` 4W 2X G Ha kv_ Wa X,FO_ [a `�k/[a f\[Zl\62a g&E` 4Y hOa �kv_ Wa X,FO_ [a `�/a � L _ [a `�/a dl/E` &W 2X G Ha �kv_ Wa X,FO_ [a `�k/[a f\[Zl\62a g&E` &Y hOa �kv_ Wa X,FO_ [a `�/a � L _ [a `�/a dl/E` 6W 2X G Ha �kv_ Wa X,FO_ [a `�k/[a f\[Zl\62a g&E` 6Y hOa �kv_ Wa X,FO_ [a `�/a � L _ [a `�/a dl/E` (W 2X G Ha �kv_ Wa X,FO_ [a `�k/[a f\[Zl\62a g&E` (Y hOa �kv_ Wa X,FO_ [a `�/a � L _ [a `�/a dl/E` 2W 2X G Ha �kv_ Wa X,FO_ [a `�k/[a f\[Zl\62a g&E` 2Y hOa �kv_ Wa X,FO_ [a `�/a � L _ [a `�/a dl/E` 0W 2X G Ha �kv_ Wa X,FO_ [a `�k/[a f\[Zl\62a g&E` 0Y hOa �kv_ Wa X,FO_ [a `�/a � L _ [a `�/a dl/E` >W 2X G Ha �kv_ Wa X,FO_ [a `�k/[a f\[Zl\62a g&E` >Y hOa �kv_ Wa X,FO_ [a `�/a � P _ [a `�/a dl/Ec  W 4X G Ha �kv_ Wa X,FO_ [a `�k/[a f\[Zl\62a g&Ec  Y hOa �kv_ Wa X,FO_ [a `�/a � L _ [a `�/a dl/E` <W 2X G Ha �kv_ Wa X,FO_ [a `�k/[a f\[Zl\62a g&E` <Y hOa �kv_ Wa X,FO_ [a `�/a � L _ [a `�/a dl/E` 8W 2X G Ha �kv_ Wa X,FO_ [a `�k/[a f\[Zl\62a g&E` 8Y hOP[OY��Oa �a �lv_ Wa X,FO _ [a dl/E` �W X G HhOa �kv_ Wa X,FOb  a �  ?b  �%�%a �%a Ja Ka La �kva Na �kva Pa �a R SO)a Ta UlhY hOPY�b  k 	 b  k �& }*j �a �,Ec  O*j �a �,Ec  Oa �_ Wa X,FOb  a di/E` &Ob  a dk/a �k/E` (Oa �_ Wa X,FO_ &a �%_ (%a �%b  %Ec  OPYb  k 	 b  l �& }*j �a �,Ec  O*j �a �,Ec  Oa �_ Wa X,FOb  a dk/a �k/E` &Ob  a di/E` (Oa �_ Wa X,FO_ &a �%_ (%a �%b  %Ec  OPYub  l 	 b  k �& u*j �a �,Ec  O*j �a �,Ec  Oa �_ Wa X,FOb  a di/E` &Ob  a dk/a �k/E` (Oa �_ Wa X,FO_ &a �%b  %Ec  OPY�b  l 	 b  l �& u*j �a �,Ec  O*j �a �,Ec  Oa �_ Wa X,FOb  a dk/a �k/E` &Ob  a di/E` (Oa �_ Wa X,FO_ &a �%b  %Ec  OPYcb  m 	 b  k �& ~*j �a �,Ec  O*j �a �,Ec  Oa �_ Wa X,FOb  a di/E` &Ob  a dk/a �k/E` (Oa �_ Wa X,FO_ &a fk/_ (%a �%b  %Ec  OPY�b  m 	 b  l �& ~*j �a �,Ec  O*j �a �,Ec  Oa �_ Wa X,FOb  a dk/a �k/E` &Ob  a di/E` (Oa �_ Wa X,FO_ &a fk/_ (%a �%b  %Ec  OPY?b  a � 	 b  k �& w*j �a �,Ec  O*j �a �,Ec  Oa �_ Wa X,FOb  a di/E` &Ob  a dk/a �k/E` (Oa �_ Wa X,FOb  a �%b  %Ec  OPY�b  a � 	 b  l �& w*j �a �,Ec  O*j �a �,Ec  Oa �_ Wa X,FOb  a dk/a �k/E` &Ob  a di/E` (Oa �_ Wa X,FOb  a �%b  %Ec  OPY%b  a � 	 b  k �&� Ahb  a � a �a �a �l Sa �,Ec  Ob  a �  a �j �Y h[OY��O ;h_ &a � a �a �a �l Sa �,E` &O_ &a �  a �j �Y h[OY��O ;h_ (a � a �a �a �l Sa �,E` (O_ (a �  a �j �Y h[OY��O_ (a �%_ &%Ec  Oa �E` �O Zh_ �a � a �a La �a �lva Na �a � Sa �,E` �O_ �a �  _ �a �%Ec  Y _ �a �%Ec  [OY��O �hb  a � _ �a �  _ &a �%_ (%a �%Ec  Y _ &a �%_ (%a �%Ec  Oa ��%b  %a �b  a La �a �lva Na �a � Sa �,Ec  Ob  a �  a �j �Y h[OY�oOPY >b  �%�%a �%a Ja Ka La �kva Na �kva Pa �a R SO)a Ta UlhOPO*a �k+ 	O*a �_ &%k+ 	O*a �_ (%k+ 	O*a �b  %k+ 	O*a �_ *%k+ 	O*a �_ ,%k+ 	O*a �_ .%k+ 	O*a �_ 0%k+ 	O*a �_ 2%k+ 	O*a �_ 4%k+ 	O*a �_ 6%k+ 	O*a �_ 8%k+ 	O*a �_ :%k+ 	O*a _ <%k+ 	O*a_ >%k+ 	O*a_ @%k+ 	O*a_ B%k+ 	O*�k+ 	Oa*jOe*a,FO #b  *a,FO)ab  %a	%k+ 	W X G H)a
b  %a%k+ 	O #b  *a,FO)ab  %a%k+ 	W X G H)ab  %a%k+ 	Ob  e  Xaa �b  a Jka Paa Laalva Nakva SE`O_a �,Ec  O)ab  %a%k+ 	Y hOb  e  Xaa �b  a Jka Paa Laalva Nakva SE`O_a �,Ec  O)a b  %a!%k+ 	Y hO �*a"a#a$�a%b  %a&b  b  %a'b  a(b  a)b  a*b  a+b  a,b  a-b  a.b  a/b  a0b  	a1b  a2b  a3a �4E`5O)a6k+ 	W LX G H)a7k+ 	Ob  �%�%a8%a Ja Ka La9kva Na:kva Pa;a R SO)a Ta UlhOPOb   e  w 'b   _5a<,FO_ �_5a=,FO)a>k+ 	W LX G H)a?k+ 	Ob  �%�%a@%a Ja Ka LaAkva NaBkva PaCa R SO)a Ta UlhOPY hO �_ &*aD,aE,FO_ (*aD,aF,FOaGb  aHaIa �*aD,aJ,FO_ **aD,aK,FO_ ,*aD,aL,FO_ .*aD,aM,FO_ 0*aD,aN,FO_ 2*aD,aO,FO_ 4*aD,aP,FO_ 6*aD,aQ,FO_ 8*aD,aR,FO_ :*aD,aS,FO_ <*aD,aT,FO_ >*aD,aU,FO_ @*aD,aV,FO_ B*aD,aW,FO)aXk+ 	W X G H)aYk+ 	O %e*aZ,FOe*a[,FOe*a\,FO)a]k+ 	W X G H)a^k+ 	Oa �j_Of*a,FOPUO a`j O*aak+ 	W X G H*abk+ 	O acj O*adk+ 	W X G H*aek+ 	O*�k+ 	O*�k+ 	O*�k+ 	 ascr  ��ޭ