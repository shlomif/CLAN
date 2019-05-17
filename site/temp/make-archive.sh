#!/bin/bash
svn export http://localhost:8080/svn/repos/Docs/CLAN
arc_name="CLAN-`date +%Y-%m-%d`.tar.gz"
tar -czvf "$arc_name" CLAN/
mv $arc_name ..
