![Ampere Computing](https://avatars2.githubusercontent.com/u/34519842?s=400&u=1d29afaac44f477cbb0226139ec83f73faefe154&v=4)

# docker-grub-builder

Sometimes you need to build grub packages with cherry picked patches for different Linux OSes

## Building Grub2 Debs for Debian

To build the Debian grub-builder container.

```
docker build -t grub-builder:debian --no-cache -f Dockerfile.debian .
```

Once the base container is built you will need to run the container to build the Grub debs for debian.
Execute the package building process with the following command:

```
docker run -v $(pwd)/output:/output -it grub-builder:debian
```

Packages will be located within the output/buster subdirectory located within this project.

```
$ ls -l output/buster/
total 21572
-rw-r--r-- 1 root root 11894704 Nov  5 14:25 grub-common-dbgsym_2.02+dfsg1-20+deb10u2_arm64.deb
-rw-r--r-- 1 root root  2481192 Nov  5 14:25 grub-common_2.02+dfsg1-20+deb10u2_arm64.deb
-rw-r--r-- 1 root root   569456 Nov  5 14:25 grub-efi-arm64-bin_2.02+dfsg1-20+deb10u2_arm64.deb
-rw-r--r-- 1 root root  2814240 Nov  5 14:26 grub-efi-arm64-dbg_2.02+dfsg1-20+deb10u2_arm64.deb
-rw-r--r-- 1 root root   118624 Nov  5 14:25 grub-efi-arm64-signed-template_2.02+dfsg1-20+deb10u2_arm64.deb
-rw-r--r-- 1 root root    39680 Nov  5 14:25 grub-efi-arm64_2.02+dfsg1-20+deb10u2_arm64.deb
-rw-r--r-- 1 root root  2151968 Nov  5 14:25 grub-theme-starfield_2.02+dfsg1-20+deb10u2_arm64.deb
-rw-r--r-- 1 root root  1477668 Nov  5 14:25 grub2-common-dbgsym_2.02+dfsg1-20+deb10u2_arm64.deb
-rw-r--r-- 1 root root   526004 Nov  5 14:25 grub2-common_2.02+dfsg1-20+deb10u2_arm64.deb
```


## Building Grub2 Debs for Ubuntu

To build the Ubuntu grub-builder container.

```
docker build -t grub-builder:ubuntu --no-cache -f Dockerfile.ubuntu .
```

Once the base container is built you will need to run the container to build the Grub debs for ubuntu.
Execute the package building process with the following command:

```
docker run -v $(pwd)/output:/output -it grub-builder:debian
```

Packages will be located within the output/applied/ubuntu/focal-updates subdirectory located within this project.

```
$ ls -l output/applied/ubuntu/focal-updates/
total 8924
-rw-r--r-- 1 root root 2569352 Nov  5 14:33 grub-common_2.04-1ubuntu26.6_arm64.deb
-rw-r--r-- 1 root root  601216 Nov  5 14:33 grub-efi-arm64-bin_2.04-1ubuntu26.6_arm64.deb
-rw-r--r-- 1 root root 3098124 Nov  5 14:33 grub-efi-arm64-dbg_2.04-1ubuntu26.6_arm64.deb
-rw-r--r-- 1 root root   85480 Nov  5 14:33 grub-efi-arm64-signed-template_2.04-1ubuntu26.6_arm64.deb
-rw-r--r-- 1 root root   46612 Nov  5 14:33 grub-efi-arm64_2.04-1ubuntu26.6_arm64.deb
-rw-r--r-- 1 root root 2154832 Nov  5 14:33 grub-theme-starfield_2.04-1ubuntu26.6_arm64.deb
-rw-r--r-- 1 root root  568232 Nov  5 14:33 grub2-common_2.04-1ubuntu26.6_arm64.deb
```

## Notes

### Ubuntu Bug:
[https://bugs.launchpad.net/ubuntu/+source/grub2/+bug/1892290](https://bugs.launchpad.net/ubuntu/+source/grub2/+bug/1892290)

### Regression in this:

[https://tools.ietf.org/html/rfc2348](https://tools.ietf.org/html/rfc2348)

### RFC 2348 - TFTP Blocksize Option - IETF Tools

RFC 2348 TFTP Blocksize Option May 1998 As was anticipated, the transfer time decreases 
with an increase in blocksize. The reason for the reduction in time is the reduction in
the number of packets sent. For example, by increasing the blocksize from 512 octets to 
1024 octets, not only are the number of data packets halved, but the number of acknowledgement
packets is also halved (along with ...
tools.ietf.org

### RH Errata:

[https://access.redhat.com/errata/RHBA-2020:4046](https://access.redhat.com/errata/RHBA-2020:4046)

### RH Bug: 

[https://bugzilla.redhat.com/show_bug.cgi?id=1869987](https://bugzilla.redhat.com/show_bug.cgi?id=1869987)

### Debian Grub2 Tracking:

[https://tracker.debian.org/pkg/grub2](https://tracker.debian.org/pkg/grub2)

### Debian Grub2 Sources
[https://salsa.debian.org/grub-team/grub](https://salsa.debian.org/grub-team/grub)


###
/usr/local/src/grub/debian/grub-efi-arm64-bin/usr/lib/grub/arm64-efi/monolithic/grubnetaa64.efi
