# harveys script to do all the fli4l-build work in one go
#
#! /bin/bash

# the custom kernel to be build for buildroot:
cust_kernel="6.6.44"
# the additional kernel to be build for fli4l
add_kernel="6.10.3"
# kernel to be set in config/base.txt for fli4l
config_kernel=$add_kernel

# now do the real build(s)
arches=( "x86_64" "x86" )
for arch in "${arches[@]}"
do
:
	cd /home/$USER/trunk-test/src/packages/src/src/fbr/
	# clean build if requested
	if [ $1 = "clean" ] ; then
		echo "clean build requested"
		echo -e "y\n" | FBR_ARCH=$arch FBR_TIDY=y FBR_BRANCH=trunk-test FBR_CATEGORY=4.0 FBR_ADDITIONAL_KERNELS=$add_kernel ./fbr-make clean
	fi
	# change custom kernel in buildroot's .config to version in $cust_kernel (fbr-make does the same to build the additional kernel ;) )
	sed -i "s/\(BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE *= *\).*/\1\"$cust_kernel\"/" /home/$USER/trunk-test/src/packages/src/src/fbr/buildroot/.config-$arch
	sed -i "s/\(BR2_LINUX_KERNEL_VERSION *= *\).*/\1\"$cust_kernel\"/" /home/$USER/trunk-test/src/packages/src/src/fbr/buildroot/.config-$arch
	echo "building "$arch
	SECONDS=0
	FBR_ARCH=$arch FBR_TIDY=y FBR_BRANCH=trunk-test FBR_CATEGORY=4.0 FBR_ADDITIONAL_KERNELS=$add_kernel ./fbr-make world legal-info
	# Rückgabewert von fbr-make mit $? prüfen, wenn nicht gleich null, Abbruch
	if [ $? -ne 0 ] ; then
		echo "Fehler beim "$arch" build, Abbruch"
		exit
	fi
	echo ""
	echo "Duration of "$arch" build: " $SECONDS " Seconds"
	echo ""
	echo "updating "$arch" files"
	SECONDS=0
	FBR_ARCH=$arch FBR_TIDY=y FBR_BRANCH=trunk-test FBR_CATEGORY=4.0 FBR_ADDITIONAL_KERNELS=$add_kernel ./fbr-make update-repo-binaries --delete-missing --update-kernel-files ~/trunk-test/
	# Rückgabewert von fbr-make mit $? prüfen, wenn nicht gleich null, Abbruch
	if [ $? -ne 0 ] ; then
		echo "Fehler beim update der "$arch" files, Abbruch"
		exit
	fi
	echo ""
	echo "Duration of updating "$arch" files: " $SECONDS " Seconds"
	echo ""
	echo "preparing installation directory "$arch
	cd /home/$USER/trunk-test/src
	eval ./_mkfli4lsvn-$arch.sh
	echo $arch" run completed"
	echo "###########################################################"
	echo ""
done

echo ""
echo "editing base.txt kernel entries to "$config_kernel
echo "and copy base_nic_kernel_x_x.list and kernel_x_x.txt"
for dir in ~/fli4l-configs/*/     # list directories in the form "/foo/dirname/"
do
        echo ""
        echo editing ${dir%}base.txt
        sed -i "s/\(KERNEL_VERSION *= *\).*/\1\'$config_kernel\'/" ${dir%}base.txt
        # now find the outdir of _mkfli4lsvn-x86.sh and st var outdr with it
        eval $(cat _mkfli4lsvn-x86_64.sh | grep outdir=)/config
        echo "copy the base_nic_kernel_X_x.list and kernel_X_x.txt to the config dir "${dir%}
        cp ${outdir}/base_nic_kernel_?_*.list ${dir%}
        cp ${outdir}/kernel_?_*.txt ${dir%}
done
echo "All done!"
   