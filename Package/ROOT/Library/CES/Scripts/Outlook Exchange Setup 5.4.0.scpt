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
 l     ����   P J Complete this only if not using Active Directory to get user information.    � �   C o m p l e t e   t h i s   o n l y   i f   n o t   u s i n g   A c t i v e   D i r e c t o r y   t o   g e t   u s e r   i n f o r m a t i o n .  l     ����   L F The part of your organization's email address following the @ symbol.    � �   T h e   p a r t   o f   y o u r   o r g a n i z a t i o n ' s   e m a i l   a d d r e s s   f o l l o w i n g   t h e   @   s y m b o l .  l     ��������  ��  ��    j   5 9���� 0 emailformat emailFormat m   5 8����   l     ����   P J Complete this only if not using Active Directory to get user information.    � �   C o m p l e t e   t h i s   o n l y   i f   n o t   u s i n g   A c t i v e   D i r e c t o r y   t o   g e t   u s e r   i n f o r m a t i o n .  l     �� !��    P J When Active Directory is unavailable to determine a user's email address,   ! �"" �   W h e n   A c t i v e   D i r e c t o r y   i s   u n a v a i l a b l e   t o   d e t e r m i n e   a   u s e r ' s   e m a i l   a d d r e s s , #$# l     �%&�  % V P this script will attempt to parse it from the display name of the user's login.   & �'' �   t h i s   s c r i p t   w i l l   a t t e m p t   t o   p a r s e   i t   f r o m   t h e   d i s p l a y   n a m e   o f   t h e   u s e r ' s   l o g i n .$ ()( l     �~�}�|�~  �}  �|  ) *+* l     �{,-�{  , 1 + Describe your organization's email format:   - �.. V   D e s c r i b e   y o u r   o r g a n i z a t i o n ' s   e m a i l   f o r m a t :+ /0/ l     �z12�z  1 / ) 1: Email format is first.last@domain.com   2 �33 R   1 :   E m a i l   f o r m a t   i s   f i r s t . l a s t @ d o m a i n . c o m0 454 l     �y67�y  6 * $ 2: Email format is first@domain.com   7 �88 H   2 :   E m a i l   f o r m a t   i s   f i r s t @ d o m a i n . c o m5 9:9 l     �x;<�x  ; N H 3: Email format is flast@domain.com (first name initial plus last name)   < �== �   3 :   E m a i l   f o r m a t   i s   f l a s t @ d o m a i n . c o m   ( f i r s t   n a m e   i n i t i a l   p l u s   l a s t   n a m e ): >?> l     �w@A�w  @ . ( 4: Email format is shortName@domain.com   A �BB P   4 :   E m a i l   f o r m a t   i s   s h o r t N a m e @ d o m a i n . c o m? CDC l     �vEF�v  E / ) 5: Email format is first_last@domain.com   F �GG R   5 :   E m a i l   f o r m a t   i s   f i r s t _ l a s t @ d o m a i n . c o mD HIH l     �u�t�s�u  �t  �s  I JKJ j   : >�rL�r 0 displayname displayNameL m   : ;�q�q K MNM l     �pOP�p  O P J Complete this only if not using Active Directory to get user information.   P �QQ �   C o m p l e t e   t h i s   o n l y   i f   n o t   u s i n g   A c t i v e   D i r e c t o r y   t o   g e t   u s e r   i n f o r m a t i o n .N RSR l     �oTU�o  T M G Describe how the user's display name appears at the bottom of the menu   U �VV �   D e s c r i b e   h o w   t h e   u s e r ' s   d i s p l a y   n a m e   a p p e a r s   a t   t h e   b o t t o m   o f   t h e   m e n uS WXW l     �nYZ�n  Y R L when clicking the Apple menu (Log Out Joe Cool... or Log Out Cool, Joe...).   Z �[[ �   w h e n   c l i c k i n g   t h e   A p p l e   m e n u   ( L o g   O u t   J o e   C o o l . . .   o r   L o g   O u t   C o o l ,   J o e . . . ) .X \]\ l     �m^_�m  ^ / ) 1: Display name appears as "Last, First"   _ �`` R   1 :   D i s p l a y   n a m e   a p p e a r s   a s   " L a s t ,   F i r s t "] aba l     �lcd�l  c . ( 2: Display name appears as "First Last"   d �ee P   2 :   D i s p l a y   n a m e   a p p e a r s   a s   " F i r s t   L a s t "b fgf l     �k�j�i�k  �j  �i  g hih j   ? E�hj�h 0 domainprefix domainPrefixj m   ? Bkk �ll  i mnm l     �gop�g  o Y S Optionally append a NetBIOS domain name to the beginning of the user's short name.   p �qq �   O p t i o n a l l y   a p p e n d   a   N e t B I O S   d o m a i n   n a m e   t o   t h e   b e g i n n i n g   o f   t h e   u s e r ' s   s h o r t   n a m e .n rsr l     �ftu�f  t 9 3 Be sure to use two backslashes when adding a name.   u �vv f   B e   s u r e   t o   u s e   t w o   b a c k s l a s h e s   w h e n   a d d i n g   a   n a m e .s wxw l     �eyz�e  y N H Example: Use "TALKINGMOOSE\\" to set user name "TALKINGMOOSE\username".   z �{{ �   E x a m p l e :   U s e   " T A L K I N G M O O S E \ \ "   t o   s e t   u s e r   n a m e   " T A L K I N G M O O S E \ u s e r n a m e " .x |}| l     �d�c�b�d  �c  �b  } ~~ l     �a�`�_�a  �`  �_   ��� l     �^���^  � C =------------- User Experience -------------------------------   � ��� z - - - - - - - - - - - - -   U s e r   E x p e r i e n c e   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     �]�\�[�]  �\  �[  � ��� j   F J�Z��Z (0 verifyemailaddress verifyEMailAddress� m   F G�Y
�Y boovfals� ��� l     �X���X  � M G If set to "true", a dialog asks the user to confirm his email address.   � ��� �   I f   s e t   t o   " t r u e " ,   a   d i a l o g   a s k s   t h e   u s e r   t o   c o n f i r m   h i s   e m a i l   a d d r e s s .� ��� l     �W�V�U�W  �V  �U  � ��� j   K O�T��T *0 verifyserveraddress verifyServerAddress� m   K L�S
�S boovfals� ��� l     �R���R  � W Q If set to "true", a dialog asks the user to confirm his Exchange server address.   � ��� �   I f   s e t   t o   " t r u e " ,   a   d i a l o g   a s k s   t h e   u s e r   t o   c o n f i r m   h i s   E x c h a n g e   s e r v e r   a d d r e s s .� ��� l     �Q�P�O�Q  �P  �O  � ��� j   P T�N��N *0 displaydomainprefix displayDomainPrefix� m   P Q�M
�M boovtrue� ��� l     �L���L  � C = If set to "true", the username appears as "DOMAIN\username".   � ��� z   I f   s e t   t o   " t r u e " ,   t h e   u s e r n a m e   a p p e a r s   a s   " D O M A I N \ u s e r n a m e " .� ��� l     �K���K  � 5 / Otherwise, the username appears as "username".   � ��� ^   O t h e r w i s e ,   t h e   u s e r n a m e   a p p e a r s   a s   " u s e r n a m e " .� ��� l     �J�I�H�J  �I  �H  � ��� j   U Y�G��G *0 downloadheadersonly downloadHeadersOnly� m   U V�F
�F boovfals� ��� l     �E���E  � H B If set to "true", only email headers are downloaded into Outlook.   � ��� �   I f   s e t   t o   " t r u e " ,   o n l y   e m a i l   h e a d e r s   a r e   d o w n l o a d e d   i n t o   O u t l o o k .� ��� l     �D���D  � B < This takes much less time to sync but a user must be online   � ��� x   T h i s   t a k e s   m u c h   l e s s   t i m e   t o   s y n c   b u t   a   u s e r   m u s t   b e   o n l i n e� ��� l     �C���C  � %  to download and view messages.   � ��� >   t o   d o w n l o a d   a n d   v i e w   m e s s a g e s .� ��� l     �B�A�@�B  �A  �@  � ��� j   Z ^�?��? 20 hideonmycomputerfolders hideOnMyComputerFolders� m   Z [�>
�> boovtrue� ��� l     �=���=  � - ' If set to "true", hides local folders.   � ��� N   I f   s e t   t o   " t r u e " ,   h i d e s   l o c a l   f o l d e r s .� ��� l     �<���<  � ; 5 A single Exchange account should do this by default.   � ��� j   A   s i n g l e   E x c h a n g e   a c c o u n t   s h o u l d   d o   t h i s   b y   d e f a u l t .� ��� l     �;�:�9�;  �:  �9  � ��� j   _ c�8��8 0 unifiedinbox unifiedInbox� m   _ `�7
�7 boovfals� ��� l     �6���6  � C = If set to "true", turns on the Group Similar Folders feature   � ��� z   I f   s e t   t o   " t r u e " ,   t u r n s   o n   t h e   G r o u p   S i m i l a r   F o l d e r s   f e a t u r e� ��� l     �5���5  � / ) in Outlook menu > Preferences > General.   � ��� R   i n   O u t l o o k   m e n u   >   P r e f e r e n c e s   >   G e n e r a l .� ��� l     �4�3�2�4  �3  �2  � ��� j   d h�1��1 *0 disableautodiscover disableAutodiscover� m   d e�0
�0 boovfals� ��� l     �/���/  � < 6 If set to "true", disables Autodiscover functionality   � ��� l   I f   s e t   t o   " t r u e " ,   d i s a b l e s   A u t o d i s c o v e r   f u n c t i o n a l i t y� ��� l     �.���.  � C = for the Exchange account. Not recommended for mobile devices   � ��� z   f o r   t h e   E x c h a n g e   a c c o u n t .   N o t   r e c o m m e n d e d   f o r   m o b i l e   d e v i c e s� ��� l     �-���-  � B < that may connect to an internal Exchange server address and   � ��� x   t h a t   m a y   c o n n e c t   t o   a n   i n t e r n a l   E x c h a n g e   s e r v e r   a d d r e s s   a n d� ��� l     �,���,  � ? 9 connect to a different external Exchange server address.   � ��� r   c o n n e c t   t o   a   d i f f e r e n t   e x t e r n a l   E x c h a n g e   s e r v e r   a d d r e s s .� ��� l     �+�*�)�+  �*  �)  � ��� j   i o�(��( 0 errormessage errorMessage� m   i l�� ��� � O u t l o o k ' s   s e t u p   f o r   y o u r   E x c h a n g e   a c c o u n t   f a i l e d .   P l e a s e   c o n t a c t   t h e   H e l p   D e s k   f o r   a s s i s t a n c e .� ��� l     �'���'  � T N Customize this error message for your users in case their account setup fails   � ��� �   C u s t o m i z e   t h i s   e r r o r   m e s s a g e   f o r   y o u r   u s e r s   i n   c a s e   t h e i r   a c c o u n t   s e t u p   f a i l s� � � l     �&�%�$�&  �%  �$     l     �#�#   0 *------------------------------------------    � T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  l     �"	�"   * $ End network, server and preferences   	 �

 H   E n d   n e t w o r k ,   s e r v e r   a n d   p r e f e r e n c e s  l     �!�!   0 *------------------------------------------    � T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  l     � ���   �  �    l     ��   0 *------------------------------------------    � T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  l     ��     Begin Domain Check    � &   B e g i n   D o m a i n   C h e c k  l     ��   0 *------------------------------------------    �   T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - !"! l     ����  �  �  " #$# l    %��% r     &'& l    (��( I    �)�
� .sysoexecTEXT���     TEXT) m     ** �++ z d s c o n f i g a d   - s h o w   |   a w k   ' / A c t i v e   D i r e c t o r y   F o r e s t /   { p r i n t   $ 5 } '�  �  �  ' o      �� 0 domainjoined domainJoined�  �  $ ,-, l   .��. r    /0/ l   1��1 I   �2�
� .sysoexecTEXT���     TEXT2 m    	33 �44 p d s c l   .   r e a d   / U s e r s / $ U S E R   O r i g i n a l A u t h e n t i c a t i o n A u t h o r i t y�  �  �  0 o      �
�
 0 networkuser networkUser�  �  - 565 l   )7�	�7 Z   )89��8 G    :;: =   <=< o    �� 0 domainjoined domainJoined= m    >> �??  ; =   @A@ o    �� 0 networkuser networkUserA m    BB �CC  9 r    %DED m    �
