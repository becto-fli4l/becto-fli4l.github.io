; -------------------------------------------------------------------------
; language constants (french)                                  __FLI4LVER__
;
; Creation: Bernard Charrier 2005-10-02
; $Id: _msg_french.msg 37111 2015-02-16 15:08:59Z lanspezi $
; -------------------------------------------------------------------------

[Global]
MSG_LINE===================================================================
MSG_BTN_close=Fermer
MSG_msgbox_error=Erreur
MSG_msgbox_warn=Avertissement
MSG_msgbox_info=Info
MSG_errorfilelog=Impossible d'ouvrir le fichier journal !
MSG_errorfilelogerror=Impossible d'ouvrir le fichier journal des erreurs !
MSG_finished=Terminer.
MSG_cancel=Annuler.
MSG_00_scpstart=Transfert des archives avec SCP sur le routeur ...
MSG_00_scpend=Le transfert des archives est termin�.
MSG_00_scpend2=Red�marrer maintenant votre routeur fli4l.
MSG_00_pass=Mot de passe pour le transfert avec SCP
MSG_00_usebasepass=Utiliser le mot de passe qui est dans 'base.txt' ?
MSG_00_scpenterpass=Entrer votre mot de passe pour le transfert des archives :
MSG_00_scpcancel=Le transfert des archives a �t� annul�.
MSG_00_scperror1=Une erreur est survenu pendant le transfert des archives !
MSG_00_scperror2=Voulez-vous v�rifier tous les param�tres SSH et SSHD sur le routeur.
MSG_00_changesshkey=S�lectionner le fichier key-SSH
MSG_00_plinkaskreboot=Voulez-vous red�marrer le routeur maintenant ?
MSG_00_plinksentreboot=La commande de red�marrage a �t� envoy�e au routeur.
MSG_00_askreboot=Le routeur fli4l - Red�marre

[mkfli4l]
MSG_01_build_abort=Le processus de construction a �t� arr�t� par l'utilisateur.
MSG_01_build_error=Le processus de construction a �t� arr�t� � cause d'une erreur !
MSG_01_no_boot_type=Valeur invalide dans la variable BOOT_TYPE !

[parse_cmd]
MSG_02_start=Processus de construction - __FLI4LVER__
MSG_02_noconfdir=Le fichier base.txt n'existe pas dans le r�pertoire de configuration fli4l !
MSG_02_useconfig=Utiliser la configuration � partir du r�pertoire '
MSG_02_undefboottype=La variable BOOT_TYPE n'est pas d�finie ! Utiliser S.V.P. un param�tre correct.
MSG_02_migrateconfig=Migration de mkfli4l.conf � mkfli4l.txt...

[parse_mkfli4l_conf]
MSG_03_readcheck_buildenv=Lecture et contr�le de l'environnement de construction '
MSG_03_nologfile=Impossible d'ouvrir le fichier log !

[mkopt]
MSG_04_start=Cr�ation des archives-fli4l ...
MSG_04_confdir=Utilisation de la configuration du r�pertoire '
MSG_04_builddir=Cr�ation des archives-fli4l dans le r�pertoire '
MSG_04_readcheckconf=Lecture et contr�le de la configuration, cr�ation du rootfs- et de l'archive-opt ...
MSG_04_generating_md5sums=G�n�ration du md5 pour un contr�le total ...
MSG_04_finished=La cr�ation de la construction des archives-fli4l est termin�e.
MSG_04_nologfile=Impossible d'ouvrir le fichier log !
MSG_04_msgboxerror=Erreur dans votre fichier de configuration fli4l !

