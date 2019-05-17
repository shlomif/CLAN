#!/bin/bash
src_dir="module-compiler"
arc_dir="lk-module-compiler-final"

rm -fr "$src_dir"

svn export "http://localhost:8080/svn/repos/progs/CLAN/trunk/module-compiler"
cd $src_dir
perl Makefile.PL
make dist
cd ..
rm -fr $arc_dir
mkdir $arc_dir
cp $src_dir/Linux-Kernel-Modules-*.tar.gz ./$arc_dir/