� boovfalsE o      �� N0 %getuserinformationfromactivedirectory %getUserInformationFromActiveDirectory�  �  �	  �  6 FGF l     �� ���  �   ��  G HIH l     ��JK��  J 0 *------------------------------------------   K �LL T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -I MNM l     ��OP��  O   Begin log file setup   P �QQ *   B e g i n   l o g   f i l e   s e t u pN RSR l     ��TU��  T 0 *------------------------------------------   U �VV T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -S WXW l     ��������  ��  ��  X YZY l     ��[\��  [ < 6 create the log file in the current user's Logs folder   \ �]] l   c r e a t e   t h e   l o g   f i l e   i n   t h e   c u r r e n t   u s e r ' s   L o g s   f o l d e rZ ^_^ l     ��������  ��  ��  _ `a` l  * 0b����b I   * 0��c���� 0 writelog writeLogc d��d m   + ,ee �ff D S t a r t i n g   E x c h a n g e   a c c o u n t   s e t u p . . .��  ��  ��  ��  a ghg l  1 ;i����i I   1 ;��j���� 0 writelog writeLogj k��k b   2 7lml m   2 3nn �oo  S c r i p t :  m n   3 6pqp 1   4 6��
�� 
pnamq  f   3 4��  ��  ��  ��  h rsr l  < Bt����t I   < B��u���� 0 writelog writeLogu v��v o   = >��
�� 
ret ��  ��  ��  ��  s wxw l     ��������  ��  ��  x yzy l     ��{|��  { 0 *------------------------------------------   | �}} T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -z ~~ l     ������  �   End log file setup    � ��� (   E n d   l o g   f i l e   s e t u p   ��� l     ������  � 0 *------------------------------------------   � ��� T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     ��������  ��  ��  � ��� l     ������  � 0 *------------------------------------------   � ��� T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     ������  � &   Begin logging script properties   � ��� @   B e g i n   l o g g i n g   s c r i p t   p r o p e r t i e s� ��� l     ������  � 0 *------------------------------------------   � ��� T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     ��������  ��  ��  � ��� l  C I������ I   C I������� 0 writelog writeLog� ���� m   D E�� ��� & S e t u p   p r o p e r t i e s . . .��  ��  ��  ��  � ��� l  J V������ I   J V������� 0 writelog writeLog� ���� b   K R��� m   K L�� ���  U s e   K e r b e r o s :  � o   L Q���� 0 usekerberos useKerberos��  ��  ��  ��  � ��� l  W c������ I   W c������� 0 writelog writeLog� ���� b   X _��� m   X Y�� ��� " E x c h a n g e   S e r v e r :  � o   Y ^����  0 exchangeserver ExchangeServer��  ��  ��  ��  � ��� l  d r������ I   d r������� 0 writelog writeLog� ���� b   e n��� m   e h�� ��� < E x c h a n g e   S e r v e r   R e q u i r e s   S S L :  � o   h m���� 60 exchangeserverrequiresssl ExchangeServerRequiresSSL��  ��  ��  ��  � ��� l  s ������� I   s �������� 0 writelog writeLog� ���� b   t }��� m   t w�� ��� , E x c h a n g e   S e r v e r   P o r t :  � o   w |���� .0 exchangeserversslport ExchangeServerSSLPort��  ��  ��  ��  � ��� l  � ������� I   � �������� 0 writelog writeLog� ���� b   � ���� m   � ��� ��� $ D i r e c t o r y   S e r v e r :  � o   � ����� "0 directoryserver DirectoryServer��  ��  ��  ��  � ��� l  � ������� I   � �������� 0 writelog writeLog� ���� b   � ���� m   � ��� ��� T D i r e c t o r y   S e r v e r   R e q u i r e s   A u t h e n t i c a t i o n :  � o   � ����� N0 %directoryserverrequiresauthentication %DirectoryServerRequiresAuthentication��  ��  ��  ��  � ��� l  � ������� I   � �������� 0 writelog writeLog� ���� b   � ���� m   � ��� ��� > D i r e c t o r y   S e r v e r   R e q u i r e s   S S L :  � o   � ����� 80 directoryserverrequiresssl DirectoryServerRequiresSSL��  ��  ��  ��  � ��� l  � ������� I   � �������� 0 writelog writeLog� ���� b   � ���� m   � ��� ��� 6 D i r e c t o r y   S e r v e r   S S L   P o r t :  � o   � ����� 00 directoryserversslport DirectoryServerSSLPort��  ��  ��  ��  � ��� l  � ������� I   � �������� 0 writelog writeLog� ���� b   � ���� m   � ��� ��� D D i r e c t o r y   S e r v e r   M a x i m u m   R e s u l t s :  � o   � ����� >0 directoryservermaximumresults DirectoryServerMaximumResults��  ��  ��  ��  � ��� l  � ������� I   � �������� 0 writelog writeLog� ���� b   � ���� m   � ��� ��� < D i r e c t o r y   S e r v e r   S e a r c h   B a s e :  � o   � ����� 60 directoryserversearchbase DirectoryServerSearchBase��  ��  ��  ��  � ��� l  � ������� I   � �������� 0 writelog writeLog�  ��  b   � � m   � � � X G e t   U s e r   I n f o r m a t i o n   f r o m   A c t i v e   D i r e c t o r y :   o   � ����� N0 %getuserinformationfromactivedirectory %getUserInformationFromActiveDirectory��  ��  ��  ��  �  l  � ����� I   � ������� 0 writelog writeLog 	��	 o   � ���
�� 
ret ��  ��  ��  ��   

 l     ��������  ��  ��    l  �B���� Z   �B���� =  � � o   � ����� N0 %getuserinformationfromactivedirectory %getUserInformationFromActiveDirectory m   � ��
� boovfals k   �>  I   �
�~�}�~ 0 writelog writeLog �| b   � m   �  �  D o m a i n   N a m e :   o   �{�{ 0 
domainname 
domainName�|  �}    I  �z�y�z 0 writelog writeLog �x b   !  m  "" �##  E m a i l   f o r m a t :  ! o  �w�w 0 emailformat emailFormat�x  �y   $%$ I  (�v&�u�v 0 writelog writeLog& '�t' b  $()( m  ** �++  D i s p l a y   N a m e :  ) o  #�s�s 0 displayname displayName�t  �u  % ,-, I  )7�r.�q�r 0 writelog writeLog. /�p/ b  *3010 m  *-22 �33  D o m a i n   P r e f i x :  1 o  -2�o�o 0 domainprefix domainPrefix�p  �q  - 4�n4 I  8>�m5�l�m 0 writelog writeLog5 6�k6 o  9:�j
�j 
ret �k  �l  �n  ��  ��  ��  ��   787 l     �i�h�g�i  �h  �g  8 9:9 l CQ;�f�e; I  CQ�d<�c�d 0 writelog writeLog< =�b= b  DM>?> m  DG@@ �AA , V e r i f y   E m a i l   A d d r e s s :  ? o  GL�a�a (0 verifyemailaddress verifyEMailAddress�b  �c  �f  �e  : BCB l R`D�`�_D I  R`�^E�]�^ 0 writelog writeLogE F�\F b  S\GHG m  SVII �JJ . V e r i f y   S e r v e r   A d d r e s s :  H o  V[�[�[ *0 verifyserveraddress verifyServerAddress�\  �]  �`  �_  C KLK l aoM�Z�YM I  ao�XN�W�X 0 writelog writeLogN O�VO b  bkPQP m  beRR �SS . D i s p l a y   D o m a i n   P r e f i x :  Q o  ej�U�U *0 displaydomainprefix displayDomainPrefix�V  �W  �Z  �Y  L TUT l p~V�T�SV I  p~�RW�Q�R 0 writelog writeLogW X�PX b  qzYZY m  qt[[ �\\ . D o w n l o a d   H e a d e r s   O n l y :  Z o  ty�O�O *0 downloadheadersonly downloadHeadersOnly�P  �Q  �T  �S  U ]^] l �_�N�M_ I  ��L`�K�L 0 writelog writeLog` a�Ja b  ��bcb m  ��dd �ee : H i d e   O n   M y   C o m p u t e r   F o l d e r s :  c o  ���I�I 20 hideonmycomputerfolders hideOnMyComputerFolders�J  �K  �N  �M  ^ fgf l ��h�H�Gh I  ���Fi�E�F 0 writelog writeLogi j�Dj b  ��klk m  ��mm �nn  U n i f i e d   I n b o x :  l o  ���C�C 0 unifiedinbox unifiedInbox�D  �E  �H  �G  g opo l ��q�B�Aq I  ���@r�?�@ 0 writelog writeLogr s�>s b  ��tut m  ��vv �ww , D i s a b l e   A u t o d i s c o v e r :  u o  ���=�= *0 disableautodiscover disableAutodiscover�>  �?  �B  �A  p xyx l ��z�<�;z I  ���:{�9�: 0 writelog writeLog{ |�8| b  ��}~} m  �� ��� ( E r r o r   M e s s a g e   t e x t :  ~ o  ���7�7 0 errormessage errorMessage�8  �9  �<  �;  y ��� l ����6�5� I  ���4��3�4 0 writelog writeLog� ��2� o  ���1
�1 
ret �2  �3  �6  �5  � ��� l     �0�/�.�0  �/  �.  � ��� l     �-���-  � 0 *------------------------------------------   � ��� T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     �,���,  � %  End logging script properties    � ��� >   E n d   l o g g i n g   s c r i p t   p r o p e r t i e s  � ��� l     �+���+  � 0 *------------------------------------------   � ��� T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     �*�)�(�*  �)  �(  � ��� l     �'���'  � 0 *------------------------------------------   � ��� T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     �&���&  � ( " Begin collecting user information   � ��� D   B e g i n   c o l l e c t i n g   u s e r   i n f o r m a t i o n� ��� l     �%���%  � 0 *------------------------------------------   � ��� T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     �$�#�"�$  �#  �"  � ��� l     �!���!  � R L attempt to read information from Active Directory for the Me Contact record   � ��� �   a t t e m p t   t o   r e a d   i n f o r m a t i o n   f r o m   A c t i v e   D i r e c t o r y   f o r   t h e   M e   C o n t a c t   r e c o r d� ��� l     � ���   �  �  � ��� l ������ r  ����� m  ���� ���  � o      �� 0 userfirstname userFirstName�  �  � ��� l ������ r  ����� m  ���� ���  � o      �� 0 userlastname userLastName�  �  � ��� l ������ r  ����� m  ���� ���  � o      ��  0 userdepartment userDepartment�  �  � ��� l ������ r  ����� m  ���� ���  � o      �� 0 
useroffice 
userOffice�  �  � ��� l ������ r  ����� m  ���� ���  � o      �� 0 usercompany userCompany�  �  � ��� l ������ r  ����� m  ���� ���  � o      �� 0 userworkphone userWorkPhone�  �  � ��� l �����
� r  ����� m  ���� ���  � o      �	�	 0 
usermobile 
userMobile�  �
  � ��� l ����� r  ���� m  ���� ���  � o      �� 0 userfax userFax�  �  � ��� l 	���� r  	��� m  �� ���  � o      �� 0 	usertitle 	userTitle�  �  � ��� l 
���� r  
��� m  
�� ���  � o      � �  0 
userstreet 
userStreet�  �  � ��� l ������ r  ��� m  �� ���  � o      ���� 0 usercity userCity��  ��  � ��� l ! ����  r  ! m   �   o      ���� 0 	userstate 	userState��  ��  �  l ")���� r  ")	 m  "%

 �  	 o      ����  0 userpostalcode userPostalCode��  ��    l *1���� r  *1 m  *- �   o      ���� 0 usercountry userCountry��  ��    l 29���� r  29 m  25 �   o      ���� 0 userwebpage userWebPage��  ��    l     ��������  ��  ��    l :����� Z  :� !" = :A#$# o  :?���� N0 %getuserinformationfromactivedirectory %getUserInformationFromActiveDirectory$ m  ?@��
�� boovtrue  k  D-%% &'& l DD��������  ��  ��  ' ()( l DD��*+��  * + % Get information from Active Directoy   + �,, J   G e t   i n f o r m a t i o n   f r o m   A c t i v e   D i r e c t o y) -.- l DD��������  ��  ��  . /0/ l DD��12��  1 3 - get the domain's primary NetBIOS domain name   2 �33 Z   g e t   t h e   d o m a i n ' s   p r i m a r y   N e t B I O S   d o m a i n   n a m e0 454 l DD��������  ��  ��  5 676 Q  D�89:8 k  Gv;; <=< r  GR>?> I GN��@��
�� .sysoexecTEXT���     TEXT@ m  GJAA �BB � / u s r / b i n / d s c l   " / A c t i v e   D i r e c t o r y / "   - r e a d   /   S u b N o d e s   |   a w k   ' B E G I N   { F S = " :   " }   { p r i n t   $ 2 } '��  ? o      ���� 0 netbiosdomain netbiosDomain= C��C Z  SvDE��FD = SZGHG o  SX���� *0 displaydomainprefix displayDomainPrefixH m  XY��
�� boovtrueE r  ]jIJI b  ]dKLK o  ]`���� 0 netbiosdomain netbiosDomainL m  `cMM �NN  \J o      ���� 0 domainprefix domainPrefix��  F r  mvOPO m  mpQQ �RR  P o      ���� 0 domainprefix domainPrefix��  9 R      ������
�� .ascrerr ****      � ****��  ��  : k  ~�SS TUT l ~~��������  ��  ��  U VWV l ~~��XY��  X   something went wrong   Y �ZZ *   s o m e t h i n g   w e n t   w r o n gW [\[ l ~~��������  ��  ��  \ ]^] I ~���_`
�� .sysodlogaskr        TEXT_ b  ~�aba b  ~�cdc b  ~�efe o  ~����� 0 errormessage errorMessagef o  ����
�� 
ret d o  ����
�� 
ret b m  ��gg �hh � U n a b l e   t o   d e t e r m i n e   N E T B I O S   d o m a i n   n a m e .   T h i s   c o m p u t e r   m a y   n o t   b e   b o u n d   t o   A c t i v e   D i r e c t o r y .` ��ij
�� 
dispi m  ����
�� stic    j ��kl
�� 
btnsk J  ��mm n��n m  ��oo �pp  O K��  l ��qr
�� 
dfltq J  ��ss t��t m  ��uu �vv  O K��  r ��w��
�� 
apprw m  ��xx �yy , O u t l o o k   E x c h a n g e   S e t u p��  ^ z��z R  ������{
�� .ascrerr ****      � ****��  { ��|��
�� 
errn| m  ����������  ��  7 }~} l ����������  ��  ��  ~ � l ��������  � 7 1 read full user information from Active Directory   � ��� b   r e a d   f u l l   u s e r   i n f o r m a t i o n   f r o m   A c t i v e   D i r e c t o r y� ��� l ����������  ��  ��  � ��� Q  ����� k  ���� ��� r  ����� J  ���� ���� m  ���� ���  :  ��  � n     ��� 1  ����
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
cpar� o  HI�� 0 i  � o  BE�~�~ "0 userinformation userInformation� m  JM�� ���  E M a i l A d d r e s s :� Q  Q����� r  Tg��� n  Ta��� 4  \a�}�
�} 
citm� m  _`�|�| � n  T\��� 4  W\�{�
�{ 
cpar� o  Z[�z�z 0 i  � o  TW�y�y "0 userinformation userInformation� o      �x�x 0 emailaddress emailAddress� R      �w�v�u
�w .ascrerr ****      � ****�v  �u  � k  o��� ��� r  o|��� J  ot�� ��t� m  or�� ���  �t  � n     � � 1  w{�s
�s 
txdl  1  tw�r
�r 
ascr� �q r  }� c  }� n  }� 7���p	
�p 
cha  m  ���o�o 	  ;  �� n  }�

 4  ���n
�n 
cpar l ���m�l [  �� o  ���k�k 0 i   m  ���j�j �m  �l   o  }��i�i "0 userinformation userInformation m  ���h
�h 
TEXT o      �g�g 0 emailaddress emailAddress�q  ��  ��  �  l ���f�e�d�f  �e  �d    r  �� J  �� �c m  �� �  :  �c   n      1  ���b
�b 
txdl 1  ���a
�a 
ascr  Z  �	�`�_ C �� !  n  ��"#" 4  ���^$
�^ 
cpar$ o  ���]�] 0 i  # o  ���\�\ "0 userinformation userInformation! m  ��%% �&& ( d s A t t r T y p e N a t i v e : c o : Q  �'()' r  ��*+* n  ��,-, 4  ���[.
�[ 
citm. m  ���Z�Z - n  ��/0/ 4  ���Y1
�Y 
cpar1 o  ���X�X 0 i  0 o  ���W�W "0 userinformation userInformation+ o      �V�V 0 usercountry userCountry( R      �U�T�S
�U .ascrerr ****      � ****�T  �S  ) k  �22 343 r  ��565 J  ��77 8�R8 m  ��99 �::  �R  6 n     ;<; 1  ���Q
�Q 
txdl< 1  ���P
�P 
ascr4 =�O= r  �>?> c  �@A@ n  ��BCB 7���NDE
�N 
cha D m  ���M�M E  ;  ��C n  ��FGF 4  ���LH
�L 
cparH l ��I�K�JI [  ��JKJ o  ���I�I 0 i  K m  ���H�H �K  �J  G o  ���G�G "0 userinformation userInformationA m  � �F
�F 
TEXT? o      �E�E 0 usercountry userCountry�O  �`  �_   LML l 

�D�C�B�D  �C  �B  M NON r  
PQP J  
RR S�AS m  
TT �UU  :  �A  Q n     VWV 1  �@
�@ 
txdlW 1  �?
�? 
ascrO XYX Z  rZ[�>�=Z C $\]\ n   ^_^ 4   �<`
�< 
cpar` o  �;�; 0 i  _ o  �:�: "0 userinformation userInformation] m   #aa �bb 2 d s A t t r T y p e N a t i v e : c o m p a n y :[ Q  'ncdec r  *;fgf n  *7hih 4  27�9j
�9 
citmj m  56�8�8 i n  *2klk 4  -2�7m
�7 
cparm o  01�6�6 0 i  l o  *-�5�5 "0 userinformation userInformationg o      �4�4 0 usercompany userCompanyd R      �3�2�1
�3 .ascrerr ****      � ****�2  �1  e k  Cnnn opo r  CPqrq J  CHss t�0t m  CFuu �vv  �0  r n     wxw 1  KO�/
�/ 
txdlx 1  HK�.
�. 
ascrp y�-y r  Qnz{z c  Qj|}| n  Qf~~ 7[f�,��
�, 
cha � m  ac�+�+ �  ;  de n  Q[��� 4  T[�*�
�* 
cpar� l WZ��)�(� [  WZ��� o  WX�'�' 0 i  � m  XY�&�& �)  �(  � o  QT�%�% "0 userinformation userInformation} m  fi�$
�$ 
TEXT{ o      �#�# 0 usercompany userCompany�-  �>  �=  Y ��� l ss�"�!� �"  �!  �   � ��� r  s���� J  sx�� ��� m  sv�� ���  :  �  � n     ��� 1  {�
� 
txdl� 1  x{�
� 
ascr� ��� Z  ������� C ����� n  ����� 4  ����
� 
cpar� o  ���� 0 i  � o  ���� "0 userinformation userInformation� m  ���� ��� 8 d s A t t r T y p e N a t i v e : d e p a r t m e n t :� Q  ������ r  ����� n  ����� 4  ����
� 
citm� m  ���� � n  ����� 4  ����
� 
cpar� o  ���� 0 i  � o  ���� "0 userinformation userInformation� o      ��  0 userdepartment userDepartment� R      ���
� .ascrerr ****      � ****�  �  � k  ���� ��� r  ����� J  ���� ��� m  ���� ���  �  � n     ��� 1  ���
� 
txdl� 1  ���
� 
ascr� ��� r  ����� c  ����� n  ����� 7���
��
�
 
cha � m  ���	�	 �  ;  ��� n  ����� 4  ����
� 
cpar� l ������ [  ����� o  ���� 0 i  � m  ���� �  �  � o  ���� "0 userinformation userInformation� m  ���
� 
TEXT� o      ��  0 userdepartment userDepartment�  �  �  � ��� l ��� �����   ��  ��  � ��� r  ����� J  ���� ���� m  ���� ���  :  ��  � n     ��� 1  ����
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
userOffice��  ��  ��  �    l EE��������  ��  ��    r  ER J  EJ �� m  EH �		  :  ��   n     

 1  MQ��
�� 
txdl 1  JM��
�� 
ascr  Z  S����� C S_ n  S[ 4  V[��
�� 
cpar o  YZ���� 0 i   o  SV���� "0 userinformation userInformation m  [^ � @ d s A t t r T y p e N a t i v e : s A M A c c o u n t N a m e : Q  b� r  ex n  er 4  mr��
�� 
citm m  pq����  n  em  4  hm��!
�� 
cpar! o  kl���� 0 i    o  eh���� "0 userinformation userInformation o      ���� 0 usershortname userShortName R      ������
�� .ascrerr ****      � ****��  ��   k  ��"" #$# r  ��%&% J  ��'' (��( m  ��)) �**  ��  & n     +,+ 1  ����
�� 
txdl, 1  ����
�� 
ascr$ -��- r  ��./. c  ��010 n  ��232 7����45
�� 
cha 4 m  ������ 5  ;  ��3 n  ��676 4  ����8
�� 
cpar8 l ��9����9 [  ��:;: o  ������ 0 i  ; m  ������ ��  ��  7 o  ������ "0 userinformation userInformation1 m  ����
�� 
TEXT/ o      ���� 0 usershortname userShortName��  ��  ��   <=< l ����������  ��  ��  = >?> r  ��@A@ J  ��BB C��C m  ��DD �EE  :  ��  A n     FGF 1  ����
�� 
txdlG 1  ����
�� 
ascr? HIH Z  �JK����J C ��LML n  ��NON 4  ����P
�� 
cparP o  ������ 0 i  O o  ������ "0 userinformation userInformationM m  ��QQ �RR : d s A t t r T y p e N a t i v e : w W W H o m e P a g e :K Q  �STUS r  ��VWV n  ��XYX 4  ����Z
�� 
citmZ m  ������ Y n  ��[\[ 4  ����]
�� 
cpar] o  ������ 0 i  \ o  ������ "0 userinformation userInformationW o      ���� 0 userwebpage userWebPageT R      ������
�� .ascrerr ****      � ****��  ��  U k  �^^ _`_ r  ��aba J  ��cc d��d m  ��ee �ff  ��  b n     ghg 1  ����
�� 
txdlh 1  ����
�� 
ascr` i��i r  �jkj c  �lml n  �non 7��pq
�� 
cha p m  	���� q  ;  o n  �rsr 4  ���t
�� 
cpart l �u����u [  �vwv o  � ���� 0 i  w m   ���� ��  ��  s o  ������ "0 userinformation userInformationm m  ��
�� 
TEXTk o      ���� 0 userwebpage userWebPage��  ��  ��  I xyx l ��������  ��  ��  y z{z r  (|}| J   ~~ �� m  �� ���  :  ��  } n     ��� 1  #'��
�� 
txdl� 1   #��
�� 
ascr{ ��� Z  )�������� C )5��� n  )1��� 4  ,1���
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
cpar� l hk���~� [  hk��� o  hi�}�} 0 i  � m  ij�|�| �  �~  � o  be�{�{ "0 userinformation userInformation� m  wz�z
�z 
TEXT� o      �y�y 0 usercity userCity��  ��  ��  � ��� l ���x�w�v�x  �w  �v  � ��� r  ����� J  ���� ��u� m  ���� ���  :  �u  � n     ��� 1  ���t
�t 
txdl� 1  ���s
�s 
ascr� ��� Z  �����r�q� C ����� n  ����� 4  ���p�
�p 
cpar� o  ���o�o 0 i  � o  ���n�n "0 userinformation userInformation� m  ���� ���  F A X N u m b e r :� Q  ������ r  ����� n  ����� 4  ���m�
�m 
citm� m  ���l�l � n  ����� 4  ���k�
�k 
cpar� o  ���j�j 0 i  � o  ���i�i "0 userinformation userInformation� o      �h�h 0 userfax userFax� R      �g�f�e
�g .ascrerr ****      � ****�f  �e  � k  ���� ��� r  ����� J  ���� ��d� m  ���� ���  �d  � n     ��� 1  ���c
�c 
txdl� 1  ���b
�b 
ascr� ��a� r  ����� c  ����� n  ����� 7���`��
�` 
cha � m  ���_�_ �  ;  ��� n  ����� 4  ���^�
�^ 
cpar� l ����]�\� [  ����� o  ���[�[ 0 i  � m  ���Z�Z �]  �\  � o  ���Y�Y "0 userinformation userInformation� m  ���X
�X 
TEXT� o      �W�W 0 userfax userFax�a  �r  �q  � ��� l ���V�U�T�V  �U  �T  � ��� r  ����� J  ���� ��S� m  ���� ���  :  �S  � n     ��� 1  ���R
�R 
txdl� 1  ���Q
�Q 
ascr� ��� Z  �U���P�O� C �   n  � 4  ��N
�N 
cpar o  �M�M 0 i   o  ���L�L "0 userinformation userInformation m   �  F i r s t N a m e :� Q  
Q	 r  

 n   4  �K
�K 
citm m  �J�J  n   4  �I
�I 
cpar o  �H�H 0 i   o  �G�G "0 userinformation userInformation o      �F�F 0 userfirstname userFirstName R      �E�D�C
�E .ascrerr ****      � ****�D  �C  	 k  &Q  r  &3 J  &+ �B m  &) �  �B   n      1  .2�A
�A 
txdl 1  +.�@
�@ 
ascr �? r  4Q c  4M !  n  4I"#" 7>I�>$%
�> 
cha $ m  DF�=�= %  ;  GH# n  4>&'& 4  7>�<(
�< 
cpar( l :=)�;�:) [  :=*+* o  :;�9�9 0 i  + m  ;<�8�8 �;  �:  ' o  47�7�7 "0 userinformation userInformation! m  IL�6
�6 
TEXT o      �5�5 0 userfirstname userFirstName�?  �P  �O  � ,-, l VV�4�3�2�4  �3  �2  - ./. r  Vc010 J  V[22 3�13 m  VY44 �55  :  �1  1 n     676 1  ^b�0
�0 
txdl7 1  [^�/
�/ 
ascr/ 898 Z  d�:;�.�-: C dp<=< n  dl>?> 4  gl�,@
�, 
cpar@ o  jk�+�+ 0 i  ? o  dg�*�* "0 userinformation userInformation= m  loAA �BB  J o b T i t l e :; Q  s�CDEC r  v�FGF n  v�HIH 4  ~��)J
�) 
citmJ m  ���(�( I n  v~KLK 4  y~�'M
�' 
cparM o  |}�&�& 0 i  L o  vy�%�% "0 userinformation userInformationG o      �$�$ 0 	usertitle 	userTitleD R      �#�"�!
�# .ascrerr ****      � ****�"  �!  E k  ��NN OPO r  ��QRQ J  ��SS T� T m  ��UU �VV  �   R n     WXW 1  ���
� 
txdlX 1  ���
� 
ascrP Y�Y r  ��Z[Z c  ��\]\ n  ��^_^ 7���`a
� 
cha ` m  ���� a  ;  ��_ n  ��bcb 4  ���d
� 
cpard l ��e��e [  ��fgf o  ���� 0 i  g m  ���� �  �  c o  ���� "0 userinformation userInformation] m  ���
� 
TEXT[ o      �� 0 	usertitle 	userTitle�  �.  �-  9 hih l ������  �  �  i jkj r  ��lml J  ��nn o�o m  ��pp �qq  :  �  m n     rsr 1  ���
� 
txdls 1  ���
� 
ascrk tut Z  �'vw��v C ��xyx n  ��z{z 4  ���
|
�
 
cpar| o  ���	�	 0 i  { o  ���� "0 userinformation userInformationy m  ��}} �~~  L a s t N a m e :w Q  �#�� r  ����� n  ����� 4  ����
� 
citm� m  ���� � n  ����� 4  ����
� 
cpar� o  ���� 0 i  � o  ���� "0 userinformation userInformation� o      �� 0 userlastname userLastName� R      �� ��
� .ascrerr ****      � ****�   ��  � k  �#�� ��� r  ���� J  ���� ���� m  ���� ���  ��  � n     ��� 1   ��
�� 
txdl� 1  � ��
�� 
ascr� ���� r  #��� c  ��� n  ��� 7����
�� 
cha � m  ���� �  ;  � n  ��� 4  	���
�� 
cpar� l ������ [  ��� o  ���� 0 i  � m  ���� ��  ��  � o  	���� "0 userinformation userInformation� m  ��
�� 
TEXT� o      ���� 0 userlastname userLastName��  �  �  u ��� l ((��������  ��  ��  � ��� r  (5��� J  (-�� ���� m  (+�� ���  :  ��  � n     ��� 1  04��
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
citm� m  ������ � n  ��� � 4  ����
�� 
cpar o  ������ 0 i    o  ������ "0 userinformation userInformation� o      ���� 0 userworkphone userWorkPhone� R      ������
�� .ascrerr ****      � ****��  ��  � k  ��  r  �� J  �� �� m  ��		 �

  ��   n      1  ����
�� 
txdl 1  ����
�� 
ascr �� r  �� c  �� n  �� 7����
�� 
cha  m  ������   ;  �� n  �� 4  ����
�� 
cpar l ������ [  �� o  ������ 0 i   m  ������ ��  ��   o  ������ "0 userinformation userInformation m  ����
�� 
TEXT o      ���� 0 userworkphone userWorkPhone��  ��  ��  �  l ����������  ��  ��    r  �	 !  J  ��"" #��# m  ��$$ �%%  :  ��  ! n     &'& 1  		��
�� 
txdl' 1  �	��
�� 
ascr ()( Z  		b*+����* C 		,-, n  		./. 4  		��0
�� 
cpar0 o  		���� 0 i  / o  		���� "0 userinformation userInformation- m  		11 �22  P o s t a l C o d e :+ Q  		^3453 r  		+676 n  		'898 4  	"	'��:
�� 
citm: m  	%	&���� 9 n  		";<; 4  		"��=
�� 
cpar= o  	 	!���� 0 i  < o  		���� "0 userinformation userInformation7 o      ����  0 userpostalcode userPostalCode4 R      ������
�� .ascrerr ****      � ****��  ��  5 k  	3	^>> ?@? r  	3	@ABA J  	3	8CC D��D m  	3	6EE �FF  ��  B n     GHG 1  	;	?��
�� 
txdlH 1  	8	;��
�� 
ascr@ I��I r  	A	^JKJ c  	A	ZLML n  	A	VNON 7	K	V��PQ
�� 
cha P m  	Q	S���� Q  ;  	T	UO n  	A	KRSR 4  	D	K��T
�� 
cparT l 	G	JU����U [  	G	JVWV o  	G	H���� 0 i  W m  	H	I���� ��  ��  S o  	A	D���� "0 userinformation userInformationM m  	V	Y��
�� 
TEXTK o      ����  0 userpostalcode userPostalCode��  ��  ��  ) XYX l 	c	c��������  ��  ��  Y Z[Z r  	c	p\]\ J  	c	h^^ _��_ m  	c	f`` �aa  :  ��  ] n     bcb 1  	k	o��
�� 
txdlc 1  	h	k��
�� 
ascr[ ded Z  	q	�fg����f C 	q	}hih n  	q	yjkj 4  	t	y��l
�� 
cparl o  	w	x���� 0 i  k o  	q	t���� "0 userinformation userInformationi m  	y	|mm �nn  R e a l N a m e :g Q  	�	�opqo r  	�	�rsr n  	�	�tut 4  	�	��v
� 
citmv m  	�	��~�~ u n  	�	�wxw 4  	�	��}y
�} 
cpary o  	�	��|�| 0 i  x o  	�	��{�{ "0 userinformation userInformations o      �z�z 0 userfullname userFullNamep R      �y�x�w
�y .ascrerr ****      � ****�x  �w  q k  	�	�zz {|{ r  	�	�}~} J  	�	� ��v� m  	�	��� ���  �v  ~ n     ��� 1  	�	��u
�u 
txdl� 1  	�	��t
�t 
ascr| ��s� r  	�	���� c  	�	���� n  	�	���� 7	�	��r��
�r 
cha � m  	�	��q�q �  ;  	�	�� n  	�	���� 4  	�	��p�
�p 
cpar� l 	�	���o�n� [  	�	���� o  	�	��m�m 0 i  � m  	�	��l�l �o  �n  � o  	�	��k�k "0 userinformation userInformation� m  	�	��j
�j 
TEXT� o      �i�i 0 userfullname userFullName�s  ��  ��  e ��� l 	�	��h�g�f�h  �g  �f  � ��� r  	�	���� J  	�	��� ��e� m  	�	��� ���  :  �e  � n     ��� 1  	�	��d
�d 
txdl� 1  	�	��c
�c 
ascr� ��� Z  	�
8���b�a� C 	�	���� n  	�	���� 4  	�	��`�
�` 
cpar� o  	�	��_�_ 0 i  � o  	�	��^�^ "0 userinformation userInformation� m  	�	��� ���  S t a t e :� Q  	�
4���� r  	�
��� n  	�	���� 4  	�	��]�
�] 
citm� m  	�	��\�\ � n  	�	���� 4  	�	��[�
�[ 
cpar� o  	�	��Z�Z 0 i  � o  	�	��Y�Y "0 userinformation userInformation� o      �X�X 0 	userstate 	userState� R      �W�V�U
�W .ascrerr ****      � ****�V  �U  � k  
	
4�� ��� r  
	
��� J  
	
�� ��T� m  
	
�� ���  �T  � n     ��� 1  

�S
�S 
txdl� 1  

�R
�R 
ascr� ��Q� r  

4��� c  

0��� n  

,��� 7
!
,�P��
�P 
cha � m  
'
)�O�O �  ;  
*
+� n  

!��� 4  

!�N�
�N 
cpar� l 

 ��M�L� [  

 ��� o  

�K�K 0 i  � m  

�J�J �M  �L  � o  

�I�I "0 userinformation userInformation� m  
,
/�H
�H 
TEXT� o      �G�G 0 	userstate 	userState�Q  �b  �a  � ��� l 
9
9�F�E�D�F  �E  �D  � ��� r  
9
F��� J  
9
>�� ��C� m  
9
<�� ���  :  �C  � n     ��� 1  
A
E�B
�B 
txdl� 1  
>
A�A
�A 
ascr� ��� Z  
G
����@�?� C 
G
S��� n  
G
O��� 4  
J
O�>�
�> 
cpar� o  
M
N�=�= 0 i  � o  
G
J�<�< "0 userinformation userInformation� m  
O
R�� ���  S t r e e t :� Q  
V
����� r  
Y
j��� n  
Y
f��� 4  
a
f�;�
�; 
citm� m  
d
e�:�: � n  
Y
a��� 4  
\
a�9�
�9 
cpar� o  
_
`�8�8 0 i  � o  
Y
\�7�7 "0 userinformation userInformation� o      �6�6 0 
userstreet 
userStreet� R      �5�4�3
�5 .ascrerr ****      � ****�4  �3  � k  
r
��� ��� r  
r
��� J  
r
w�� ��2� m  
r
u�� ���  �2  � n     ��� 1  
z
~�1
�1 
txdl� 1  
w
z�0
�0 
ascr� ��/� r  
�
���� c  
�
�	 		  n  
�
�			 7
�
��.		
�. 
cha 	 m  
�
��-�- 	  ;  
�
�	 n  
�
�			 4  
�
��,	
�, 
cpar	 l 
�
�		�+�*		 [  
�
�	
		
 o  
�
��)�) 0 i  	 m  
�
��(�( �+  �*  	 o  
�
��'�' "0 userinformation userInformation	 m  
�
��&
�& 
TEXT� o      �%�% 0 
userstreet 
userStreet�/  �@  �?  � 	�$	 l 
�
��#�"�!�#  �"  �!  �$  �� 0 i  � m  #$� �  � I $/�	�
� .corecnte****       ****	 n $+			 2 '+�
� 
cpar	 o  $'�� "0 userinformation userInformation�  ��  � 			 l 
�
�����  �  �  	 			 r  
�
�			 J  
�
�		 			 m  
�
�		 �		  ; K e r b e r o s v 5 ; ;	 	�	 m  
�
�		 �		  ;�  	 n     			 1  
�
��
� 
txdl	 1  
�
��
� 
ascr	 	 	!	  l 
�
�����  �  �  	! 	"	#	" Q  
�
�	$	%�	$ r  
�
�	&	'	& n  
�
�	(	)	( 4  
�
��	*
� 
citm	* m  
�
��� 	) o  
�
��� "0 userinformation userInformation	' o      �� &0 userkerberosrealm userKerberosRealm	% R      ���
� .ascrerr ****      � ****�  �  �  	# 	+	,	+ l 
�
��
�	��
  �	  �  	, 	-	.	- r  
�
�	/	0	/ J  
�
�	1	1 	2�	2 m  
�
�	3	3 �	4	4  �  	0 n     	5	6	5 1  
�
��
� 
txdl	6 1  
�
��
� 
ascr	. 	7	8	7 l 
�
�����  �  �  	8 	9	:	9 Z  
�+	;	<�� 	; = 
�
�	=	>	= o  
�
����� 0 emailaddress emailAddress	> m  
�
�	?	? �	@	@  	< k  
�'	A	A 	B	C	B l 
�
���������  ��  ��  	C 	D	E	D l 
�
���	F	G��  	F   something went wrong   	G �	H	H *   s o m e t h i n g   w e n t   w r o n g	E 	I	J	I l 
�
���������  ��  ��  	J 	K	L	K I 
���	M	N
�� .sysodlogaskr        TEXT	M b  
�
�	O	P	O b  
�
�	Q	R	Q b  
�
�	S	T	S o  
�
����� 0 errormessage errorMessage	T o  
�
���
�� 
ret 	R o  
�
���
�� 
ret 	P m  
�
�	U	U �	V	V h U n a b l e   t o   r e a d   e m a i l   a d d r e s s   f r o m   n e t w o r k   d i r e c t o r y .	N ��	W	X
�� 
disp	W m  
� ��
�� stic    	X ��	Y	Z
�� 
btns	Y J  	[	[ 	\��	\ m  	]	] �	^	^  O K��  	Z ��	_	`
�� 
dflt	_ J  	a	a 	b��	b m  	c	c �	d	d  O K��  	` ��	e��
�� 
appr	e m  	f	f �	g	g , O u t l o o k   E x c h a n g e   S e t u p��  	L 	h��	h R  '����	i
�� .ascrerr ****      � ****��  	i ��	j��
�� 
errn	j m  !$��������  ��  �  �   	: 	k��	k l ,,��������  ��  ��  ��  ! 	l	m	l F  0C	n	o	n = 07	p	q	p o  05���� 0 emailformat emailFormat	q m  56���� 	o = :A	r	s	r o  :?���� 0 displayname displayName	s m  ?@���� 	m 	t	u	t k  F�	v	v 	w	x	w l FF��������  ��  ��  	x 	y	z	y l FF��	{	|��  	{ P J Pull user information from the account settings of the local user account   	| �	}	} �   P u l l   u s e r   i n f o r m a t i o n   f r o m   t h e   a c c o u n t   s e t t i n g s   o f   t h e   l o c a l   u s e r   a c c o u n t	z 	~		~ l FF��������  ��  ��  	 	�	�	� r  FU	�	�	� n  FO	�	�	� 1  KO��
�� 
sisn	� l FK	�����	� I FK������
�� .sysosigtsirr   ��� null��  ��  ��  ��  	� o      ���� 0 usershortname userShortName	� 	�	�	� r  Ve	�	�	� n  V_	�	�	� 1  [_��
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
domainName	� o      ���� 0 emailaddress emailAddress	� 	���	� l ����������  ��  ��  ��  	u 	�	�	� F  ��	�	�	� = ��	�	�	� o  ������ 0 emailformat emailFormat	� m  ������ 	� = ��	�	�	� o  ������ 0 displayname displayName	� m  ������ 	� 	�	�	� k  �O	�	� 	�	�	� l ����������  ��  ��  	� 	�	�	� l ����	�	���  	� P J Pull user information from the account settings of the local user account   	� �	�	� �   P u l l   u s e r   i n f o r m a t i o n   f r o m   t h e   a c c o u n t   s e t t i n g s   o f   t h e   l o c a l   u s e r   a c c o u n t	� 	�	�	� l ����������  ��  ��  	� 	�	�	� r  ��	�	�	� n  ��	�	�	� 1  ����
�� 
sisn	� l ��	�����	� I ��������
�� .sysosigtsirr   ��� null��  ��  ��  ��  	� o      ���� 0 usershortname userShortName	� 	�	�	� r  ��	�	�	� n  ��	�	�	� 1  ����
�� 
siln	� l ��	�����	� I ��������
�� .sysosigtsirr   ��� null��  ��  ��  ��  	� o      ���� 0 userfullname userFullName	� 	�	�	� l ����������  ��  ��  	� 	�	�	� l ����	�	���  	� C = first.last@domain.com and full name displays as "First Last"   	� �	�	� z   f i r s t . l a s t @ d o m a i n . c o m   a n d   f u l l   n a m e   d i s p l a y s   a s   " F i r s t   L a s t "	� 	�	�	� l ����������  ��  ��  	� 	�	�	� r  �	�	�	� m  ��	�	� �	�	�   	� n     	�	�	� 1  ���
�� 
txdl	� 1  ����
�� 
ascr	� 	�	�	� r  	�	�	� n  
 

  4  ��

�� 
cwor
 m  ���� 
 n  


 4  ��

�� 
citm
 m  ���� 
 o  ���� 0 userfullname userFullName	� o      ���� 0 userfirstname userFirstName	� 


 r  %

	
 n  !




 4 !��

�� 
citm
 m   ������
 o  ���� 0 userfullname userFullName
	 o      ���� 0 userlastname userLastName
 


 r  &1


 m  &)

 �

  
 n     


 1  ,0�
� 
txdl
 1  ),�~
�~ 
ascr
 


 r  2M


 b  2G


 b  2A


 b  2=


 b  29

 
 o  25�}�} 0 userfirstname userFirstName
  m  58