[mkfloppy]
MSG_05_start=Cr�ation de la/les disquette(s) ...
MSG_05_insertfloppy=S.V.P. ins�rer une disquette format�e.
MSG_05_bootdisk=(cette disquette est votre BOOT_DISK)
MSG_05_startcopy=Cliquez sur OK ou pressez ENTER pour d�marrer la copie des fichiers.
MSG_05_copysyslinux=Copie syslinux.cfg ...
MSG_05_writesystem=�criture des fichiers syst�mes ...
MSG_05_copykernel=Copie kernel ...
MSG_05_copyrootfstgz=Copie rootfs.img ...
MSG_05_copyrootfsbz2=Copie rootfs.bz2 ...
MSG_05_copyrccfg=Copie rc.cfg ...
MSG_05_copyopttarbz2=Copie opt.img ...
MSG_05_bootdisk2= (BOOT_DISK)
MSG_05_optdisk= (OPT_DISK)
MSG_05_secfloppy1=Enlever la premier disquette (BOOT_DISK).
MSG_05_secfloppy2=Ins�rer une disquette format�e et pressez ENTER ou cliquez sur OK.
MSG_05_secfloppy3=(cette disquette est votre OPT_DISK)
MSG_05_floppynowrite1=Lors de l'�criture des fichiers '
MSG_05_floppynowrite2=une erreur a �t� rencontr�e !
MSG_05_floppynospace=Pas assez d'espace sur la disquette pour enregistrer les archives.
MSG_05_bootflnospace=Pas assez d'espace sur la disquette BOOT pour enregistrer les archives.
MSG_05_cancel=L'�criture de la/les disquette(s) a �t� arr�t�e par l'utilisateur.
MSG_05_error=Erreur d'�criture sur la disquette !
MSG_05_finish1=La cr�ation de la/les disquette(s) fli4l est termin�e.
MSG_05_finish2=- Vous pouvez installer la/les disquette(s) dans votre routeur et d�marrer celui-ci.
MSG_05_filesonfloppy=La disquette contient des fichiers. Les supprimer ?
MSG_05_usefloppy=Utiliser quand m�me cette disquette ?
MSG_05_nofloppy=Aucune disquette trouv�e !
MSG_05_nofloppyW9x=Aucune disquette format�e trouv�e !
MSG_05_calculatespace=Calcul de l'espace requit ...
MSG_05_requiredspace1=Espace requit :
MSG_05_requiredspace2=Octet.
MSG_05_requiredspace3=Espace disponible :
MSG_05_floppyseemsboot=Attention : cette disquette semble �tre une BOOT_DISK !
MSG_05_exchangefloppy=Installer une autre disquette et cliquez sur OK pour continuer
MSG_05_floppynotformatted1=La disquette n'est pas format�e !
MSG_05_floppynotformatted2=voulez-vous la formater ?
MSG_05_formatfloppy=Formatage de la disquette ...

[mkiso]
MSG_06_createisoimage=Cr�ation d'une image-iso-fli4l ...
MSG_06_buildisoimage=Construction de l'image-iso '
MSG_06_finish1=La cr�ation de l'image-iso-fli4l est termin�e
MSG_06_finish2=- Apr�s avoir grav� l'image, vous pouvez installer le CD dans votre routeur et d�marrer celui-ci.

[mknetboot]
MSG_07_mld1=La cr�ation de l'image pour le d�marrage par le r�seau n'est pas
MSG_07_mld2=encore possible avec toutes les versions de Microsoft Windows !

