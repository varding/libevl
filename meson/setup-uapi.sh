#! /bin/sh

if test \! -d $UAPI/include/uapi/evl; then
    echo "meson: path given to -Duapi does not look right ($UAPI/include/uapi/evl is missing)"
    exit 1
fi

mkdir -p $O_UAPI
rm -f $O_UAPI/asm $O_UAPI/asm-generic $O_UAPI/evl

if test -r $UAPI/Kbuild; then
    ln -s $UAPI/arch/$ARCH/include/uapi/asm $O_UAPI/asm
    ln -s $UAPI/include/uapi/asm-generic $O_UAPI/asm-generic
    ln -s $UAPI/include/uapi/evl $O_UAPI/evl
elif test \! -L	$O_UAPI/asm; then
    ln -s $UAPI/asm $O_UAPI/asm
    ln -s $UAPI/asm-generic $O_UAPI/asm-generic
    ln -s $UAPI/evl $O_UAPI/evl
fi