!
! �
"
"  .
 o  9<�|�| 0 userlastname userLastName
 m  =@
#
# �
$
$  @
 o  AF�{�{ 0 
domainname 
domainName
 o      �z�z 0 emailaddress emailAddress
 
%�y
% l NN�x�w�v�x  �w  �v  �y  	� 
&
'
& F  Re
(
)
( = RY
*
+
* o  RW�u�u 0 emailformat emailFormat
+ m  WX�t�t 
) = \c
,
-
, o  \a�s�s 0 displayname displayName
- m  ab�r�r 
' 
.
/
. k  h�
0
0 
1
2
1 l hh�q�p�o�q  �p  �o  
2 
3
4
3 l hh�n
5
6�n  
5 P J Pull user information from the account settings of the local user account   
6 �
7
7 �   P u l l   u s e r   i n f o r m a t i o n   f r o m   t h e   a c c o u n t   s e t t i n g s   o f   t h e   l o c a l   u s e r   a c c o u n t
4 
8
9
8 l hh�m�l�k�m  �l  �k  
9 
:
;
: r  hw
<
=
< n  hq
>
?
> 1  mq�j
�j 
sisn
? l hm
@�i�h
@ I hm�g�f�e
�g .sysosigtsirr   ��� null�f  �e  �i  �h  
= o      �d�d 0 usershortname userShortName
; 
A
B
A r  x�
C
D
C n  x�
E
F
E 1  }��c
�c 
siln
F l x}
G�b�a
G I x}�`�_�^
�` .sysosigtsirr   ��� null�_  �^  �b  �a  
D o      �]�] 0 userfullname userFullName
B 
H
I
H l ���\�[�Z�\  �[  �Z  
I 
J
K
J l ���Y
L
M�Y  
L ? 9 first@domain.com and full name displays as "Last, First"   
M �
N
N r   f i r s t @ d o m a i n . c o m   a n d   f u l l   n a m e   d i s p l a y s   a s   " L a s t ,   F i r s t "
K 
O
P
O l ���X�W�V�X  �W  �V  
P 
Q
R
Q r  ��
S
T
S m  ��
U
U �
V
V  ,  
T n     
W
X
W 1  ���U
�U 
txdl
X 1  ���T
�T 
ascr
R 
Y
Z
Y r  ��
[
\
[ n  ��
]
^
] 4 ���S
_
�S 
citm
_ m  ���R�R��
^ o  ���Q�Q 0 userfullname userFullName
\ o      �P�P 0 userfirstname userFirstName
Z 
`
a
` r  ��
b
c
b n  ��
d
e
d 4  ���O
f
�O 
cwor
f m  ���N�N 
e n  ��
g
h
g 4  ���M
i
�M 
citm
i m  ���L�L 
h o  ���K�K 0 userfullname userFullName
c o      �J�J 0 userlastname userLastName
a 
j
k
j r  ��
l
m
l m  ��
n
n �
o
o  
m n     
p
q
p 1  ���I
�I 
txdl
q 1  ���H
�H 
ascr
k 
r
s
r r  ��
t
u
t b  ��
v
w
v b  ��
x
y
x o  ���G�G 0 userfirstname userFirstName
y m  ��
z
z �
{
{  @
w o  ���F�F 0 
domainname 
domainName
u o      �E�E 0 emailaddress emailAddress
s 
|�D
| l ���C�B�A�C  �B  �A  �D  
/ 
}
~
} F  ��

�
 = ��
�
�
� o  ���@�@ 0 emailformat emailFormat
� m  ���?�? 
� = ��
�
�
� o  ���>�> 0 displayname displayName
� m  ���=�= 
~ 
�
�
� k  �a
�
� 
�
�
� l ���<�;�:�<  �;  �:  
� 
�
�
� l ���9
�
��9  
� P J Pull user information from the account settings of the local user account   
� �
�
� �   P u l l   u s e r   i n f o r m a t i o n   f r o m   t h e   a c c o u n t   s e t t i n g s   o f   t h e   l o c a l   u s e r   a c c o u n t
� 
�
�
� l ���8�7�6�8  �7  �6  
� 
�
�
� r  � 
�
�
� n  ��
�
�
� 1  ���5
�5 
sisn
� l ��
��4�3
� I ���2�1�0
�2 .sysosigtsirr   ��� null�1  �0  �4  �3  
� o      �/�/ 0 usershortname userShortName
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
�.
�. 
siln
� l 
��-�,
� I �+�*�)
�+ .sysosigtsirr   ��� null�*  �)  �-  �,  
� o      �(�( 0 userfullname userFullName
� 
�
�
� l �'�&�%�'  �&  �%  
� 
�
�
� l �$
�
��$  
� = 7 first@domain.com if full name displays as "First Last"   
� �
�
� n   f i r s t @ d o m a i n . c o m   i f   f u l l   n a m e   d i s p l a y s   a s   " F i r s t   L a s t "
� 
�
�
� l �#�"�!�#  �"  �!  
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
� 1  � 
�  
txdl
� 1  �
� 
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
� 
cwor
� m  *+�� 
� n  '
�
�
� 4  "'�
�
� 
citm
� m  %&�� 
� o  "�� 0 userfullname userFullName
� o      �� 0 userfirstname userFirstName
� 
�
�
� r  1?
�
�
� n  1;
�
�
� 4 6;�
�
� 
citm
� m  9:����
� o  16�� 0 userfullname userFullName
� o      �� 0 userlastname userLastName
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
� 1  FJ�
� 
txdl
� 1  CF�
� 
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
� o  LO�� 0 userfirstname userFirstName
� m  OR
�
� �
�
�  @
� o  SX�� 0 
domainname 
domainName
� o      �� 0 emailaddress emailAddress
� 
��
� l ``����  �  �  �  
� 
�
�
� F  dw
�
�
� = dk
�
�
� o  di�� 0 emailformat emailFormat
� m  ij�
�
 
� = nu
�
�
� o  ns�	�	 0 displayname displayName
� m  st�� 
� 
�
�
� k  z�
�
� 
�
�
� l zz����  �  �  
� 
�
�
� l zz�
�
��  
� P J Pull user information from the account settings of the local user account   
� �
�
� �   P u l l   u s e r   i n f o r m a t i o n   f r o m   t h e   a c c o u n t   s e t t i n g s   o f   t h e   l o c a l   u s e r   a c c o u n t
� 
�
�
� l zz����  �  �  
� 
�
�
� r  z�
�
�
� n  z�
�
�
� 1  �� 
�  
sisn
� l z
�����
� I z������
�� .sysosigtsirr   ��� null��  ��  ��  ��  
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
� 
� r  �� m  �� �  ,   n      1  ����
�� 
txdl 1  ����
�� 
ascr   r  ��	
	 n  �� 4 ����
�� 
citm m  �������� o  ������ 0 userfullname userFullName
 o      ���� 0 userfirstname userFirstName  r  �� n  �� 4  ����
�� 
cwor m  ������  n  �� 4  ����
�� 
citm m  ������  o  ������ 0 userfullname userFullName o      ���� 0 userlastname userLastName  r  �� m  �� �   n      1  ����
�� 
txdl 1  ����
�� 
ascr  !  r  ��"#" b  ��$%$ b  ��&'& b  ��()( l ��*����* n  ��+,+ 4  ����-
�� 
cha - m  ������ , o  ������ 0 userfirstname userFirstName��  ��  ) o  ������ 0 userlastname userLastName' m  ��.. �//  @% o  ������ 0 
domainname 
domainName# o      ���� 0 emailaddress emailAddress! 0��0 l ����������  ��  ��  ��  
� 121 F  �	343 = ��565 o  ������ 0 emailformat emailFormat6 m  ������ 4 =  787 o   ���� 0 displayname displayName8 m  ���� 2 9:9 k  �;; <=< l ��������  ��  ��  = >?> l ��@A��  @ P J Pull user information from the account settings of the local user account   A �BB �   P u l l   u s e r   i n f o r m a t i o n   f r o m   t h e   a c c o u n t   s e t t i n g s   o f   t h e   l o c a l   u s e r   a c c o u n t? CDC l ��������  ��  ��  D EFE r  GHG n  IJI 1  ��
�� 
sisnJ l K����K I ������
�� .sysosigtsirr   ��� null��  ��  ��  ��  H o      ���� 0 usershortname userShortNameF LML r  +NON n  %PQP 1  !%��
�� 
silnQ l !R����R I !������
�� .sysosigtsirr   ��� null��  ��  ��  ��  O o      ���� 0 userfullname userFullNameM STS l ,,��������  ��  ��  T UVU l ,,��WX��  W > 8 flast@domain.com and full name displays as "First Last"   X �YY p   f l a s t @ d o m a i n . c o m   a n d   f u l l   n a m e   d i s p l a y s   a s   " F i r s t   L a s t "V Z[Z l ,,��������  ��  ��  [ \]\ r  ,7^_^ m  ,/`` �aa   _ n     bcb 1  26��
�� 
txdlc 1  /2��
�� 
ascr] ded r  8Kfgf n  8Ghih 4  BG��j
�� 
cworj m  EF���� i n  8Bklk 4  =B��m
�� 
citmm m  @A���� l o  8=���� 0 userfullname userFullNameg o      ���� 0 userfirstname userFirstNamee non r  LZpqp n  LVrsr 4 QV��t
�� 
citmt m  TU������s o  LQ���� 0 userfullname userFullNameq o      ���� 0 userlastname userLastNameo uvu r  [fwxw m  [^yy �zz  x n     {|{ 1  ae��
�� 
txdl| 1  ^a��
�� 
ascrv }~} r  g�� l g}������ b  g}��� b  gw��� b  gs��� n  go��� 4  jo���
�� 
cha � m  mn���� � o  gj���� 0 userfirstname userFirstName� o  or���� 0 userlastname userLastName� m  sv�� ���  @� o  w|���� 0 
domainname 
domainName��  ��  � o      ���� 0 emailaddress emailAddress~ ���� l ����������  ��  ��  ��  : ��� F  ����� = ����� o  ������ 0 emailformat emailFormat� m  ������ � = ����� o  ������ 0 displayname displayName� m  ������ � ��� k  ��� ��� l ����������  ��  ��  � ��� l ��������  � P J Pull user information from the account settings of the local user account   � ��� �   P u l l   u s e r   i n f o r m a t i o n   f r o m   t h e   a c c o u n t   s e t t i n g s   o f   t h e   l o c a l   u s e r   a c c o u n t� ��� l ����������  ��  ��  � ��� r  ����� n  ����� 1  ����
�� 
sisn� l �������� I ��������
�� .sysosigtsirr   ��� null��  ��  ��  ��  � o      ���� 0 usershortname userShortName� ��� r  ����� n  ����� 1  ����
�� 
siln� l �������� I ��������
�� .sysosigtsirr   ��� null��  ��  ��  ��  � o      �� 0 userfullname userFullName� ��� l ���~�}�|�~  �}  �|  � ��� l ���{���{  � C = shortName@domain.com and full name displays as "Last, First"   � ��� z   s h o r t N a m e @ d o m a i n . c o m   a n d   f u l l   n a m e   d i s p l a y s   a s   " L a s t ,   F i r s t "� ��� l ���z�y�x�z  �y  �x  � ��� r  ����� m  ���� ���  ,  � n     ��� 1  ���w
�w 
txdl� 1  ���v
�v 
ascr� ��� r  ����� n  ����� 4 ���u�
�u 
citm� m  ���t�t��� o  ���s�s 0 userfullname userFullName� o      �r�r 0 userfirstname userFirstName� ��� r  ����� n  ����� 4  ���q�
�q 
cwor� m  ���p�p � n  ����� 4  ���o�
�o 
citm� m  ���n�n � o  ���m�m 0 userfullname userFullName� o      �l�l 0 userlastname userLastName� ��� r  ����� m  ���� ���  � n     ��� 1  ���k
�k 
txdl� 1  ���j
�j 
ascr� ��� r  ���� b  �
��� b  ���� o  � �i�i 0 usershortname userShortName� m   �� ���  @� o  	�h�h 0 
domainname 
domainName� o      �g�g 0 emailaddress emailAddress� ��f� l �e�d�c�e  �d  �c  �f  � ��� F  *��� = ��� o  �b�b 0 emailformat emailFormat� m  �a�a � = !(��� o  !&�`�` 0 displayname displayName� m  &'�_�_ � ��� k  -��� ��� l --�^�]�\�^  �]  �\  � ��� l --�[���[  � P J Pull user information from the account settings of the local user account   � ��� �   P u l l   u s e r   i n f o r m a t i o n   f r o m   t h e   a c c o u n t   s e t t i n g s   o f   t h e   l o c a l   u s e r   a c c o u n t� ��� l --�Z�Y�X�Z  �Y  �X  � ��� r  -<��� n  -6��� 1  26�W
�W 
sisn� l -2��V�U� I -2�T�S�R
�T .sysosigtsirr   ��� null�S  �R  �V  �U  � o      �Q�Q 0 usershortname userShortName�    r  =L n  =F 1  BF�P
�P 
siln l =B�O�N I =B�M�L�K
�M .sysosigtsirr   ��� null�L  �K  �O  �N   o      �J�J 0 userfullname userFullName  l MM�I�H�G�I  �H  �G   	
	 l MM�F�F   B < shortName@domain.com and full name displays as "First Last"    � x   s h o r t N a m e @ d o m a i n . c o m   a n d   f u l l   n a m e   d i s p l a y s   a s   " F i r s t   L a s t "
  l MM�E�D�C�E  �D  �C    r  MX m  MP �    n      1  SW�B
�B 
txdl 1  PS�A
�A 
ascr  r  Yl n  Yh 4  ch�@
�@ 
cwor m  fg�?�?  n  Yc  4  ^c�>!
�> 
citm! m  ab�=�=   o  Y^�<�< 0 userfullname userFullName o      �;�; 0 userfirstname userFirstName "#" r  m{$%$ n  mw&'& 4 rw�:(
�: 
citm( m  uv�9�9��' o  mr�8�8 0 userfullname userFullName% o      �7�7 0 userlastname userLastName# )*) r  |�+,+ m  |-- �..  , n     /0/ 1  ���6
�6 
txdl0 1  ��5
�5 
ascr* 121 r  ��343 b  ��565 b  ��787 o  ���4�4 0 usershortname userShortName8 m  ��99 �::  @6 o  ���3�3 0 
domainname 
domainName4 o      �2�2 0 emailaddress emailAddress2 ;�1; l ���0�/�.�0  �/  �.  �1  � <=< F  ��>?> = ��@A@ o  ���-�- 0 emailformat emailFormatA m  ���,�, ? = ��BCB o  ���+�+ 0 displayname displayNameC m  ���*�* = D�)D k  ��EE FGF l ���(�'�&�(  �'  �&  G HIH l ���%JK�%  J $  Prompt User for relevant info   K �LL <   P r o m p t   U s e r   f o r   r e l e v a n t   i n f oI MNM l ���$�#�"�$  �#  �"  N OPO V  ��QRQ k  ��SS TUT r  ��VWV n  ��XYX 1  ���!
�! 
ttxtY l ��Z� �Z I ���[\
� .sysodlogaskr        TEXT[ m  ��]] �^^ > E n t e r   t h e   u s e r ' s   n e t w o r k   l o g i n .\ �_�
� 
dtxt_ m  ��`` �aa  �  �   �  W o      �� 0 usershortname userShortNameU b�b Z ��cd��c = ��efe o  ���� 0 usershortname userShortNamef m  ��gg �hh  d I ���i�
� .sysodisAaleR        TEXTi m  ��jj �kk  I n v a l i d   E n t r y !�  �  �  �  R = ��lml o  ���� 0 usershortname userShortNamem m  ��nn �oo  P pqp l ������  �  �  q rsr V  �9tut k  	4vv wxw r  	yzy n  	{|{ 1  �
� 
ttxt| l 	}��} I 	�~
� .sysodlogaskr        TEXT~ m  	�� ��� J E n t e r   t h e   u s e r ' s   f i r s t   o r   g i v e n   n a m e . ���
� 
dtxt� m  �� ���  �  �  �  z o      �
�
 0 userfirstname userFirstNamex ��	� Z 4����� = &��� o  "�� 0 userfirstname userFirstName� m  "%�� ���  � I )0���
� .sysodisAaleR        TEXT� m  ),�� ���  I n v a l i d   E n t r y !�  �  �  �	  u = ��� o  �� 0 userfirstname userFirstName� m  �� ���  s ��� l ::��� �  �  �   � ��� V  :v��� k  Fq�� ��� r  F[��� n  FW��� 1  SW��
�� 
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
 C A B L E��  ��  ��  � o      ���� 0 domainchoice domainChoice� ���� Z  �������� = ����� o  ������ 0 domainchoice domainChoice� m  ���� ���  C O R P H Q� r  ����� b  ����� o  ������ 0 domainchoice domainChoice� m  ���� ���  \� o      ���� 0 domainprefix domainPrefix��  � r  ����� b  ����� o  ������ 0 domainchoice domainChoice� m  ���� ���  \� o      ���� 0 domainprefix domainPrefix��  � = ����� o  ������ 0 domainchoice domainChoice� m  ���� ���  � � � l ����������  ��  ��     V  �� k  �  Z  �2	��
 = � o  ������ 0 domainchoice domainChoice m  � �  C O R P H Q	 r   b   b   b   o  ���� 0 userfirstname userFirstName m   �  _ o  ���� 0 userlastname userLastName m   �  @ c o m c a s t . c o m o      ���� 0 emailaddress emailAddress��  
 r  2 b  , b  (  b  $!"! o   ���� 0 userfirstname userFirstName" m   ### �$$  _  o  $'���� 0 userlastname userLastName m  (+%% �&& $ @ c a b l e . c o m c a s t . c o m o      ���� 0 emailaddress emailAddress '(' r  3g)*) n  3a+,+ 1  ]a��
�� 
ttxt, l 3]-����- I 3]��./
�� .sysodlogaskr        TEXT. b  3>010 b  38232 m  3644 �55 j V e r i f y   t h e   u s e r ' s   e m a i l   a d d r e s s .   C h a n g e   i f   i n c o r r e c t .3 o  67��
�� 
ret 1 o  8=���� 0 emailaddress emailAddress/ ��67
�� 
dtxt6 o  AF���� 0 emailaddress emailAddress7 ��89
�� 
btns8 J  IQ:: ;<; m  IL== �>>  C a n c e l< ?��? m  LO@@ �AA  V e r i f y��  9 ��B��
�� 
dfltB m  TWCC �DD  V e r i f y��  ��  ��  * o      ���� 0 emailaddress emailAddress( E��E Z hFG����F = hqHIH o  hm���� 0 emailaddress emailAddressI m  mpJJ �KK  G I t{��L��
�� .sysodisAaleR        TEXTL m  twMM �NN  I n v a l i d   E n t r y !��  ��  ��  ��   = ��OPO o  ������ 0 emailaddress emailAddressP m  ��QQ �RR   STS l ����������  ��  ��  T U��U l ����������  ��  ��  ��  �)  " k  ��VV WXW l ����������  ��  ��  X YZY l ����[\��  [   something went wrong   \ �]] *   s o m e t h i n g   w e n t   w r o n gZ ^_^ l ����������  ��  ��  _ `a` I ����bc
�� .sysodlogaskr        TEXTb b  ��ded b  ��fgf b  ��hih o  ������ 0 errormessage errorMessagei o  ����
�� 
ret g o  ����
�� 
ret e m  ��jj �kk x U n a b l e   t o   p a r s e   a c c o u n t   i n f o r m a t i o n   f r o m   l o c a l   O S   X   a c c o u n t .c ��lm
�� 
displ m  ����
�� stic    m ��no
�� 
btnsn J  ��pp q��q m  ��rr �ss  O K��  o ��tu
�� 
dfltt J  ��vv w��w m  ��xx �yy  O K��  u ��z��
�� 
apprz m  ��{{ �|| , O u t l o o k   E x c h a n g e   S e t u p��  a }~} R  ������
�� .ascrerr ****      � ****��   �����
�� 
errn� m  ����������  ~ ���� l ����������  ��  ��  ��  ��  ��   ��� l     ��������  ��  ��  � ��� l     ������  � 0 *------------------------------------------   � ��� T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     ������  � &   End collecting user information   � ��� @   E n d   c o l l e c t i n g   u s e r   i n f o r m a t i o n� ��� l     ������  � 0 *------------------------------------------   � ��� T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     ��������  ��  ��  � ��� l     ������  � 0 *------------------------------------------   � ��� T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     ������  � %  Begin logging user information   � ��� >   B e g i n   l o g g i n g   u s e r   i n f o r m a t i o n� ��� l     ������  � 0 *------------------------------------------   � ��� T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     ��������  ��  ��  � ��� l �������� I  ��������� 0 writelog writeLog� ���� m  ���� ��� & U s e r   i n f o r m a t i o n . . .��  ��  ��  ��  � ��� l ������� I  ���~��}�~ 0 writelog writeLog� ��|� b  ����� m  ���� ���  F i r s t   N a m e :  � o  ���{�{ 0 userfirstname userFirstName�|  �}  ��  �  � ��� l ����z�y� I  ���x��w�x 0 writelog writeLog� ��v� b  ����� m  ���� ���  L a s t   N a m e :  � o  ���u�u 0 userlastname userLastName�v  �w  �z  �y  � ��� l ����t�s� I  ���r��q�r 0 writelog writeLog� ��p� b  ����� m  ���� ���  E m a i l   A d d r e s s :  � o  ���o�o 0 emailaddress emailAddress�p  �q  �t  �s  � ��� l ���n�m� I  ��l��k�l 0 writelog writeLog� ��j� b  � ��� m  ���� ���  D e p a r t m e n t :  � o  ���i�i  0 userdepartment userDepartment�j  �k  �n  �m  � ��� l ��h�g� I  �f��e�f 0 writelog writeLog� ��d� b  ��� m  	�� ���  O f f i c e :  � o  	�c�c 0 
useroffice 
userOffice�d  �e  �h  �g  � ��� l ��b�a� I  �`��_�` 0 writelog writeLog� ��^� b  ��� m  �� ���  C o m p a n y :  � o  �]�] 0 usercompany userCompany�^  �_  �b  �a  � ��� l +��\�[� I  +�Z��Y�Z 0 writelog writeLog� ��X� b   '��� m   #�� ���  W o r k   P h o n e :  � o  #&�W�W 0 userworkphone userWorkPhone�X  �Y  �\  �[  � ��� l ,8��V�U� I  ,8�T��S�T 0 writelog writeLog� ��R� b  -4��� m  -0�� ���  M o b i l e   P h o n e :  � o  03�Q�Q 0 
usermobile 
userMobile�R  �S  �V  �U  � ��� l 9E��P�O� I  9E�N��M�N 0 writelog writeLog� ��L� b  :A��� m  :=�� ��� 
 F A X :  � o  =@�K�K 0 userfax userFax�L  �M  �P  �O  � ��� l FR �J�I  I  FR�H�G�H 0 writelog writeLog �F b  GN m  GJ �  T i t l e :   o  JM�E�E 0 	usertitle 	userTitle�F  �G  �J  �I  �  l S_	�D�C	 I  S_�B
�A�B 0 writelog writeLog
 �@ b  T[ m  TW �  S t r e e t :   o  WZ�?�? 0 
userstreet 
userStreet�@  �A  �D  �C    l `l�>�= I  `l�<�;�< 0 writelog writeLog �: b  ah m  ad �  C i t y :   o  dg�9�9 0 usercity userCity�:  �;  �>  �=    l my�8�7 I  my�6�5�6 0 writelog writeLog �4 b  nu m  nq   �!!  S t a t e :   o  qt�3�3 0 	userstate 	userState�4  �5  �8  �7   "#" l z�$�2�1$ I  z��0%�/�0 0 writelog writeLog% &�.& b  {�'(' m  {~)) �**  P o s t a l   C o d e :  ( o  ~��-�-  0 userpostalcode userPostalCode�.  �/  �2  �1  # +,+ l ��-�,�+- I  ���*.�)�* 0 writelog writeLog. /�(/ b  ��010 m  ��22 �33  C o u n t r y :  1 o  ���'�' 0 usercountry userCountry�(  �)  �,  �+  , 454 l ��6�&�%6 I  ���$7�#�$ 0 writelog writeLog7 8�"8 b  ��9:9 m  ��;; �<<  W e b   P a g e :  : o  ���!�! 0 userwebpage userWebPage�"  �#  �&  �%  5 =>= l ��?� �? I  ���@�� 0 writelog writeLog@ A�A o  ���
� 
ret �  �  �   �  > BCB l     ����  �  �  C DED l     �FG�  F 0 *------------------------------------------   G �HH T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -E IJI l     �KL�  K #  End logging user information   L �MM :   E n d   l o g g i n g   u s e r   i n f o r m a t i o nJ NON l     �PQ�  P 0 *------------------------------------------   Q �RR T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -O STS l     ����  �  �  T UVU l     �WX�  W 0 *------------------------------------------   X �YY T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -V Z[Z l     �\]�  \   Begin account setup   ] �^^ (   B e g i n   a c c o u n t   s e t u p[ _`_ l     �ab�  a 0 *------------------------------------------   b �cc T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -` ded l     ����  �  �  e fgf l ��h��
h O  ��iji k  ��kk lml I ���	��
�	 .miscactvnull��� ��� null�  �  m non l ������  �  �  o pqp r  ��rsr m  ���
� boovtrues 1  ���
� 
wkOfq tut l ���� ���  �   ��  u vwv Q  ��xyzx k  ��{{ |}| r  ��~~ o  ������ 0 unifiedinbox unifiedInbox 1  ����
�� 
GrpF} ���� n ����� I  ��������� 0 writelog writeLog� ���� b  ����� b  ����� m  ���� ��� : S e t   G r o u p   S i m i l a r   F o l d e r s   t o  � o  ������ 0 unifiedinbox unifiedInbox� m  ���� ���  :   S u c c e s s f u l .��  ��  �  f  ����  y R      ������
�� .ascrerr ****      � ****��  ��  z n ����� I  ��������� 0 writelog writeLog� ���� b  ����� b  ����� m  ���� ��� : S e t   G r o u p   S i m i l a r   F o l d e r s   t o  � o  ������ 0 unifiedinbox unifiedInbox� m  ���� ���  :   F a i l e d .��  ��  �  f  ��w ��� l ����������  ��  ��  � ��� Q  �3���� k  ��� ��� r  ���� o  � ���� 20 hideonmycomputerfolders hideOnMyComputerFolders� 1   ��
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
ttxt� o  qt���� 0 verifyemail verifyEmail� o      ���� 0 emailaddress emailAddress� ���� n ���� I  ��������� 0 writelog writeLog� ���� b  ����� b  ����� m  ���� ��� > U s e r   v e r i f i e d   e m a i l   a d d r e s s   a s  � o  ������ 0 emailaddress emailAddress� m  ���� ���  .��  ��  �  f  ���  ��  ��  � ��� l ����������  ��  ��  � ��� Z  ��������� = ��� � o  ������ *0 verifyserveraddress verifyServerAddress  m  ����
�� boovtrue� k  ��  r  �� I ����
�� .sysodlogaskr        TEXT m  �� �		 f P l e a s e   v e r i f y   y o u r   E x c h a n g e   S e r v e r   n a m e   i s   c o r r e c t . ��

�� 
dtxt
 o  ������  0 exchangeserver ExchangeServer ��
�� 
disp m  ������  ��
�� 
appr m  �� � , O u t l o o k   E x c h a n g e   S e t u p ��
�� 
btns J  ��  m  �� �  C a n c e l �� m  �� �  V e r i f y��   ����
�� 
dflt J  �� �� m  �� �    V e r i f y��  ��   o      ���� 0 verifyserver verifyServer !"! r  ��#$# n  ��%&% 1  ����
�� 
ttxt& o  ������ 0 verifyserver verifyServer$ o      ����  0 exchangeserver ExchangeServer" '��' n ��()( I  ����*���� 0 writelog writeLog* +��+ b  ��,-, b  ��./. m  ��00 �11 @ U s e r   v e r i f i e d   s e r v e r   a d d r e s s   a s  / o  ������  0 exchangeserver ExchangeServer- m  ��22 �33  .��  ��  )  f  ����  ��  ��  � 454 l ����������  ��  ��  5 676 l ����89��  8 "  create the Exchange account   9 �:: 8   c r e a t e   t h e   E x c h a n g e   a c c o u n t7 ;<; l ����������  ��  ��  < =>= Q  ��?@A? k  ��BB CDC r  ��EFE I ������G
�� .corecrel****      � null��  G ��HI
�� 
koclH m  ���
�� 
EactI ��J��
�� 
prdtJ l 	�K����K K  �LL ��MN
�� 
pnamM b  OPO m  	QQ �RR  M a i l b o x   -  P o  	���� 0 userfullname userFullNameN ��ST
�� 
unmeS b  UVU o  ���� 0 domainprefix domainPrefixV o  ���� 0 usershortname userShortNameT ��WX
�� 
fnamW o   %���� 0 userfullname userFullNameX ��YZ
�� 
emadY o  (-���� 0 emailaddress emailAddressZ ��[\
�� 
host[ o  05����  0 exchangeserver ExchangeServer\ ��]^
�� 
usss] o  8=���� 60 exchangeserverrequiresssl ExchangeServerRequiresSSL^ ��_`
�� 
port_ o  @E���� .0 exchangeserversslport ExchangeServerSSLPort` ��ab
�� 
ExLSa o  HM���� "0 directoryserver DirectoryServerb ��cd
�� 
LDAuc o  PU���� N0 %directoryserverrequiresauthentication %DirectoryServerRequiresAuthenticationd ��ef
�� 
LDSLe o  X]���� 80 directoryserverrequiresssl DirectoryServerRequiresSSLf ��gh
�� 
LDMXg o  `e���� >0 directoryservermaximumresults DirectoryServerMaximumResultsh ��ij
�� 
LDSBi o  hm���� 60 directoryserversearchbase DirectoryServerSearchBasej ��kl
�� 
ExPmk o  pu���� *0 downloadheadersonly downloadHeadersOnlyl �m�~
� 
pBADm o  x}�}�} *0 disableautodiscover disableAutodiscover�~  ��  ��  ��  F o      �|�| (0 newexchangeaccount newExchangeAccountD n�{n n ��opo I  ���zq�y�z 0 writelog writeLogq r�xr m  ��ss �tt H C r e a t e   E x c h a n g e   a c c o u n t :   S u c c e s s f u l .�x  �y  p  f  ���{  @ R      �w�v�u
�w .ascrerr ****      � ****�v  �u  A k  ��uu vwv l ���t�s�r�t  �s  �r  w xyx l ���qz{�q  z   something went wrong   { �|| *   s o m e t h i n g   w e n t   w r o n gy }~} l ���p�o�n�p  �o  �n  ~ � n ����� I  ���m��l�m 0 writelog writeLog� ��k� m  ���� ��� @ C r e a t e   E x c h a n g e   a c c o u n t :   F a i l e d .�k  �l  �  f  ��� ��� l ���j�i�h�j  �i  �h  � ��� I ���g��
�g .sysodlogaskr        TEXT� b  ����� b  ����� b  ����� o  ���f�f 0 errormessage errorMessage� o  ���e
�e 
ret � o  ���d
�d 
ret � m  ���� ��� D U n a b l e   t o   c r e a t e   E x c h a n g e   a c c o u n t .� �c��
�c 
disp� m  ���b
�b stic    � �a��
�a 
btns� J  ���� ��`� m  ���� ���  O K�`  � �_��
�_ 
dflt� J  ���� ��^� m  ���� ���  O K�^  � �]��\
�] 
appr� m  ���� ��� , O u t l o o k   E x c h a n g e   S e t u p�\  � ��� R  ���[�Z�
�[ .ascrerr ****      � ****�Z  � �Y��X
�Y 
errn� m  ���W�W���X  � ��V� l ���U�T�S�U  �T  �S  �V  > ��� l ���R�Q�P�R  �Q  �P  � ��� l ���O���O  � e _ The following lines enable Kerberos support if the userKerberos property above is set to true.   � ��� �   T h e   f o l l o w i n g   l i n e s   e n a b l e   K e r b e r o s   s u p p o r t   i f   t h e   u s e r K e r b e r o s   p r o p e r t y   a b o v e   i s   s e t   t o   t r u e .� ��� l ���N�M�L�N  �M  �L  � ��� Z  �b���K�J� = ����� o  ���I�I 0 usekerberos useKerberos� m  ���H
�H boovtrue� Q  �^���� k  ��� ��� r  ����� o  ���G�G 0 usekerberos useKerberos� n      ��� 1  ���F
�F 
Kerb� o  ���E�E (0 newexchangeaccount newExchangeAccount� ��� r  ���� o  � �D�D &0 userkerberosrealm userKerberosRealm� n      ��� 1  �C
�C 
ExGI� o   �B�B (0 newexchangeaccount newExchangeAccount� ��A� n 	��� I  
�@��?�@ 0 writelog writeLog� ��>� m  
�� ��� P S e t   K e r b e r o s   a u t h e n t i c a t i o n :   S u c c e s s f u l .�>  �?  �  f  	
�A  � R      �=�<�;
�= .ascrerr ****      � ****�<  �;  � k  ^�� ��� l �:�9�8�:  �9  �8  � ��� l �7���7  �   something went wrong   � ��� *   s o m e t h i n g   w e n t   w r o n g� ��� l �6�5�4�6  �5  �4  � ��� n !��� I  !�3��2�3 0 writelog writeLog� ��1� m  �� ��� H S e t   K e r b e r o s   a u t h e n t i c a t i o n :   F a i l e d .�1  �2  �  f  � ��� l ""�0�/�.�0  �/  �.  � ��� I "Q�-��
�- .sysodlogaskr        TEXT� b  "/��� b  "+��� b  ")��� o  "'�,�, 0 errormessage errorMessage� o  '(�+
�+ 
ret � o  )*�*
�* 
ret � m  +.�� ��� ^ U n a b l e   t o   s e t   E x c h a n g e   a c c o u n t   t o   u s e   K e r b e r o s .� �)��
�) 
disp� m  25�(
�( stic    � �'��
�' 
btns� J  8=�� ��&� m  8;�� ���  O K�&  � �%��
�% 
dflt� J  @E�� ��$� m  @C�� ���  O K�$  � �#��"
�# 
appr� m  HK   � , O u t l o o k   E x c h a n g e   S e t u p�"  �  R  R\�!� 
�! .ascrerr ****      � ****�    ��
� 
errn m  VY�����   � l ]]����  �  �  �  �K  �J  �  l cc����  �  �   	
	 Q  cm k  f]  l ff��   M G The Me Contact record is automatically created with the first account.    � �   T h e   M e   C o n t a c t   r e c o r d   i s   a u t o m a t i c a l l y   c r e a t e d   w i t h   t h e   f i r s t   a c c o u n t .  l ff��   a [ Set the first name, last name, email address and other information using Active Directory.    � �   S e t   t h e   f i r s t   n a m e ,   l a s t   n a m e ,   e m a i l   a d d r e s s   a n d   o t h e r   i n f o r m a t i o n   u s i n g   A c t i v e   D i r e c t o r y .  l ff����  �  �    r  fs o  fi�� 0 userfirstname userFirstName n        1  nr�
� 
pFrN  1  in�
� 
meCn !"! r  t�#$# o  tw�� 0 userlastname userLastName$ n      %&% 1  |��
� 
pLsN& 1  w|�
� 
meCn" '(' r  ��)*) K  ��++ �
,-
�
 
radd, o  ���	�	 0 emailaddress emailAddress- �.�
� 
type. m  ���
� EATyeWrk�  * n      /0/ 1  ���
� 
EmAd0 1  ���
� 
meCn( 121 r  ��343 o  ����  0 userdepartment userDepartment4 n      565 1  ���
� 
Dptm6 1  ���
� 
meCn2 787 r  ��9:9 o  ��� �  0 
useroffice 
userOffice: n      ;<; 1  ����
�� 
Ofic< 1  ����
�� 
meCn8 =>= r  ��?@? o  ������ 0 usercompany userCompany@ n      ABA 1  ����
�� 
CmpyB 1  ����
�� 
meCn> CDC r  ��EFE o  ������ 0 userworkphone userWorkPhoneF n      GHG 1  ����
�� 
bsNmH 1  ����
�� 
meCnD IJI r  ��KLK o  ������ 0 
usermobile 
userMobileL n      MNM 1  ����
�� 
mbNmN 1  ����
�� 
meCnJ OPO r  ��QRQ o  ������ 0 userfax userFaxR n      STS 1  ����
�� 
bFaxT 1  ����
�� 
meCnP UVU r  � WXW o  ������ 0 	usertitle 	userTitleX n      YZY 1  ����
�� 
pTtlZ 1  ����
�� 
meCnV [\[ r  ]^] o  ���� 0 
userstreet 
userStreet^ n      _`_ 1  	��
�� 
bStA` 1  	��
�� 
meCn\ aba r  cdc o  ���� 0 usercity userCityd n      efe 1  ��
�� 
bCtyf 1  ��
�� 
meCnb ghg r  *iji o   ���� 0 	userstate 	userStatej n      klk 1  %)��
�� 
bStal 1   %��
�� 
meCnh mnm r  +8opo o  +.����  0 userpostalcode userPostalCodep n      qrq 1  37��
�� 
bZipr 1  .3��
�� 
meCnn sts r  9Fuvu o  9<���� 0 usercountry userCountryv n      wxw 1  AE��
�� 
bCoux 1  <A��
�� 
meCnt yzy r  GT{|{ o  GJ���� 0 userwebpage userWebPage| n      }~} 1  OS��
�� 
bsWP~ 1  JO��
�� 
meCnz �� n U]��� I  V]������� 0 writelog writeLog� ���� m  VY�� ��� X P o p u l a t e   M e   C o n t a c t   i n f o r m a t i o n :   S u c c e s s f u l .��  ��  �  f  UV��   R      ������
�� .ascrerr ****      � ****��  ��   n em��� I  fm������� 0 writelog writeLog� ���� m  fi�� ��� P P o p u l a t e   M e   C o n t a c t   i n f o r m a t i o n :   F a i l e d .��  ��  �  f  ef
 ��� l nn��������  ��  ��  � ��� l nn������  � 0 * Set Outlook to be the default application   � ��� T   S e t   O u t l o o k   t o   b e   t h e   d e f a u l t   a p p l i c a t i o n� ��� l nn������  � ( " for mail, calendars and contacts.   � ��� D   f o r   m a i l ,   c a l e n d a r s   a n d   c o n t a c t s .� ��� l nn��������  ��  ��  � ��� Q  n����� k  q��� ��� r  qx��� m  qr��
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
wkOf� ��� l ����������  ��  ��  � ��� l ��������  �   We're done.   � ���    W e ' r e   d o n e .� ���� l ����������  ��  ��  ��  j m  �����                                                                                  OPIM  alis    x  Macintosh HD               �\	'H+  Z�Microsoft Outlook.app                                          'п�,�0        ����  	                Applications    �\Ag      �,�p    Z�  0Macintosh HD:Applications: Microsoft Outlook.app  ,  M i c r o s o f t   O u t l o o k . a p p    M a c i n t o s h   H D  "Applications/Microsoft Outlook.app  / ��  �  �
  g ��� l     ��������  ��  ��  � ��� l     ������  � 0 *------------------------------------------   � ��� T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     ������  �   End account setup   � ��� $   E n d   a c c o u n t   s e t u p� ��� l     ������  � 0 *------------------------------------------   � ��� T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     ��������  ��  ��  � ��� l     ������  � 0 *------------------------------------------   � ��� T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     ������  �   Begin script cleanup   � ��� *   B e g i n   s c r i p t   c l e a n u p� ��� l     ������  � 0 *------------------------------------------   � ��� T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     ��������  ��  ��  � ��� l ������� Z  �������� I �������
�� .coredoexbool       obj � 4  �����
�� 
psxf� m  ���� ��� � $ H O M E / L i b r a r y / L a u n c h A g e n t s / n e t . t a l k i n g m o o s e . O u t l o o k E x c h a n g e S e t u p 5 . p l i s t��  � k  ��� ��� Q  ������ k  ���� � � l ����������  ��  ��     I ������
�� .sysoexecTEXT���     TEXT m  �� � � / b i n / r m   $ H O M E / L i b r a r y / L a u n c h A g e n t s / n e t . t a l k i n g m o o s e . O u t l o o k E x c h a n g e S e t u p 5 . p l i s t��    I  �������� 0 writelog writeLog 	��	 m  ��

 � � D e l e t e   O u t l o o k E x c h a n g e S e t u p 5 . p l i s t   f i l e   f r o m   u s e r   L a u n c h A g e n t s   f o l d e r :   S u c c e s s f u l .��  ��   �� l ����������  ��  ��  ��  � R      ������
�� .ascrerr ****      � ****��  ��  � I  �������� 0 writelog writeLog �� m  �� � � D e l e t e   O u t l o o k E x c h a n g e S e t u p 5 . p l i s t   f i l e   f r o m   u s e r   L a u n c h A g e n t s   f o l d e r :   F a i l e d .��  ��  �  l ����������  ��  ��   � Q  � k  ��  l ���~�}�|�~  �}  �|    I ���{�z
�{ .sysoexecTEXT���     TEXT m  �� � x / b i n / l a u n c h c t l   r e m o v e   n e t . t a l k i n g m o o s e . O u t l o o k E x c h a n g e S e t u p 5�z   �y I  ���x �w�x 0 writelog writeLog  !�v! m  ��"" �## x U n l o a d   O u t l o o k E x c h a n g e S e t u p 5 . p l i s t   l a u n c h   a g e n t :   S u c c e s s f u l .�v  �w  �y   R      �u�t�s
�u .ascrerr ****      � ****�t  �s   I  �r$�q�r 0 writelog writeLog$ %�p% m  	&& �'' p U n l o a d   O u t l o o k E x c h a n g e S e t u p 5 . p l i s t   l a u n c h   a g e n t :   F a i l e d .�p  �q  �  ��  ��  ��  ��  � ()( l     �o�n�m�o  �n  �m  ) *+* l ,�l�k, I  �j-�i�j 0 writelog writeLog- .�h. o  �g
�g 
ret �h  �i  �l  �k  + /0/ l 1�f�e1 I  �d2�c�d 0 writelog writeLog2 3�b3 o  �a
�a 
ret �b  �c  �f  �e  0 454 l  &6�`�_6 I   &�^7�]�^ 0 writelog writeLog7 8�\8 o  !"�[
�[ 
ret �\  �]  �`  �_  5 9:9 l     �Z�Y�X�Z  �Y  �X  : ;<; l     �W=>�W  = 0 *------------------------------------------   > �?? T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -< @A@ l     �VBC�V  B   End script cleanup   C �DD &   E n d   s c r i p t   c l e a n u pA EFE l     �UGH�U  G 0 *------------------------------------------   H �II T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -F JKJ l     �T�S�R�T  �S  �R  K LML l     �QNO�Q  N 0 *------------------------------------------   O �PP T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -M QRQ l     �PST�P  S   Begin script handlers   T �UU ,   B e g i n   s c r i p t   h a n d l e r sR VWV l     �OXY�O  X 0 *------------------------------------------   Y �ZZ T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -W [\[ l     �N�M�L�N  �M  �L  \ ]^] i   p s_`_ I      �Ka�J�K 0 writelog writeLoga b�Ib o      �H�H 0 
logmessage 
logMessage�I  �J  ` k     Ycc ded r     fgf b     	hih l    j�G�Fj I    �Ekl
�E .earsffdralis        afdrk m     �D
�D afdrcusrl �Cm�B
�C 
rtypm m    �A
�A 
TEXT�B  �G  �F  i m    nn �oo L L i b r a r y : L o g s : O u t l o o k E x c h a n g e S e t u p 5 . l o gg o      �@�@ 0 logfile logFilee pqp r    !rsr b    tut b    vwv b    xyx n    z{z 1    �?
�? 
shdt{ l   |�>�=| I   �<�;�:
�< .misccurdldt    ��� null�;  �:  �>  �=  y m    }} �~~   w n    � 1    �9
�9 
tstr� l   ��8�7� I   �6�5�4
�6 .misccurdldt    ��� null�5  �4  �8  �7  u 1    �3
�3 
tab s o      �2�2 0 rightnow rightNowq ��� Z   " 5���1�� =  " %��� o   " #�0�0 0 
logmessage 
logMessage� o   # $�/
�/ 
ret � r   ( +��� o   ( )�.
�. 
ret � o      �-�- 0 loginfo logInfo�1  � r   . 5��� b   . 3��� b   . 1��� o   . /�,�, 0 rightnow rightNow� o   / 0�+�+ 0 
logmessage 
logMessage� o   1 2�*
�* 
ret � o      �)�) 0 loginfo logInfo� ��� r   6 B��� I  6 @�(��
�( .rdwropenshor       file� 4   6 :�'�
�' 
file� o   8 9�&�& 0 logfile logFile� �%��$
�% 
perm� m   ; <�#
�# boovtrue�$  � o      �"�" 0 openlogfile openLogFile� ��� I  C P�!��
�! .rdwrwritnull���     ****� o   C D� �  0 loginfo logInfo� ���
� 
refn� o   E F�� 0 openlogfile openLogFile� ���
� 
wrat� m   G J�
� rdwreof �  � ��� I  Q Y���
� .rdwrclosnull���     ****� 4   Q U��
� 
file� o   S T�� 0 logfile logFile�  �  ^ ��� l     ����  �  �  � ��� l     ����  � 0 *------------------------------------------   � ��� T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     ����  �   End script handlers   � ��� (   E n d   s c r i p t   h a n d l e r s� ��� l     ����  � 5 /------------------------------------------5.4.0   � ��� ^ - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 5 . 4 . 0�       ��� F�� p�
�	�� �� � � ���k���� ����������  � ���������������������������������������������������������� 0 usekerberos useKerberos��  0 exchangeserver ExchangeServer�� 60 exchangeserverrequiresssl ExchangeServerRequiresSSL�� .0 exchangeserversslport ExchangeServerSSLPort�� "0 directoryserver DirectoryServer�� N0 %directoryserverrequiresauthentication %DirectoryServerRequiresAuthentication�� 80 directoryserverrequiresssl DirectoryServerRequiresSSL�� 00 directoryserversslport DirectoryServerSSLPort�� >0 directoryservermaximumresults DirectoryServerMaximumResults�� 60 directoryserversearchbase DirectoryServerSearchBase�� N0 %getuserinformationfromactivedirectory %getUserInformationFromActiveDirectory�� 0 usershortname userShortName�� 0 userfullname userFullName�� 0 emailaddress emailAddress�� 0 
domainname 
domainName�� 0 emailformat emailFormat�� 0 displayname displayName�� 0 domainprefix domainPrefix�� (0 verifyemailaddress verifyEMailAddress�� *0 verifyserveraddress verifyServerAddress�� *0 displaydomainprefix displayDomainPrefix�� *0 downloadheadersonly downloadHeadersOnly�� 20 hideonmycomputerfolders hideOnMyComputerFolders�� 0 unifiedinbox unifiedInbox�� *0 disableautodiscover disableAutodiscover�� 0 errormessage errorMessage�� 0 writelog writeLog
�� .aevtoappnull  �   � ****
� boovtrue
� boovtrue��
�
 boovtrue
�	 boovtrue����
� boovtrue� � 
� boovfals
� boovfals
� boovtrue
�  boovfals
�� boovtrue
�� boovfals
�� boovfals� ��`���������� 0 writelog writeLog�� ����� �  ���� 0 
logmessage 
logMessage��  � ������������ 0 
logmessage 
logMessage�� 0 logfile logFile�� 0 rightnow rightNow�� 0 loginfo logInfo�� 0 openlogfile openLogFile� ��������n����}������������������������
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
�� .aevtoappnull  �   � ****� k    &�� #�� ,�� 5�� `�� g�� r�� ��� ��� ��� ��� ��� ��� ��� ��� ��� ��� ��� ��� �� �� 9�� B�� K�� T�� ]�� f�� o�� x�� ��� ��� ��� ��� ��� ��� ��� ��� ��� ��� ��� ��� ��� �� �� �� �� ��� ��� ��� ��� ��� ��� ��� ��� ��� ��� ��� �� �� �� "�� +�� 4�� =�� f�� ��� *�� /�� 4����  ��  ��  � ���� 0 i  �i*����3��>B��e��n���������������"*2@IR[dmv�����������������������������������
������A��MQ����g������o��u��x����������������������������������%9Tau������)DQe�������4AUp}������	$1E`m�������		��	3	?	U	]	c	f������	���	�	�	�	�

!
#
U
n
z
�
�
�.`y������-9��n]��`��gj��������������������������Q#%4=@C��JMjrx{���������� )2;������������������������������02��~�}Q�|�{�z�y�x�w�v�u�t�s�r�q�p�o�n�ms������l�k����� �j�i�h�g�f�e�d�c�b�a�`�_�^�]�\�[�Z�Y�X�W���V�U�T���S�R��Q
"&
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
� 
kocl
�~ 
Eact
�} 
prdt
�| 
unme
�{ 
fnam
�z 
emad
�y 
host
�x 
usss
�w 
port
�v 
ExLS
�u 
LDAu
�t 
LDSL
�s 
LDMX
�r 
LDSB
�q 
ExPm
�p 
pBAD�o 
�n .corecrel****      � null�m (0 newexchangeaccount newExchangeAccount
�l 
Kerb
�k 
ExGI
�j 
meCn
�i 
pFrN
�h 
pLsN
�g 
radd
�f 
type
�e EATyeWrk
�d 
EmAd
�c 
Dptm
�b 
Ofic
�a 
Cmpy
�` 
bsNm
�_ 
mbNm
�^ 
bFax
�] 
pTtl
�\ 
bStA
�[ 
bCty
�Z 
bSta
�Y 
bZip
�X 
bCou
�W 
bsWP
�V 
pMSD
�U 
pCSD
�T 
pABD
�S .sysodelanull��� ��� nmbr
�R 
psxf
�Q .coredoexbool       obj ��'�j E�O�j E�O�� 
 �� �& fEc  
Y hO*�k+ 	O*�)�,%k+ 	O*�k+ 	O*�k+ 	O*�b   %k+ 	O*�b  %k+ 	O*a b  %k+ 	O*a b  %k+ 	O*a b  %k+ 	O*a b  %k+ 	O*a b  %k+ 	O*a b  %k+ 	O*a b  %k+ 	O*a b  	%k+ 	O*a b  
%k+ 	O*�k+ 	Ob  
f  G*a b  %k+ 	O*a b  %k+ 	O*a b  %k+ 	O*a b  %k+ 	O*�k+ 	Y hO*a b  %k+ 	O*a b  %k+ 	O*a b  %k+ 	O*a  b  %k+ 	O*a !b  %k+ 	O*a "b  %k+ 	O*a #b  %k+ 	O*a $b  %k+ 	O*�k+ 	Oa %E` &Oa 'E` (Oa )E` *Oa +E` ,Oa -E` .Oa /E` 0Oa 1E` 2Oa 3E` 4Oa 5E` 6Oa 7E` 8Oa 9E` :Oa ;E` <Oa =E` >Oa ?E` @Oa AE` BOb  
e � 4a Cj E` DOb  e  _ Da E%Ec  Y a FEc  W AX G Hb  �%�%a I%a Ja Ka La Mkva Na Okva Pa Qa R SO)a Ta UlhO &a Vkv_ Wa X,FOa Y_ D%a Z%j E` [W AX G Hb  �%�%a \%a Ja Ka La ]kva Na ^kva Pa _a R SO)a Ta UlhO�k_ [a `-j akh  a bkv_ Wa X,FO_ [a `�/a c P _ [a `�/a dl/Ec  W 4X G Ha ekv_ Wa X,FO_ [a `�k/[a f\[Zl\62a g&Ec  Y hOa hkv_ Wa X,FO_ [a `�/a i L _ [a `�/a dl/E` @W 2X G Ha jkv_ Wa X,FO_ [a `�k/[a f\[Zl\62a g&E` @Y hOa kkv_ Wa X,FO_ [a `�/a l L _ [a `�/a dl/E` .W 2X G Ha mkv_ Wa X,FO_ [a `�k/[a f\[Zl\62a g&E` .Y hOa nkv_ Wa X,FO_ [a `�/a o L _ [a `�/a dl/E` *W 2X G Ha pkv_ Wa X,FO_ [a `�k/[a f\[Zl\62a g&E` *Y hOa qkv_ Wa X,FO_ [a `�/a r L _ [a `�/a dl/E` ,W 2X G Ha skv_ Wa X,FO_ [a `�k/[a f\[Zl\62a g&E` ,Y hOa tkv_ Wa X,FO_ [a `�/a u P _ [a `�/a dl/Ec  W 4X G Ha vkv_ Wa X,FO_ [a `�k/[a f\[Zl\62a g&Ec  Y hOa wkv_ Wa X,FO_ [a `�/a x L _ [a `�/a dl/E` BW 2X G Ha ykv_ Wa X,FO_ [a `�k/[a f\[Zl\62a g&E` BY hOa zkv_ Wa X,FO_ [a `�/a { L _ [a `�/a dl/E` :W 2X G Ha |kv_ Wa X,FO_ [a `�k/[a f\[Zl\62a g&E` :Y hOa }kv_ Wa X,FO_ [a `�/a ~ L _ [a `�/a dl/E` 4W 2X G Ha kv_ Wa X,FO_ [a `�k/[a f\[Zl\62a g&E` 4Y hOa �kv_ Wa X,FO_ [a `�/a � L _ [a `�/a dl/E` &W 2X G Ha �kv_ Wa X,FO_ [a `�k/[a f\[Zl\62a g&E` &Y hOa �kv_ Wa X,FO_ [a `�/a � L _ [a `�/a dl/E` 6W 2X G Ha �kv_ Wa X,FO_ [a `�k/[a f\[Zl\62a g&E` 6Y hOa �kv_ Wa X,FO_ [a `�/a � L _ [a `�/a dl/E` (W 2X G Ha �kv_ Wa X,FO_ [a `�k/[a f\[Zl\62a g&E` (Y hOa �kv_ Wa X,FO_ [a `�/a � L _ [a `�/a dl/E` 2W 2X G Ha �kv_ Wa X,FO_ [a `�k/[a f\[Zl\62a g&E` 2Y hOa �kv_ Wa X,FO_ [a `�/a � L _ [a `�/a dl/E` 0W 2X G Ha �kv_ Wa X,FO_ [a `�k/[a f\[Zl\62a g&E` 0Y hOa �kv_ Wa X,FO_ [a `�/a � L _ [a `�/a dl/E` >W 2X G Ha �kv_ Wa X,FO_ [a `�k/[a f\[Zl\62a g&E` >Y hOa �kv_ Wa X,FO_ [a `�/a � P _ [a `�/a dl/Ec  W 4X G Ha �kv_ Wa X,FO_ [a `�k/[a f\[Zl\62a g&Ec  Y hOa �kv_ Wa X,FO_ [a `�/a � L _ [a `�/a dl/E` <W 2X G Ha �kv_ Wa X,FO_ [a `�k/[a f\[Zl\62a g&E` <Y hOa �kv_ Wa X,FO_ [a `�/a � L _ [a `�/a dl/E` 8W 2X G Ha �kv_ Wa X,FO_ [a `�k/[a f\[Zl\62a g&E` 8Y hOP[OY��Oa �a �lv_ Wa X,FO _ [a dl/E` �W X G HhOa �kv_ Wa X,FOb  a �  ?b  �%�%a �%a Ja Ka La �kva Na �kva Pa �a R SO)a Ta UlhY hOPY�b  k 	 b  k �& }*j �a �,Ec  O*j �a �,Ec  Oa �_ Wa X,FOb  a di/E` &Ob  a dk/a �k/E` (Oa �_ Wa X,FO_ &a �%_ (%a �%b  %Ec  OPYb  k 	 b  l �& }*j �a �,Ec  O*j �a �,Ec  Oa �_ Wa X,FOb  a dk/a �k/E` &Ob  a di/E` (Oa �_ Wa X,FO_ &a �%_ (%a �%b  %Ec  OPYub  l 	 b  k �& u*j �a �,Ec  O*j �a �,Ec  Oa �_ Wa X,FOb  a di/E` &Ob  a dk/a �k/E` (Oa �_ Wa X,FO_ &a �%b  %Ec  OPY�b  l 	 b  l �& u*j �a �,Ec  O*j �a �,Ec  Oa �_ Wa X,FOb  a dk/a �k/E` &Ob  a di/E` (Oa �_ Wa X,FO_ &a �%b  %Ec  OPYcb  m 	 b  k �& ~*j �a �,Ec  O*j �a �,Ec  Oa �_ Wa X,FOb  a di/E` &Ob  a dk/a �k/E` (Oa �_ Wa X,FO_ &a fk/_ (%a �%b  %Ec  OPY�b  m 	 b  l �& ~*j �a �,Ec  O*j �a �,Ec  Oa �_ Wa X,FOb  a dk/a �k/E` &Ob  a di/E` (Oa �_ Wa X,FO_ &a fk/_ (%a �%b  %Ec  OPY?b  a � 	 b  k �& w*j �a �,Ec  O*j �a �,Ec  Oa �_ Wa X,FOb  a di/E` &Ob  a dk/a �k/E` (Oa �_ Wa X,FOb  a �%b  %Ec  OPY�b  a � 	 b  l �& w*j �a �,Ec  O*j �a �,Ec  Oa �_ Wa X,FOb  a dk/a �k/E` &Ob  a di/E` (Oa �_ Wa X,FOb  a �%b  %Ec  OPY%b  a � 	 b  k �&� Ahb  a � a �a �a �l Sa �,Ec  Ob  a �  a �j �Y h[OY��O ;h_ &a � a �a �a �l Sa �,E` &O_ &a �  a �j �Y h[OY��O ;h_ (a � a �a �a �l Sa �,E` (O_ (a �  a �j �Y h[OY��O_ (a �%_ &%Ec  Oa �E` �O Zh_ �a � a �a La �a �lva Na �a � Sa �,E` �O_ �a �  _ �a �%Ec  Y _ �a �%Ec  [OY��O �hb  a � _ �a �  _ &a �%_ (%a �%Ec  Y _ &a �%_ (%a �%Ec  Oa ��%b  %a �b  a La �a �lva Na �a � Sa �,Ec  Ob  a �  a �j �Y h[OY�oOPY >b  �%�%a �%a Ja Ka La �kva Na �kva Pa �a R SO)a Ta UlhOPO*a �k+ 	O*a �_ &%k+ 	O*a �_ (%k+ 	O*a �b  %k+ 	O*a �_ *%k+ 	O*a �_ ,%k+ 	O*a �_ .%k+ 	O*a �_ 0%k+ 	O*a �_ 2%k+ 	O*a �_ 4%k+ 	O*a �_ 6%k+ 	O*a �_ 8%k+ 	O*a �_ :%k+ 	O*a _ <%k+ 	O*a_ >%k+ 	O*a_ @%k+ 	O*a_ B%k+ 	O*�k+ 	Oa*jOe*a,FO #b  *a,FO)ab  %a	%k+ 	W X G H)a
b  %a%k+ 	O #b  *a,FO)ab  %a%k+ 	W X G H)ab  %a%k+ 	Ob  e  Xaa �b  a Jka Paa Laalva Nakva SE`O_a �,Ec  O)ab  %a%k+ 	Y hOb  e  Xaa �b  a Jka Paa Laalva Nakva SE`O_a �,Ec  O)a b  %a!%k+ 	Y hO �*a"a#a$�a%b  %a&b  b  %a'b  a(b  a)b  a*b  a+b  a,b  a-b  a.b  a/b  a0b  	a1b  a2b  a3a �4E`5O)a6k+ 	W LX G H)a7k+ 	Ob  �%�%a8%a Ja Ka La9kva Na:kva Pa;a R SO)a Ta UlhOPOb   e  w 'b   _5a<,FO_ �_5a=,FO)a>k+ 	W LX G H)a?k+ 	Ob  �%�%a@%a Ja Ka LaAkva NaBkva PaCa R SO)a Ta UlhOPY hO �_ &*aD,aE,FO_ (*aD,aF,FOaGb  aHaIa �*aD,aJ,FO_ **aD,aK,FO_ ,*aD,aL,FO_ .*aD,aM,FO_ 0*aD,aN,FO_ 2*aD,aO,FO_ 4*aD,aP,FO_ 6*aD,aQ,FO_ 8*aD,aR,FO_ :*aD,aS,FO_ <*aD,aT,FO_ >*aD,aU,FO_ @*aD,aV,FO_ B*aD,aW,FO)aXk+ 	W X G H)aYk+ 	O %e*aZ,FOe*a[,FOe*a\,FO)a]k+ 	W X G H)a^k+ 	Oa �j_Of*a,FOPUO)a`aa/jb N acj O*adk+ 	OPW X G H*aek+ 	O afj O*agk+ 	W X G H*ahk+ 	Y hO*�k+ 	O*�k+ 	O*�k+ 	ascr  ��ޭ