[dlg_mkfli4l_conf]
MSG_08_btnabort=Arr�ter la construction fli4l
MSG_08_btnbuild=D�marrer la construction fli4l
MSG_08_nobasetxt=Le fichier 'base.txt' n'existe pas dans le r�pertoire
MSG_08_changedirconfig=R�pertoire des fichiers de configuration fli4l
MSG_08_changedconfigdir1=Changer le r�pertoire de configuration
MSG_08_changedconfigdir2=Le r�pertoire choisi doit-il �tre utilis� par d�faut ?
MSG_08_changedirbuild=Cr�ation du r�pertoire "build" pour les archives-fli4l
MSG_08_dirconfiginfo1=Les modifications des options du 'Config Dir' peuvent �tre sauvegard�es dans le fichier 'mkfli4l.txt'.
MSG_08_dirconfiginfo2=Vous pouvez aussi sauvegarder les options par ligne de commande.
MSG_08_savemkfli4lconf=Sauvegarder la configuration dans mkfli4l.txt
MSG_08_savemkfli4ldone=Votre configuration a �t� sauvegard�e dans mkfli4l.txt
MSG_08_savemkfli4lerror=Erreur d'�criture dans le fichier mkfli4l.txt
MSG_08TT_btnconfigdir=Changer le r�pertoire des fichiers de configuration
MSG_08TT_btnbuilddir=Changer le r�pertoire pour la construction des archives-fli4l
MSG_08TT_verbose=Activer pour d�tailler le processus de construction
MSG_08TT_filesonly=Activer pour seulement cr�er les archives-fli4l
MSG_08TT_drive=S�lectionner le lecteur de disquettes
MSG_08TT_floppy_normal=S�lectionner le mode normal du lecteur de disquettes
MSG_08TT_floppy_safe=S�lectionner le mode lent du lecteur de disquettes
MSG_08TT_remoteupdate=Activer pour transf�rer les archives-fli4l
MSG_08TT_remotehostname=Nom d'h�te ou adresse-IP pour le transfert des archives
MSG_08TT_remoteusername=Nom d'utilisateur pour le transfert des archives
MSG_08TT_remotepathname=R�pertoire de destination pour le transfert des archives
MSG_08TT_remoteport=Port pour le transfert des archives
MSG_08TT_btn_sshfile=Rechercher le fichier key-SSH
MSG_08TT_btn_sshfileclear=Suppression de l'utilisation de la key-SSH -> Nom d'utilisateur/mot de passe

[mkhdinstall]
MSG_09_start=S�lectionner le disque dur pour l'installation
MSG_09_copysyslinux=Copie syslinux.cfg ...
MSG_09_copykernel=Copie kernel ...
MSG_09_copyrootfstgz=Copie rootfs.img ...
MSG_09_copyrootfsbz2=Copie rootfs.bz2 ...
MSG_09_copyrccfg=Copie rc.cfg ...
MSG_09_copyopttarbz2=Copie opt.img ...
MSG_09_writesystem=�criture des fichiers syst�mes ...
MSG_09_finish1=La cr�ation pour la pr�-installation du HD est termin�e
MSG_09_finish2=- Vous pouvez installer le disque dur dans votre routeur et d�marrer celui-ci.
MSG_09_cancel=L'�criture de la pr�-installation du HD a �t� arr�t�e par l'utilisateur
MSG_09_error=Erreur d'�criture des archives sur la pr�-installation du HD !
MSG_09_admin1=Vous n'avez pas les Droits -Admin- ils sont n�cessaires pour faire un disque amor�able,
MSG_09_admin2=voulez-vous ex�cuter 'syslinux' en tant qu'administrateur ?
MSG_09_ask_pass=Mot de passe administrateur
MSG_09_pass=Mot de passe :
MSG_09_wrongfs1=Le lecteur
MSG_09_wrongfs2=n'a pas de fichier syst�me FAT !
MSG_09_errorcopy=Erreur lors de la copie des archives

[mkls120]
MSG_10_start=S�lectionner le lecteur LS120 pour l'installation
MSG_10_copysyslinux=Copie syslinux.cfg ...
MSG_10_copykernel=Copie kernel ...
MSG_10_copyrootfstgz=Copie rootfs.img ...
MSG_10_copyrootfsbz2=Copie rootfs.bz2 ...
MSG_10_copyrccfg=Copie rc.cfg ...
MSG_10_copyopttarbz2=Copie opt.img ...
MSG_10_writesystem=�criture des fichiers syst�mes ...
MSG_10_finish1=La cr�ation du lecteur LS120 fli4l est termin�e
MSG_10_finish2=- Vous pouvez installer le LS120 dans votre routeur et d�marrer celui-ci.
MSG_10_cancel=L'�criture du lecteur LS120 a �t� arr�t�e par l'utilisateur.
MSG_10_error=Erreur d'�criture sur le lecteur LS120 !
MSG_10_wrongfs1=Le lecteur
MSG_10_wrongfs2=n'a pas de fichier syst�me FAT !
MSG_10_errorcopy=Erreur lors de la copie des archives
