@echo off
net stop dnscache
net start > dns.txt
timeout /t 30
net start > dns2.txt
fc /A dns.txt dns2.txt > delta.txt
net start dnscache
